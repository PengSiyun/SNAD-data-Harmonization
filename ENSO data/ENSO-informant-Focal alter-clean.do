****Author:  Siyun Peng
****Date:    2022/01/19
****Version: 17
****Purpose: clean Informant's report of Focal alter data for ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

/*Things to fix later: 
SUBID=10216,10259 are in pilot T1 and ENSO T1

*/

************************************************************
**# 1. keep ENSO focal alter 
************************************************************

*load data
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\ENSO Informant\Alter") clear force append(force) //import multiple csv in a folder (ssc install multimport)
rename respondent_name SUBID
replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,force replace
drop if missing(SUBID) //drop all test runs
rename alter_id TIEID

*make names consistent
drop if alter_name=="99" | missing(alter_name) // 2 with 99

replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank

*drop ENSO alter with no alter info
encode fclose3,gen(fclose3_copy)
replace fclose3="2" if fclose3_copy==3 //recode weird string values
replace fclose3="1" if fclose3_copy==4
encode fclose4,gen(fclose4_copy)
replace fclose4="2" if fclose4_copy==4 //recode weird string values
replace fclose4="1" if fclose4_copy==5
encode ftalk3,gen(ftalk3_copy)
replace ftalk3="2" if ftalk3_copy==4 //recode weird string values
replace ftalk3="1" if ftalk3_copy==5
encode ftalk4,gen(ftalk4_copy)
replace ftalk4="2" if ftalk4_copy==4 //recode weird string values
replace ftalk4="1" if ftalk4_copy==5

drop *_copy

foreach x of varlist fclose* ftalk* sclose* stalk* fimp* fhlth* fanyelse* fpartner* fstillmem* simp* shlth* scaregiv* swk* sfamily* scowrkrs* sneighbrs* sanyelse* spartner* sstillmem* {
	tostring `x',replace
	replace `x' =substr(`x',1,1) //remove " in string
	destring `x',replace
}

* ENSO alter with no alter info (Focal)
egen fclose=rowmean(fclose*)
egen ftalk=rowmean(ftalk*)
egen fstrength=rowmean(fstrength*) //strength have too much values of 1 which should be missing
egen falter_mi=rowmean(fclose ftalk)
sum falter_mi fclose ftalk fstrength

* ENSO alter with no alter info (Informant)
egen sclose=rowmean(sclose*)
egen stalk=rowmean(stalk*)
egen sstrength=rowmean(sstrength*)
egen salter_mi=rowmean(sclose stalk)
sum salter_mi sclose stalk sstrength

*generators
egen fgen=anymatch(fimp* fhlth* fanyelse* fpartner* fstillmem*),v(1)
egen sgen=anymatch(simp* shlth* scaregiv* swk* sfamily* scowrkrs* sneighbrs* sanyelse* spartner* sstillmem*),v(1) 
fre fgen falter_mi

keep if fgen==1


***************************************************************
**# 2 Remove duplicates in ENSO FOCAL alter data
***************************************************************


*******check duplicate cases within each wave (same subjects with different interview dates)
sort _filename SUBID 
duplicates tag SUBID alter_name _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //T1: 10067, 10327. T2: 6418, T3: 6368: 4 duplicates

*manually check and drop duplicates within each wave
drop if SUBID==10067 & interview_id!=729 & _filename==1 
drop if SUBID==10327 & interview_id==232 & _filename==1
drop if SUBID==6418 & interview_id!=193 & _filename==2
drop if SUBID==6368 & interview_id==697 & _filename==3
duplicates report SUBID alter_name _filename //0 dup
drop dup pickone

*******check duplicate cases across waves  

*remove place holders (e.g., T2 alters that are from previous waves are in ENSO T1 too, although they are not interviewed in T1 by ENSO)
duplicates tag SUBID alter_name,gen(dup) //124 duplicates
egen exinput=rowtotal(inputfromspf*),mi 
drop if dup==1 & exinput!=1 //exinput=1 when current wave alters are from previous wave, so keep them and drop the previous wave alters.
duplicates report SUBID alter_name //no duplicate left


*******Other issues  

*drop alters in previous wave but not mentioned in current wave
drop if !missing(fnotnamed2) & fstillmem2!=1 & missing(fstrength2) & _filename==2
drop if !missing(fnotnamed3) & fstillmem3!=1 & missing(fstrength3) & _filename==3
drop if !missing(fnotnamed4) & fstillmem4!=1 & missing(fstrength4) & _filename==4
*drop if !missing(fnotnamed5) & fstillmem5!=1 & missing(fstrength5) & _filename==5 //no fstillmem5

*maually drop same alter but have 2 spellings
drop if SUBID==6388 & alter_name=="linora h"
drop if SUBID==6517 & alter_name=="lisandra l"
drop if SUBID==6517 & alter_name=="nelly o"
drop if SUBID==10299 & alter_name=="connie c"



************************************************************
**# 3 make relation type and demo variables consistent accross waves
************************************************************


/*relation type*/


* Change ENSO T3's different format of alter relation type
*1421_SRELSIB3 Informant; 1398_ Focal
lookfor 1398
rename (_srelemple3 _srelrabbi3 _srelthrpy3 _srelclub3 v40 _srelprnt3 _srelpart3 v62 _srelactvt3 _srelchrch3 v78 v84 _srelchld3 v99 v100 v102 v108 v118 v119 v121 v122 _srelgprnt3 v128 v132) (frelemple3 frelrabbi3 frelthrpy3 frelclub3 frellwyr3 frelprnt3 frelpart3 frelemplr3 frelactvt3 frelchrch3 frelnghbr3 frelfrnd3 frelchld3 frelsib3 frelcowrk3 frelothrmd3 freldoc3 frelfince3 frelothrl3 frelantun3 frelstdnt3 frelgprnt3 frelgchld3 frelinlaw3)
gen frelother3=.


*change ENSO T4 different format
foreach x in frelchrch frelemplr frelfrnd frelothrl frelantun frelstdnt frelsib frelgprnt frelinlaw frelgchld frelothmd frelrabbi frelthrpy frellwyr frelprnt frelnghbr frelclub frelactvt frelfinan frelcowrk freldoc frelpart frelemple frelchld {
	rename (_`x'4) (`x'4)
}
rename frelfinan4 frelfince4 
rename frelothmd4 frelothrmd4
*gen variables missing in each waves
rename frelothmd5 frelothrmd5

