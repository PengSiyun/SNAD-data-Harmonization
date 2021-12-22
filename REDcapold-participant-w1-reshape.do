****Author:  Siyun Peng
****Date:    2021/05/24
****Version: 16
****Purpose: clean W1 data for REDcap R01 Participant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\temp" //home
*do "REDcapold-R01-w1-import" //import w1 excel from Redcap into stata

*Interview date
gen redcap_date = dofc(gift_date) //remove hours and minutes
format redcap_date %td
list signature_sub if ccid_gc=="3568" //show interview for 3568, which missing gift_date
replace redcap_date = daily("02oct2019", "DMY") if ccid_gc=="3568"
replace redcap_date = dofc(gift_datei) if gcccid=="10347" //mistakenly sign as informant
replace redcap_date = daily("30apr2019", "DMY") if gcccid=="6574a" //sign in the wrong form but complete
rename redcap_date date_snad

*IADRC date
rename date_of_clinical_core_visi date_iadc 
order date_iadc,after(date_snad)

************************************************************
// 1. Fill in demographics for wave line and remove demographics line  
************************************************************
*keep participant's demographics
drop phone-demographics_complete
*Fill in demographics for wave line
foreach x of varlist dem_ccid first_name-zip_code {
	bysort record_id: gen `x'new = `x'[1] //copy values from demographics
    local lbl : variable label `x' //save variable label
    label var `x'new "`lbl'" //apply variable label
	drop `x' //drop old variable
	rename `x'new `x' //rename copied variable
}
format date_of_birth %td

*remove demographics line
drop if redcap_event_name=="demographics_arm_1"

************************************************************
// 2. clean wave lines (one focal should has one wave)
************************************************************
*use gift card info to decide whether focal completed interview
replace ccid_gc= subinstr(ccid_gc, "a", "", .) //drop a (10325a to 10325)
destring ccid_gc,gen(SUBID) // ccid_gc is focal who completed interview
replace SUBID=10347 if gcccid=="10347" //mistakenly sign as informant
replace SUBID=6574 if gcccid=="6574a" //sign in the wrong form but complete

drop if missing(SUBID) //delete line with incomplete data
duplicates list SUBID //one focal should has one wave
replace SUBID=10420 if dem_ccid=="10420" & SUBID==10240  //10240 is a typo of 10420
order SUBID 

************************************************************
// 3. drop NON-participant data (REDcap data export order is based on Designer)
************************************************************
*drop tracking info
drop redcap_event_name-gift_card_receipt_complete
*drop informant variables
drop record_id22_w1-wave_5_informant_ses_complete
drop recordid_09f669-informant_enso_complete


************************************************************
// 4. collapse "5 waves" into 1 wave of data
************************************************************

*drop repeated record_id and ccid in 5 waves of data
drop record_id_* w4record_id recordid *ccid*
*rename variables that do not have consistent wave indicator
foreach x in _stress_and_qu _social_activi _physical_acti _caregiving _facial_memory _theory_of_mind _ses_occupatio {
	egen `x'=rowmean(*`x'_*) //collapse 5 waves into 1 wave
	drop *`x'_*
	rename `x' `x'_complete
}

/*collapse the 5 waves*/
*manually collapse variables that cannot be handled by loop below

*other variable have variable name (e.g. marriage) in its name
egen marriage=rowmean(marriage_w1 marriage_w2 marriage_w3 marriage_b05645 marriage_w5) 
local lbl : variable label marriage_w1 //save variable label
label var marriage "`lbl'" //apply variable label
drop marriage_w1 marriage_w2 marriage_w3 marriage_b05645 marriage_w5
egen family=rowmean(family_w1 family_w2 family_w3 family_925815 family_w5)
local lbl : variable label family_w1 //save variable label
label var family "`lbl'" //apply variable label
drop family_w1 family_w2 family_w3 family_925815 family_w5
egen friends=rowmean(friends_w1 friends_w2 friends_w3 friends_f9bfd5 friends_w5)
local lbl : variable label friends_w1 //save variable label
label var friends "`lbl'" //apply variable label
drop friends_w1 friends_w2 friends_w3 friends_f9bfd5 friends_w5
egen money=rowmean(money_w1 money_w2 money_w3 money_e858d9 money_w5)
local lbl : variable label money_w1 //save variable label
label var money "`lbl'" //apply variable label
drop money_w1 money_w2 money_w3 money_e858d9 money_w5
egen self=rowmean(self_w1 self_w2 self_w3 self_e5b645 self_w5)
local lbl : variable label self_w1 //save variable label
label var self "`lbl'" //apply variable label
drop self_w1 self_w2 self_w3 self_e5b645 self_w5

