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

**start here

replace dem_military=veteran_enso if missing(dem_military)
rename dem_military veteran

replace dem_biochild=biochild_enso if missing(dem_biochild)
replace dem_nonbio=othchild_enso if missing(dem_nonbio)
replace kids=dem_biochild+dem_nonbio if missing(kids)

recode grade (0/11=1) (12=2) (13/15=3) (16=4) (17/30=5), gen(edu)
label values edu dem_education_w1enso_
replace edu=dem_education if missing(edu)
replace edu=educat_enso if missing(edu)

replace birthmnth=month(date_of_birth) if missing(birthmnth)
replace birthyr=year(date_of_birth) if missing(birthyr)

drop dem_marital married_enso dem_sex sex_enso veteran_enso biochild_enso othchild_enso dem_education educat_enso ///
empstat_enso emphrs_enso empstat_other_enso //current employment is not demographic

save "Demographics.dta", replace



***************************************************************
**# 4 Match IADC with SNAD
***************************************************************




use "IADC-Long-CleanA.dta", clear
*create variable for AD
gen ad=primarysubtype
replace ad= "Alzheimers disease" if contributel=="Alzheimers disease" //code as AD if other condition says AD even primary subtype is not AD 
gen adtype=1 if ad== "Alzheimers disease"	  
replace	adtype=0 if !missing(ad) & adtype!=1	   
label define ad 0 "Non AD" 1 "AD"
label values adtype ad
*create diagnosis variable + data clean
encode diag,gen(diagnosis) //convert string to numeric
recode diagnosis (4 7 8=1) (1 2 5 6 =2) (3=3)
lab def diagnosisnew 1 "Normal" 2 "MCI" 3 "Dementia"
lab val diagnosis diagnosisnew
lab var diagnosis "Normal, MCI, or dementia"

label var CCI_INFTOT "Informant CCI Total score"
rename age age_i
rename ageatvisit ageiadc


*drop cases of IADC that are 180 days apart from SNAD at any wave
merge m:1 SUBID using "SNAD-MatchData.dta" 
fre SUBID if _merge==1 //201 people in IADRC not in SNAD 
fre SUBID if _merge==2 //1 peole with SNAD but no IADC
order date_snad5 date_snad4 date_snad3 date_snad2 date_snad1, after(visitdate)

gen match=.
replace match=1 if visitdate==date_snad1 & !missing(visitdate)
replace match=2 if visitdate==date_snad2 & !missing(visitdate)
replace match=3 if visitdate==date_snad3 & !missing(visitdate)
replace match=4 if visitdate==date_snad4 & !missing(visitdate)
replace match=5 if visitdate==date_snad5 & !missing(visitdate)

order match, after(visitdate)

gen diff1=abs(visitdate-date_snad1)
gen diff2=abs(visitdate-date_snad2)
gen diff3=abs(visitdate-date_snad3)
gen diff4=abs(visitdate-date_snad4)
gen diff5=abs(visitdate-date_snad5)

egen minval = rowmin(diff1 diff2 diff3 diff4 diff5) //SNAD date closest to IADC date
replace diff1=. if minval!=diff1
replace diff2=. if minval!=diff2
replace diff3=. if minval!=diff3
replace diff4=. if minval!=diff4
replace diff5=. if minval!=diff5

fre diff1 if match==.
replace match=1 if diff1<=180

fre diff2 if match==.
replace match=2 if diff2<=180

fre diff3 if match==.
replace match=3 if diff3<=180

fre diff4 if match==.
replace match=4 if diff4<=180

fre diff5 if match==.
replace match=5 if diff5<=180

duplicates list SUBID match if !missing(match) //3 mismatch
list SUBID visitdate date_snad* diff* match if SUBID==3805 & minval<=180
replace match=. if diff1==112 & SUBID==3805
list SUBID visitdate date_snad* diff* match if SUBID==6343 & minval<=180
replace match=. if diff1==166 & SUBID==6343
list SUBID visitdate date_snad* diff* match if SUBID==10179 & minval<=180
replace match=. if diff1==170 & SUBID==10179

drop if match==.

fre SUBID if _merge==3 //N=654
rename match time
rename visitdate iadcdate
drop _merge minval diff1 diff2 diff3 diff4 diff5
*prepare for merge with mail-in from Redcap
tostring oliveoil-alcoholdrinks veg,replace

save "IADC-Long-CleanB.dta", replace


***************************************************************
**# 5 Match MRI with SNAD
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "IADC-CleanA.dta" ,replace

