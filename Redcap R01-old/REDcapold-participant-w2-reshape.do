****Author:  Siyun Peng
****Date:    2021/06/08
****Version: 16
****Purpose: clean W2 data for REDcap R01 Participant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\temp" //home
*do "REDcapold-R01-w2-import" //import w2 

*Interview date
gen redcap_date = dofc(gift_date) //remove hours and minutes
format redcap_date %td
*list signature_sub if ccid_gc=="3568" //show interview for 3568, which missing gift_date
*replace redcap_date = daily("02oct2019", "DMY") if ccid_gc=="3568"
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
rename ccid_gc SUBID // ccid_gc is focal who completed interview
drop if missing(SUBID) //delete line with incomplete data
duplicates list SUBID //one focal should has one wave
order SUBID 

************************************************************
// 3. drop NON-participant data (REDcap data export order is based on Designer)
************************************************************
*drop tracking info
drop redcap_event_name-informant_gift_card__v_9
*drop informant variables
drop record_id2_w1-wave_6_informant_ses_complete


************************************************************
// 4. collapse "5 waves" into 1 wave of data
************************************************************

*drop repeated record_id and ccid in 5 waves of data
drop *record_id* *ccid*

*rename variables that do not have consistent wave indicator
foreach x in _stress_and_qu _social_activi _physical_acti _caregiving the_office_task _ses_occupatio {
	egen `x'=rowmean(*`x'_*) //collapse 5 waves into 1 wave
	drop *`x'_*
	rename `x' `x'_complete
}

/*collapse the 5 waves*/
*manually collapse variables that cannot be handled by loop below

*other variable have variable name (e.g. marriage) in its name
egen marriage=rowmean(marriage_w2_w2 marriage_w3_w2 marriage_w4_w2 marriage_w5_w2 marriage_w6_w2) 
local lbl : variable label marriage_w2_w2 //save variable label
label var marriage "`lbl'" //apply variable label
drop marriage_w2_w2 marriage_w3_w2 marriage_w4_w2 marriage_w5_w2 marriage_w6_w2
egen family=rowmean(family_w2_w2 family_w3_w2 family_w4_w2 family_w5_w2 family_w6_w2)
local lbl : variable label family_w2_w2 //save variable label
label var family "`lbl'" //apply variable label
drop family_w2_w2 family_w3_w2 family_w4_w2 family_w5_w2 family_w6_w2 
egen friends=rowmean(friends_w2_w2 friends_w3_w2 friends_w4_w2 friends_w5_w2 friends_w6_w2)
local lbl : variable label friends_w2_w2 //save variable label
label var friends "`lbl'" //apply variable label
drop friends_w2_w2 friends_w3_w2 friends_w4_w2 friends_w5_w2 friends_w6_w2
egen money=rowmean(money_w2_w2 money_w3_w2 money_w4_w2 money_w5_w2 money_w6_w2)
local lbl : variable label money_w2_w2 //save variable label
label var money "`lbl'" //apply variable label
drop money_w2_w2 money_w3_w2 money_w4_w2 money_w5_w2 money_w6_w2
egen self=rowmean(self_w2_w2 self_w3_w2 self_w4_w2 self_w5_w2 self_w6_w2)
local lbl : variable label self_w2_w2 //save variable label
label var self "`lbl'" //apply variable label
drop self_w2_w2 self_w3_w2 self_w4_w2 self_w5_w2 self_w6_w2
egen activities_hear=rowmean(activities_w2_w2 activities_w3_w2 activities_w4_w2 activities_w5_w2 activities_w6_w2)
local lbl : variable label activities_w2_w2 //save variable label
label var activities_hear "`lbl'" //apply variable label
drop activities_w2_w2 activities_w3_w2 activities_w4_w2 activities_w5_w2 activities_w6_w2

