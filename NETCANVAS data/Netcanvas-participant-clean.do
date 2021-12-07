****Author:  Siyun Peng
****Date:    2021/02/14
****Version: 16
****Purpose: label and create variables for NC 

clear

***************************************************************
**# 1 read files 
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\temp"


/*read interviewer files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\Netcanvas Focal Interviews\interviewer") clear force 
drop id _filename networkcanvasuuid // drop unnessary variables 
save "Netcanvas-participant-interviewer-20211112.dta", replace


/*read ego files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\Netcanvas Focal Interviews\ego") clear force import(stringcols(_all)) //import all variables as string

*convert date
list ccid session* if missing(sessionfinish)
replace sessionfinish=sessionexported if missing(sessionfinish)
replace sessionfinish = substr(sessionfinish,1,10)
gen date_snad = date(sessionfinish,"YMD") // convert string to date 
format date_snad %dM_d,_CY //display in date 
list date_snad sessionfinish //double check

*check ccid
list ccid networkcanvascaseid if ccid!=networkcanvascaseid //1 case corrected below
replace ccid=networkcanvascaseid if networkcanvascaseid=="10240" //ccid is wrong but networkcanvascaseid is correct

*create wave for NC
sort ccid date_snad //sort ccid by time
bysort ccid: gen NC=_n
list ccid date_snad NC  //check order by time
 

drop session* interviewwave alterid ego_variable _filename // drop unnessary variables

save "Netcanvas-participant-ego-20211112.dta", replace


/*read alter files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\Netcanvas Focal Interviews\alter") clear force import(stringcols(_all)) //import all variables as string
drop if missing(networkcanvasegouuid) //empty row with no networkcanvasegouuid
drop _filename // drop unnessary variables

save "Netcanvas-participant-alter-20211112.dta", replace


/*read alter tie files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\Netcanvas Focal Interviews\alter_tie") clear force import(stringcols(_all))
fre alteralterclose // alter do not know each other is not in the data
destring alteralterclose,replace

*impute missing in alter-alter tie due to accidental skip
replace alteralterclose=1 if networkcanvasegouuid=="d8171411-dca7-45f1-a248-f16ad13f4072" & missing(alteralterclose) //they are both family members
replace alteralterclose=1 if networkcanvasegouuid=="3613a591-79bc-4ea5-8d80-46e8dfe770f1" & missing(alteralterclose) //they are both children
replace alteralterclose=1 if networkcanvasegouuid=="842da4a8-5dc0-432a-b958-c8bc440728cf" & missing(alteralterclose) //they are both coworker and friends
replace alteralterclose=2 if networkcanvasegouuid=="a6a3cf29-ac92-4d63-9782-8cad50a30d72" & missing(alteralterclose) //they are a child and a friend

*clean
recode alteralterclose (1=3) (2=2) (3=1) 
label define alteralterclose 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values alteralterclose alteralterclose
bysort networkcanvasegouuid: egen totval=total(alteralterclose),mi //for value density

recode alteralterclose (2/3=1) (1=0),gen(tievalue)
bysort networkcanvasegouuid: egen totnum=total(tievalue),mi //for Binary density

recode alteralterclose (1/3=1),gen(newtievalue)
bysort networkcanvasegouuid: egen totnum1=total(newtievalue),mi // for Density of networks know each other

save "Netcanvas-participant-altertie-long-20211112.dta", replace
keep networkcanvasegouuid totval totnum totnum1
duplicates drop networkcanvasegouuid, force
save "Netcanvas-participant-altertie-EGOAGG-20211112.dta", replace



***************************************************************
**# 2 merge files 
***************************************************************


use "Netcanvas-participant-interviewer-20211112.dta",clear
merge 1:1 networkcanvasegouuid using "Netcanvas-participant-ego-20211112.dta", nogen //only older protocols have interviewer files
merge 1:m networkcanvasegouuid using "Netcanvas-participant-alter-20211112.dta", nogen //all matched
merge m:1 networkcanvasegouuid using "Netcanvas-participant-altertie-EGOAGG-20211112.dta" 
fre ccid if _merge==1 //10229,10339 are missing in altertie data due to time constrict
drop _merge
rename (ccid name) (SUBID alter_name)
order SUBID alterid id
sort SUBID alterid
destring SUBID alterid,replace

*make names consistent
replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =subinstr(alter_name, `"""' , "",.) //remove "
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank


preserve




***************************************************************
**#3 Check and fix altername and alterid across SNAD
***************************************************************


/*check alterid & alter_name within each wave of NC*/

