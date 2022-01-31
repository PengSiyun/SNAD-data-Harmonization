****Author:  Siyun Peng
****Date:    2022/01/27
****Version: 17
****Purpose: Clean NC Informant report of FOCAL

clear


***************************************************************
**# 1 clean ego data 
***************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\temp"


/*read interviewer files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews\interviewer") clear force 
drop id _filename networkcanvasuuid // drop unnessary variables 
save "NC-informant-interviewer-20211112.dta", replace


/*read ego files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews\ego") clear force import(stringcols(_all)) //import all variables as string

*convert date
list ccid session* if missing(sessionfinish)
replace sessionfinish=sessionexported if missing(sessionfinish)
replace sessionfinish = substr(sessionfinish,1,10)
gen date_snad = date(sessionfinish,"YMD") // convert string to date 
format date_snad %dM_d,_CY //display in date 
list date_snad sessionfinish //double check

*check ccid
list ccid networkcanvascaseid if ccid!=networkcanvascaseid //4 cases, correct in the excel if networkcanvascaseid is wrong
replace ccid=networkcanvascaseid if ccid!=networkcanvascaseid //networkcanvascaseid are all correct for 4 cases

*create wave for NC
sort ccid date_snad //sort ccid by time
bysort ccid: gen NC=_n
list ccid date_snad NC  //check order by time
drop sessionstart sessionfinish sessionexported interviewwave alterid ego_variable _filename // drop unnessary variables

save "NC-informant-ego-20211112.dta", replace





***************************************************************
**# 2 Read alter level data (only collect relation types after 2021)
***************************************************************



*read file
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews\alter") clear force import(stringcols(_all)) //import all variables as string
drop if missing(networkcanvasegouuid) //empty row with no networkcanvasegouuid
drop null _filename // drop unnessary variables

*merge with ego level 
merge m:1 networkcanvasegouuid using "NC-informant-ego-20211112.dta", nogen //all matched

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



***************************************************************
**#3 clean generators
***************************************************************

/*check and fill missing on generators*/


