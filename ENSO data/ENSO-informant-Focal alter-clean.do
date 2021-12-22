****Author:  Siyun Peng
****Date:    2021/03/19
****Version: 16
****Purpose: clean Informant's report of Focal alter data for ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

/*Things to fix later: 
1. Alter age, race, hispanic, edu are skipped for old alters, but pilot data did not collect those
2. need to ask for IADC data to match with ENSO participant
3. SUBID=10216,10259 are in pilot T1 and ENSO T1

*/

************************************************************
// 1. keep ENSO focal alter 
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
//	#2 Remove duplicates in ENSO FOCAL alter data
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



************************************************************
//3 make relation type variables consistent accross waves
************************************************************

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


save "ENSO-Informant-Focal alter-LONG.dta",replace


*Stopped here
/*
************************************************************
// 2. Replace interview date with REDCAP data (ENSO date is not accurate)
************************************************************
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\SNAD-Redcap-R01-20210215",clear
replace ccid_gc= subinstr(ccid_gc, "a", "", .) //drop a (10325a to 10325)
destring ccid_gc,gen(SUBID) // ccid_gc is focal who completed interview
drop if missing(SUBID)
*convert date
format gift_date %tc
gen date_snad = dofc(gift_date) // convert "21apr2015 14:31:18" to "21apr2015" 
format date_snad %dM_d,_CY
list date_snad gift_date //double check
save "SNAD-Redcap-R01-20210215-temp",replace

*merge ENSO with Redcap R01
keep date_snad SUBID
merge 1:m SUBID using "ENSO-Participant-alter-LONG.dta"
fre SUBID if _merge==1 //  3517, 3594, 6409, 6477, 10394, 10397, 10428: 7 in completed Redcap but not in ENSO (10428 was interviewed by NETcanvas), where are the 6?
fre SUBID if _merge==2 //  8 in ENSO not in completed Redcap (6242, 6406, 6574, 10194, 10229, 10259, 10304, 10347 in pilot but not in R01 Redcap, but 6574, 10259, 10347 have alter info, which contradict Redcap record)
drop if _merge==1

*find date for ENSO 8 not found in Redcap R01 + 1 giftcard ccid for not completed focal
replace created_on=substr(created_on, 1, 10) //only keep MDY
replace created_on= subinstr(created_on, "-", "", .) //drop -
gen _date_ = date(created_on,"YMD")
format _date_ %dM_d,_CY
replace date_snad=_date_ if missing(date_snad) //fill in ENSO date if not found in REDCAP
drop _merge created_on modified_on _date_


************************************************************
// 3. drop ENSO focal with no alter info (this is needed so that network measures are not falsely count as 0)
************************************************************



/*N=132 for unique SUBID in alter tie data > N=112 in alter-ties data (who are the extra 20 SUBID?)
*T1, completed interviews but missing alter data on ENSO: 6377, 10023, 10042, 10150, 10332, 10345, 10352, 10353, 10360, 10382 
*T2, completed interviews but missing alter data on ENSO: 10150, 10257 (should be T3 but only in T2)
*T3, completed interviews but missing alter data on ENSO: 10075 (should be T4 but only in T3)
 13 in total

3517, 3594, 6409, 6477, 10394, 10397, 10428: 7 in completed Redcap but not found in ENSO, (10428 was interviewed by NETcanvas), where are the 6?
*/
*name generators have weird missing pattern, freq of talk is not carried over as other demographics, so it is chose here.


sum falter_mi fclose ftalk fstrength

