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
list ccid networkcanvascaseid if ccid!=networkcanvascaseid //0 case, otherwise correct in the excel

*create wave for NC
sort ccid date_snad //sort ccid by time
bysort ccid: gen NC=_n
list ccid date_snad NC  //check order by time
drop sessionstart sessionfinish sessionexported interviewwave alterid ego_variable _filename // drop unnessary variables

save "Netcanvas-participant-ego-20211112.dta", replace


/*read alter files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\Netcanvas Focal Interviews\alter") clear force import(stringcols(_all)) //import all variables as string
drop if missing(networkcanvasegouuid) //empty row with no networkcanvasegouuid
drop v57 v77 v78 _filename // drop unnessary variables
save "Netcanvas-participant-alter-20211112.dta", replace


/*read alter tie files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Netcanvas\Netcanvas Focal Interviews\alter_tie") clear force import(stringcols(_all))
fre alteralterclose // alter do not know each other is not in the data
destring alteralterclose,replace

*impute missing in alter-alter tie due to accidental skip
replace alteralterclose=1 if networkcanvasuuid=="5e61b348-bd81-4e29-9f04-3c0ea0201768" & missing(alteralterclose) //they are both family members
replace alteralterclose=1 if networkcanvasuuid=="f8be72ca-3e3f-48bb-88e2-8f9489294d7a" & missing(alteralterclose) //they are both children
replace alteralterclose=1 if networkcanvasuuid=="e33cc922-9118-46a1-863b-97fa4500c03f" & missing(alteralterclose) //they are both coworker and friends
replace alteralterclose=2 if networkcanvasuuid=="f09f351b-0fbd-4ec7-b17c-70322c6c2c6c" & missing(alteralterclose) //they are a child and a friend

*clean
recode alteralterclose (1=3) (2=2) (3=1) 
label define alteralterclose 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values alteralterclose alteralterclose
bysort networkcanvasegouuid: egen totval=total(alteralterclose),mi //for value density

recode alteralterclose (2/3=1) (1=0),gen(tievalue)
bysort networkcanvasegouuid: egen totnum=total(tievalue),mi //for Binary density

recode alteralterclose (1/3=1),gen(newtievalue)
bysort networkcanvasegouuid: egen totnum1=total(newtievalue),mi // for Density of networks know each other
drop _filename

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


/*this is not necessary if pilot data is not used*/

egen pilot=rowtotal(alterim* alterhm*)
*drop if pilot==0 | missing(pilot) //drop names that are not in health and important matter to be consistent with Pilot data 


/*clean alter level interpretors*/


bysort SUBID NC: egen netsize=count(name_gen)
lab var netsize "Total number of alters mentioned" 

destring altercloseego,replace
recode altercloseego (1=3) (2=2) (3=1)
label define altercloseego 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values altercloseego altercloseego
recode altercloseego (1 2=0) (3=1),gen(tclose)
lab var tclose "Alter is very close"
bysort SUBID NC: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
bysort SUBID NC: egen mclose=mean(altercloseego)
lab var mclose "Mean closeness in network, HI=MORE"

destring alterfreqcon,replace
recode alterfreqcon (1=3) (2=2) (3=1)
label define alterfreqcon 1 "Hardly ever" 2 "Occcasionally" 3 "Often"
label values alterfreqcon alterfreqcon
recode alterfreqcon (1 2=0) (3=1),gen(tfreq)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID NC: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
bysort SUBID NC: egen mfreq=mean(alterfreqcon)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID NC: egen sdfreq=sd(alterfreqcon)
lab var sdfreq "Standard deviation of freq of contact in network"

foreach x of varlist altersupfunc_* {
	replace `x'="0" if `x'=="false" | `x'=="FALSE"
	replace `x'="1" if `x'=="true" | `x'=="TRUE"
	destring `x',replace
}
rename (altersupfunc_1-altersupfunc_5) (listen care advice chores loan)
egen numsup=rowtotal(listen-loan),mi
lab var numsup "Number of support functions"
bysort SUBID NC: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

egen numsup3=rowtotal(listen care advice),mi
bysort SUBID NC: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist listen-loan {
	bysort SUBID NC: egen p`x'=mean(`x') //missing means no alter
}
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"

