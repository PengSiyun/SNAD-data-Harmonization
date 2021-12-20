****Priject: SNAD
****Author:  Siyun Peng
****Date:    2021/12/22
****Version: 17
****Purpose: Harmonize data from IADRC and SNAD -participant
clear
*cd "C:\Users\siypeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data" //office
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"



***************************************************************
**# 1 Append Pilot participant T1, T2, T3, T4+ ENSO+ NC
***************************************************************
use "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", clear
append using "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta"
append using "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta"
append using "SNAD-Participant-T4-CleanB-EGOAGG-092520.dta",force
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-pilot-clean.dta"
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-EGOAGG-pilot-clean-20211112.dta"

*gen source indicator
rename time pilot //rename old time indicator in pilots
recode pilot (1/4=1),gen(source) 
replace source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n

save "SNAD-Participant-EGOAGG-pilotmatch-clean.dta", replace 




***************************************************************
**# 2 Append full participant ENSO+NC
***************************************************************



use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-clean.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-EGOAGG-clean-20211112.dta"

*gen source indicator
gen source=1 if ENSO==1
replace source=2 if !missing(NC)
label define source 1 "ENSO" 2 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n
save "SNAD-Participant-EGOAGG-clean.dta", replace 


/*create match data for IADRC*/


use "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", clear
append using "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta"
append using "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta"
append using "SNAD-Participant-T4-CleanB-EGOAGG-092520.dta",force
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-clean.dta"
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-EGOAGG-clean-20211112.dta"

*gen time indicator
drop time
sort SUBID date_snad
bysort SUBID: gen time=_n

*create match data
keep SUBID date_snad time 
egen tot_wave=max(time)
reshape wide date_snad, i(SUBID) j(time)
save "SNAD-MatchData.dta", replace //match all SNAD ego regardless of they have important/health matter




***************************************************************
**# 3 Clean Demographics info
***************************************************************




