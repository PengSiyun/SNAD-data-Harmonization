****Author:  Siyun Peng
****Date:    2025/12/04
****Version: 19
****Purpose: clean REDcap R01-2.0 Participant  

cd "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-2" //home
do "REDcap-2-Participant-import" //import excel from Redcap into stata
cd "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-2\temp" //home

*fix an error in redcap provided code
replace subject_type="" if subject_type=="UNK"
destring subject_type,replace
label values subject_type subject_type_

save "REDcap-2-participant-raw",replace

*to do: 
*how to create sum score of facial memory, emotion cognition?
*how to obtain qualtrics data for facial memory?


************************************************************
**# 1. Keep completed interviews
************************************************************



*drop administrative info
drop if redcap_event_name=="administrative_arm_1"

*keep completed interviews
gen date_red = time_consented
format date_red %td
bysort record_id: replace date_red=date_red[2] if missing(date_red)&redcap_event_name=="static_demographic_arm_1" //fill in date for Demo line using 1st wave line
bysort record_id: replace ccid=ccid[1] if missing(ccid) //fill in ccid for wave lines line using demo line
drop if missing(date_red)

*interviewer
rename  coord_name interviewer_redcap

*Drop tracking and sensitive info (REDcap data export order is based on Designer)
drop pref_contact_method-capacity_to_consent_complete gc_type-gift_card_complete





************************************************************
**# 2. rename variables
************************************************************




rename ccid SUBID
*replace SUBID=subinstr(SUBID,"DC","",1) //remove DC
*destring SUBID, replace

*Cognitive tests
rename total_score_ moca_raw
*replace moca_raw=subinstr(moca_raw,"/30","",1) //turn 16/30 into 16

rename (trailseconds_ trailsecond_) (trail_a_time trail_b_time)
rename (total_learn_rey delayed_sum_rey) (rey_sum delayed_rey_sum)
replace rey_sum="" if rey_sum=="refused"
replace rey_sum="" if rey_sum=="refused "
replace delayed_rey_sum="" if delayed_rey_sum=="refused"
destring delayed_rey_sum rey_sum,replace

*rename variables that are not clear
rename (volunteer_activities___2 volunteer_activities___3 volunteer_activities___4 volunteer_activities___5 volunteer_activities___6 volunteer_activities___7 volunteer_activities___8 volunteer_activities___9 volunteer_activities___10 volunteer_activities___11 volunteer_activities___12 volunteer_activities___13 volunteer_activities___14) ///
       (volunteer_act___coach_ volunteer_act___teach_ volunteer_act___mentor_ volunteer_act___usher_ volunteer_act___food_ volunteer_act___cloth_ volunteer_act___fund_ volunteer_act___med_ volunteer_act___office_ volunteer_act___manage_ volunteer_act___art_ volunteer_act___drive_ volunteer_act___other_)

rename no_friends_* nofriends_feel_*
rename (person_relationship_ other_relation) (patient_relation patient_relation_other)

*IADRC date
rename date_of_clinical_visit date_iadc 
order date_iadc,after(date_red)

*race
gen race=.
order race,before(race___1)
replace race=6 if race___6==1 //other
replace race=5 if race___5==1 //White
replace race=4 if race___4==1 //pacific islander
replace race=1 if race___1==1 //Native American
replace race=2 if race___2==1 //Asian
replace race=3 if race___3==1 //Black
drop race___*
label define race 1 "American Indian or Alaskan Native" 2 "Asian" 3 "African American" 4 "Pacific Islander" 5 "White" 6 "Other"
label values race race

*remove trailing w1 or _ to be consistant
rename *_ *
rename city_w1f city2
rename *_w1f *
rename *_w1 *
rename (nofriends_w1___1 embarassed_behaviorr) (nofriends embarassed_behavior)

*children
replace children="3" if children=="5 (3 alive)"
destring children,replace 






************************************************************
**# 3. Double check with old R01
************************************************************



/*merge demo*/

preserve

keep if redcap_event_name=="static_demographic_arm_1" //keep demo line
keep SUBID-zip_code race-education_father1
drop other_gender

*prepare for merge
destring step, replace
tostring year_start1 different_jobs long_live*,replace

merge 1:1 SUBID using "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-1\Cleaned\REDcap-1-participant-demographics.dta",nogen

*copy values from old R01 if missing
foreach x of varlist date_of_birth-education_father1 {
	replace `x'=`x'_red if missing(`x') 
}

*drop variables with old values
drop *_red

rename * *_red //to differentiate from IADRC demo variables
rename  SUBID_red SUBID
save "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-2\Cleaned\REDcap-2-participant-demographics.dta",replace

restore


/*append the rest*/

*prepare for append
drop if redcap_event_name=="static_demographic_arm_1" //drop demo line
drop first_name-demographics_complete //drop demo variables
replace living_number="" if living_number=="Not applicable"
destring living_number,replace
destring redcap_repeat_instrument,replace
tostring moca_raw,replace
replace trail_a_time="" if trail_a_time=="refused"
destring trail_a_time,replace

append using "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-1\Cleaned\REDcap-1-participant.dta"
drop time //wave indicator in old R01
sort SUBID date_red
bysort SUBID: gen time=_n //create new wave indicator

*clean
egen lonely=rowmean(lack_companionship1 left_out1 feel_isolated1)
lab var lonely "UCLA 3-item loneliness"
lab values lonely lack_companionship1_w1_

recode anxiety? (1=0) (2=1) (3=2) (4=3) 
label define anxiety 0 "No" 1 "A little" 2 "Sometimes" 3 "Extremely"
label values anxiety? anxiety

recode cwpuzzles_f (1=5) (2=4) (3=3) (4=2) (5=1)
label values cwpuzzles_f puzzlegame_f_w1_

recode *_f (6=1) (0=.) //6 never is coded as once a year or less because oldredcap did not have never as a category

replace puzzlegame=puzzlegame_d if missing(puzzlegame)
drop puzzlegame_d 
rename puzzlegame puzzlegame_d

recode integration1 (1=7)(2=6)(3=5)(4=4)(5=3)(6=2)(7=1)
egen integration=rowmean(integration1 integration2 integration3)
lab var integration "Community integration scale"


save "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-2\Cleaned\REDcap-2-participant.dta",replace