destring alterhassle,replace
revrs alterhassle, replace //reverse code
bysort SUBID NC: egen mhassles=mean(alterhassle)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode alterhassle (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID NC: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

destring altercls110,replace
bysort SUBID NC: egen mstrength=mean(altercls110)
lab var mstrength "Mean tie strength in network, HI=MORE"
bysort SUBID NC: egen weakest=min(altercls110)
lab var weakest "Minimum tie strength score"
bysort SUBID NC: egen iqrstrength=iqr(altercls110)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID NC: egen sdstrength=sd(altercls110)
lab var sdstrength "Standard deveiation of tie strength"

lab var alterfem "Alter is female"
bysort SUBID NC: egen pfem=mean(alterfem)
lab var pfem "Proportion female in network"

lab var alterage "Alter age"
bysort SUBID NC: egen mage=mean(alterage)
lab var mage "Mean alter age"
bysort SUBID NC: egen sdage=sd(alterage)
lab var sdage "Standard deveiation of alter age"

bysort SUBID NC: egen pcollege=mean(altercollege)
lab var pcollege "Proportion college in network"

destring alterprox,replace
label define alterprox 1 "<30 mins" 2 "30-60 mins" 3 "1-2 hour" 4 ">2 hour",replace
label values alterprox alterprox
bysort SUBID NC: egen mprox=mean(alterprox)
lab var mprox "Mean alter proximity"
recode alterprox (2/4=0),gen(prox30)
bysort SUBID NC: egen pprox=mean(prox30)
lab var prox30 "Proportion <30 mins"

destring alterhknow,replace
recode alterhknow (1=3) (2=2) (3=1)
label define alterhknow 1 "Not very much" 2 "Some" 3 "A lot",replace
label values alterhknow alterhknow
bysort SUBID NC: egen mknow=mean(alterhknow)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE"
recode alterhknow (1 2=0) (3=1),gen(tknow)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age"
bysort SUBID NC: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot about aging"

destring alterdtr,replace
recode alterdtr (1=3) (2=2) (3=1) (-8=.)
label define alterdtr 1 "Not very much" 2 "Most of the time" 3 "A lot",replace
label values alterdtr alterdtr
bysort SUBID NC: egen mtrust=mean(alterdtr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
recode alterdtr (1 2 =0) (3=1),gen(ttrust)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID NC: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"

destring alterquestion,replace
recode alterquestion (-8=.)
label define alterquestion 1 "Rarely" 2 "Sometimes" 3 "Often",replace
label values alterquestion alterquestion
bysort SUBID NC: egen mquestion=mean(alterquestion)
lab var mquestion "Mean questions doctors in network, HI=MORE"

recode alterrace (1 2 4=0) (3=1),gen(white)
bysort SUBID NC: egen pwhite=mean(white)
lab var pwhite "Proportion White in network"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if relmiss==0
lab var tkin "Alter is family member"
bysort SUBID NC: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into  professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID NC `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
recode urelpartner-urelclub (0=.) if relmiss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID NC: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi //cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop relmiss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity"


/*clean alter-alter level interpretors*/
**start here

totval totnum totnum1
bysort SUBID NC: egen npossties=netsize*(netsize-1)/2

bysort SUBID: egen totval=total(tievalue),mi //for value density
gen density=totval/npossties
lab var density "Valued density of networks from matrix"

recode tievalue (2/3=1) (0/1=0),gen(tievalue1)
bysort SUBID: egen totnum=total(tievalue1),mi //for Binary density
gen bdensity=totnum/npossties
lab var bdensity "Binary density of networks from matrix"

recode tievalue (1/3=1) (0=0),gen(tievalue2)
bysort SUBID: egen totnum1=total(tievalue2),mi // for Density of networks know each other
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"

egen sole=rowmin(newmatrix_1_2-newmatrix_19_20) 
recode sole (0=1) (1=0) //same as recode b1density (1=0)
lab var sole "Sole bridge status"
*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"





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