*string variable
foreach x in marriage_other other_relation require_expanded contacts_phone volunteer_hours other_specify grade_mother grade_father {
    egen `x' = concat(`x'_*) 
	replace `x'=subinstr(`x',".","",.) 
    local lbl : variable label `x'_w2_w2 //save variable label
    label var `x' "`lbl'" //apply variable label
	drop `x'_*
}

egen patient_name=concat(patient_w*) 
replace patient_name=subinstr(patient_name,".","",.) 
local lbl : variable label patient_w2_w2 
label var patient_name "`lbl'" 
drop patient_w*

egen volunteer_other=concat(other_w*) 
replace volunteer_other=subinstr(volunteer_other,".","",.) 
local lbl : variable label other_w2_w2 
label var volunteer_other "`lbl'" 
drop other_w*

foreach x in followers_twitter followers_instagram followers_pinterest followers_facebook followers_linkedin followers_snapchat followers_whatsapp followers_reddit followers_tumblr followers_skype sm_other religion_other {
	egen `x' = concat(`x'1_*)
    replace `x'=subinstr(`x',".","",.) //remove . from values
    local lbl : variable label `x'1_w2_w2 //save variable label
    label var `x' "`lbl'" //apply variable label
    drop `x'1_*
}
foreach x in oliveoil leafy veg berry redmeat fish chicken cheese butter beans grain sweets nuts fastfood alcoholser {
	egen `x'=concat(`x'_*),p(;)
	replace `x' = subinstr(`x', ";.", "", .)
    replace `x' = subinstr(`x', ".;", "", .) 
	replace `x' = subinstr(`x', ";", "", .)
    local lbl : variable label `x'_w2_w2 //save variable label
    label var `x' "`lbl'" //apply variable label
    drop `x'_*
}
rename veg vegother


/*loop to collapse the 5 waves*/
rename *_w2_w2 *_ //Removes suffix w2 to prepare for loop

*hand code variables that do not end with _w2
*clean social_media variables
rename social_media1_w#* =_w# //add suffix _w1 to wave 1 accordingly
rename social_media1*___* social_media1___*[2] // remove w# in the middle: [2] refers to 2nd *
rename *_w2 *_ //Remove suffix w2 to prepare for loop
*clean volunteer_activities variables (Only for Wave 2 in SES Occupation And Housing, not in Wave 1)
rename volunteer_activities* volunteer_act* //variable name is too long
rename volunteer_act_w#* =_w# //add suffix _w1 to wave 1 accordingly
rename volunteer_act*___* volunteer_act___*[2] // remove w# in the middle: [2] refers to 2nd *
rename *_w2 *_ //Remove suffix w2 to prepare for loop
rename (volunteer_act_v_13 volunteer_act_v_14 volunteer_act_v_15 volunteer_act_v_16 volunteer_act_v_17) (volunteer_act___10_ volunteer_act___11_ volunteer_act___12_ volunteer_act___13_ volunteer_act___14_) //rename weird names in w2
rename (volunteer_act_v_22 volunteer_act_v_23 volunteer_act_v_24 volunteer_act_v_25 volunteer_act_v_26) (volunteer_act___10_w3 volunteer_act___11_w3 volunteer_act___12_w3 volunteer_act___13_w3 volunteer_act___14_w3) //rename weird names in w3
rename (volunteer_act_v_31 volunteer_act_v_32 volunteer_act_v_33 volunteer_act_v_34 volunteer_act_v_35) (volunteer_act___10_w4 volunteer_act___11_w4 volunteer_act___12_w4 volunteer_act___13_w4 volunteer_act___14_w4) //rename weird names in w4
rename (volunteer_act_v_40 volunteer_act_v_41 volunteer_act_v_42 volunteer_act_v_43 volunteer_act_v_44) (volunteer_act___10_w5 volunteer_act___11_w5 volunteer_act___12_w5 volunteer_act___13_w5 volunteer_act___14_w5) //rename weird names in w5
rename (volunteer_act_v_49 volunteer_act_v_50 volunteer_act_v_51 volunteer_act_v_52 volunteer_act_v_53) (volunteer_act___10_w6 volunteer_act___11_w6 volunteer_act___12_w6 volunteer_act___13_w6 volunteer_act___14_w6) //rename weird names in w6


*clean other variables
rename *___1 * //Remove remaining variables that end with ___1
rename *_w2_w2 *_ //Remove suffix w2 to prepare for loop
rename (embarassed_behaviorr*) (embarassed_behavior*)
rename (dontmodtot_08c989_ memthink_w6_ embarassed_w6_)  ///
       (dontmodtot_ memthink_f_w6_ embarassed_behavior_w6_)

*start loop
foreach x of varlist health_-ladder_ marital_ employment_ workhours_ {
	egen new`x'=rowmean(`x'*) //collapse 5 waves into 1 wave
    local lbl : variable label `x'w3 //save variable label
    label var new`x' "`lbl'" //apply variable label
	label values new`x' `x'w3_w2_ // apply value label
	drop `x'* //drop old variables
	rename new`x' `x'
}


************************************************************
// 5. rename variables with 1 wave 
************************************************************
*None for R01 wave 2

save "REDcap-R01-w2-participant-reformated",replace


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old" //reset directory for rule-all do file




