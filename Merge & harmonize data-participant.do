****Priject: SNAD
****Author:  Siyun Peng
****Date:    2021/12/22
****Version: 17
****Purpose: Harmonize data from IADRC and SNAD- participant
clear
/*
To do: 
1. fix married?
*/

***************************************************************
**# 1a Append Pilot participant T1, T2, T3, T4+ ENSO+ NC
***************************************************************





/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\clean data\SNAD-Participant-T1234-CleanB-LONG.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-LONG-pilot-clean.dta"
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-LONG-pilot-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
drop pilot
rename time pilot //rename old time indicator in pilots
recode pilot (1/4=1),gen(source) 
replace source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (pilot,ENSO,NC)
rename no_friends nofriends_feel
replace impmat=imd if missing(impmat) //generators
replace impmat=alterim1 if missing(impmat)
replace impforce=imr if missing(impforce)
replace impforce=alterim2 if missing(impforce)
replace impburdn=imb if missing(impburdn)
replace impburdn=alterim3 if missing(impburdn)
replace hlthcount=hmd if missing(hlthcount)
replace hlthcount=alterhm1 if missing(hlthcount)
replace hlthencrg=hmr if missing(hlthencrg)
replace hlthencrg=alterhm2 if missing(hlthencrg)
replace hlthburdn=hmb if missing(hlthburdn)
replace hlthburdn=alterhm3 if missing(hlthburdn)
replace et_wkndties=alteret1 if missing(et_wkndties)
replace et_wkdyties=alteret2 if missing(et_wkdyties)
replace et_family=alteret3 if missing(et_family)
replace et_cowrkrs=alteret4 if missing(et_cowrkrs)
replace et_neighbrs=alteret5 if missing(et_neighbrs)
replace et_anyelse=alteret6 if missing(et_anyelse)
replace et_partner=alteret7 if missing(et_partner)
drop imd imr imb hmd hmr hmb alterim1 alterim2 alterim3 alterhm1 alterhm2 alterhm3 alteret1 alteret2 alteret3 alteret4 alteret5 alteret6 alteret7

replace alterfem=tfem if missing(alterfem) //interpretors
replace alterrace=alter_race if missing(alterrace)
replace alterage=alter_age if missing(alterage)
replace altercollege=alter_college if missing(altercollege)
replace altercollege=tcollege if missing(altercollege)
recode niclose howclose nitalk seetalk (1=3) (3=1)
replace altercloseego=niclose if missing(altercloseego)
replace altercloseego=howclose if missing(altercloseego)
replace alterfreqcon=nitalk if missing(alterfreqcon)
replace alterfreqcon=seetalk if missing(alterfreqcon)
replace listen=nisuplstn if missing(listen)
replace care=nisupcare if missing(care)
replace advice=nisupsugg if missing(advice)
replace chores=nisupchor if missing(chores)
replace loan=nisupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhassle=nihassle if missing(alterhassle)
replace alterhassle=difficult if missing(alterhassle)
rename altercls110 alterstrength
replace alterstrength=strong if missing(alterstrength)
replace alterstrength=nistrength if missing(alterstrength)
recode knowabout (1=3) (3=1)
replace alterhknow=knowabout if missing(alterhknow)
recode trustdoctors (1=3)(3=1)(8=.)
replace alterdtr=trustdoctors if missing(alterdtr)
rename alterdtr altertrust
replace alterquestion=tquestion if missing(alterquestion)

replace relothrel=nirelothrl if missing(relothrel)
replace relchurch=nirelchrch if missing(relchurch)
replace relboss=nirelemplr if missing(relboss)
replace relcowork=nirelcowrk if missing(relcowork)
replace relemploy=nirelemple if missing(relemploy)
replace relfriend=nirelfrnd if missing(relfriend)
replace relauntunc=nirelantun if missing(relauntunc)
replace relschool=nirelstdnt if missing(relschool)
replace relsibling=nirelsib if missing(relsibling)
replace relgrandp=nirelgprnt if missing(relgrandp)
replace relinlaw=nirelinlaw if missing(relinlaw)
replace relgrandc=nirelgchld if missing(relgrandc)
replace relothmed=nirelothmd if missing(relothmed)
replace relrelig=nirelrabbi if missing(relrelig)
replace relmental=nirelthrpy if missing(relmental)
replace rellawyer=nirellwyr if missing(rellawyer)
replace relpartner=nirelpart if missing(relpartner)
replace relneigh=nirelnghbr if missing(relneigh)
replace relclub=nirelclub if missing(relclub)
replace reldoctor=nireldoc if missing(reldoctor)
replace relchild=nirelchld if missing(relchild)
replace relparent=nirelprnt if missing(relparent)
replace relleisure=nirelactvt if missing(relleisure)