duplicates list SUBID alter_name date_snad //none should exist, otherwise fix.  
duplicates list SUBID alterid date_snad //none should exist, otherwise fix. 


/*check alterid & alter_name across waves of NC*/


duplicates drop SUBID alterid alter_name,force //drop alters in multiple waves
duplicates list SUBID alter_name //none should exist, otherwise fix 
rename alterid alterid_nc
save "NC-altername-match",replace

rename (alterid_nc alter_name) (alterid alter_name_nc)
duplicates list SUBID alterid //8 alters have different spelling in 2 waves (10155: 5,21; 10328:1; 10339:40; )
duplicates drop SUBID alterid,force //Those 8 are safe to drop different spelling
save "NC-alterid-match",replace


/*check alterid with uniqueid list*/

*same name but different alterid

import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\UniqueID  W12345-Focal-20210215", clear first 
keep SUBID TIEID_uniq name 
rename (name TIEID_uniq) (alter_name alterid)
duplicates drop SUBID alter_name,force
merge 1:1 SUBID alter_name using "NC-altername-match",keepusing(SUBID alterid_nc alter_name) 
sort SUBID alter_name
keep if _merge==3
list SUBID alter_name alterid* if alterid != alterid_nc //none should exist, otherwise fix

*same alterid but different name
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\UniqueID  W12345-Focal-20210215", clear first 
keep SUBID TIEID_uniq name 
rename (TIEID_uniq name) (alterid alter_name)
duplicates drop SUBID alterid,force
merge 1:1 SUBID alterid using "NC-alterid-match",keepusing(SUBID alterid alter_name_nc) 
sort SUBID alterid
keep if _merge==3
list SUBID alterid alter_name* if alter_name != alter_name_nc //double check to make sure people with same id are indeed different spelling rather than different people




***************************************************************
**#4 clean generators
***************************************************************

restore
/*check and fill missing on generators*/