foreach x in frelother frelchrch frelemplr frelfrnd frelothrl frelantun frelstdnt frelsib frelgprnt frelinlaw frelgchld frelothrmd frelrabbi frelthrpy frellwyr frelprnt frelnghbr frelclub frelactvt frelfince frelcowrk freldoc frelpart frelemple frelchld {
	egen `x'=rowmean(`x'1 `x'2 `x'3 `x'4 `x'5)
	drop `x'1 `x'2 `x'3 `x'4 `x'5
}

fre *_txt* 

replace frelchld=1 if frelother4_txt=="Step-child" 
replace frelinlaw=1 if frelother_txt1=="Current wifes ex-husband" 
replace frelnghbr=1 if frelother_txt1=="Tennant" 
replace frelinlaw=1 if frelother_txt2=="Former daughter in law"
drop *_txt*


/*make college consistent*/


recode fcollege* (1=1) (0 2=0) (99=.)
egen alter_college=rowmean(fcollege*)
drop fcollege*


/*make gender consistent*/


egen alter_female=rowmean(ffemale*)
drop ffemale*
save "ENSO-Informant-Focal alter-LONG.dta", replace 


/*merge with uniqueID*/


import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Focal alter", clear first 
keep SUBID TIEID_uniq name 
replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,force replace
rename (name TIEID_uniq) (alter_name alterid)
merge m:1 SUBID alter_name using "ENSO-Informant-Focal alter-LONG.dta" //0 of _merge==2
keep if _merge==3
duplicates drop SUBID alter_name alterid,force //drop duplicates due to merge
drop dup
duplicates tag SUBID alterid,gen(dup) //ENSO alters have the same alterid
list SUBID alter_name alterid if dup==1 //find and fix alterid in raw file
drop _merge dup
egen relmiss=rowtotal(frel*) //119 alters are missing/0 on all relation type

save "ENSO-Informant-Focal alter-LONG.dta",replace

**start here


***********************************************************************
**# 4. old alters' relation type, gender, college need to retrive from pilot wave 

/*Alter age, race, hispanic, gender, edu, relation type are skipped for old alters, but pilot only collected gender, education, relation type*/
***********************************************************************


/*retrive alter demo from pilot data*/

use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\clean data\SNAD-Partner-T1234-CleanB-LONG",replace
keep SUBID alterid time imd imr imb hmd hmr hmb rel* tfem tcollege

*Only keep 1 wave 
tostring SUBID alterid,replace
gen id=SUBID+alterid
destring SUBID alterid,replace
reshape wide imd imr imb hmd hmr hmb rel* tfem tcollege,i(id) j(time)
drop id
foreach x in imd imr imb hmd hmr hmb tfem tcollege relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure {
	replace `x'4=`x'3 if missing(`x'4) 
	replace `x'4=`x'2 if missing(`x'4)
	replace `x'4=`x'1 if missing(`x'4)
	rename `x'4 `x'
	drop `x'1 `x'2 `x'3
} //use the most recent wave demo info

merge 1:1 SUBID alterid using "ENSO-Participant-alter-LONG.dta" 
drop if _merge==1 //drop pilot alters did not match with ENSO old alters
drop _merge


/*retrive gender info*/

replace nifemale=tfem if missing(nifemale)
drop tfem

/*retrive education info*/

replace alter_college=tcollege if missing(alter_college)
drop tcollege

/*retrive relation type info*/

