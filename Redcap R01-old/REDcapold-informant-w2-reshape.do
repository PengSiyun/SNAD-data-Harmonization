****Author:  Siyun Peng
****Date:    2022/01/11
****Version: 17
****Purpose: clean W2 data for REDcap R01 Informant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old"
do "REDcapold-R01-w2-import" //import w2 excel from Redcap into stata
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\temp" 

*Interview date
gen redcap_date = dofc(gift_datei) //remove hours and minutes
format redcap_date %td




************************************************************
**# 1. Fill in demographics for wave line and remove demographics line  
************************************************************



*keep informant's demographics
drop first_name-date_the_subject_withdrew informant_phone_number informant_email demographics_complete
replace dem_ccid=dem_ccid + "a" 

*Fill in demographics for wave line
foreach x of varlist dem_ccid-informant_zip {
	bysort record_id: gen `x'new = `x'[1] //copy values from demographics
	drop `x' //drop old variable
	rename `x'new `x' //rename copied variable
}

*remove demographics line
drop if redcap_event_name=="demographics_arm_1"




************************************************************
**# 2. clean wave lines (one informant should has one wave)
************************************************************


*use gift card info to decide whether informant completed interview
destring gcccid,gen(gcccid_miss_a) force
fre gcccid_miss_a // 3 gcccid do not have "a" in the end: 10327,10339,10382
replace gcccid=gcccid + "a" if !missing(gcccid_miss_a) 
drop gcccid_miss_a
rename gcccid SUBID
drop if missing(SUBID) //delete line with incomplete data
duplicates list SUBID //one informant should has one wave
order SUBID 



************************************************************
**# 3. drop NON-informant data (REDcap data export order is based on Designer)
************************************************************


*drop tracking info
drop redcap_event_name-informant_gift_card__v_9

*drop focal variables
drop marital_w2_w2-wave_6_ses_occupatio_v_54



************************************************************
**# 4. collapse "5 waves" into 1 wave of data
************************************************************


*drop repeated record_id and ccid in 5 waves of data
drop record_id* *ccid* w2ccid_w2_w2

*drop complete indicator for 5 waves
drop wave_* 


/*collapse the 5 waves*/


*manually collapse variables that cannot be handled by loop below
*Variables that does not consistent wave indicator
rename no_friends_3_* no_friends3_*
rename self_3_* self3_* 
drop date_moca_w5_42c4d0-where_administered_w5_768ded //no valid values
rename (repetition2_w2 delay_recog2_w3 nofriends3_w2_1586a9 happiness22_w1 happiness2_w5_45437c hobbu_d2_w5 eat_d_2_w6) ///
       (repetition_w2 delay_recog_w3 nofriends3_w2 happiness2_w1 happiness2_w6 hobby_d2_w5 eat_d2_w6)
replace grade_mother2_w5="16" if grade_mother2_w5=="Bachelors"
destring grade_mother2_w5,replace
replace grade_father2_w5="20" if grade_father2_w5=="MD"
destring grade_father2_w5,replace
replace grade_father2_w2="4" if grade_father2_w2=="4th grade"
destring grade_father2_w2,replace

*string variable
foreach x in name2 int_date2 subname2 total_score day_week2 marriage_other2 marriage_other3 patient2 contacts_phone2 followers_twitter2 followers_instagram2 followers_pinterest2 followers_facebook2 followers_linkedin2 followers_snapchat2 followers_whatsapp2 followers_reddit2 followers_tumblr2 followers_skype2 sm_other2 religion_other2 {
    egen `x' = concat(`x'_*) 
	replace `x'=subinstr(`x',".","",.) 
    local lbl : variable label `x'_w1 //save variable label
    label var `x' "`lbl'" //apply variable label
	drop `x'_*
}


/*loop to collapse the 5 waves*/


rename *_w2 *_ //Removes suffix w2 to prepare for loop

*hand code variables that do not end with _w2
*clean social_media variables
rename social_media2_w#* =_w# //add suffix _w2 to wave 2 accordingly
rename social_media2*___* social_media2___*[2] // remove w# in the middle: [2] refers to 2nd *
rename *_w2 *_ //Remove suffix w2 to prepare for loop
*clean other variables
rename *___1 * //Remove remaining variables that end with ___1
rename *_w2 *_ //Remove suffix w2 to prepare for loop
  

*start loop
foreach x of varlist health2_-ladder2_ {
	egen new`x'=rowmean(`x'*) //collapse 5 waves into 1 wave
    local lbl : variable label `x'w1 //save variable label
    label var new`x' "`lbl'" //apply variable label
	label values new`x' `x'w1_ // apply value label
	drop `x'* //drop old variables
	rename new`x' `x'
}




************************************************************
**# 5. rename variables with 1 wave 
************************************************************



*cognitive function 
rename total_score moca_total


save "REDcap-R01-w2-informant-reformated",replace

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old" //reset directory for rule-all do file





