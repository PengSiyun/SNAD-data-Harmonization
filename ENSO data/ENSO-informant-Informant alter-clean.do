****Author:  Siyun Peng
****Date:    2022/01/25
****Version: 17
****Purpose: clean Informant reports of Informant alter data for ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

/*Things to fix later: 
1. SUBID=10216,10259 are in pilot T1 and ENSO T1
*/

************************************************************
**# 1. keep ENSO informant alter 
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

* ENSO alter with no alter info (Informant)
egen sclose=rowmean(sclose*)
egen stalk=rowmean(stalk*)
egen sstrength=rowmean(sstrength*)
egen salter_mi=rowmean(sclose stalk)
sum salter_mi sclose stalk sstrength

*generators
foreach x in shlthburdn shlthcount shlthencrg simpburdn simpforce simpmat ///
    scaregiv swkndties swkdyties sfamily scowrkrs sneighbrs sanyelse spartner {
	egen `x'new=rowmean(`x'1 `x'2 `x'3 `x'4 `x'5)
	drop `x'1 `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
egen fgen=anymatch(fimp* fhlth* fanyelse* fpartner* fstillmem*),v(1)
egen sgen=anymatch(simp* shlth* scaregiv* swk* sfamily* scowrkrs* sneighbrs* sanyelse* spartner* sstillmem*),v(1) 
keep if sgen==1



***************************************************************
**# 2 Remove duplicates in ENSO informant alter data
***************************************************************


*******check duplicate cases within each wave (same subjects with different interview dates)
duplicates tag SUBID alter_name _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //0 duplicates
drop dup

*******check duplicate cases across waves  

*remove place holders (e.g., T2 alters that are from previous waves are in ENSO T1 too, although they are not interviewed in T1 by ENSO)
duplicates tag SUBID alter_name,gen(dup) //0 duplicates

*******Other issues  

*drop alters in previous wave but not mentioned in current wave
drop if !missing(snotnamed2) & sstillmem2!=1 & missing(sstrength2) & _filename==2
drop if !missing(snotnamed3) & sstillmem3!=1 & missing(sstrength3) & _filename==3
*drop if !missing(snotnamed4) & sstillmem4!=1 & missing(sstrength4) & _filename==4 //no sstillmem4
*drop if !missing(snotnamed5) & sstillmem5!=1 & missing(sstrength5) & _filename==5 //no sstillmem5




************************************************************
**# 3 make relation type variables consistent accross waves
************************************************************




/*relation type*/



* Change ENSO T3's different format of alter relation type
lookfor 1421
rename (_srellwyr3 _srelinlaw3 _srelfince3 _srelemplr3 _srelothrl3 v26 v27 _srelfrnd3 _srelstdnt3 _srelsib3 _srelnghbr3 v53 _srelantun3 _srelothrmd3 _sreldoc3 v79 v83 v87 _srelcowrk3 v117 _srelgchld3 v127 v129 v131) (srellwyr3 srelinlaw3 srelfince3 srelemplr3 srelothrl3 srelemple3 srelrabbi3 srelfrnd3 srelstdnt3 srelsib3 srelnghbr3 srelclub3 srelantun3 srelothrmd3 sreldoc3 srelthrpy3 srelactvt3 srelpart3 srelcowrk3 srelprnt3 srelgchld3 srelchld3 srelgprnt3 srelchrch3)


*change ENSO T4 different format
foreach x in srelchrch srelemplr srelfrnd srelothrl srelantun srelstdnt srelsib srelgprnt srelinlaw srelgchld srelothrmd srelrabbi srelthrpy srellwyr srelprnt srelnghbr srelclub srelactvt srelfince srelcowrk sreldoc srelpart srelemple srelchld {
	rename (_`x'4) (`x'4)
}
gen srelother4=.

*correct name in each waves
rename srelrnd5 srelfrnd5
rename srelothmd5 srelothrmd5

foreach x in srelother srelchrch srelemplr srelfrnd srelothrl srelantun srelstdnt srelsib srelgprnt srelinlaw srelgchld srelothrmd srelrabbi srelthrpy srellwyr srelprnt srelnghbr srelclub srelactvt srelfince srelcowrk sreldoc srelpart srelemple srelchld {
	egen `x'=rowmean(`x'1 `x'2 `x'3 `x'4 `x'5)
	drop `x'1 `x'2 `x'3 `x'4 `x'5
}