merge m:1 SUBID using "SNAD-MatchData.dta"
drop if _merge==1 //drop people did not do SNAD
drop if _merge==2 //drop people did not do imaging

drop _merge
save "Neuroimaging-CleanA2.dta" ,replace

*drop cases of IADC that are 1 year apart from SNAD at any wave

keep SUBID date_snad* scanage-globalctx_thick //drop non-MRI variables
destring icv-globalctx_thick,replace

gen matchmri=.
replace matchmri=1 if date_mri==date_snad1 & !missing(date_mri)
replace matchmri=2 if date_mri==date_snad2 & !missing(date_mri)
replace matchmri=3 if date_mri==date_snad3 & !missing(date_mri)
replace matchmri=4 if date_mri==date_snad4 & !missing(date_mri)
replace matchmri=5 if date_mri==date_snad5 & !missing(date_mri)

gen diffmri1=abs(date_mri-date_snad1)
gen diffmri2=abs(date_mri-date_snad2)
gen diffmri3=abs(date_mri-date_snad3)
gen diffmri4=abs(date_mri-date_snad4)
gen diffmri5=abs(date_mri-date_snad5)

egen minval = rowmin(diffmri1 diffmri2 diffmri3 diffmri4 diffmri5) //SNAD date closest to Neuroimaging date
replace diffmri1=. if minval!=diffmri1
replace diffmri2=. if minval!=diffmri2
replace diffmri3=. if minval!=diffmri3
replace diffmri4=. if minval!=diffmri4
replace diffmri5=. if minval!=diffmri5

fre diffmri1 if matchmri==. & diffmri1<400
replace matchmri=1 if diffmri1<=365 // or 186 for half a year

fre diffmri2 if matchmri==. & diffmri2<400
replace matchmri=2 if diffmri2<=365 // or 181 for half a year

fre diffmri3 if matchmri==. & diffmri3<400
replace matchmri=3 if diffmri3<=365 // or 181 for half a year

fre diffmri4 if matchmri==. & diffmri4<400
replace matchmri=4 if diffmri4<=365 // or 181 for half a year

fre diffmri5 if matchmri==. & diffmri5<400
replace matchmri=5 if diffmri5<=365 // or 181 for half a year

duplicates list SUBID matchmri if !missing(matchmri) //8 mismatch

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

di date("20140514","YMD") //19857=one year before SNAD
fre matchmri date_mri if date_mri>19857 //231 out of 312

rename matchmri time
drop date_snad* diffmri* minval //drop non-MRI data
drop if missing(time)
save "MRI-Clean-20201001.dta" ,replace


***************************************************************
**# 6 Match TauDate_ with SNAD
***************************************************************

use "Neuroimaging-CleanA2-20201001.dta" ,replace
keep SUBID date_snad1 date_snad2 date_snad3 date_snad4 date_snad5 date_tau AV1451_crus_EntCtx_t-AV1451_crus_GlobalCtx_t 

gen matchtau=.
replace matchtau=1 if date_tau==date_snad1 & !missing(date_tau)
replace matchtau=2 if date_tau==date_snad2 & !missing(date_tau)
replace matchtau=3 if date_tau==date_snad3 & !missing(date_tau)
replace matchtau=4 if date_tau==date_snad4 & !missing(date_tau)
replace matchtau=5 if date_tau==date_snad5 & !missing(date_tau)

gen difftau1=abs(date_tau-date_snad1)
gen difftau2=abs(date_tau-date_snad2)
gen difftau3=abs(date_tau-date_snad3)
gen difftau4=abs(date_tau-date_snad4)
gen difftau5=abs(date_tau-date_snad5)

egen minval = rowmin(difftau1 difftau2 difftau3 difftau4 difftau5) //SNAD date closest to Neuroimaging date
replace difftau1=. if minval!=difftau1
replace difftau2=. if minval!=difftau2
replace difftau3=. if minval!=difftau3
replace difftau4=. if minval!=difftau4
replace difftau5=. if minval!=difftau5

fre difftau1 if matchtau==.
replace matchtau=1 if difftau1<=365  // or 180 for half a year

fre difftau2 if matchtau==.
replace matchtau=2 if difftau2<=365 // or 180 for half a year

fre difftau3 if matchtau==.
replace matchtau=3 if difftau3<=365 // or 180 for half a year

fre difftau4 if matchtau==.
replace matchtau=4 if difftau4<=365 // or 180 for half a year

fre difftau5 if matchtau==.
replace matchtau=5 if difftau5<=365 // or 180 for half a year

duplicates list SUBID matchtau if !missing(matchtau) //0 mismatch