foreach x of varlist prevalter broughtforward stilldiscuss alterim* alterhm* alteret* prevalterimcat* alterrel* {
	replace `x' = "1" if `x'== "true" | `x'== "TRUE"
	replace `x' = "0" if `x'== "false" | `x'== "FALSE"
	destring `x', replace
}
recode broughtforward stilldiscuss (. 2 =0)

*10052 missing generators despite stilldiscuss=1 (fill from ENSO data)
replace alterim1=1 if SUBID==10052 & alter_name=="maria p"
replace alterhm1=1 if SUBID==10052 & alter_name=="maria p"
replace alterim1=1 if SUBID==10052 & alter_name=="paula s"
replace alterhm1=1 if SUBID==10052 & alter_name=="paula s"
replace alterim1=1 if SUBID==10052 & alter_name=="risa d"
replace alteret4=1 if SUBID==10052 & alter_name=="shanel p"
replace alterim1=1 if SUBID==10052 & alter_name=="dereck r"
replace alterim1=1 if SUBID==10052 & alter_name=="sophie m"
replace alterhm1=1 if SUBID==10052 & alter_name=="sophie m" 
replace alterim1=1 if SUBID==10052 & alter_name=="angie r"
replace alterim1=1 if SUBID==10052 & alter_name=="becky f"
replace alterhm1=1 if SUBID==10052 & alter_name=="becky f"
replace alterim1=1 if SUBID==10052 & alter_name=="dea l"
replace alterhm1=1 if SUBID==10052 & alter_name=="dea l"
replace alteret5=1 if SUBID==10052 & alter_name=="mike a"
replace alteret6=1 if SUBID==10052 & alter_name=="winston j"

egen name_gen=rowtotal(alterim* alterhm* alteret* prevalterimcat*)
list SUBID alter_name if name_gen==0 & stilldiscuss==1 //0 missing generators while stilldiscuss=1
list SUBID if name_gen>0 & stilldiscuss==0 & broughtforward==0 //10357,10327,10299,6564,6409,3477 are named in generators but broughtforward/stilldiscuss!=1. The drag back problem. It is fixed in the APP and will not happen in the future.


/*recode generators*/


replace alterim1=1 if prevalterimcat_ima==1
replace alterim2=1 if prevalterimcat_imb==1
replace alterim3=1 if prevalterimcat_imc==1
replace alterhm1=1 if prevalterimcat_ihma==1
replace alterhm2=1 if prevalterimcat_ihmb==1
replace alterhm3=1 if prevalterimcat_ihmc==1
replace alteret3=1 if prevalterimcat_etc==1
replace alteret4=1 if prevalterimcat_etd==1
replace alteret5=1 if prevalterimcat_ete==1
replace alteret6=1 if prevalterimcat_etf==1
replace alteret7=1 if prevalterimcat_etg==1
*weekdays and weekends tie generators dropped in newer interviews
replace alteret1=1 if prevalterimcat_eta==1 
replace alteret2=1 if prevalterimcat_etb==1
drop prevalterimcat_*



/*drop previous alters that entered by mistakes*/

fre prevalter 
drop if prevalter!=1 & name_gen==0
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\cleaned\NC-participant-alter-LONG-prevalters.dta",replace

/*drop alters from previous wave but not mentioned in this wave*/

*mvpatterns if name_gen==0 //check those alters are not interviewed
drop if name_gen==0



***********************************************************************
**# 5. Retrive old alters' relation type and other demo (i.e., gender,race, age, college) from ENSO/pilot (only needed for early interviews in NC)
***********************************************************************


/*clean alter demo for merge with ENSO&pilots*/


destring SUBID altersex altercollege alterage alterrace,replace force
recode altercollege (-8=.) (1=1) (2=0)
recode altersex (-8=.) (2=1) (1=0),gen(tfem)
drop altersex
recode alterrace (3=4) (4=3) (5=4)
label define alterrace 1 "Asian" 2 "African American" 3 "White" 4 "Other"
label values alterrace alterrace
save "NC-Participant-LONG-20211112.dta", replace 


/*Merge W1 NC with missing alter demo with ENSO*/


keep if NC==1
egen relmiss=rowtotal(alterrel*) //209 alters are missing/0 on all relation type

*rename for merge with ENSO
rename (altercollege alterage alterrace) (alter_college alter_age alter_race)

*merge NC with ENSO
merge 1:1 SUBID alterid using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\temp\ENSO-Participant-alter-LONG-clean.dta",keepusing(nirel* tfem alter_race alter_age alter_college) update //update missing values in tfem alter_race alter_age alter_college of master data with values in using data
drop if _merge==2 //drop ENSO alters did not match with NC old alters
drop _merge

*retrive relation type (it cannot be done with update because we need to use relmiss to identify missing)
replace alterrel_1=nirelpart if relmiss==0
replace alterrel_2=nirelprnt if relmiss==0
replace alterrel_3=nirelsib if relmiss==0
replace alterrel_4=nirelchld if relmiss==0
replace alterrel_5=nirelgprnt if relmiss==0
replace alterrel_6=nirelgchld if relmiss==0
replace alterrel_7=nirelantun if relmiss==0
replace alterrel_8=nirelinlaw if relmiss==0
replace alterrel_9=nirelothrl if relmiss==0
replace alterrel_10=nirelcowrk if relmiss==0
replace alterrel_11=nirelnghbr if relmiss==0
replace alterrel_12=nirelfrnd if relmiss==0
replace alterrel_13=nirelemplr if relmiss==0
replace alterrel_14=nirelemple if relmiss==0
replace alterrel_15=nirelstdnt if relmiss==0
replace alterrel_16=nirellwyr if relmiss==0
replace alterrel_17=nireldoc if relmiss==0
replace alterrel_18=nirelothmd if relmiss==0
replace alterrel_19=nirelthrpy if relmiss==0
replace alterrel_20=nirelrabbi if relmiss==0
replace alterrel_21=nirelchrch if relmiss==0
replace alterrel_22=nirelclub if relmiss==0
replace alterrel_23=nirelactvt if relmiss==0

drop relmiss nirel*
egen relmiss=rowtotal(alterrel*) //54 alters are still missing/0 on all relation type


/*Merge W1 NC with missing alter demo with Pilots*/


*rename for merge with pilots
rename (alter_college) (tcollege)

*merge NC with pilots
preserve
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\SNAD-Participant-T1234-CleanB-LONG",replace
keep SUBID alterid time rel* tfem tcollege

*Only keep 1 wave 
tostring SUBID alterid,replace
gen id=SUBID+alterid
destring SUBID alterid,replace
reshape wide rel* tfem tcollege,i(id) j(time)
drop id
foreach x in tfem tcollege relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure {
	replace `x'4=`x'3 if missing(`x'4) 
	replace `x'4=`x'2 if missing(`x'4)
	replace `x'4=`x'1 if missing(`x'4)
	rename `x'4 `x'
	drop `x'1 `x'2 `x'3
} //use the most recent wave demo info
save "pilot-alterdemo",replace
restore

merge 1:1 SUBID alterid using "pilot-alterdemo", update //update missing values in tfem tcollege of master data with values in using data
drop if _merge==2 //drop pilot alters did not match with NC old alters
drop _merge


*retrive relation type info (it cannot be done with update because we need to use relmiss to identify missing)
replace alterrel_1=relpartner if relmiss==0
replace alterrel_2=relparent if relmiss==0
replace alterrel_3=relsibling if relmiss==0
replace alterrel_4=relchild if relmiss==0
replace alterrel_5=relgrandp if relmiss==0
replace alterrel_6=relgrandc if relmiss==0
replace alterrel_7=relauntunc if relmiss==0
replace alterrel_8=relinlaw if relmiss==0
replace alterrel_9=relothrel if relmiss==0
replace alterrel_10=relcowork if relmiss==0
replace alterrel_11=relneigh if relmiss==0
replace alterrel_12=relfriend if relmiss==0
replace alterrel_13=relboss if relmiss==0
replace alterrel_14=relemploy if relmiss==0
replace alterrel_15=relschool if relmiss==0
replace alterrel_16=rellawyer if relmiss==0
replace alterrel_17=reldoctor if relmiss==0
replace alterrel_18=relothmed if relmiss==0
replace alterrel_19=relmental if relmiss==0
replace alterrel_20=relrelig if relmiss==0
replace alterrel_21=relchurch if relmiss==0
replace alterrel_22=relclub if relmiss==0
replace alterrel_23=relleisure if relmiss==0
drop rel*
rename (tcollege alter_age alter_race) (altercollege alterage alterrace)
recode NC (1=.)

*append with wave 2+ NC
append using "NC-Participant-LONG-20211112.dta" 
drop if NC==1 //only append wave 2+
recode NC (.=1)
rename (tfem) (alterfem)
rename (alterrel_1-alterrel_23) (relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure)
recode rel* (.=0) //. were from ENSO/pilots

*rename (nirelpart nirelprnt nirelsib nirelchld nirelgprnt nirelgchld nirelantun nirelinlaw nirelothrl nirelcowrk nirelnghbr nirelfrnd nirelemplr nirelemple nirelstdnt nirellwyr nireldoc nirelothmd nirelthrpy nirelrabbi nirelchrch nirelclub nirelactvt) 




***************************************************************
**#6 Retrive alter demo from NC T1 (those are skiped for T2+ NC)
***************************************************************


egen relmiss=rowtotal(rel*) //65 alters are 0 on all relation type
sort SUBID alterid NC // T1 alter appears first

foreach x of varlist altercollege alterfem alterrace {
	bysort SUBID alterid: replace `x'=`x'[1] if missing(`x') & NC>1 //take T1 values if missing
}
foreach x of varlist rel* {
	bysort SUBID alterid: replace `x'=`x'[1] if relmiss==0 & NC>1 //take T1 values if relmiss=0
}
bysort SUBID alterid: replace alterage=alterage[1]+age(date_snad[1], date_snad) if missing(alterage) & NC>1 //take T1 values+time between waves if missing




***************************************************************
**#7 clean interpretors
***************************************************************

**start here

/*this is not necessary if pilot data is not used*/


egen pilot=rowtotal(alterim* alterhm*)
*drop if pilot==0 | missing(pilot) //drop names that are not in health and important matter to be consistent with Pilot data 


**stop here

*missing on interpretors: 
mvpatterns if name_gen>0

*check missing on alterid 
list SUBID alter_name if missing(alterid) // no missing

list SUBID name alterid if missing(altercloseego) & (broughtforward==1 | stilldiscuss==1) //910004 & alterid 4 is missing on all interpretor; 

list SUBID name alterid if missing(altersupfunc_1) & (broughtforward==1 | stilldiscuss==1) //10458,6125,10464 support function all false

list SUBID name alterid if missing(altercls110) & (broughtforward==1 | stilldiscuss==1) //10389,910004 accidental skip

*double check randomly choose 10
destring random,replace
bysort SUBID: egen random_tot = total(random)
fre SUBID if random_tot!=10 & random_tot!=0 //6534 only chose 9

*weird pattern of all false
foreach x of varlist alterrel_* altersupfunc_* {
	replace `x' = "0" if `x' == "false" | `x' == "FALSE"
	replace `x' = "1" if `x' == "true" | `x' == "TRUE"
	destring `x',replace
}

egen alterrel=rowtotal(alterrel_*)
fre SUBID if alterrel==0 & (broughtforward==1 | stilldiscuss==1) //need to retrive demo from older waves (Evan skip demo if interviewed before)

egen altersupfunc=rowtotal(altersupfunc_*)
fre SUBID if alterrel==0 & altersupfunc==0 & (broughtforward==1 | stilldiscuss==1) //10154,10458,10459,10464,6125


/*
************************************************************
// 3. retrive ego info for baseline ENSO interview (not collected for other wave)
************************************************************
import delimited "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO Focal\Ego\focal_bl_ego_export_17-1_2021-01-14T10 05 01.920140-05 00.csv", clear
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs
replace SUBID=10400 if SUBID==1400
drop if SUBID==10339 //ENSO interviewer thought 10039 is a misspelling of 10339 in ENSO, thus leave incomplete data for 10339 and restart interview for 10039
replace SUBID=10339 if SUBID==10039 //actually 10039 is the wrong number, it should be 10339
duplicates list SUBID //6377, 6574, 10067, 10127, 10163, 10216, 10239, 10262, 10327, 10332, 10339, 10360: 12 duplicates

*manually check and drop duplicates within each wave
drop if SUBID==6377 & interview_id==703







************************************************************
// 6. clean the variable names across 5 ENSO waves
******************************************************


*******clean name generators
foreach x of varlist hlthburdn hlthcount hlthencrg impburdn impforce impmat ///
    wkndties wkdyties family cowrkrs neighbrs anyelse partner {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}

*******clean name interpretors 
bysort SUBID: egen netsize=count(alter_name)
lab var netsize "Total number of alters mentioned" 

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

foreach x of varlist nisupcare nisupcash nisupchor nisuplstn nisupsugg {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
egen numsup=rowtotal(nisupcare nisupcash nisupchor nisuplstn nisupsugg),mi
replace numsup=. if missing(alter_name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

foreach x of varlist nihassle* {
	tostring `x',replace
	replace `x' =substr(`x',1,1) //remove " in string
	destring `x',replace
}
egen nihasslenew=rowmean(nihassle*)
drop nihassle nihassle2 nihassle3 nihassle4 nihassle5
rename nihasslenew nihassle
revrs nihassle, replace //reverse code
bysort SUBID: egen mhassles=mean(nihassle)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode nihassle (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

foreach x of varlist nistrength {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
bysort SUBID: egen mstrength=mean(nistrength)
lab var mstrength "Mean tie strength in network, HI=MORE"
bysort SUBID: egen weakest=min(nistrength)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(nistrength)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(nistrength)
lab var sdstrength "Standard deveiation of tie strength"

gen tfem=nifemale
lab var tfem "Alter is female"
drop nifemale
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen): 25 types total in data (nirelother nirelfinan are two extra in ENSO)
egen othfam=rowtotal(nirelsib nirelantun nirelgprnt nirelgchld nirelothrl),mi //group into other family
egen fri=rowtotal(nirelfrnd nirelactvt),mi //group into friend
egen work=rowtotal(nirelemple nirelemplr nirelcowrk),mi //group into workmate
egen church=rowtotal(nirelrabbi nirelchrch),mi //group into religious group
egen prof=rowtotal(nirelthrpy nirelothmd nireldoc nirellwyr nirelfinan),mi //group into professional group
recode othfam fri work church prof (1/10=1)
foreach x of varlist othfam fri work church prof nirelpart nirelprnt nirelinlaw nirelchld nirelnghbr nirelstdnt nirelclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen relmiss=rowtotal(nirelother nirelchrch nirelemplr nirelfrnd nirelothrl nirelantun nirelstdnt nirelsib nirelgprnt nirelinlaw nirelgchld nirelothmd nirelrabbi nirelthrpy nirellwyr nirelprnt nirelnghbr nirelclub nirelactvt nirelfinan nirelcowrk nireldoc nirelpart nirelemple nirelchld) //114 alters are missing/0 on all relation type (6+1+107=114)

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

gen ENSO=1
save "ENSO-Participant-LONG-pilot-clean.dta", replace 
*save "ENSO-Participant-LONG-clean.dta", replace 

duplicates drop SUBID, force
keep SUBID date_snad netsize-ENSO
drop tfem tkin tclose tfreq thassles numsup //drop alter level variables
save "ENSO-Participant-EGOAGG-pilot-clean.dta", replace 
*save "ENSO-Participant-EGOAGG-clean.dta", replace 









***************************************************************
//	#7 Clean alter-alter ties (A-B and B-A are both in the file! But this does not affect calculation of density)
***************************************************************
*match with pilot of important and health matters
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO Focal") clear force  //import multiple csv in a folder (ssc install multimport)
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs
replace SUBID=10400 if SUBID==1400
drop if SUBID==10339 //ENSO interviewer thought 10039 is a misspelling of 10339 in ENSO, thus leave incomplete data for 10339 and restart interview for 10039
replace SUBID=10339 if SUBID==10039 //actually 10039 is the wrong number, it should be 10339


*duplicates within each wave
duplicates tag SUBID alter_a_name alter_b_name _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //10262 T1, 10327 T1, 6564 T2, 10127 T2, 6538 T3
sort SUBID interview_id alter_a_name

*manually check and drop duplicates within each wave
drop if SUBID==10262 & interview_id==446 & _filename==1
replace tievalue=. if SUBID==10262 & _filename==1 //every tie has value of 1=low close, this is impossible given ego is close to all alters, thus code missing 
drop if SUBID==10327 & _filename==1 
replace tievalue=. if SUBID==10327 & _filename==1 //every tie has value of 2, this is impossible, thus code missing (high close, low strength, missing relation type in alter data too)
drop if SUBID==6564 & interview_id==617 & _filename==2
drop if SUBID==10127 & interview_id!=770 & _filename==2
drop if SUBID==6538 & interview_id==159 & _filename==3
duplicates report SUBID alter_a_name alter_b_name _filename //no duplicate left


*******check duplicate cases across waves  

*remove place holders (e.g., T2 alters that are from previous waves are in ENSO T1 too, although they are not interviewed in T1 by ENSO)
duplicates list SUBID alter_a_name alter_b_name //3564 in T3 is also in T4
drop if SUBID==3564 & _filename==3
duplicates report SUBID alter_a_name alter_b_name //no duplicate left


*******check weird pattern in tievalue  
egen new_tievalue=rowtotal(tievalue*),mi
drop tievalue* tieweight* 
rename new_tievalue tievalue
fre tievalue
label define alterclose 0 "Dont know each other" 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values tievalue alterclose
bysort SUBID: egen tievalue_min=min(tievalue)
bysort SUBID: egen tievalue_max=max(tievalue)
bysort SUBID: gen issue=1 if tievalue_min==tievalue_max & !missing(tievalue_min, tievalue_max)
drop pickone
egen pickone=tag(SUBID) if issue==1
fre pickone //44 SUBIDs have issues!
fre SUBID if issue==1 //too many 
sort issue SUBID
order SUBID tievalue tievalue_min tievalue_max issue

replace tievalue=. if SUBID==3429 | SUBID==3477 | SUBID==3677 //stopped here

keep SUBID tievalue alter_a_name alter_b_name



*merge with alter data pilot vs. full to clean

*this is not nesscessary for full data
merge m:1 SUBID using "ENSO-Participant-LONG-pilot-clean.dta"
keep if _merge==3 //keep alters that are important or health matters
keep survey_id-tievalue //only keep variables from alter-alter ties

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