/*Merge IADRC with SNAD Demo & fill in those missing in IADRC*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean\Clean data\IADC-Cross-Clean.dta", clear
merge 1:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\ENSO-Participant-ego-clean",nogen //1 in ENSO (1352) not found in IADRC 
merge 1:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-participant-demographics.dta",nogen //21 in Redcap (10469,10475,10481,10483,10484 + non IADRC focal) not found in IADRC 

*married was collected as demo before new R01; IADC update the demo with most recent marital status
rename married married_iadc_demo
rename married_enso married_enso_demo
recode marital_red (1 4 5 6=0) (2 3=1)
rename marital_red married_oldred_demo
label values married_oldred_demo married

*harmonize demo from 3 sources (IADC most accurate, then Redcap, then ENSO)
recode gender_red sex_enso (1=0) (2=1)
replace female=gender_red if missing(female)
replace female=sex_enso if missing(female)
drop gender_red sex_enso

recode race_red (5=1) (.=.) (else=0),gen(white_red)
replace white=white_red if missing(white)
drop race_red race white_red

rename death deceased_iadc

replace military_red=veteran_enso if missing(military_red)
rename military_red veteran
drop veteran_enso

replace children_red=biochild_enso if missing(children_red)
replace step_red=othchild_enso if missing(step_red)
egen kids_snad=rowtotal(children_red step_red),mi
replace kids=kids_snad if missing(kids)
drop kids_snad children_red biochild_enso step_red othchild_enso

recode grade (0/11=1) (12=2) (13/15=3) (16=4) (17/30=5), gen(edu)
label values edu school_red
replace edu=school_red if missing(edu)
replace edu=educat_enso if missing(edu)
drop school_red educat_enso

tostring birthyr birthmnth,replace
destring birthmnth,gen(month)
gen birthmnth2="0"+ birthmnth if month<10
replace birthmnth2=birthmnth if missing(birthmnth2)
gen dob=birthyr+birthmnth2+"15" // no days, so assume it is 15th
destring dob,replace force
todate dob, gen(dobdate) p(yyyymmdd) f(%dd_m_cy) //install todate if not alreday;ssc install todate  
replace date_of_birth_red=dobdate if missing(date_of_birth_red) //IADC does not have days info, so Redcap is better
drop birthyr birthmnth month birthmnth2 dob dobdate
rename date_of_birth_red dobdate

save "Demographics.dta", replace




***************************************************************
**# 4 Match IADC clinical data with SNAD
***************************************************************




use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean\Clean data\IADC-Long-Clean.dta", clear


*drop cases of IADC that are 180 days apart from SNAD at any wave
merge m:1 SUBID using "SNAD-MatchData.dta" 
fre SUBID if _merge==1 //216 cases in IADRC not in SNAD 
fre SUBID if _merge==2 //21 peole with SNAD but no IADC
order date_snad*, after(visitdate)

*extract total number of waves in SNAD
sum tot_wave
local num=`r(max)' 

gen match=.
forvalues i=1/`num' {
	replace match=`i' if visitdate==date_snad`i' & !missing(visitdate) //exact match
	gen diff`i'=abs(visitdate-date_snad`i') //calculate difference between visits
}

order match, after(visitdate)

*match within 180 days
egen minval = rowmin(diff*) //SNAD date closest to IADC date
forvalues i=1/`num' {
	replace diff`i'=. if minval!=diff`i' //only keep the matched wave
}

forvalues i=1/`num' {
	fre diff`i' if match==.
	replace match=`i' if diff`i'<=180 & missing(match)
}


duplicates list SUBID match if !missing(match) //3 mismatch
list SUBID visitdate date_snad* diff* match if SUBID==3805 & minval<=180
replace match=. if diff1==112 & SUBID==3805
list SUBID visitdate date_snad* diff* match if SUBID==6343 & minval<=180
replace match=. if diff1==166 & SUBID==6343
list SUBID visitdate date_snad* diff* match if SUBID==10179 & minval<=180
replace match=. if diff1==170 & SUBID==10179

drop if match==.

fre SUBID if _merge==3 //N=756
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if match==`i'
	drop date_snad`i'
}
format date_snad %td
rename visitdate date_iadc
drop _merge minval diff1 diff2 diff3 diff4 diff5 diff6

*prepare for merge with mail-in from Redcap
tostring oliveoil-alcoholdrinks veg,replace

save "IADC-Long-Clean-snadMatch.dta", replace




***************************************************************
**# 5 Match MRI with SNAD
***************************************************************




use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean\Neuroimaging-CleanA.dta" ,replace

merge m:1 SUBID using "SNAD-MatchData.dta"
drop if _merge==1 //drop people did not do SNAD
drop if _merge==2 //drop people did not do imaging

drop _merge
save "Neuroimaging-CleanA2.dta" ,replace

*drop cases of IADC that are 1 year apart from SNAD at any wave

keep SUBID tot_wave date_snad* scanage-globalctx_thick //drop non-MRI variables
destring icv-globalctx_thick,replace

*extract total number of waves in SNAD
sum tot_wave
local num=`r(max)' 

gen matchmri=.
forvalues i=1/`num' {
	replace matchmri=`i' if date_mri==date_snad`i' & !missing(date_mri) //exact match
	gen diffmri`i'=abs(date_mri-date_snad`i') //calculate difference between visits
}

egen minval = rowmin(diffmri*) //SNAD date closest to Neuroimaging date
forvalues i=1/`num' {
	replace diffmri`i'=. if minval!=diffmri`i' //only keep the matched wave
}

*match within 365 days
forvalues i=1/`num' {
	fre diffmri`i' if matchmri==. & diffmri`i'<400
	replace matchmri=`i' if diffmri`i'<=365 & missing(matchmri)
}


duplicates list SUBID matchmri if !missing(matchmri) //9 mismatch

list SUBID matchmri diffmri* date_mri date_snad* if SUBID==5032 & minval<=365
replace matchmri=. if diffmri1==337 & SUBID==5032 
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==6409 & minval<=365
replace matchmri=3 if diffmri4==164 & SUBID==6409  
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==6417 & minval<=365
replace matchmri=. if diffmri1==357 & SUBID==6417  
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==6541 & minval<=365
replace matchmri=1 if diffmri2==3 & SUBID==6541 
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==10002 & minval<=365
replace matchmri=2 if diffmri1==36 & SUBID==10002  
replace matchmri=3 if diffmri2 ==113 & SUBID==10002  
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==10087 & minval<=365
replace matchmri=2 if diffmri1==2 & SUBID==10087  
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==10088 & minval<=365
replace matchmri=. if diffmri1==329 & SUBID==10088  
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==10101 & minval<=365
replace matchmri=. if diffmri1==350 & SUBID==10101  
list SUBID matchmri diffmri* date_mri date_snad* if SUBID==10154 & minval<=365
replace matchmri=4 if diffmri4==274 & SUBID==10154  

di date("20140514","YMD") //19857=one year before SNAD
fre matchmri date_mri if date_mri>19857 //231 out of 312

gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if matchmri==`i'
	drop date_snad`i'
}
format date_snad %td

drop diffmri* minval //drop non-MRI data
drop if missing(matchmri)
save "MRI-Clean-snadMatch.dta" ,replace




***************************************************************
**# 6 Match TauDate_ with SNAD
***************************************************************




use "Neuroimaging-CleanA2.dta" ,replace
keep SUBID tot_wave date_snad* tau-av1451_crus_globalctx 

*extract total number of waves in SNAD
sum tot_wave
local num=`r(max)' 
gen matchtau=.
forvalues i=1/`num' {
	replace matchtau=`i' if date_tau==date_snad`i' & !missing(date_tau) //exact match
	gen difftau`i'=abs(date_tau-date_snad`i') //calculate difference between visits
}

egen minval = rowmin(difftau*) //SNAD date closest to Neuroimaging date
forvalues i=1/`num' {
	replace difftau`i'=. if minval!=difftau`i' //only keep matched wave
}

*match within 365 days
forvalues i=1/`num' {
	fre difftau`i' if matchtau==.
	replace matchtau=`i' if difftau`i'<=365 & missing(matchtau)
}

duplicates list SUBID matchtau if !missing(matchtau) //0 mismatch

di date("20140514","YMD") //19857=one year before SNAD
fre matchtau date_tau if date_tau>19857 //90 out of 108
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if matchtau==`i'
	drop date_snad`i'
}
format date_snad %td

drop if missing(matchtau)
drop minval difftau* 
save "TAU-Clean-snadMatch.dta" ,replace




***************************************************************
**# 7 Match AmyDate_ with SNAD
***************************************************************




use "Neuroimaging-CleanA2.dta" ,replace
keep SUBID tot_wave date_snad* amyloid-glctx_cent_cl 

*extract total number of waves in SNAD
sum tot_wave
local num=`r(max)' 
gen matchamy=.
forvalues i=1/`num' {
	replace matchamy=`i' if date_amy==date_snad`i' & !missing(date_amy) //exact match
	gen diffamy`i'=abs(date_amy-date_snad`i') //calculate difference between visits
}

egen minval = rowmin(diffamy*) //SNAD date closest to Neuroimaging date
forvalues i=1/`num' {
	replace diffamy`i'=. if minval!=diffamy`i' //only keep matched wave
}

*match within 365 days
forvalues i=1/`num' {
	fre diffamy`i' if matchamy==.
	replace matchamy=`i' if diffamy`i'<=365 & missing(matchamy) 
}


duplicates list SUBID matchamy if !missing(matchamy) //check and fix 1 duplicates

list SUBID matchamy diff* date_amy date_snad* if SUBID==6417 & !missing(date_amy)
replace matchamy=2 if diffamy1==100 & SUBID==6417

di date("20140514","YMD") //19857=one year before SNAD
fre matchamy date_amy if date_amy>19857 //104 out of 136
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if matchamy==`i'
	drop date_snad`i'
}
format date_snad %td

drop if missing(matchamy)

drop minval diffamy*
save "AMY-Clean-snadMatch.dta" ,replace




***************************************************************
**# 8 Match REDCap_R01 with SNAD
***************************************************************




use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-participant.dta",clear
merge m:1 SUBID using "SNAD-MatchData.dta"
drop if _merge==1 //drop 4 people in Redcap not complete network: 6477,10045,10397,10484
drop if _merge==2 //drop people did not do REDCap
order SUBID date_red date_snad*

*extract total number of waves in SNAD
sum tot_wave
local num=`r(max)' 
gen matchred=.
forvalues i=1/`num' {
	replace matchred=`i' if date_red==date_snad`i' & !missing(date_red) //exact match
	gen diffred`i'=abs(date_red-date_snad`i') //calculate difference between visits
}

egen minval = rowmin(diffred*) //SNAD date closest to REDCap date
forvalues i=1/`num' {
	replace diffred`i'=. if minval!=diffred`i' //only keep matched wave
}

*match within 60 days (Network data collection may be completed later due to time)
forvalues i=1/`num' {
	fre diffred`i' if matchred==.
	replace matchred=`i' if diffred`i'<=60 & missing(matchred)
}

duplicates list SUBID matchred if !missing(matchred) //0 duplicates

*check interviews lag>60 days
fre SUBID if missing(matchred) //3 not matched
list SUBID date_red date_snad* if missing(matchred)
list matchred date_red date_snad* diffred* if SUBID==6418 //NC interview not found
list matchred date_red diffred* if SUBID==10250
replace matchred=4 if SUBID==10250 & diffred4==147 
list matchred date_red diffred* if SUBID==10394 //ENSO interview not finished

drop time

gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if matchred==`i'
	drop date_snad`i'
}
format date_snad %td
drop if missing(matchred)

save "red-Clean-snadMatch.dta",replace




***************************************************************
**# 9 Merge files
***************************************************************




*load Demographics info
use "Demographics.dta", clear 

*add Redcap data
merge 1:m SUBID using "red-Clean-snadMatch.dta", nogen 

*add IADC data
merge 1:1 SUBID date_snad using "IADC-Long-Clean-snadMatch.dta", nogen update // update: when in conflict, prefer Redcap over IADRC for mail-in packet

*add Neuroimaging data
merge 1:1 SUBID date_snad using "MRI-Clean-snadMatch.dta",nogen
merge 1:1 SUBID date_snad using "TAU-Clean-snadMatch.dta",nogen 
merge 1:1 SUBID date_snad using "AMY-Clean-snadMatch.dta",nogen 
drop _merge

*add SNAD data (Full)
preserve

merge 1:1 SUBID date_snad using "SNAD-Participant-EGOAGG-clean" 
drop if _merge==1 //drop cases have no R01 SNAD data
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday 
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-R01-preexlusion-20211217",replace

restore

*add SNAD data (pilot match)
merge 1:1 SUBID date_snad using "SNAD-Participant-EGOAGG-pilotmatch-clean.dta" 
drop if _merge==1 //drop cases have no SNAD data
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday 
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-pilotmatch-preexlusion-20211217",replace






***************************************************************
**# 10 Exclusion criteria for all analyses 
***************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data"

*Drop people who should not be in the study based on exlusion criteria for SAND: MoCA<10, age<45, Prion disease, and bipolar at T1


/*R01 only*/


use "SNAD-Analysis-R01-preexlusion-20211217",clear
drop if agesnad<45 | MOCATOTS<10 
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease" 
save "SNAD-Analysis-R01-20211217", replace


/*Pilot matched*/


use "SNAD-Analysis-pilotmatch-preexlusion-20211217",clear

drop if agesnad<45 | MOCATOTS<10 
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease" 
save "SNAD-Analysis-pilotmatch-20211217", replace