foreach x of varlist prevalter broughtforward stilldiscuss alterim* alterhm* alteret* prevalterimcat* alterrel* ///
prevalteri broughtforwardi stilldiscussi iim* iihm* iet* stilldiscusscati* {
	replace `x' = "1" if `x'== "true" | `x'== "TRUE"
	replace `x' = "0" if `x'== "false" | `x'== "FALSE"
	destring `x', replace
}
recode broughtforward stilldiscuss stilldiscussi (. 2 =0)

egen name_gen=rowtotal(alterim* alterhm* alteret* prevalterimcat*) //Focal 
list SUBID alter_name if name_gen==0 & stilldiscuss==1 //0 missing generators while stilldiscuss=1
list SUBID if name_gen>0 & stilldiscuss==0 & broughtforward==0 //10004a, 10299a, 10327a are named in generators but broughtforward/stilldiscuss!=1. The drag back problem. It is fixed in the APP and will not happen in the future.


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


/*keep FOCAL alter variables*/

keep randomi SUBID id networkcanvasegouuid networkcanvasuuid informantname focalsubname interviewername NC alter_name alterid prevalter broughtforward stilldiscuss alterim* alterhm* alteret* alterrel_* previnterpreter altermissing altermissingother name_gen date_snad ///
altersex alterrace altercollege alterage altercloseego alterfreqcon alterprox  alterhknow alterdtr alterquestion altersupfunc_* alterhassle altercls110 egoaltercloseinformant //last 3 rows are FOCAL alter questions that were dropped in 2021 of NC

/*drop previous alters that entered by mistakes*/

fre prevalter 
drop if prevalter!=1 & name_gen==0
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant-focal alter-LONG-prevalters.dta",replace

/*drop alters from previous wave but not mentioned in this wave*/

*mvpatterns if name_gen==0 //check those alters are not interviewed
drop if name_gen==0



***************************************************************
**#4 Check and fix altername and alterid across SNAD in csv files
***************************************************************



preserve


/*check alterid & alter_name within each wave of NC*/

duplicates list SUBID alter_name date_snad //none should exist, otherwise fix.  
duplicates list SUBID alterid date_snad //none should exist, otherwise fix. 


/*check alterid & alter_name across waves of NC*/


duplicates drop SUBID alterid alter_name,force //drop alters in multiple waves
duplicates list SUBID alter_name //none should exist, otherwise fix 
rename alterid alterid_nc
save "NC-informant focal-altername-match",replace

rename (alterid_nc alter_name) (alterid alter_name_nc)
duplicates list SUBID alterid //0 alters have different spelling in 2 waves 
duplicates drop SUBID alterid,force //drop different spelling
save "NC-informant focal-alterid-match",replace


/*check alterid with uniqueid list*/

*same name but different alterid

import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Focal alter", clear first 
keep SUBID TIEID_uniq name 
rename (name TIEID_uniq) (alter_name alterid)
duplicates drop SUBID alter_name,force
merge 1:1 SUBID alter_name using "NC-informant focal-altername-match",keepusing(SUBID alterid_nc alter_name) 
sort SUBID alter_name
keep if _merge==3
list SUBID alter_name alterid* if alterid != alterid_nc //none should exist, otherwise fix

*same alterid but different name
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Focal alter", clear first 
keep SUBID TIEID_uniq name 
rename (TIEID_uniq name) (alterid alter_name)
duplicates drop SUBID alterid,force
merge 1:1 SUBID alterid using "NC-informant focal-alterid-match",keepusing(SUBID alterid alter_name_nc) 
sort SUBID alterid
keep if _merge==3
list SUBID alterid alter_name* if alter_name != alter_name_nc //double check to make sure people with same id are indeed different spelling rather than different people





***********************************************************************
**#5. Retrive old alters' relation type and other demo (i.e., gender,race, age, college) from ENSO (only needed for early interviews in NC)
***********************************************************************



restore
/*clean alter demo for merge with ENSO&pilots*/

replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,replace
destring altersex altercollege alterage alterrace,replace force
recode altercollege (-8=.) (1=1) (2=0)
recode altersex (-8=.) (2=1) (1=0),gen(tfem)
drop altersex
recode alterrace (3=4) (4=3) (5=4)
label define alterrace 1 "Asian" 2 "African American" 3 "White" 4 "Other"
label values alterrace alterrace
save "NC-informant focal-LONG-20211112.dta", replace 


/*Merge W1 NC with missing alter demo with ENSO*/


keep if NC==1
egen relmiss=rowtotal(alterrel*) //40 alters are missing/0 on all relation type

*rename for merge with ENSO
rename (altercollege alterage alterrace) (alter_college alter_age alter_race)

*merge NC with ENSO
merge 1:1 SUBID alterid using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\ENSO-Informant-Focal alter-LONG-clean.dta",keepusing(frel* tfem alter_race alter_age alter_college) update //update missing values in tfem alter_race alter_age alter_college of master data with values in using data
drop if _merge==2 //drop ENSO alters did not match with NC old alters
drop _merge

*retrive relation type (it cannot be done with update because we need to use relmiss to identify missing)
replace alterrel_1=frelpart if relmiss==0
replace alterrel_2=frelprnt if relmiss==0
replace alterrel_3=frelsib if relmiss==0
replace alterrel_4=frelchld if relmiss==0
replace alterrel_5=frelgprnt if relmiss==0
replace alterrel_6=frelgchld if relmiss==0
replace alterrel_7=frelantun if relmiss==0
replace alterrel_8=frelinlaw if relmiss==0
replace alterrel_9=frelothrl if relmiss==0
replace alterrel_10=frelcowrk if relmiss==0
replace alterrel_11=frelnghbr if relmiss==0
replace alterrel_12=frelfrnd if relmiss==0
replace alterrel_13=frelemplr if relmiss==0
replace alterrel_14=frelemple if relmiss==0
replace alterrel_15=frelstdnt if relmiss==0
replace alterrel_16=frellwyr if relmiss==0
replace alterrel_17=freldoc if relmiss==0
replace alterrel_18=frelothrmd if relmiss==0
replace alterrel_19=frelthrpy if relmiss==0
replace alterrel_20=frelrabbi if relmiss==0
replace alterrel_21=frelchrch if relmiss==0
replace alterrel_22=frelclub if relmiss==0
replace alterrel_23=frelactvt if relmiss==0

drop relmiss frel*
egen relmiss=rowtotal(alterrel*) //20 alters are still missing/0 on all relation type

*append with wave 2+ NC
recode NC (1=.)
append using "NC-informant focal-LONG-20211112.dta" 
drop if NC==1 //only append wave 2+
recode NC (.=1)
rename (tfem) (alterfem)
rename (alterrel_1-alterrel_23) (relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure)
recode rel* (.=0) //. were from ENSO/pilots

save "NC-informant-focal alter-20211112.dta", replace





***************************************************************
**#6a Full: clean alter level interpretors
***************************************************************




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
lab var pprox "Proportion <30 mins"

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

destring egoaltercloseinformant,replace
gen tficlose=egoaltercloseinformant
recode tficlose (2/3=0) (-8=.)
lab var tficlose "Focal Alter is very close to Informant"
bysort SUBID: egen pficlose=mean(tficlose)
lab var pficlose "Proportion Focal alter very close to Informant in network"
gen howcloser2=egoaltercloseinformant
recode howcloser2 (1=3)(3=1)(-8=.)
bysort SUBID: egen mficlose=mean(howcloser2)
lab var mficlose "Mean Focal alter closeness to Informant in network, HI=MORE"
drop howcloser2

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

drop tclose tfreq numsup numsup3 thassles prox30 tknow ttrust white tkin //drop alter level variables
save "NC-informant-focal alter-clean-20211112.dta", replace




***************************************************************
**#7a Full: Clean alter-alter level data
***************************************************************




/*read alter tie files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews\alter_tie") clear force import(stringcols(_all))

*drop informant alter tie
destring alteralterclose,replace
fre alteralterclose // alter do not know each other is not in the data
drop if missing(alteralterclose) //keep focal alter ties
drop infalteralterclose* //drop informant variables

save "NC-informant-focal altertie-long-20211112.dta", replace


/*clean alter-alter level interpretors*/


recode alteralterclose (1=3) (2=2) (3=1) 
label define alteralterclose 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values alteralterclose alteralterclose
bysort networkcanvasegouuid: egen totval=total(alteralterclose),mi //for value density

recode alteralterclose (2/3=1) (1=0),gen(tievalue)
bysort networkcanvasegouuid: egen totnum=total(tievalue),mi //for Binary density

recode alteralterclose (1/3=1),gen(newtievalue)
bysort networkcanvasegouuid: egen totnum1=total(newtievalue),mi // for Density of networks know each other
drop _filename

keep networkcanvasegouuid totval totnum totnum1 
duplicates drop networkcanvasegouuid, force
save "NC-informant-focal altertie-EGOAGG-20211112.dta", replace



/*Merge with alter level*/


merge 1:m networkcanvasegouuid using "NC-informant-focal alter-clean-20211112" 
fre SUBID if _merge==2 //most are missing in altertie data because we dropped questions for alter-alter tie after 2021
drop _merge



/*Clean density etc measures*/


*adjust for randomization 
destring randomi, replace
bysort SUBID NC: egen trandom=total(randomi),mi
bysort SUBID NC: gen npossties=trandom*(trandom-1)/2 
bysort SUBID NC: replace npossties=netsize*(netsize-1)/2 if missing(npossties) //early NC did not implement randomization

foreach x of varlist totval totnum totnum1 {
	replace `x'=0 if inrange(netsize,2,4) & missing(`x') & !missing(mclose) //all 0 on alter-alter ties are absent and treated as missing for totval,totnum, totnum1; need to replace them as 0
}