fre *_txt* 
replace srelfince=1 if srelother_txt3=="Financial Advisor"
replace srelclub=1 if srelother_txt3=="Suppory group " 
replace srelclub=1 if srelother_txt3=="Support group" 
replace srelinlaw=1 if srelother_txt1=="ex husband" 
replace srelcowrk=1 if srelother_txt1=="client"
replace srelcowrk=1 if srelother_txt1=="Vonunteer with her" 
replace srelinlaw=1 if srelother_txt2=="Former daughter in law"
replace srellwyr=1 if srelother_txt3=="Hair dresser" 
drop *_txt*


/*make college consistent*/


recode scollege* (1=1) (0 2=0) (99=.)
egen alter_college=rowmean(scollege*)
drop scollege*


/*make gender consistent*/


egen alter_female=rowmean(sfemale*)
drop sfemale*
save "ENSO-Informant-Informant alter-LONG.dta", replace 


/*merge with uniqueID*/


import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Informant alter", clear first 
keep SUBID TIEID_uniq name 
replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,force replace
rename (name TIEID_uniq) (alter_name alterid)
merge m:1 SUBID alter_name using "ENSO-Informant-Informant alter-LONG.dta" //0 of _merge==2
keep if _merge==3
duplicates drop SUBID alter_name alterid,force //drop duplicates due to merge
drop dup
duplicates tag SUBID alterid,gen(dup) //ENSO alters have the same alterid
list SUBID alter_name alterid if dup==1 //find and fix alterid in raw file
drop _merge dup
egen relmiss=rowtotal(srel*) //114 alters are missing/0 on all relation type
drop relmiss

save "ENSO-Informant-Informant alter-LONG.dta",replace







************************************************************
**# 4. clean the variable names across 5 ENSO waves
************************************************************


*drop FOCAL variables
drop f* _frel*

*******clean name interpretors 
bysort SUBID: egen netsize=count(alter_name)
lab var netsize "Total number of alters mentioned" 

bysort SUBID: egen pcollege=mean(alter_college)
lab var pcollege "Proportion college in network"

* look at codebook to make sure all interpretors are cleaned


destring srace* sage* ,replace force
rename sliv1 slive1
foreach x in srace sage slive strust squedoc ssupcare ssupcash ssupchor ssuplstn ssupsugg shassle stlkcare shlthprob {
	egen `x'new=rowmean(`x'1 `x'2 `x'3 `x'4 `x'5)
	drop `x'1 `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
} 

rename (srace sage) (alter_race alter_age)
bysort SUBID: egen mage=mean(alter_age)
lab var mage "Mean age in network"
bysort SUBID: egen sdage=sd(alter_age)
lab var sdage "Standard deveiation of alter age"

label define alter_race 1 "Asian" 2 "African American" 3 "White" 4 "Other"
label values alter_race alter_race
recode alter_race (1 2 4=0) (3=1),gen(white)
bysort SUBID: egen pwhite=mean(white)
lab var pwhite "Proportion White in network"

rename slive alterprox
label define alterprox 1 "<30 mins" 2 "30-60 mins" 3 "1-2 hour" 4 ">2 hour"
label values alterprox alterprox
bysort SUBID: egen mprox=mean(alterprox)
lab var mprox "Mean alter proximity"
recode alterprox (2/4=0),gen(prox30)
bysort SUBID: egen pprox=mean(prox30)
lab var prox30 "Proportion <30 mins"