fre SUBID if missing(nitalk) & _filename==1 //17 unique SUBID: 10347 only missing on nitalk
drop if _filename==1 & (SUBID==3568 | SUBID==6242 | SUBID==6377 | SUBID==10023 | SUBID==10042 | SUBID==10150 | SUBID==10229 | SUBID==10295 | SUBID==10304 | SUBID==10332 | SUBID==10345 | SUBID==10352 | SUBID==10353 | SUBID==10360 | SUBID==10382)  //Cases are largely blank on everything (3568, 6242, 10229 did not complete ENSO interview)
drop if SUBID==10216 & missing(nitalk) & _filename==1 //only 2 alters are missing
fre SUBID if missing(nitalk2) & _filename==2 //3 unique SUBID
drop if _filename==2 & (SUBID==10194 | SUBID==10150 | SUBID==10257) // 10194 did not complete ENSO interview
fre SUBID if missing(nitalk3) & _filename==3 //4 unique SUBID
drop if _filename==3 & (SUBID==6406 | SUBID==10075) //6406 did not complete ENSO interview
drop if _filename==3 & SUBID==6502 & missing(nitalk3) //only 1 alter is missing
drop if _filename==3 & SUBID==10237 & missing(nitalk3) //only 1 alter is missing
fre SUBID if missing(nitalk4) & _filename==4 //5 unique SUBID: 6364, 10052 only missing on nitalk
drop if _filename==4 & SUBID==3537 & missing(nitalk4) //only 1 alter is missing
drop if _filename==4 & SUBID==6530 & missing(nitalk4) //only 1 alter is missing
drop if _filename==4 & SUBID==10062 & missing(nitalk4) //only 1 alter is missing
fre SUBID if missing(nitalk5) & _filename==5 //0 unique SUBID
fre pickone //N=112 which is the same as alter-ties data

drop pickone dup






***********************************************************************
// 5. old alters' relation type and other demo (i.e., gender) need to retrive from pilot wave
***********************************************************************

egen relmiss=rowtotal(nirel*) //402 alters are missing/0 on all relation type
fre relmiss nifemale // at least 290 alters are missing on gender
keep if exinput==1 | relmiss==0 | missing(nifemale) //keep all 416 alters that are old or missing on gender or relation type (should just use exinput to identify old alters, but I am not confident in the data quality, so I check all missing on gender and relation type)
save "ENSO-oldalters",replace
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\SNAD-Participant-T1234-CleanB-LONG-20201001",clear
rename name alter_name //different spelling lead to mismatch
drop if missing(alter_name)
drop if ENSO==1 //drop ENSO cases cleaned from Kate's csv in pilot

*make names consistent
replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank

*correct names in pilot to be the same as ENSO (identified by merge ENSO section below)
replace alter_name="aly c" if alter_name=="allison c" & SUBID==3477
replace alter_name="chris w" if alter_name=="chris b" & SUBID==3477
replace alter_name="sheryl s" if alter_name=="shirley h" & SUBID==3477
replace alter_name="dr john knoll" if alter_name=="dr john kroll" & SUBID==3537
replace alter_name="larry ad" if alter_name=="larry a d" & SUBID==3738
replace alter_name="stephanie h" if alter_name=="stehanie h" & SUBID==6388
replace alter_name="cynthia b" if alter_name=="cindy b" & SUBID==6404
replace alter_name="joyce d" if alter_name=="joice d" & SUBID==6538
replace alter_name="carla s" if alter_name=="crala s" & SUBID==6545
replace alter_name="mary ann f" if alter_name=="mary f" & SUBID==10022
replace alter_name="solomon m" if alter_name=="soloman m" & SUBID==10022
replace alter_name="roxie t" if alter_name=="ruthie t" & SUBID==10063
replace alter_name="amartllis l" if alter_name=="amaryllis l" & SUBID==10105
replace alter_name="carmen g" if alter_name=="carmen d" & SUBID==10105
replace alter_name="jackie b" if alter_name=="jackie h" & SUBID==10284