gen density=totval/npossties
lab var density "Valued density of networks from matrix"
gen bdensity=totnum/npossties
lab var bdensity "Binary density of networks from matrix"
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"
recode b1density (1=0) (.=.) (else=1),gen(sole) 
lab var sole "Sole bridge status"

bysort SUBID NC: gen npossties_rd=trandom*(trandom-1)/2 
bysort SUBID NC: gen npossties_full=netsize*(netsize-1)/2
gen efctsize=netsize - 2*totnum1*(npossties_full/npossties_rd)/netsize //adjust totnum1 proportionaly to npossties_full/npossties_rd; trandom to netsize/trandom
replace efctsize=netsize-2*totnum1/netsize if missing(efctsize)
label var efctsize "Effective size"
drop npossties_rd npossties_full





***************************************************************
**#8a Full: save files 
***************************************************************




cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned"
save "NC-informant focal-LONG-clean-20211112.dta", replace 

duplicates drop SUBID NC, force
keep SUBID date_snad NC netsize-efctsize
save "NC-informant focal-EGOAGG-clean-20211112.dta", replace 









***************************************************************
**#6b Pilot: clean alter level interpretors
***************************************************************




*drop names that are not in health and important matter to be consistent with Pilot data 
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\temp"
use "NC-informant-focal alter-20211112.dta", clear
egen pilot=rowtotal(alterim* alterhm*)
drop if pilot==0 | missing(pilot) 

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
lab var pprox "Proportion <30 mins"

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

