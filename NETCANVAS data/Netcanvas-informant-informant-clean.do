****Author:  Siyun Peng
****Date:    2022/04/27
****Version: 17
****Purpose: Clean NC Informant report of INFORMANT



***************************************************************
**# 1 Read alter level data (ego file is cleaned in informant-focal code)
***************************************************************



cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\temp"
*read file
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews\alter") clear force import(stringcols(_all)) //import all variables as string
drop if missing(networkcanvasegouuid) //empty row with no networkcanvasegouuid
drop null _filename // drop unnessary variables

*merge with ego level 
merge m:1 networkcanvasegouuid using "NC-informant-ego-20211112.dta", nogen //all matched

rename (ccid name) (SUBID alter_name)
order SUBID alteridi id
sort SUBID alteridi
destring alteridi,replace

*make names consistent
replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =subinstr(alter_name, `"""' , "",.) //remove "
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank

*Harmonize variables due to questions format change
replace stilldiscussi="1" if stilldiscussi_1=="TRUE"
replace stilldiscussi="0" if stilldiscussi_2=="TRUE"
replace altersexi="1" if altersexi_1=="TRUE"
replace altersexi="2" if altersexi_2=="TRUE"
replace altericollege="1" if altericollege_1=="TRUE"
replace altericollege="2" if altericollege_2=="TRUE"
replace altericollege="-8" if altericollege_8=="TRUE"
replace informalterphyi="1" if informalterphyi_1=="TRUE"
replace informalterphyi="2" if informalterphyi_2=="TRUE"
replace informalterphyi="3" if informalterphyi_3=="TRUE"
replace informalterphyi="-8" if informalterphyi_8=="TRUE"
replace alterhasslei="1" if alterhasslei_1=="TRUE"
replace alterhasslei="2" if alterhasslei_2=="TRUE"
replace alterhasslei="3" if alterhasslei_3=="TRUE"
drop stilldiscussi_? altersexi_? altericollege_? informalterphyi_? alterhasslei_?

             



***************************************************************
**#2 clean generators
***************************************************************

/*check and fill missing on generators*/


foreach x of varlist prevalter broughtforward stilldiscuss alterim* alterhm* alteret* prevalterimcat* alterrel* ///
prevalteri broughtforwardi stilldiscussi iim* iihm* iet* stilldiscusscati* {
	replace `x' = "1" if `x'== "true" | `x'== "TRUE"
	replace `x' = "0" if `x'== "false" | `x'== "FALSE"
	destring `x', replace
}
recode broughtforward stilldiscuss stilldiscussi (. 2 =0)

egen name_gen=rowtotal(iim* iihm* iet* stilldiscusscati*) //INFORMANT
list SUBID alter_name if name_gen==0 & stilldiscussi==1 //0 missing generators while stilldiscuss=1
list SUBID if name_gen>0 & stilldiscussi==0 & broughtforwardi==0 //6404a are named in generators but broughtforward/stilldiscuss!=1. The drag back problem. It is fixed in the APP and will not happen in the future.


/*recode generators*/


replace iim1=1 if stilldiscusscati_iimasd==1
replace iim2=1 if stilldiscusscati_iimbsd==1
replace iim3=1 if stilldiscusscati_iimcsd==1
replace iihm1=1 if stilldiscusscati_iihmasd==1
replace iihm2=1 if stilldiscusscati_iihmbsd==1
replace iihm3=1 if stilldiscusscati_iihmcsd==1
replace iet1=1 if stilldiscusscati_ietasd==1 
replace iet2=1 if stilldiscusscati_ietbsd==1
replace iet3=1 if stilldiscusscati_ietcsd==1
replace iet4=1 if stilldiscusscati_ietdsd==1
replace iet5=1 if stilldiscusscati_ietesd==1
drop stilldiscusscati_*


/*drop FOCAL alter variables*/

drop alterid prevalter broughtforward stilldiscuss alterim* alterhm* alteret* prevalterimcat* alterrel_* previnterpreter altermissing altermissingother altersex alterrace altercollege alterage altercloseego alterfreqcon alterprox alterhknow alterdtr alterquestion altersupfunc_* alterhassle altercls110 egoaltercloseinformant 


/*drop previous alters that entered by mistakes*/

fre prevalteri 
drop if prevalteri!=1 & name_gen==0
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant-informant alter-LONG-prevalters.dta",replace

/*drop alters from previous wave but not mentioned in this wave*/

*mvpatterns if name_gen==0 //check those alters are not interviewed
drop if name_gen==0



