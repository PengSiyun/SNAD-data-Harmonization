****Author:  Siyun Peng
****Date:    2021/12/16
****Version: 17
****Purpose: clean REDcap R01 Participant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01" //home
do "REDcap-R01-Participant-import" //import excel from Redcap into stata
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\temp" //home

*to do: 
*how to create sum score of facial memory, emotion cognition?
*how to obtain qualtrics data for facial memory?


************************************************************
**# 1. Keep completed interviews
************************************************************



*double check all completed interviews have gift_date
replace gift_date=coord_date if missing(gift_date)
fre gift_date gift_card_receipts_complete 

*keep completed interviews
gen date_red = dofc(gift_date) //remove hours and minutes
format date_red %td
bysort record_id: replace date_red=date_red[2] if missing(date_red)&redcap_event_name=="demographics_arm_1" //fill in date for Demo line using 1st wave line
bysort record_id: replace ccid=ccid[1] if missing(ccid) //fill in ccid for wave lines line using demo line
drop if missing(date_red)

*Drop tracking and sensitive info (REDcap data export order is based on Designer)
order date_of_clinical_core_visi,after(gift_card_receipts_complete)
drop checkboxes___1-gift_card_receipts_complete





************************************************************
**# 2. rename variables
************************************************************




rename ccid SUBID

*Cognitive tests
rename total_score_ moca_raw
replace moca_raw=subinstr(moca_raw,"/30","",1) //turn 16/30 into 16

rename (trailseconds_ trailsecond_) (trail_a_time trail_b_time)
rename (total_learn_rey delayed_sum_rey) (rey_sum delayed_rey_sum)
replace rey_sum=subinstr(rey_sum,"/75","",1) //remove /75 
replace delayed_rey_sum=subinstr(delayed_rey_sum,"/15","",1) //remove /75 
destring delayed_rey_sum,replace

*rename variables that are not clear
rename (volunteer_activities___2 volunteer_activities___3 volunteer_activities___4 volunteer_activities___5 volunteer_activities___6 volunteer_activities___7 volunteer_activities___8 volunteer_activities___9 volunteer_activities___10 volunteer_activities___11 volunteer_activities___12 volunteer_activities___13 volunteer_activities___14) ///
       (volunteer_act___coach_ volunteer_act___teach_ volunteer_act___mentor_ volunteer_act___usher_ volunteer_act___food_ volunteer_act___cloth_ volunteer_act___fund_ volunteer_act___med_ volunteer_act___office_ volunteer_act___manage_ volunteer_act___art_ volunteer_act___drive_ volunteer_act___other_)

rename veg_* vegother_*
rename no_friends_* nofriends_feel_*
rename (person_relationship_ other_relation) (patient_relation patient_relation_other)

*IADRC date
rename date_of_clinical_core_visi date_iadc 
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
rename social_media1*___* social_media1___*[2] // remove w# in the middle: [2] refers to 2nd *
rename (nofriends_w1___1 embarassed_behaviorr) (nofriends embarassed_behavior)





************************************************************
**# 3. Append with old R01
************************************************************



/*append demo*/

preserve

keep if redcap_event_name=="demographics_arm_1" //keep demo line
keep SUBID-zip_code deceased-education_father2

*prepare for append
replace step= "0" if step=="o"
destring step, replace
tostring year_start1 different_jobs long_live*,replace

append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant-demographics.dta"
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot missing demo clean\pilot-participant-missingdemo"

foreach x of varlist * {
	bysort SUBID: replace `x'=`x'[2] if missing(`x') //copy values from old R01 if missing
	bysort SUBID: replace `x'=`x'[3] if missing(`x') //copy values from pilot demo missing if still missing
}
duplicates drop SUBID,force //drop old R01


*check conflict and fix it in the new R01
/*
foreach x of varlist gender race school military children step education_mother1 education_father1 marital kind_business1 kind_business2 {
  bysort SUBID: egen `x'_t=mean(`x')
}
fre *_t
list SUBID first_name last_name gender if gender_t==1.5
*/

rename * *_red //to differentiate from IADRC demo variables
rename  SUBID_red SUBID
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-participant-demographics.dta",replace

restore


/*append the rest*/


*prepare for append
drop if redcap_event_name=="demographics_arm_1" //drop demo line
drop first_name-demographics_complete //drop demo variables
tostring oliveoil-alcoholser,replace
destring rey_sum,replace

append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant.dta"
drop time //wave indicator in old R01
sort SUBID date_red
bysort SUBID: gen time=_n //create new wave indicator
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-participant.dta",replace