destring egoaltercloseinformant,replace
gen tficlose=egoaltercloseinformant
recode tficlose (2/3=0) (-8=.)
lab var tficlose "Focal Alter is very close to Informant"
bysort SUBID: egen pficlose=mean(tficlose)
lab var pficlose "Proportion Focal alter very close to Informant in network"
gen howcloser2=egoaltercloseinformant
recode howcloser2 (1=3)(3=1)(-8=.)
bysort SUBID: egen mficlose=mean(howcloser2)
lab var mficlose "Mean Focal alter closeness to Informant in network, HI=MORE"
drop howcloser2

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

drop tclose tfreq numsup numsup3 thassles prox30 tknow ttrust white tkin //drop alter level variables
save "NC-informant-focal alter-pilot-clean-20211112.dta", replace




***************************************************************
**#7b Pilot: Clean alter-alter level data
***************************************************************


**start here



/*Only keep alters from important matters*/


*grab selected alterid from alter level data
use "NC-informant-focal alter-pilot-clean-20211112",clear
gen networkcanvassourceuuid = networkcanvasuuid //networkcanvasuuid is alterid  
gen networkcanvastargetuuid = networkcanvasuuid
keep networkcanvassourceuuid networkcanvastargetuuid networkcanvasegouuid
save "NC-informant focal-pilotmatch",replace

*merge alterid with alter-alter level data
use "NC-informant-focal altertie-long-20211112",clear
merge m:1 networkcanvasegouuid networkcanvassourceuuid using "NC-informant focal-pilotmatch",keepusing(networkcanvassourceuuid)
keep if _merge==3 //keep selected alters for networkcanvassourceuuid
drop _merge
merge m:1 networkcanvasegouuid networkcanvastargetuuid using "NC-informant focal-pilotmatch",keepusing(networkcanvastargetuuid)
keep if _merge==3 //keep selected alters for networkcanvassourceuuid
drop _merge



/*clean alter-alter level interpretors*/


recode alteralterclose (1=3) (2=2) (3=1) 
label define alteralterclose 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values alteralterclose alteralterclose
bysort networkcanvasegouuid: egen totval=total(alteralterclose),mi //for value density

