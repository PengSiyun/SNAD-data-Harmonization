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
	replace match=`i' if diff`i'<=180
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
rename match time
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if time==`i'
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
	replace matchmri=`i' if diffmri`i'<=365 
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

rename matchmri time
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if time==`i'
	drop date_snad`i'
}
format date_snad %td

drop diffmri* minval //drop non-MRI data
drop if missing(time)
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
	replace matchtau=`i' if difftau`i'<=365  // or 365 for half a year
}

duplicates list SUBID matchtau if !missing(matchtau) //0 mismatch

di date("20140514","YMD") //19857=one year before SNAD
fre matchtau date_tau if date_tau>19857 //90 out of 108
rename  matchtau time
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if time==`i'
	drop date_snad`i'
}
format date_snad %td

drop if missing(time)
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
	replace matchamy=`i' if diffamy`i'<=365  // or 180 for half a year
}


duplicates list SUBID matchamy if !missing(matchamy) //check and fix 1 duplicates

list SUBID matchamy diff* date_amy date_snad* if SUBID==6417 & !missing(date_amy)
replace matchamy=2 if diffamy1==100 & SUBID==6417

di date("20140514","YMD") //19857=one year before SNAD
fre matchamy date_amy if date_amy>19857 //104 out of 136
rename matchamy time
gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if time==`i'
	drop date_snad`i'
}
format date_snad %td

drop if missing(time)

drop minval diffamy*
save "AMY-Clean-snadMatch.dta" ,replace




***************************************************************
**# 8 Match Old REDCap_R01 with SNAD
***************************************************************

**start here


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant.dta",clear
merge m:1 SUBID using "SNAD-MatchData.dta"
drop if _merge==1 //drop 16 people in Redcap not complete network (12 people interviewed in NetCanvas, 4 people are missing in ENSO): 6477,10394,10397,10420
drop if _merge==2 //drop people did not do old REDCap
order SUBID redcap_date date_snad1 date_snad2 date_snad3 date_snad4 date_snad5
rename redcap_date date_red

gen matchred=.
replace matchred=1 if date_red==date_snad1 & !missing(date_red)
replace matchred=2 if date_red==date_snad2 & !missing(date_red)
replace matchred=3 if date_red==date_snad3 & !missing(date_red)
replace matchred=4 if date_red==date_snad4 & !missing(date_red)
replace matchred=5 if date_red==date_snad5 & !missing(date_red)

fre time if missing(matchred) //33 not exact match: 4 in T1 of R01, all 29 T2 was done in NetCanvas
list SUBID time date_red date_snad1 date_snad2 date_snad3 date_snad4 date_snad5 if missing(matchred) & time==1 // 6409,10021 interviewed in NETcanvas; 3517,3594 network data not found anywhere.

drop time
rename matchred time
drop if missing(time)
save "red-Clean-20210630.dta" ,replace



***************************************************************
**# 9 Merge files
***************************************************************


*load Demographics info
use "Demographics.dta", clear 

/*
****************add SNAD data (this is not compatible with pilot because network measures have elastic ties in ENSO)
preserve
merge 1:1 SUBID time using "SNAD-Participant-T12345-EGOAGG-clean.dta" 
list SUBID enrolldate date_snad if _merge==2 // 9 people interviewed with SNAD but not IADC (Need to get IADC in the future)
drop if _merge==1 //drop 16 cases have no SNAD data
drop _merge date_snad1 date_snad2 date_snad3 date_snad4 date_snad5 date_iadc //date_iadc is from snad and contain many missing

*create age based on SNAD date
personage dobdate date_snad, gen(agesnad) //install personage if not alreday 

save "SNAD-Participant-T12345-EGOAGG-mergeIADRC.dta",replace 
restore
*/

****************add SNAD data (pilot match)
merge 1:m SUBID using "SNAD-Participant-T12345-EGOAGG-pilot-clean.dta" 
list SUBID enrolldate date_snad if _merge==2 // 1 people interviewed with SNAD but not IADC (10234 did not finish enrollment in IADRC)
drop if _merge==1 //drop 87 cases not having network data

*create age based on SNAD date
personage dobdate date_snad, gen(agesnad) //install personage if not alreday 

*add Redcap data
merge 1:1 SUBID time using "red-Clean-20210630.dta", nogen keep(match master) //117 matched

*add IADC data
merge 1:1 SUBID time using "IADC-Long-CleanB.dta", nogen keep(match master match_update match_conflict) update //6 cases missing IADC data due to >180 days apart from SNAD at least one wave; update: when in conflict, prefer Redcap over IADRC for mail-in packet

*add Neuroimaging data
merge 1:1 SUBID time using "MRI-Clean-20201001.dta",nogen keep(match master) //233 matched

merge 1:1 SUBID time using "TAU-Clean-20201001.dta",nogen keep(match master) //91 matched

merge 1:1 SUBID time using "AMY-Clean-20201001.dta",nogen keep(match master) //106 matched

drop _merge date_snad1 date_snad2 date_snad3 date_snad4 date_snad5 date_iadc //date_iadc is from snad and contain many missing


save "SNAD-Participant-T12345-EGOAGG-pilot-mergeIADRC.dta",replace



***************************************************************
**# 10 Exclusion criteria for all analyses 
***************************************************************

*Drop people who should not be in the study based on exlusion criteria for SAND: MoCA<10, age<45, Prion disease, and bipolar at T1

*********pilot
use "SNAD-Participant-T12345-EGOAGG-pilot-mergeIADRC.dta",clear

drop if agesnad<45 | MOCATOTS<10 
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease" 

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\SNAD-Analysis-T12345-20210915-Imaging from Shannon.dta", replace

*merge old imaging data with shannon's new version (need to add old imaging to T3)
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\SNAD-Analysis-T1T2-20200311-old imaging",replace 
keep SUBID time ICV_-Amy_Cent_Precuneus_
foreach x of varlist ICV_-Amy_Cent_Precuneus_ {
	rename `x' `x'old
}
destring SUBID,replace

merge 1:1 SUBID time using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\SNAD-Analysis-T12345-20210915-Imaging from Shannon.dta"
drop if _merge==1 //drop unmatched cases from old imaging (mostly empty cases)
drop _merge 
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\SNAD-Analysis-T12345-20210915-all imaging.dta", replace