***************************************************************
**# 3 Check and fix altername and alterid across SNAD in csv files
***************************************************************



preserve


/*check alterid & alter_name within each wave of NC*/

duplicates list SUBID_num alter_name date_snad //none should exist, otherwise fix.  
duplicates list SUBID_num alterid date_snad //none should exist, otherwise fix. 


/*check alterid & alter_name across waves of NC*/


duplicates drop SUBID_num alterid alter_name,force //drop alters in multiple waves
duplicates list SUBID_num alter_name //none should exist, otherwise fix 
rename alterid alterid_nc
save "NC-informant informant-altername-match",replace

rename (alterid_nc alter_name) (alterid alter_name_nc)
duplicates list SUBID_num alterid //1 alter have different spelling in 2 waves (10250:3)
duplicates drop SUBID_num alterid,force //Those 1 are safe to drop different spelling
save "NC-informant informant-alterid-match",replace



/*check alterid with uniqueid list*/

*same name but different alterid

import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Informant alter", clear first 
gen SUBID_num =subinstr(SUBID, "a", "",.) //remove a
destring SUBID_num,replace
keep SUBID_num TIEID_uniq name 
rename (name TIEID_uniq) (alter_name alterid)
duplicates drop SUBID_num alter_name,force
merge 1:1 SUBID_num alter_name using "NC-informant informant-altername-match",keepusing(SUBID_num alterid_nc alter_name) 
sort SUBID_num alter_name
keep if _merge==3
list SUBID_num alter_name alterid* if alterid != alterid_nc //none should exist, otherwise fix

*same alterid but different name
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Informant alter", clear first 
gen SUBID_num =subinstr(SUBID, "a", "",.) //remove a
destring SUBID_num,replace
keep SUBID_num TIEID_uniq name 
rename (TIEID_uniq name) (alterid alter_name)
duplicates drop SUBID_num alterid,force
merge 1:1 SUBID_num alterid using "NC-informant informant-alterid-match",keepusing(SUBID_num alterid alter_name_nc) 
sort SUBID_num alterid
keep if _merge==3
list SUBID_num alterid alter_name* if alter_name != alter_name_nc //double check to make sure people with same id are indeed different spelling rather than different people





***********************************************************************
**#4. Retrive old alters' relation type and other demo (i.e., gender,race, age, college) from ENSO (only needed for early interviews in NC)
***********************************************************************



restore
/*clean alter demo for merge with ENSO&pilots*/


destring altersexi altericollege alteragei alterracei,replace 
recode altericollege (-8=.) (1=1) (2=0)
recode altersexi (-8=.) (2=1) (1=0),gen(tfem)
drop altersexi
recode alterracei (3=4) (4=3) (5=4)
label define alterracei 1 "Asian" 2 "African American" 3 "White" 4 "Other"
label values alterracei alterracei

*rename for merge with ENSO
rename (altericollege alteragei alterracei alteridi) (alter_college alter_age alter_race alterid)
save "NC-informant informant-LONG-20211112.dta", replace 


/*Merge W1 NC with missing alter demo with ENSO*/


keep if NC==1
egen relmiss=rowtotal(alterreli*) //19 alters are missing/0 on all relation type


*merge NC with ENSO
rename (SUBID SUBID_num) (SUBID_str SUBID)
merge 1:1 SUBID alterid using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\ENSO-Informant-Informant alter-LONG-clean.dta",keepusing(srel* tfem alter_race alter_age alter_college) update //update missing values in tfem alter_race alter_age alter_college of master data with values in using data
rename (SUBID_str SUBID) (SUBID SUBID_num)
drop if _merge==2 //drop ENSO alters did not match with NC old alters
drop _merge

*retrive relation type (it cannot be done with update because we need to use relmiss to identify missing)
replace alterreli_1=srelpart if relmiss==0
replace alterreli_2=srelprnt if relmiss==0
replace alterreli_3=srelsib if relmiss==0
replace alterreli_4=srelchld if relmiss==0
replace alterreli_5=srelgprnt if relmiss==0
replace alterreli_6=srelgchld if relmiss==0
replace alterreli_7=srelantun if relmiss==0
replace alterreli_8=srelinlaw if relmiss==0
replace alterreli_9=srelothrl if relmiss==0
replace alterreli_10=srelcowrk if relmiss==0
replace alterreli_11=srelnghbr if relmiss==0
replace alterreli_12=srelfrnd if relmiss==0
replace alterreli_13=srelemplr if relmiss==0
replace alterreli_14=srelemple if relmiss==0
replace alterreli_15=srelstdnt if relmiss==0
replace alterreli_16=srellwyr if relmiss==0
replace alterreli_17=sreldoc if relmiss==0
replace alterreli_18=srelothrmd if relmiss==0
replace alterreli_19=srelthrpy if relmiss==0
replace alterreli_20=srelrabbi if relmiss==0
replace alterreli_21=srelchrch if relmiss==0
replace alterreli_22=srelclub if relmiss==0
replace alterreli_23=srelactvt if relmiss==0

