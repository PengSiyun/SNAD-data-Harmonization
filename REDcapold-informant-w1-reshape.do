****Author:  Siyun Peng
****Date:    2021/05/24
****Version: 16
****Purpose: clean W1 data for REDcap R01 Informant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\intermediate files" //home
use "REDcap-R01-w1",clear
*Interview date
gen redcap_date = dofc(gift_datei) //remove hours and minutes
format redcap_date %td
*list signature_sub if ccid_gc=="3568" //show interview for 3568, which missing gift_date
*replace redcap_date = daily("02oct2019", "DMY") if ccid_gc=="3568"

************************************************************
// 1. Fill in demographics for wave line and remove demographics line  
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
// 2. clean wave lines (one focal should has one wave)
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
// 3. drop NON-informant data (REDcap data export order is based on Designer)
************************************************************
*drop tracking info
drop redcap_event_name-gift_card_receipt_complete
*drop focal variables
drop rey_w1-wave_5_ses_occupatio_v_35
drop recordid-my_first_instrument_complete //missing ENSO demo

************************************************************
// 4. clean informant data 
************************************************************