di date("20140514","YMD") //19857=one year before SNAD
fre matchtau date_tau if date_tau>19857 //90 out of 108
rename  matchtau time
drop if missing(time)
drop minval difftau* 
save "TAU-Clean-20201001.dta" ,replace


***************************************************************
**# 7 Match AmyDate_ with SNAD
***************************************************************

use "Neuroimaging-CleanA2-20201001.dta" ,replace
keep SUBID date_snad1 date_snad2 date_snad3 date_snad4 date_snad5 date_amy AbPos_t GlCtx_Cent_CL_t // Amy_Cent_LateralParietal_ Amy_Cent_Precuneus_ not included in ths data Shannon sent
gen matchamy=.
replace matchamy=1 if date_amy==date_snad1 & !missing(date_amy)
replace matchamy=2 if date_amy==date_snad2 & !missing(date_amy)
replace matchamy=3 if date_amy==date_snad3 & !missing(date_amy)
replace matchamy=4 if date_amy==date_snad4 & !missing(date_amy)
replace matchamy=5 if date_amy==date_snad5 & !missing(date_amy)

gen diffamy1=abs(date_amy-date_snad1)
gen diffamy2=abs(date_amy-date_snad2)
gen diffamy3=abs(date_amy-date_snad3)
gen diffamy4=abs(date_amy-date_snad4)
gen diffamy5=abs(date_amy-date_snad5)


egen minval = rowmin(diffamy1 diffamy2 diffamy3 diffamy4 diffamy5) //SNAD date closest to Neuroimaging date
replace diffamy1=. if minval!=diffamy1
replace diffamy2=. if minval!=diffamy2
replace diffamy3=. if minval!=diffamy3
replace diffamy4=. if minval!=diffamy4
replace diffamy5=. if minval!=diffamy5

fre diffamy1 if matchamy==.
replace matchamy=1 if diffamy1<=365  // or 180 for half a year

fre diffamy2 if matchamy==.
replace matchamy=2 if diffamy2<=365 // or 180 for half a year

fre diffamy3 if matchamy==.
replace matchamy=3 if diffamy3<=365 // or 180 for half a year

fre diffamy4 if matchamy==.
replace matchamy=4 if diffamy4<=365 // or 180 for half a year

fre diffamy4 if matchamy==.
replace matchamy=5 if diffamy5<=365 // or 180 for half a year

duplicates list SUBID matchamy if !missing(matchamy) //check and fix 2 duplicates

list SUBID matchamy diff* date_amy date_snad* if SUBID==3908 & !missing(date_amy)
replace matchamy=2 if diffamy1==50 & SUBID==3908
list SUBID matchamy diff* date_amy date_snad* if SUBID==6417 & !missing(date_amy)
replace matchamy=2 if diffamy1==100 & SUBID==6417

di date("20140514","YMD") //19857=one year before SNAD
fre matchamy date_amy if date_amy>19857 //104 out of 136
rename matchamy time
drop if missing(time)

drop minval diffamy*
save "AMY-Clean-20201001.dta" ,replace


***************************************************************
**# 8 Match Old REDCap_R01 with SNAD
***************************************************************

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
tostring birthyr birthmnth,replace
destring birthmnth,gen(month)
gen birthmnth2="0"+ birthmnth if month<10
replace birthmnth2=birthmnth if missing(birthmnth2)
gen dob=birthyr+birthmnth2+"15"
destring dob,replace force
*ssc install todate //install todate if not alreday 
todate dob, gen(dobdate) p(yyyymmdd) f(%dd_m_cy)
personage dobdate date_snad, gen(agesnad) //install personage if not alreday 

save "SNAD-Participant-T12345-EGOAGG-mergeIADRC.dta",replace 
restore
*/

****************add SNAD data (pilot match)
merge 1:m SUBID using "SNAD-Participant-T12345-EGOAGG-pilot-clean.dta" 
list SUBID enrolldate date_snad if _merge==2 // 1 people interviewed with SNAD but not IADC (10234 did not finish enrollment in IADRC)
drop if _merge==1 //drop 87 cases not having network data

*create age based on SNAD date
tostring birthyr birthmnth,replace
destring birthmnth,gen(month)
gen birthmnth2="0"+ birthmnth if month<10
replace birthmnth2=birthmnth if missing(birthmnth2)
gen dob=birthyr+birthmnth2+"15"
destring dob,replace force
*ssc install todate //install todate if not alreday 
todate dob, gen(dobdate) p(yyyymmdd) f(%dd_m_cy)
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