drop relmiss srel*
egen relmiss=rowtotal(alterreli*) //12 alters are still missing/0 on all relation type

*append with wave 2+ NC
recode NC (1=.)
append using "NC-informant informant-LONG-20211112.dta" 
drop if NC==1 //only append wave 2+
recode NC (.=1)
rename (tfem) (alterfem)
rename (alterreli_1-alterreli_23) (relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure)
recode rel* (.=0) //. were from ENSO/pilots






***************************************************************
**#5 Retrive alter demo from NC T1 (those are skiped for T2+ NC)
***************************************************************


sort SUBID alterid NC // T1 alter appears first

foreach x of varlist alter_college alterfem alter_race {
	bysort SUBID alterid: replace `x'=`x'[1] if missing(`x') & NC>1 //take T1 values if missing
}
foreach x of varlist rel* {
	bysort SUBID alterid: replace `x'=`x'[1] if relmiss==0 & NC>1 //take T1 values if relmiss=0
}
bysort SUBID alterid: replace alter_age=alter_age[1]+age(date_snad[1], date_snad) if missing(alter_age) & NC>1 //take T1 values+time between waves if missing

save "NC-informant-informant alter-20211112.dta", replace





***************************************************************
**#6 clean alter level interpretors
***************************************************************




/*clean alter level interpretors*/


bysort SUBID NC: egen netsize=count(name_gen)
lab var netsize "Total number of alters mentioned" 

bysort SUBID NC: egen pcollege=mean(alter_college)
lab var pcollege "Proportion college in network"

lab var alter_age "Alter age"
bysort SUBID NC: egen mage=mean(alter_age)
lab var mage "Mean alter age"
bysort SUBID NC: egen sdage=sd(alter_age)
lab var sdage "Standard deveiation of alter age"

recode alter_race (1 2 4=0) (3=1),gen(white)
bysort SUBID NC: egen pwhite=mean(white)
lab var pwhite "Proportion White in network"

destring alterproxi,replace
label define alterprox 1 "<30 mins" 2 "30-60 mins" 3 "1-2 hour" 4 ">2 hour",replace
label values alterproxi alterprox
bysort SUBID NC: egen mprox=mean(alterproxi)
lab var mprox "Mean alter proximity"
recode alterproxi (2/4=0),gen(prox30)
bysort SUBID NC: egen pprox=mean(prox30)
lab var pprox "Proportion <30 mins"

destring informalterphyi,replace
recode informalterphyi (1=3) (2=2) (3=1) (-8=.)
label define informalterphyi 1 "Not very much" 2 "Most of the time" 3 "A lot",replace
label values informalterphyi informalterphyi
bysort SUBID NC: egen mtrust=mean(informalterphyi)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
recode informalterphyi (1 2 =0) (3=1),gen(ttrust)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID NC: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"

destring informalterresearch,replace
recode informalterresearch (-8=.)
label define informalterresearch 1 "Rarely" 2 "Sometimes" 3 "Often",replace
label values informalterresearch informalterresearch
bysort SUBID NC: egen mquestion=mean(informalterresearch)
lab var mquestion "Mean questions doctors in network, HI=MORE"

destring alterclosei,replace
recode alterclosei (1=3) (2=2) (3=1)
label define alterclosei 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values alterclosei alterclosei
recode alterclosei (1 2=0) (3=1),gen(tclose)
lab var tclose "Alter is very close"
bysort SUBID NC: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
bysort SUBID NC: egen mclose=mean(alterclosei)
lab var mclose "Mean closeness in network, HI=MORE"

destring alterfreqconi,replace
recode alterfreqconi (1=3) (2=2) (3=1)
label define alterfreqconi 1 "Hardly ever" 2 "Occcasionally" 3 "Often"
label values alterfreqconi alterfreqconi
recode alterfreqconi (1 2=0) (3=1),gen(tfreq)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID NC: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
bysort SUBID NC: egen mfreq=mean(alterfreqconi)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID NC: egen sdfreq=sd(alterfreqconi)
lab var sdfreq "Standard deviation of freq of contact in network"