drop tfem alter_race alter_age alter_college tcollege tclose niclose howclose tfreq nitalk seetalk nisupcare nisupcash nisupchor nisuplstn nisupsugg thassles nihassle difficult strong nistrength tknow knowabout trustdoctors ttrust questiondoc tquestion nirel* //keep one name for a measure


save "SNAD-Participant-LONG-pilotmatch-clean.dta", replace 


/*EGOAGG (ego-level)*/


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
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

*make variable names consistent between pilot and Redcap for quality of life
rename no_friends nofriends_feel
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-Participant-EGOAGG-pilotmatch-clean.dta", replace 




***************************************************************
**# 1b Append ENSO+ NC matched data (workdays and weekends generators are dropped at early of 2021)
***************************************************************



/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-LONG-match-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-LONG-match-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (ENSO, NC)
replace impmat=alterim1 if missing(impmat)
replace impforce=alterim2 if missing(impforce)
replace impburdn=alterim3 if missing(impburdn)
replace hlthcount=alterhm1 if missing(hlthcount)
replace hlthencrg=alterhm2 if missing(hlthencrg)
replace hlthburdn=alterhm3 if missing(hlthburdn)
replace et_wkndties=alteret1 if missing(et_wkndties)
replace et_wkdyties=alteret2 if missing(et_wkdyties)
replace et_family=alteret3 if missing(et_family)
replace et_cowrkrs=alteret4 if missing(et_cowrkrs)
replace et_neighbrs=alteret5 if missing(et_neighbrs)
replace et_anyelse=alteret6 if missing(et_anyelse)
replace et_partner=alteret7 if missing(et_partner)
drop alterim1 alterim2 alterim3 alterhm1 alterhm2 alterhm3 alteret1 alteret2 alteret3 alteret4 alteret5 alteret6 alteret7

replace alterfem=tfem if missing(alterfem) //interpretors
replace alterrace=alter_race if missing(alterrace)
replace alterage=alter_age if missing(alterage)
replace altercollege=alter_college if missing(altercollege)
recode niclose nitalk (1=3) (3=1)
replace altercloseego=niclose if missing(altercloseego)
replace alterfreqcon=nitalk if missing(alterfreqcon)
replace listen=nisuplstn if missing(listen)
replace care=nisupcare if missing(care)
replace advice=nisupsugg if missing(advice)
replace chores=nisupchor if missing(chores)
replace loan=nisupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhassle=nihassle if missing(alterhassle)
rename altercls110 alterstrength
replace alterstrength=nistrength if missing(alterstrength)
rename alterdtr altertrust

replace relothrel=nirelothrl if missing(relothrel)
replace relchurch=nirelchrch if missing(relchurch)
replace relboss=nirelemplr if missing(relboss)
replace relcowork=nirelcowrk if missing(relcowork)
replace relemploy=nirelemple if missing(relemploy)
replace relfriend=nirelfrnd if missing(relfriend)
replace relauntunc=nirelantun if missing(relauntunc)
replace relschool=nirelstdnt if missing(relschool)
replace relsibling=nirelsib if missing(relsibling)
replace relgrandp=nirelgprnt if missing(relgrandp)
replace relinlaw=nirelinlaw if missing(relinlaw)
replace relgrandc=nirelgchld if missing(relgrandc)
replace relothmed=nirelothmd if missing(relothmed)
replace relrelig=nirelrabbi if missing(relrelig)
replace relmental=nirelthrpy if missing(relmental)
replace rellawyer=nirellwyr if missing(rellawyer)
replace relpartner=nirelpart if missing(relpartner)
replace relneigh=nirelnghbr if missing(relneigh)
replace relclub=nirelclub if missing(relclub)
replace reldoctor=nireldoc if missing(reldoctor)
replace relchild=nirelchld if missing(relchild)
replace relparent=nirelprnt if missing(relparent)
replace relleisure=nirelactvt if missing(relleisure)

drop tfem alter_race alter_age alter_college tclose niclose tfreq nitalk nisupcare nisupcash nisupchor nisuplstn nisupsugg thassles nihassle nistrength tknow ttrust nirel* //keep one name for a measure


save "SNAD-Participant-LONG-match-clean.dta", replace 