recode alteralterclose (2/3=1) (1=0),gen(tievalue)
bysort networkcanvasegouuid: egen totnum=total(tievalue),mi //for Binary density

recode alteralterclose (1/3=1),gen(newtievalue)
bysort networkcanvasegouuid: egen totnum1=total(newtievalue),mi // for Density of networks know each other
drop _filename

keep networkcanvasegouuid totval totnum totnum1 
duplicates drop networkcanvasegouuid, force
save "NC-informant-focal altertie-EGOAGG-pilot-20211112.dta", replace



/*Merge with alter level*/


merge 1:m networkcanvasegouuid using "NC-informant-focal alter-pilot-clean-20211112" 
list SUBID networkcanvasuuid alterid if random=="1" & _merge==2 //alters from important matters not randomly chosen, only 1 alter from important matters was randomly chosen, or alters from important matters did not know each other
drop _merge


/*Clean density etc measures*/


*adjust for randomization 
destring randomi, replace
bysort SUBID NC: egen trandom=total(randomi),mi
bysort SUBID NC: gen npossties=trandom*(trandom-1)/2 
bysort SUBID NC: replace npossties=netsize*(netsize-1)/2 if missing(npossties) //early NC did not implement randomization

foreach x of varlist totval totnum totnum1 {
	replace `x'=0 if inrange(netsize,2,4) & missing(`x') & !missing(mclose) //all 0 on alter-alter ties are absent and treated as missing for totval,totnum, totnum1; need to replace them as 0
}

gen density=totval/npossties
lab var density "Valued density of networks from matrix"
gen bdensity=totnum/npossties
lab var bdensity "Binary density of networks from matrix"
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"
recode b1density (1=0) (.=.) (else=1),gen(sole) 
lab var sole "Sole bridge status"

bysort SUBID NC: gen npossties_rd=trandom*(trandom-1)/2 
bysort SUBID NC: gen npossties_full=netsize*(netsize-1)/2
gen efctsize=netsize - 2*totnum1*(npossties_full/npossties_rd)/netsize //adjust totnum1 proportionaly to npossties_full/npossties_rd; trandom to netsize/trandom
replace efctsize=netsize-2*totnum1/netsize if missing(efctsize)
label var efctsize "Effective size"
drop npossties_rd npossties_full





***************************************************************
**#8b Pilot: save files 
***************************************************************




*save files
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned"
save "NC-informant focal-LONG-pilot-clean-20211112.dta", replace 

duplicates drop SUBID NC, force
keep SUBID date_snad NC netsize-efctsize
save "NC-informant focal-EGOAGG-pilot-clean-20211112.dta", replace 







***************************************************************
**#6c NC match (workdays and weekends generators are dropped at early of 2021): clean alter level interpretors
***************************************************************




*drop names that are workdays and weekend ties to be consistent with latest NC data 
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\temp"
use "NC-participant-alter-20211112.dta", clear
egen match=rowtotal(alterim* alterhm* alteret3 alteret4 alteret5 alteret6 alteret7)
drop if match==0 | missing(match) 

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
lab var pprox "Proportion <30 mins"

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

destring egoaltercloseinformant,replace
gen tficlose=egoaltercloseinformant
recode tficlose (2/3=0) (-8=.)
lab var tficlose "Focal Alter is very close to Informant"
bysort SUBID: egen pficlose=mean(tficlose)
lab var pficlose "Proportion Focal alter very close to Informant in network"
gen howcloser2=egoaltercloseinformant
recode howcloser2 (1=3)(3=1)(-8=.)
bysort SUBID: egen mficlose=mean(howcloser2)
lab var mficlose "Mean Focal alter closeness to Informant in network, HI=MORE"
drop howcloser2

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

drop tclose tfreq numsup numsup3 thassles prox30 tknow ttrust white tkin //drop alter level variables
save "NC-participant-alter-match-clean-20211112.dta", replace