replace nirelothrl=relothrel if relmiss==0
replace nirelchrch=relchurch if relmiss==0
replace nirelemplr=relboss if relmiss==0
replace nirelcowrk=relcowork if relmiss==0
replace nirelemple=relemploy if relmiss==0
replace nirelfrnd=relfriend if relmiss==0
replace nirelantun=relauntunc if relmiss==0
replace nirelstdnt=relschool if relmiss==0
replace nirelsib=relsibling if relmiss==0
replace nirelgprnt=relgrandp if relmiss==0
replace nirelinlaw=relinlaw if relmiss==0
replace nirelgchld=relgrandc if relmiss==0
replace nirelothmd=relothmed if relmiss==0
replace nirelrabbi=relrelig if relmiss==0
replace nirelthrpy=relmental if relmiss==0
replace nirellwyr=rellawyer if relmiss==0
replace nirelpart=relpartner if relmiss==0
replace nirelnghbr=relneigh if relmiss==0
replace nirelclub=relclub if relmiss==0
replace nireldoc=reldoctor if relmiss==0
replace nirelchld=relchild if relmiss==0
replace nirelprnt=relparent if relmiss==0
replace nirelactvt=relleisure if relmiss==0
drop rel*





************************************************************
**# 5a. clean the variable names across 5 ENSO waves -FULL
************************************************************


*******clean name interpretors 
bysort SUBID: egen netsize=count(alter_name)
lab var netsize "Total number of alters mentioned" 

bysort SUBID: egen pcollege=mean(alter_college)
lab var pcollege "Proportion college in network"

foreach x of varlist nitrust* {
	tostring `x',replace
	replace `x' =substr(`x',1,1) //remove " in string
	destring `x',replace
}
destring nirace5 niage,replace force
encode niqdoc4,gen(niqdoc4_copy)
drop niqdoc4
recode niqdoc4_copy (4=3) (5=1) (6=2),gen(niqdoc4)
drop niqdoc4_copy
foreach x of varlist nirace niage nilive niqdoc nitrust nimemloss {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
rename (nirace niage) (alter_race alter_age)
bysort SUBID: egen mage=mean(alter_age)
lab var mage "Mean age in network"
bysort SUBID: egen sdage=sd(alter_age)
lab var sdage "Standard deveiation of alter age"

label define alter_race 1 "Asian" 2 "African American" 3 "White" 4 "Other"
label values alter_race alter_race
recode alter_race (1 2 4=0) (3=1),gen(white)
bysort SUBID: egen pwhite=mean(white)
lab var pwhite "Proportion White in network"

rename nilive alterprox
label define alterprox 1 "<30 mins" 2 "30-60 mins" 3 "1-2 hour" 4 ">2 hour"
label values alterprox alterprox
bysort SUBID: egen mprox=mean(alterprox)
lab var mprox "Mean alter proximity"
recode alterprox (2/4=0),gen(prox30)
bysort SUBID: egen pprox=mean(prox30)
lab var prox30 "Proportion <30 mins"

rename nimemloss alterhknow
recode alterhknow (1=3) (2=2) (3=1)
label define alterhknow 1 "Not very much" 2 "Some" 3 "A lot"
label values alterhknow alterhknow
bysort SUBID: egen mknow=mean(alterhknow)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE"
recode alterhknow (1 2=0) (3=1),gen(tknow)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot about aging"

rename nitrust alterdtr
recode alterdtr (1=3) (2=2) (3=1)
label define alterdtr 1 "Not very much" 2 "Most of the time" 3 "A lot"
label values alterdtr alterdtr
bysort SUBID: egen mtrust=mean(alterdtr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
recode alterdtr (1 2 =0) (3=1),gen(ttrust)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"

rename niqdoc alterquestion
label define alterquestion 1 "Rarely" 2 "Sometimes" 3 "Often"
label values alterquestion alterquestion
bysort SUBID: egen mquestion=mean(alterquestion)
lab var mquestion "Mean questions doctors in network, HI=MORE"

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

egen numsup3=rowtotal(nisupcare nisuplstn nisupsugg),mi
replace numsup3=. if missing(name)
bysort SUBID: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist nisupcare nisupcash nisupchor nisuplstn nisupsugg {
	replace `x'=. if missing(alter_name)
	bysort SUBID: egen p`x'=mean(`x') //missing means no alter
}
rename (pnisupcare pnisupcash pnisupchor pnisuplstn pnisupsugg) ///
       (pcare ploan pchores plisten padvice)
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"

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
save "ENSO-Participant-alter-LONG-clean.dta", replace 

duplicates drop SUBID, force
keep SUBID date_snad netsize-ENSO
drop tfem tkin tclose tfreq thassles numsup white alter_race alter_age numsup numsup3 prox30 tknow ttrust //drop alter level variables
save "ENSO-Participant-alter-EGOAGG-clean.dta", replace 

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code" //reset directory for rule-all do file