/*EGOAGG (ego-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-match-clean.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-EGOAGG-match-clean-20211112.dta"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-Participant-EGOAGG-match-clean.dta", replace 




***************************************************************
**# 1c Append full participant ENSO+NC
***************************************************************




/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-LONG-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-LONG-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (ENSO, NC)
replace impmat=alterim1 if missing(impmat)
replace impforce=alterim2 if missing(impforce)
replace impburdn=alterim3 if missing(impburdn)
replace hlthcount=alterhm1 if missing(hlthcount)
replace hlthencrg=alterhm2 if missing(hlthencrg)
replace hlthburdn=alterhm3 if missing(hlthburdn)
replace et_wkndties=alteret1 if missing(et_wkndties)
replace et_wkdyties=alteret2 if missing(et_wkdyties)
replace et_family=alteret3 if missing(et_family)
replace et_cowrkrs=alteret4 if missing(et_cowrkrs)
replace et_neighbrs=alteret5 if missing(et_neighbrs)
replace et_anyelse=alteret6 if missing(et_anyelse)
replace et_partner=alteret7 if missing(et_partner)
drop alterim1 alterim2 alterim3 alterhm1 alterhm2 alterhm3 alteret1 alteret2 alteret3 alteret4 alteret5 alteret6 alteret7

replace alterfem=tfem if missing(alterfem) //interpretors
replace alterrace=alter_race if missing(alterrace)
replace alterage=alter_age if missing(alterage)
replace altercollege=alter_college if missing(altercollege)
recode niclose nitalk (1=3) (3=1)
replace altercloseego=niclose if missing(altercloseego)
replace alterfreqcon=nitalk if missing(alterfreqcon)
replace listen=nisuplstn if missing(listen)
replace care=nisupcare if missing(care)
replace advice=nisupsugg if missing(advice)
replace chores=nisupchor if missing(chores)
replace loan=nisupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhassle=nihassle if missing(alterhassle)
rename altercls110 alterstrength
replace alterstrength=nistrength if missing(alterstrength)
rename alterdtr altertrust

replace relothrel=nirelothrl if missing(relothrel)
replace relchurch=nirelchrch if missing(relchurch)
replace relboss=nirelemplr if missing(relboss)
replace relcowork=nirelcowrk if missing(relcowork)
replace relemploy=nirelemple if missing(relemploy)
replace relfriend=nirelfrnd if missing(relfriend)
replace relauntunc=nirelantun if missing(relauntunc)
replace relschool=nirelstdnt if missing(relschool)
replace relsibling=nirelsib if missing(relsibling)
replace relgrandp=nirelgprnt if missing(relgrandp)
replace relinlaw=nirelinlaw if missing(relinlaw)
replace relgrandc=nirelgchld if missing(relgrandc)
replace relothmed=nirelothmd if missing(relothmed)
replace relrelig=nirelrabbi if missing(relrelig)
replace relmental=nirelthrpy if missing(relmental)
replace rellawyer=nirellwyr if missing(rellawyer)
replace relpartner=nirelpart if missing(relpartner)
replace relneigh=nirelnghbr if missing(relneigh)
replace relclub=nirelclub if missing(relclub)
replace reldoctor=nireldoc if missing(reldoctor)
replace relchild=nirelchld if missing(relchild)
replace relparent=nirelprnt if missing(relparent)
replace relleisure=nirelactvt if missing(relleisure)

drop tfem alter_race alter_age alter_college tclose niclose tfreq nitalk nisupcare nisupcash nisupchor nisuplstn nisupsugg thassles nihassle nistrength tknow ttrust nirel* //keep one name for a measure

save "SNAD-Participant-LONG-clean.dta", replace 


/*EGOAGG (ego-level)*/



use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-clean.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-Participant-EGOAGG-clean-20211112.dta"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n
save "SNAD-Participant-EGOAGG-clean.dta", replace 


/*create match data for IADRC*/

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
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
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
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
label values edu education_mother1_
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
replace matchmri=3 if diffmri4==274 & SUBID==10154  

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




*load Redcap data
use "red-Clean-snadMatch.dta", clear 
rename puzzlegame puzzlegame_d //consistent with IADC

*add IADC data
merge 1:1 SUBID date_snad using "IADC-Long-Clean-snadMatch.dta", nogen update // Redcap as master: when in conflict, prefer Redcap over IADRC for mail-in packet

*harmonize cognitive test from Redcap vs. IADC: e.g., moca for new recuit&discontinued is only collected in Redcap.
destring moca_raw,replace
replace MOCATOTS=moca_raw if missing(MOCATOTS)
replace Trailatime=trail_a_time if missing(Trailatime)
replace Trailbtime=trail_b_time if missing(Trailbtime)
replace calcavltsum=rey_sum if missing(calcavltsum)
replace ReyDeCorAB=delayed_rey_sum if missing(ReyDeCorAB)
drop moca_raw trail_a_time trail_b_time rey_sum delayed_rey_sum
rename (MOCATOTS Trailatime Trailbtime calcavltsum ReyDeCorAB) (moca_raw trail_a_time trail_b_time rey_sum delayed_rey_sum)