destring alterclosenessi,replace
bysort SUBID NC: egen mstrength=mean(alterclosenessi)
lab var mstrength "Mean tie strength in network, HI=MORE"
bysort SUBID NC: egen weakest=min(alterclosenessi)
lab var weakest "Minimum tie strength score"
bysort SUBID NC: egen iqrstrength=iqr(alterclosenessi)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID NC: egen sdstrength=sd(alterclosenessi)
lab var sdstrength "Standard deveiation of tie strength"

foreach x of varlist infaltersup_* {
	replace `x'="0" if `x'=="false" | `x'=="FALSE"
	replace `x'="1" if `x'=="true" | `x'=="TRUE"
	destring `x',replace
}
rename (infaltersup_1-infaltersup_5) (listen care advice chores loan)
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

destring alterhasslei,replace
revrs alterhasslei, replace //reverse code
bysort SUBID NC: egen mhassles=mean(alterhasslei)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode alterhasslei (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID NC: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

lab var alterfem "Alter is female"
bysort SUBID NC: egen pfem=mean(alterfem)
lab var pfem "Proportion female in network"

destring ialterdisc,replace
gen tlkcare=ialterdisc
recode tlkcare (2/3=0)
lab var tlkcare "Informant talk a lot to alter about supporting FOCAL PERSON"
bysort SUBID: egen ptlkcare=mean(tlkcare)
lab var ptlkcare "Proportion alters who Informant talk a lot about supporting FOCAL PERSON in network"
recode ialterdisc (1=3)(3=1)
lab var ialterdisc "Informant talk to alter about supporting FOCAL PERSON, 3=a lot"
bysort SUBID: egen mtlkcare=mean(ialterdisc)
lab var mtlkcare "Mean Informant talk about supporting FOCAL PERSON in network, HI=MORE"

destring alterhealthi,replace
gen hlthprob=alterhealthi
recode hlthprob (2/3=0)
lab var hlthprob "Alter know a lot about Informant's health problems"
bysort SUBID: egen phlthprob=mean(hlthprob)
lab var phlthprob "Proportion alters who know a lot about Informant's health problems"
recode alterhealthi (1=3)(3=1)
lab var alterhealthi "Alter know about Informant's health problems, 3=a lot"
bysort SUBID: egen mhlthprob=mean(alterhealthi)
lab var mhlthprob "Mean Alter know about Informant's health problems, HI=MORE"
 
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

drop tclose tfreq numsup numsup3 thassles prox30 ttrust tkin tlkcare hlthprob //drop alter level variables

save "NC-informant-informant alter-clean-20211112.dta", replace



***************************************************************
**#7 Clean alter-alter level data
***************************************************************




/*read alter tie files*/


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\Netcanvas Informant Interviews\alter_tie") clear force import(stringcols(_all))
replace infalteralterclose="1" if infalteralterclose_1=="true"
replace infalteralterclose="2" if infalteralterclose_2=="true"
replace infalteralterclose="3" if infalteralterclose_3=="true"
drop infalteralterclose_?
destring infalteralterclose,replace
fre infalteralterclose // alter do not know each other is not in the data

*drop focal alter tie
drop if missing(infalteralterclose) //keep informant alter ties
drop alteralterclose //drop focal variables

save "NC-informant-informant altertie-long-20211112.dta", replace


/*clean alter-alter level interpretors*/


recode infalteralterclose (1=3) (2=2) (3=1) 
label define infalteralterclose 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values infalteralterclose infalteralterclose
bysort networkcanvasegouuid: egen totval=total(infalteralterclose),mi //for value density

recode infalteralterclose (2/3=1) (1=0),gen(tievalue)
bysort networkcanvasegouuid: egen totnum=total(tievalue),mi //for Binary density

recode infalteralterclose (1/3=1),gen(newtievalue)
bysort networkcanvasegouuid: egen totnum1=total(newtievalue),mi // for Density of networks know each other
drop _filename

keep networkcanvasegouuid totval totnum totnum1 
duplicates drop networkcanvasegouuid, force
save "NC-informant-informant altertie-EGOAGG-20211112.dta", replace



/*Merge with alter level*/


merge 1:m networkcanvasegouuid using "NC-informant-informant alter-clean-20211112" 
fre SUBID if _merge==2 //4 SUBIDs are missing in altertie data 
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
**#8 save files 
***************************************************************




cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned"
save "NC-informant informant-LONG-clean-20211112.dta", replace 

duplicates drop SUBID NC, force
keep SUBID* date_snad NC netsize-efctsize
save "NC-informant informant-EGOAGG-clean-20211112.dta", replace 








