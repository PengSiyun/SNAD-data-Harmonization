****Author:  Siyun Peng
****Date:    2022/01/09
****Version: 17
****Purpose: clean W1 data for REDcap R01 Informant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old"
do "REDcapold-R01-w1-import" //import w1 excel from Redcap into stata
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\temp" 

*Interview date
gen redcap_date = dofc(gift_datei) //remove hours and minutes
format redcap_date %td



************************************************************
**# 1. Fill in demographics for wave line and remove demographics line  
************************************************************


*keep informant's demographics
drop first_name-deceased informant_phone_number informant_email demographics_complete
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
fre gcccid_miss_a // 6 gcccid do not have "a" in the end: 6388, 6541, 10239, 10284, 10325, 10347
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
drop redcap_event_name-gift_card_receipt_complete

*drop focal variables
drop rey_w1-wave_5_ses_occupatio_v_35
drop recordid-my_first_instrument_complete //missing ENSO FOCAL demo



************************************************************
**# 4. collapse "5 waves" into 1 wave of data
************************************************************


*drop repeated record_id and ccid in 5 waves of data
drop record_id* recordid_09f669 *ccid*

*drop complete indicator for 5 waves
drop wave_* cardgame2_w1 playgame2_w1 write2_w1 memthink2_w1 sew2_w1


/*collapse the 5 waves*/


*manually collapse variables that cannot be handled by loop below
*Variables that does not consistent wave indicator
rename no_friends_3_* no_friends3_*
rename self_3_* self3_* 
rename (repetition2_w2 delay_recog2_w3 puzzlegame2_w3 puzzlegame2_w4 sm_linkedin4_w4) (repetition_w2 delay_recog_w3 puzzlegame_d2_w3 puzzlegame_d2_w4 sm_linkedin2_w4)

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

*missing ENSO demo: recordid-my_first_instrument_complete
rename *_w1ensoi *_

save "REDcap-R01-w1-informant-reformated",replace

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old" //reset directory for rule-all do file