*merge ENSO with pilot
keep SUBID alter_name time rel* tfem
merge m:1 SUBID alter_name using "ENSO-oldalters.dta"
*this is to identify misspelling between pilot and ENSO
list SUBID alter_name if _merge==2 // 100 new ENSO alters with missing demo did not match with pilot
list alter_name _merge if SUBID==3273 & _merge!=3
list alter_name _merge if SUBID==3477 & _merge!=3
list alter_name _merge if SUBID==3537 & _merge!=3
list alter_name _merge if SUBID==3564 & _merge!=3 
list alter_name _merge if SUBID==3738 & _merge!=3 
list alter_name _merge if SUBID==6125 & _merge!=3 
list alter_name _merge if SUBID==6302 & _merge!=3 
list alter_name _merge if SUBID==6388 & _merge!=3 
list alter_name _merge if SUBID==6404 & _merge!=3 
list alter_name _merge if SUBID==6417 & _merge!=3 
list alter_name _merge if SUBID==6418 & _merge!=3 
list alter_name _merge if SUBID==6480 & _merge!=3 
list alter_name _merge if SUBID==6512 & _merge!=3 
list alter_name _merge if SUBID==6517 & _merge!=3 
list alter_name _merge if SUBID==6530 & _merge!=3 
list alter_name _merge if SUBID==6538 & _merge!=3 
list alter_name _merge if SUBID==6545 & _merge!=3
list alter_name _merge if SUBID==10018 & _merge!=3 
list alter_name _merge if SUBID==10022 & _merge!=3 
list alter_name _merge if SUBID==10339 & _merge!=3 
list alter_name _merge if SUBID==10052 & _merge!=3 
list alter_name _merge if SUBID==10063 & _merge!=3 
list alter_name _merge if SUBID==10067 & _merge!=3 
list alter_name _merge if SUBID==10105 & _merge!=3 
list alter_name _merge if SUBID==10125 & _merge!=3 
list alter_name _merge if SUBID==10225 & _merge!=3 
list alter_name _merge if SUBID==10284 & _merge!=3
list alter_name _merge if SUBID==10347 & _merge!=3 
keep if _merge==3 //drop pilot alters did not match with ENSO old alters

*drop duplicated pilot data with no relation type info
duplicates tag SUBID alter_name,gen(dup)
egen miss=rowtotal(rel*) 
list SUBID miss alter_name dup if miss==0 & dup>0 //jeff c of 6364 had no relation type in all waves of pilot data
drop if miss==0 & dup>0
drop miss dup

*replace ENSO old alters with most recent pilot alter info
gsort SUBID alter_name -time //sort time descending, so that first occurence is latest time
duplicates drop SUBID alter_name,force //keep first occurence of duplicates
count //315 old alters found in pilot (416-100=316), 1 pilot alter had no relation type info

replace nifemale=tfem
replace nirelothrl=relothrel
replace nirelchrch=relchurch
replace nirelemplr=relboss
replace nirelcowrk=relcowork
replace nirelemple=relemploy
replace nirelfrnd=relfriend
replace nirelantun=relauntunc
replace nirelstdnt=relschool
replace nirelsib=relsibling
replace nirelgprnt=relgrandp
replace nirelinlaw=relinlaw
replace nirelgchld=relgrandc
replace nirelothmd=relothmed
replace nirelrabbi=relrelig
replace nirelthrpy=relmental
replace nirellwyr=rellawyer
replace nirelpart=relpartner
replace nirelnghbr=relneigh
replace nirelclub=relclub
replace nireldoc=reldoctor
replace nirelchld=relchild
replace nirelprnt=relparent
replace nirelactvt=relleisure     
drop time rel* tfem //drop variables from pilot
egen relmiss=rowtotal(nirel*)
fre relmiss //6 alters are missing/0 on all relation type in 316 found in pilot
list SUBID alter_name if relmiss==0
drop relmiss _merge
append using "ENSO-Participant-alter-LONG.dta"  
duplicates drop SUBID alter_name,force //drop 315 duplicates from using data





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
*this is not necessary if pilot data is not used
egen pilot=rowtotal(hlthburdn hlthcount hlthencrg impburdn impforce impmat),mi
drop if pilot==0 | missing(pilot) //drop names that are not in health and important matter to be consistent with Pilot data 

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
save "ENSO-Participant-alter-LONG-pilot-clean.dta", replace 
*save "ENSO-Participant-alter-LONG-clean.dta", replace 

duplicates drop SUBID, force
keep SUBID date_snad netsize-ENSO
drop tfem tkin tclose tfreq thassles numsup //drop alter level variables
save "ENSO-Participant-alter-EGOAGG-pilot-clean.dta", replace 
*save "ENSO-Participant-alter-EGOAGG-clean.dta", replace 
