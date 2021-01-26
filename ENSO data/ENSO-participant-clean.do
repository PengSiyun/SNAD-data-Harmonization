****Author:  Siyun Peng
****Date:    01/20/2021
****Version: 16
****Purpose: label and create variables for ENSO (Match with pilot)

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean" //home

***************************************************************
//	#1 Clean ENSO participant network data (it seems people with 0 alter are not in alter file?)
***************************************************************
/*Things to fix later: 
2. too many missing values in the ENSO data for health matter and important matter, why?
3. need to ask for IADC data to match with ENSO participant
4. SUBID=10216,10259 are in pilot T1 and ENSO T1
5. alter data and alter-alter ties data does not match, some people are missing from one of the file.
*/

multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO Focal\Alter") clear force  //import multiple csv in a folder (ssc install multimport)
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) //drop all test runs
rename alter_id TIEID
sort SUBID alter_name


*********************remove duplicates******************************************


*******check duplicate cases within each wave (same subjects with different interview dates)

duplicates tag SUBID TIEID _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //10327 T1, 10262 T1, 10194 T2, 10168 T2, 10155 T2, 10127 T2, 6564 T2, 6534 T2, 6538 T3, 6340 T3, 6125 T3: 11 duplicates

*manually check and drop duplicates within each wave
drop if SUBID==10327 & interview_id==231
drop if SUBID==10262 & interview_id==446
drop if SUBID==10194 & interview_id==176
drop if SUBID==10168 & interview_id==164
drop if SUBID==10155 & interview_id==203
drop if SUBID==10127 & interview_id!=770
drop if SUBID==6564 & interview_id==617
drop if SUBID==6534 & interview_id!=186
drop if SUBID==6538 & interview_id==159
drop if SUBID==6340 & interview_id==173
drop if SUBID==6125 & interview_id==204
drop pickone dup


*******check duplicate cases across waves  (remove place holders)
*name generators have weird missing pattern, freq of talk should not be carried over as other demographics, so it is chose here.
drop if missing(nitalk) & _filename==1 //drop cases with missing nitalk in T1
drop if missing(nitalk2) & _filename==2
drop if missing(nitalk3) & _filename==3
drop if missing(nitalk4) & _filename==4
drop if missing(nitalk5) & _filename==5

duplicates report SUBID TIEID //no duplicate left
egen pickone=tag(SUBID)
fre pickone //N=112 same as alter-ties data

********clean the variable names across 5 waves*********************************