*string variable
foreach x in marriage_other other_relation require_expanded longest_job longest2_job job_activity job2_activity other_describe other_describe2 long_business long_business2 long2_business long2_business2 different_jobs neighborhood1 neighborhood2 neighborhood3 neighborhood4 neighborhood5 neighborhood6 neighborhood7 neighborhood8 neighborhood9 neighborhood10 neighborhood11 neighborhood12 neighborhood13 neighborhood14 neighborhood15 long_live1 long_live2 long_live3 long_live4 long_live5 long_live6 long_live7 long_live8 long_live9 long_live10 long_live11 long_live12 long_live13 long_live14 long_live15 {
    egen `x' = concat(`x'_*) 
	replace `x'=subinstr(`x',".","",.) 
    local lbl : variable label `x'_w1 //save variable label
    label var `x' "`lbl'" //apply variable label
	drop `x'_*
}

egen patient_name=concat(patient_w* patient_d8788c) 
replace patient_name=subinstr(patient_name,".","",.) 
local lbl : variable label patient_w1 
label var patient_name "`lbl'" 
drop patient_w* patient_d8788c

egen contacts_phone=concat(contacts_phone_*)
replace contacts_phone=subinstr(contacts_phone,".","",.) 
local lbl : variable label contacts_phone_w1 
label var contacts_phone "`lbl'" 
drop contacts_phone_*

foreach x in followers_twitter followers_instagram followers_pinterest followers_facebook followers_linkedin followers_snapchat followers_whatsapp followers_reddit followers_tumblr followers_skype sm_other religion_other {
	egen `x' = concat(`x'1_*)
    replace `x'=subinstr(`x',".","",.) //remove . from values
    local lbl : variable label `x'1_w1 //save variable label
    label var `x' "`lbl'" //apply variable label
    drop `x'1_*
}
foreach x in oliveoil leafy veg berry redmeat fish chicken cheese butter beans grain sweets nuts fastfood alcoholser {
	egen `x'=concat(`x'_*),p(;)
	replace `x' = subinstr(`x', ";.", "", .)
    replace `x' = subinstr(`x', ".;", "", .) 
	replace `x' = subinstr(`x', ";", "", .)
    local lbl : variable label `x'_w1 //save variable label
    label var `x' "`lbl'" //apply variable label
    drop `x'_*
}
rename veg vegother

/*loop to collapse the 5 waves*/
rename *_w2 *_ //Removes suffix w2 to prepare for loop

*hand code variables that do not end with _w2
*clean social_media variables
rename social_media1_2175ef* social_media1_w4* //rename to w4
rename social_media1_w#* =_w# //add suffix _w1 to wave 1 accordingly
rename social_media1*___* social_media1___*[2] // remove w# in the middle: [2] refers to 2nd *
rename *_w2 *_ //Remove suffix w2 to prepare for loop
*clean other variables
rename *___1 * //Remove remaining variables that end with ___1
rename *_w2 *_ //Remove suffix w2 to prepare for loop
rename (dontmodtot scale_16_v2 embarassed_behaviorr*) (dontmodtot_ scale_16_v2_ embarassed_behavior*)
  

*start loop
foreach x of varlist health_-ladder_ {
	egen new`x'=rowmean(`x'*) //collapse 5 waves into 1 wave
    local lbl : variable label `x'w1 //save variable label
    label var new`x' "`lbl'" //apply variable label
	label values new`x' `x'w1_ // apply value label
	drop `x'* //drop old variables
	rename new`x' `x'
}


************************************************************
// 5. rename variables with 1 wave 
************************************************************
*cognitive function + wave 1 stress_and_quality of life: rey_w1-wave_1_trails_complete + race_w1-workhours_w1
rename *_w1f *_
rename *_w1 *_
*missing ENSO demo: recordid-my_first_instrument_complete
rename *_w1enso *_

save "REDcap-R01-w1-participant-reformated",replace

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old" //reset directory for rule-all do file