rename strust alterdtr
recode alterdtr (1=3) (2=2) (3=1)
label define alterdtr 1 "Not very much" 2 "Most of the time" 3 "A lot"
label values alterdtr alterdtr
bysort SUBID: egen mtrust=mean(alterdtr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
recode alterdtr (1 2 =0) (3=1),gen(ttrust)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"

rename squedoc alterquestion
label define alterquestion 1 "Rarely" 2 "Sometimes" 3 "Often"
label values alterquestion alterquestion
bysort SUBID: egen mquestion=mean(alterquestion)
lab var mquestion "Mean questions doctors in network, HI=MORE"

drop sclose? stalk? sstrength? 
gen tclose=sclose
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=sclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser 

gen tfreq=stalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=stalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"
drop seetalkr

bysort SUBID: egen mstrength=mean(sstrength)
lab var mstrength "Mean tie strength in network, HI=MORE"
bysort SUBID: egen weakest=min(sstrength)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(sstrength)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(sstrength)
lab var sdstrength "Standard deveiation of tie strength"

egen numsup=rowtotal(ssupcare ssupcash ssupchor ssuplstn ssupsugg),mi
replace numsup=. if missing(alter_name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

egen numsup3=rowtotal(ssupcare ssuplstn ssupsugg),mi
replace numsup3=. if missing(alter_name)
bysort SUBID: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist ssupcare ssupcash ssupchor ssuplstn ssupsugg {
	replace `x'=. if missing(alter_name)
	bysort SUBID: egen p`x'=mean(`x') //missing means no alter
}
rename (pssupcare pssupcash pssupchor pssuplstn pssupsugg) ///
       (pcare ploan pchores plisten padvice)
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"

revrs shassle, replace //reverse code
bysort SUBID: egen mhassles=mean(shassle)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode shassle (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

gen tfem=alter_female
lab var tfem "Alter is female"
drop alter_female
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

gen tlkcare=stlkcare
recode tlkcare (2/3=0)
lab var tlkcare "Informant talk a lot to alter about supporting FOCAL PERSON"
bysort SUBID: egen ptlkcare=mean(tlkcare)
lab var ptlkcare "Proportion alters who Informant talk a lot about supporting FOCAL PERSON in network"
recode stlkcare (1=3)(3=1)
lab var stlkcare "Informant talk to alter about supporting FOCAL PERSON, 3=a lot"
bysort SUBID: egen mtlkcare=mean(stlkcare)
lab var mtlkcare "Mean Informant talk about supporting FOCAL PERSON in network, HI=MORE"

gen hlthprob=shlthprob
recode hlthprob (2/3=0)
lab var hlthprob "Alter know a lot about Informant's health problems"
bysort SUBID: egen phlthprob=mean(hlthprob)
lab var phlthprob "Proportion alters who know a lot about Informant's health problems"
recode shlthprob (1=3)(3=1)
lab var shlthprob "Alter know about Informant's health problems, 3=a lot"
bysort SUBID: egen mhlthprob=mean(shlthprob)
lab var mhlthprob "Mean Alter know about Informant's health problems, HI=MORE"
 
*diversity measure (Cohen): 25 types total in data (nirelother nirelfinan are two extra in ENSO)
egen othfam=rowtotal(srelsib srelantun srelgprnt srelgchld srelothrl),mi //group into other family
egen fri=rowtotal(srelfrnd srelactvt),mi //group into friend
egen work=rowtotal(srelemple srelemplr srelcowrk),mi //group into workmate
egen church=rowtotal(srelrabbi srelchrch),mi //group into religious group
egen prof=rowtotal(srelthrpy srelothrmd sreldoc srellwyr srelfince),mi //group into professional group
recode othfam fri work church prof (1/10=1)
foreach x of varlist othfam fri work church prof srelpart srelprnt srelinlaw srelchld srelnghbr srelstdnt srelclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen relmiss=rowtotal(srelother srelchrch srelemplr srelfrnd srelothrl srelantun srelstdnt srelsib srelgprnt srelinlaw srelgchld srelothrmd srelrabbi srelthrpy srellwyr srelprnt srelnghbr srelclub srelactvt srelfince srelcowrk sreldoc srelpart srelemple srelchld) //6 alters are missing/0 on all relation type

recode uothfam ufri uwork uchurch uprof usrelpart usrelprnt usrelinlaw usrelchld usrelnghbr usrelstdnt usrelclub (0=.) if relmiss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(uothfam+ufri+uwork+uchurch+uprof+usrelpart+usrelprnt+usrelinlaw+usrelchld+usrelnghbr+usrelstdnt+usrelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop uothfam-usrelclub othfam fri work church prof
lab var diverse "Network diversity" 
fre diverse

egen tkin=rowtotal(srelsib srelantun srelgprnt srelgchld srelothrl srelpart srelprnt srelinlaw srelchld)
recode tkin (1/9=1)
replace tkin=. if missing(alter_name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

gen ENSO=1
save "ENSO-Informant-Informant alter-LONG-clean.dta", replace 
duplicates drop SUBID, force
keep SUBID created_on netsize-ENSO
drop tfem tkin tclose tfreq thassles numsup white alter_race alter_age numsup numsup3 prox30 tlkcare hlthprob alterprox alterdtr alterquestion ssupcare ssupcash ssupchor ssuplstn ssupsugg shassle stlkcare shlthprob ttrust //drop alter level variables
save "ENSO-Informant-Informant alter-EGOAGG-clean.dta", replace 

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code" //reset directory for rule-all do file