***************************************************************
**#7c NC match: Clean alter-alter level data
***************************************************************






/**drop names that are workdays and weekend ties to be consistent with latest NC data 
*/


*grab selected alterid from alter level data
use "NC-participant-alter-match-clean-20211112",clear
gen networkcanvassourceuuid = networkcanvasuuid //networkcanvasuuid is alterid  
gen networkcanvastargetuuid = networkcanvasuuid
keep networkcanvassourceuuid networkcanvastargetuuid networkcanvasegouuid
save "NC-participant-NCmatch",replace

*merge alterid with alter-alter level data
use "NC-participant-altertie-long-20211112",clear
merge m:1 networkcanvasegouuid networkcanvassourceuuid using "NC-participant-NCmatch",keepusing(networkcanvassourceuuid)
keep if _merge==3 //keep selected alters for networkcanvassourceuuid
drop _merge
merge m:1 networkcanvasegouuid networkcanvastargetuuid using "NC-participant-NCmatch",keepusing(networkcanvastargetuuid)
keep if _merge==3 //keep selected alters for networkcanvassourceuuid
drop _merge



/*clean alter-alter level interpretors*/


recode alteralterclose (1=3) (2=2) (3=1) 
label define alteralterclose 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values alteralterclose alteralterclose
bysort networkcanvasegouuid: egen totval=total(alteralterclose),mi //for value density

recode alteralterclose (2/3=1) (1=0),gen(tievalue)
bysort networkcanvasegouuid: egen totnum=total(tievalue),mi //for Binary density

recode alteralterclose (1/3=1),gen(newtievalue)
bysort networkcanvasegouuid: egen totnum1=total(newtievalue),mi // for Density of networks know each other
drop _filename

keep networkcanvasegouuid totval totnum totnum1 
duplicates drop networkcanvasegouuid, force
save "NC-participant-altertie-EGOAGG-match-20211112.dta", replace



/*Merge with alter level*/


merge 1:m networkcanvasegouuid using "NC-participant-alter-match-clean-20211112" 
list SUBID networkcanvasuuid alterid if random=="1" & _merge==2 //alters from important matters not randomly chosen, only 1 alter from important matters was randomly chosen, or alters from important matters did not know each other
drop _merge


/*Clean density etc measures*/


*adjust for randomization 
destring random, replace
bysort SUBID NC: egen trandom=total(random),mi
bysort SUBID NC: gen npossties=trandom*(trandom-1)/2 
bysort SUBID NC: replace npossties=netsize*(netsize-1)/2 if missing(npossties) //early NC did not implement randomization

foreach x of varlist totval totnum totnum1 {
	replace `x'=0 if inrange(netsize,2,4) & missing(`x') & !missing(mclose) //all 0 on alter-alter ties are absent and treated as missing for totval,totnum, totnum1; need to replace them as 0
}

gen density=totval/npossties
lab var density "Valued density of networks from matrix"
gen bdensity=totnum/npossties
lab var bdensity "Binary density of networks from matrix"
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"
recode b1density (1=0) (.=.) (else=1),gen(sole) 
lab var sole "Sole bridge status"

bysort SUBID NC: gen npossties_rd=trandom*(trandom-1)/2 
bysort SUBID NC: gen npossties_full=netsize*(netsize-1)/2
gen efctsize=netsize - 2*totnum1*(npossties_full/npossties_rd)/netsize //adjust totnum1 proportionaly to npossties_full/npossties_rd; trandom to netsize/trandom
replace efctsize=netsize-2*totnum1/netsize if missing(efctsize)
label var efctsize "Effective size"
drop npossties_rd npossties_full





***************************************************************
**#8c NC match: save files 
***************************************************************




*save files
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned"
save "NC-Participant-LONG-match-clean-20211112.dta", replace 

duplicates drop SUBID NC, force
keep SUBID date_snad NC netsize-efctsize
save "NC-Participant-EGOAGG-match-clean-20211112.dta", replace 