*calculate diagnosis here
rename diagnosis diagnosis_iadc
label var diagnosis_iadc "Consensus diagnosis from IADC"

recode moca_raw (26/30=1) (18/25=2) (0/17=3),gen(diagnosis_moca)
label var diagnosis_moca "diagnosis based on MoCA scores"
label values diagnosis_moca diagnosisnew

*harmonize mail-in pack
replace alcoholser=alcoholdrinks if missing(alcoholser) //prefer Redcap over IADRC
drop alcoholdrinks 
rename alcoholser alcoholdrinks

*add Neuroimaging data
merge 1:1 SUBID date_snad using "MRI-Clean-snadMatch.dta",nogen
merge 1:1 SUBID date_snad using "TAU-Clean-snadMatch.dta",nogen 
merge 1:1 SUBID date_snad using "AMY-Clean-snadMatch.dta",nogen 
drop _merge


/*add SNAD data (Full)*/


preserve

merge 1:1 SUBID date_snad using "SNAD-Participant-EGOAGG-clean",update // fill in pilot quality of life
drop if _merge==1 //drop cases have no R01 SNAD data
drop _merge 

*add Demographics info
merge m:1 SUBID using "Demographics.dta" 
drop if _merge==2 //Demo data not matched with network data
drop _merge 
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday 
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-preexlusion-focal-R01raw-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID date_snad using "SNAD-Participant-LONG-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-preexlusion-focal-LONG-R01raw-20211222",replace

restore
preserve

/*add SNAD data (pilot match)*/


merge 1:1 SUBID date_snad using "SNAD-Participant-EGOAGG-pilotmatch-clean.dta",update // fill in pilot quality of life 
drop if _merge==1 //drop cases have no SNAD data
drop _merge

*add Demographics info
merge m:1 SUBID using "Demographics.dta"
drop if _merge==2 //Demo data not matched with network data
drop _merge 

personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday 
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-preexlusion-focal-pilotmatch-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID date_snad using "SNAD-Participant-LONG-pilotmatch-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-preexlusion-focal-LONG-pilotmatch-20211222",replace


restore


/*add SNAD data (NC latest match)*/


merge 1:1 SUBID date_snad using "SNAD-Participant-EGOAGG-match-clean.dta",update // fill in pilot quality of life 
drop if _merge==1 //drop cases have no SNAD data
drop _merge

*add Demographics info
merge m:1 SUBID using "Demographics.dta"
drop if _merge==2 //Demo data not matched with network data
drop _merge 

personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday 

*some non demographics are collected in ENSO EGO, need to harmonize with Redcap
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap
rename marital married
label values married married_enso
drop married_enso 

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-preexlusion-focal-R01match-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID date_snad using "SNAD-Participant-LONG-match-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-preexlusion-focal-LONG-R01match-20211222",replace




***************************************************************
**# 10 Exclusion criteria for all analyses 
***************************************************************



*Drop people who should not be in the study based on exlusion criteria for SAND: MoCA<10, age<45, Prion disease, and bipolar


/*R01 only*/


*EGOAGG
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data"
use "SNAD-preexlusion-focal-R01raw-20211222",clear
drop if agesnad<45 | moca_raw<10
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease"
save "SNAD-Analysis-focal-R01raw-20211222", replace

*LONG
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\"
use "SNAD-preexlusion-focal-LONG-R01raw-20211222",clear
drop if agesnad<45 | moca_raw<10
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease"
save "SNAD-Analysis-focal-LONG-R01raw-20211222", replace


/*Pilot matched*/


*EGOAGG
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data"
use "SNAD-preexlusion-focal-pilotmatch-20211222",clear

drop if agesnad<45 | moca_raw<10
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease"
save "SNAD-Analysis-focal-pilotmatch-20211222", replace

*LONG
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\"
use "SNAD-preexlusion-focal-LONG-pilotmatch-20211222",clear
drop if agesnad<45 | moca_raw<10
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease"
save "SNAD-Analysis-focal-LONG-pilotmatch-20211222", replace


/*R01 matched*/


*EGOAGG
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data"
use "SNAD-preexlusion-focal-R01match-20211222",clear

drop if agesnad<45 | moca_raw<10
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease"
save "SNAD-Analysis-focal-R01match-20211222", replace

*LONG
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\"
use "SNAD-preexlusion-focal-LONG-R01match-20211222",clear
drop if agesnad<45 | moca_raw<10
drop if primarysubtype=="Bipolar disorder" | primarysubtype=="Prion Disease"
save "SNAD-Analysis-focal-LONG-R01match-20211222", replace