*******clean name generators
foreach x of varlist hlthburdn hlthcount hlthencrg impburdn impforce impmat ///
    wkndties wkdyties family cowrkrs neighbrs anyelse partner {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
*this is not necessary if pilot data is not used
egen pilot=rowtotal(hlthburdn hlthcount hlthencrg impburdn impforce impmat),mi
drop if pilot==0 | missing(pilot) //drop names that are not in health and important matter to be consistent with Pilot data 

*******clean name interpretors
drop if alter_name=="99"
bysort SUBID: egen netsize=count(alter_name)
lab var netsize "Total number of alters mentioned" 

*Change ENSO T4's different format of alter relation type
encode nirelpart4nirelprnt4nirelsib4nir, gen(nirel4)
drop nirelother4

foreach x of varlist nirelother nirelchrch nirelemplr nirelfrnd nirelothrl nirelantun nirelstdnt nirelsib nirelgprnt nirelinlaw nirelgchld nirelothmd nirelrabbi nirelthrpy nirellwyr nirelprnt nirelnghbr nirelclub nirelactvt nirelfinan nirelcowrk nireldoc nirelpart nirelemple nirelchld {
	gen `x'4=.
}
fre nirel4
replace nirelchld4=1 if nirel4==1
replace nirelchrch4=1 if nirel4==2
replace nireldoc4=1 if nirel4==3
replace nirelemple4=1 if nirel4==4
replace nirelfinan4=1 if nirel4==5
replace nirelfrnd4=1 if nirel4==6
replace nirelinlaw4=1 if nirel4==7
replace nirelnghbr4=1 if nirel4==8
replace nirelothmd4=1 if nirel4==9
replace nirelothrl4=1 if nirel4==10
replace nirelpart4=1 if nirel4==11
replace nirelsib4=1 if nirel4==12
replace nirelthrpy4=1 if nirel4==13
drop nirel4 nirelpart4nirelprnt4nirelsib4nir

*change ENSO T2 & 3's different format
foreach x of varlist nirelchrch nirelemplr nirelfrnd nirelothrl nirelantun nirelstdnt nirelsib nirelgprnt nirelinlaw nirelgchld nirelothmd nirelrabbi nirelthrpy nirellwyr nirelprnt nirelnghbr nirelclub nirelactvt nirelfinan nirelcowrk nireldoc nirelpart nirelemple nirelchld {
	rename _`x'2 `x'2
    rename _`x'3 `x'3
}
gen nirelother2=.
gen nirelother3=.


foreach x of varlist nifemale nirelother nirelchrch nirelemplr nirelfrnd nirelothrl nirelantun nirelstdnt nirelsib nirelgprnt nirelinlaw nirelgchld nirelothmd nirelrabbi nirelthrpy nirellwyr nirelprnt nirelnghbr nirelclub nirelactvt nirelfinan nirelcowrk nireldoc nirelpart nirelemple nirelchld {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
gen tfem=nifemale
lab var tfem "Alter is female"
drop nifemale
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen): 25 types total in data (nirelother nirelfinan are two extra in ENSO)
fre nirelother_txt nirelother5_txt
replace nirelinlaw=1 if nirelother==1 //daughter's boyfriend is coded as in law for purpose of diversity measure here

egen othfam=rowtotal(nirelsib nirelantun nirelgprnt nirelgchld nirelothrl),mi //group into other family
egen fri=rowtotal(nirelfrnd nirelactvt),mi //group into friend
egen work=rowtotal(nirelemple nirelemplr nirelcowrk),mi //group into workmate
egen church=rowtotal(nirelrabbi nirelchrch),mi //group into religious group
egen prof=rowtotal(nirelthrpy nirelothmd nireldoc nirellwyr nirelfinan),mi //group into professional group
recode othfam fri work church prof (1/10=1)
foreach x of varlist othfam fri work church prof nirelpart nirelprnt nirelinlaw nirelchld nirelnghbr nirelstdnt nirelclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen relmiss=rowtotal(nirelother nirelchrch nirelemplr nirelfrnd nirelothrl nirelantun nirelstdnt nirelsib nirelgprnt nirelinlaw nirelgchld nirelothmd nirelrabbi nirelthrpy nirellwyr nirelprnt nirelnghbr nirelclub nirelactvt nirelfinan nirelcowrk nireldoc nirelpart nirelemple nirelchld) //275 alters are missing/0 on all relation type
recode uothfam ufri uwork uchurch uprof unirelpart unirelprnt unirelinlaw unirelchld unirelnghbr unirelstdnt unirelclub (0=.) if relmiss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(uothfam+ufri+uwork+uchurch+uprof+unirelpart+unirelprnt+unirelinlaw+unirelchld+unirelnghbr+unirelstdnt+unirelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop uothfam-unirelclub othfam fri work church prof
lab var diverse "Network diversity" 
fre diverse

egen tkin=rowtotal(nirelsib nirelantun nirelgprnt nirelgchld nirelothrl nirelpart nirelprnt nirelinlaw nirelchld)
recode tkin (1/9=1)
replace tkin=. if missing(alter_name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

foreach x of varlist niclose* {
	tostring `x',replace
	replace `x' =substr(`x',1,1) //remove " in string
	destring `x',replace
}
egen niclosenew=rowmean(niclose*)
drop niclose niclose2 niclose3 niclose4 niclose5
rename niclosenew niclose
gen tclose=niclose
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=niclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser 

foreach x of varlist nitalk {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
gen tfreq=nitalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=nitalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"
drop seetalkr

egen numsup=rowtotal(nisupcare nisupcash nisupchor nisuplstn nisupsugg),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

revrs nihassle, replace //reverse code
bysort SUBID: egen mhassles=mean(nihassle)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode nihassle (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

bysort SUBID: egen mstrength=mean(nistrength)
lab var mstrength "Mean tie strength in network, HI=MORE"
bysort SUBID: egen weakest=min(nistrength)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(nistrength)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(nistrength)
lab var sdstrength "Standard deveiation of tie strength"

gen ENSO=1
gen time=1
rename created_on date_snad
replace date_snad=substr(date_snad, 1, 10) //only keep YMD
replace date_snad= subinstr(date_snad, "-", "", .) //drop -
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY
/*
foreach x of varlist netsize-sdstrength {
	rename `x' `x'1
}
*/
save "ENSO-Participant-T1-Clean-LONG-pilot.dta", replace 

duplicates drop SUBID, force
keep SUBID date_snad netsize-sdstrength
drop tfem tkin tclose tfreq thassles numsup //drop alter level variables
save "ENSO-Participant-T1-Clean-EGOAGG-pilot.dta", replace //22 out of 41 people remains after only keep health and important matters

***************************************************************
//	#2 Clean alter-alter ties (A-B and B-A are both in the file! But this does not affect calculation of density)
***************************************************************
*match with pilot of important and health matters
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO Focal") clear force  //import multiple csv in a folder (ssc install multimport)
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID)
duplicates tag SUBID alter_a_id alter_b_id _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //10262 T1, 10327 T1, 6564 T2, 10127 T2, 6538 T3

fre _filename // T3=25 not 26 suggesting SUBID=3564 in T3 is also in T4




rename respondent_name SUBID
rename alter_a_id TIEID
merge m:1 TIEID using "ENSO-Participant-T1-Clean-LONG-pilot.dta"
keep if _merge==3 //keep alters that are important or health matters
keep survey_id-tievalue //only keep variables from alter-alter ties

recode tievalue (0=3)(1=2)(2=1)(3=0) // 0 = do not know each other
label define alterclose 0 "Dont know each other" 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values tievalue alterclose
fre tievalue
bysort SUBID: egen npossties=count(tievalue)
bysort SUBID: egen totval=total(tievalue),mi
gen density=totval/npossties
lab var density "Valued density of networks from matrix"

gen newtievalue=tievalue
recode tievalue (2/3=1)(0/1=0)
bysort SUBID: egen totnum=total(tievalue),mi
gen bdensity=totnum/npossties
lab var bdensity "Binary density of networks from matrix"

recode newtievalue (1/3=1)(0=0)
bysort SUBID: egen totnum1=total(newtievalue),mi
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"

rename created_on date_snad
replace date_snad=substr(date_snad, 1, 10) //only keep YMD
replace date_snad= subinstr(date_snad, "-", "", .) //drop -
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY

keep SUBID date_snad density bdensity b1density
/*
foreach x of varlist density bdensity b1density {
	rename `x' `x'1
}
*/
duplicates drop SUBID, force
merge 1:1 SUBID using "ENSO-Participant-T1-Clean-EGOAGG-pilot.dta"
drop _merge // all 22 subjects with health and important matter alters matched.
gen time=1
gen ENSO=1
save "ENSO-Participant-T1-Clean-EGOAGG-pilot.dta", replace

/*
***************************************************************
//	#3 Match IADC with SNAD
***************************************************************
/* modify this when cleanning multiple waves of ENSO!
create data of SNAD date to match SNAD with IADC
use "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", replace
keep SUBID date_snad1
merge 1:1 SUBID using "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta" //check to make sure N=0 for _merge==2 
keep SUBID date_snad1 date_snad2 
merge 1:1 SUBID using "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta" //check to make sure N=0 for _merge==2 
keep SUBID date_snad1 date_snad2 date_snad3
save "SNAD-MatchData-120419.dta", replace
*/ 

*drop cases of IADC that are 62 days apart from SNAD at any wave
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\IADC-Long-CleanA-052920.dta", clear

gen ageiadc=round(ageatvisit,.1)
drop ageatvisit
merge m:1 SUBID using "ENSO-Participant-T1-Clean-EGOAGG.dta" //8 cases from ENSO not matched


*************Stopped here

order date_snad3 date_snad2 date_snad1, after(visitdate)

gen match=.
replace match=1 if visitdate==date_snad1 & !missing(visitdate)
replace match=2 if visitdate==date_snad2 & !missing(visitdate)
replace match=3 if visitdate==date_snad3 & !missing(visitdate)

order match, after(visitdate)

gen diff1=abs(visitdate-date_snad1)
gen diff2=abs(visitdate-date_snad2)
gen diff3=abs(visitdate-date_snad3)

egen minval = rowmin(diff1 diff2 diff3) //SNAD date closest to IADC date
replace diff1=. if minval!=diff1
replace diff2=. if minval!=diff2
replace diff3=. if minval!=diff3

fre diff1 if match==.
replace match=1 if diff1<=60

fre diff2 if match==.
replace match=2 if diff2<=62

fre diff3 if match==.
replace match=3 if diff3<=60

duplicates list SUBID match if !missing(match) //no mismatch
drop if match==.

rename match time
rename visitdate iadcdate
drop _merge minval diff1 diff2 diff3

save "IADC-Long-CleanB-062519.dta", replace


***************************************************************
//	#6 Match Neuroimaging with SNAD
***************************************************************
*drop cases of IADC that are 1 year apart from SNAD at any wave
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "Neuroimaging-CleanA-041320.dta" ,replace
destring SUBID ICV_t-cdrsb_t,replace
*mri date
gen date_mri1 = date(DateofMRIScan_t, "MDY") //for 10/20/2014
format date_mri1 %td
replace DateofMRIScan_t = subinstr(DateofMRIScan_t, "-", "", .) //for 31-May-17
gen date_mri2 = date(DateofMRIScan_t, "DM20Y") if missing(date_mri1)
format date_mri2 %td
gen date_mri=date_mri1
replace date_mri=date_mri2 if missing(date_mri1)
format date_mri %td
list date_mri date_mri1 date_mri2 DateofMRIScan_t
drop date_mri1 date_mri2 DateofMRIScan_t
*tau date
replace Taudate_t = subinstr(Taudate_t, "-", "", .) //drop -
gen date_tau = date(Taudate_t, "DM20Y") 
format date_tau %td
list date_tau Taudate_t 
drop Taudate_t
*Amy date
* AmyDate_t //have values like "IDEAS", need to correct this before proceed

merge m:1 SUBID using "SNAD-MatchData-120419.dta"
drop if _merge==1 //drop people did not do SNAD
drop _merge
save "Neuroimaging-CleanA2-041320.dta" ,replace

*match MRI with SNAD
use "Neuroimaging-CleanA2-041320.dta" ,replace
keep SUBID ICV_t-date_snad3 //drop demographic variables
gen matchmri=.
replace matchmri=1 if date_mri==date_snad1 & !missing(date_mri)
replace matchmri=2 if date_mri==date_snad2 & !missing(date_mri)
replace matchmri=3 if date_mri==date_snad3 & !missing(date_mri)

gen diffmri1=abs(date_mri-date_snad1)
gen diffmri2=abs(date_mri-date_snad2)
gen diffmri3=abs(date_mri-date_snad3)

gen same=1 if diffmri1==diffmri2 & !missing(diffmri1,diffmri2) 
replace same=1 if diffmri1==diffmri3 & !missing(diffmri1,diffmri3) 
replace same=1 if diffmri3==diffmri2 & !missing(diffmri3,diffmri2) 
fre same //no case with the same time lag for T1 T2 T3

egen minval = rowmin(diffmri1 diffmri2 diffmri3) //SNAD date closest to Neuroimaging date
replace diffmri1=. if minval!=diffmri1
replace diffmri2=. if minval!=diffmri2
replace diffmri3=. if minval!=diffmri3

fre diffmri1 if matchmri==. & diffmri1<400
replace matchmri=1 if diffmri1<=365 // or 186 for half a year

fre diffmri2 if matchmri==. & diffmri2<400
replace matchmri=2 if diffmri2<=365 // or 181 for half a year

fre diffmri3 if matchmri==. & diffmri3<400
replace matchmri=3 if diffmri2<=365 // or 181 for half a year

gen time=matchmri
drop if missing(time)
duplicates tag SUBID time,gen(dup) 
list SUBID time minval diffmri1 diffmri2 diffmri3 date_mri date_snad1 date_snad2 date_snad3 if dup>0 //check 7 records of mri are assigned to the same wave
replace time=. if minval==337 & SUBID==5032 //manually change this 
replace time=. if minval==357 & SUBID==6417 //manually change this 
replace time=1 if minval==3 & SUBID==6541 //manually change this 
replace time=. if minval==272 & SUBID==10002 //manually change this 
replace time=2 if minval==2 & SUBID==10087 //manually change this 
replace time=. if minval==329 & SUBID==10088 //manually change this 
replace time=. if minval==350 & SUBID==10101 //manually change this 

drop matchmri minval diffmri1 diffmri2 diffmri3 dup same
drop DXGrp_t-cdrsb_t //drop non-MRI data
drop if missing(time)
save "MRI-Clean-041320.dta" ,replace

*match TauDate_ with SNAD: need to fix taudate
