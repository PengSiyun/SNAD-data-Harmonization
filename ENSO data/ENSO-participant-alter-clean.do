****Author:  Siyun Peng
****Date:    2021/02/19
****Version: 16
****Purpose: clean alter data for ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\temp" //home

***************************************************************
//	#1 Remove duplicates in ENSO participant alter data
***************************************************************
/*Things to fix later: 
None
*/

multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO Focal\Alter") clear force  //import multiple csv in a folder (ssc install multimport)
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs
*Fix typo in ENSO SUBID
replace SUBID=10400 if SUBID==1400
drop if SUBID==10339 //ENSO interviewer thought 10039 is a misspelling of 10339 in ENSO, thus leave incomplete data for 10339 and restart interview for 10039
replace SUBID=10339 if SUBID==10039 //actually 10039 is the wrong number, it should be 10339

rename alter_id TIEID
sort SUBID alter_name

*******check duplicate cases within each wave (same subjects with different interview dates)

duplicates tag SUBID TIEID _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //10327 T1, 10262 T1, 10194 T2, 10168 T2, 10155 T2, 10127 T2, 6564 T2, 6534 T2, 6538 T3, 6340 T3, 6125 T3: 11 duplicates

*manually check and drop duplicates within each wave
drop if SUBID==10327 & interview_id==231 & _filename==1 
drop if SUBID==10262 & interview_id==446 & _filename==1
drop if SUBID==10194 & interview_id==176 & _filename==2
drop if SUBID==10168 & interview_id==164 & _filename==2
drop if SUBID==10155 & interview_id==203 & _filename==2
drop if SUBID==10127 & interview_id!=770 & _filename==2
drop if SUBID==6564 & interview_id==617 & _filename==2
drop if SUBID==6534 & interview_id!=186 & _filename==2
drop if SUBID==6538 & interview_id==159 & _filename==3
drop if SUBID==6340 & interview_id==173 & _filename==3
drop if SUBID==6125 & interview_id==204 & _filename==3
drop pickone dup

*some alters are named twice in the same wave, but have different TIEID (remove duplicates)
drop if alter_name=="99" | alter_name=="999999999" | missing(alter_name) // 5 with 99, 1 with 999999999, 2 with missing
duplicates tag SUBID alter_name _filename,gen(dup)
egen pickone=tag(SUBID) if dup>0
list SUBID _filename if pickone==1 //3537 T4, 6368 T3, 6502 T3, 6574 T1, 10067 T1, 10105 T4, 10127 T1, 10216 T1, 10237 T3: 9 duplicates

*manually check and drop duplicates within each wave
fre alter_name if SUBID==3537 & dup==1
drop if SUBID==3537 & dup==1 & missing(nitalk4) //drop 2 alters
fre alter_name if SUBID==10105 & dup==1
drop if SUBID==10105 & dup==1 & missing(nitalk4) //drop 2 alters
fre alter_name if SUBID==6368 & dup==1
drop if SUBID==6368 & interview_id==696 //drop 4 alters
fre alter_name if SUBID==6502 & dup==1
drop if SUBID==6502 & dup==1 & missing(nitalk3) //drop 2 alters
fre alter_name if SUBID==10237 & dup==1
drop if SUBID==10237 & dup==1 & missing(nitalk3) //drop 2 alters
fre alter_name if SUBID==6574 & dup==1
drop if SUBID==6574 & interview_id==156 //drop 4 alters
fre alter_name if SUBID==10067 & dup==1
drop if SUBID==10067 & interview_id==652 //drop 4 alters
fre alter_name if SUBID==10216 & dup==1
drop if SUBID==10216 & dup==1 & missing(nitalk) //drop 2 alters
fre alter_name if SUBID==10127 & dup==1
drop if SUBID==10127 & dup==1 & missing(nitalk) //drop 8 alters
drop pickone dup
duplicates report SUBID alter_name _filename,gen(dup) //no duplicate

*******check duplicate cases across waves  

*remove place holders (e.g., T2 alters that are from previous waves are in ENSO T1 too, although they are not interviewed in T1 by ENSO)
duplicates tag SUBID alter_name,gen(dup) //332 duplicates
egen exinput=rowtotal(inputfromfpbl inputfromfpt2 inputfromfpt3 inputfromfpt4)
duplicates tag SUBID alter_name exinput,gen(exinput_missing) //24 alters mentions in different waves but are both same on exinput

*manually fill in exinput for previous wave
fre SUBID _filename if exinput_missing==1
replace exinput=1 if SUBID==3568 & _filename==3 & exinput_missing==1
drop if SUBID==3568 & alter_name=="Sandra M" & _filename==1 //duplicate with Sondra M in W3
replace exinput=1 if SUBID==6502 & _filename==3 & exinput_missing==1
replace exinput=1 if SUBID==6568 & _filename==3 & exinput_missing==1

*drop duplicates
drop if dup==1 & exinput!=1 //exinput=1 when current wave alters are from previous wave, so keep them and drop the previous wave alters.
duplicates report SUBID alter_name //no duplicate left

*******Other issues  

*drop alters in previous wave but not mentioned in current wave
encode stillmem4,gen(stillmem4_copy)
replace stillmem4="1" if stillmem4_copy==2
destring stillmem4,replace
drop stillmem4_copy
drop if !missing(notnamed2) & stillmem2!=1 & missing(nistrength2) & _filename==2
drop if !missing(notnamed3) & stillmem3!=1 & missing(nistrength3) & _filename==3
drop if !missing(notnamed4) & stillmem4!=1 & missing(nistrength4) & _filename==4
drop if !missing(notnamed5) & stillmem5!=1 & missing(nistrength5) & _filename==5
drop dup

*drop alters in alter file but not in alter-alter tie files (also missing on all alter info)
drop if alter_name=="Derek M" & SUBID==3537
drop if alter_name=="Talbert K" & SUBID==6530
drop if alter_name=="Genny" & SUBID==10259
drop if missing(nihassle4) & SUBID==10062
drop if missing(nihassle) & SUBID==10216

*drop alters enter twice with different spelling
drop if SUBID==6302 & alter_name=="Jere S"
drop if SUBID==10373 & alter_name=="Jennifer"

save "ENSO-Participant-alter-LONG.dta",replace


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
fre SUBID if _merge==1 // 3517, 3594, 6409, 6477, 10394, 10397, 10428: 7 in completed Redcap but not in ENSO (10428 was interviewed by NETcanvas), where are the 7?
fre SUBID if _merge==2 //  8 in ENSO not in completed Redcap (6242, 6406, 6574, 10194, 10229, 10259, 10304, 10347 in pilot but not in R01 Redcap, but 6574, 10259, 10347 have alter info, which contradict Redcap record)
drop if _merge==1

*find date for ENSO 8 not found in Redcap R01 + 1 giftcard ccid for not completed focal
replace created_on=substr(created_on, 1, 10) //only keep MDY
replace created_on= subinstr(created_on, "-", "", .) //drop -
gen _date_ = date(created_on,"YMD")
format _date_ %dM_d,_CY
replace date_snad=_date_ if missing(date_snad) //fill in ENSO date if not found in REDCAP
replace date_snad=daily("02oct2019", "DMY") if SUBID==3568
replace date_snad=daily("01oct2019", "DMY") if SUBID==10347
replace date_snad=daily("08jul2020", "DMY") if SUBID==10127

drop _merge created_on modified_on _date_



************************************************************
// 3. Mark alters with no name generators info 
************************************************************

*clean name generators
foreach x of varlist hlthburdn hlthcount hlthencrg impburdn impforce impmat ///
    wkndties wkdyties family cowrkrs neighbrs anyelse partner {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
egen name_gen=anymatch(imp* hlth* wk* family* cowrkrs* neighbrs* anyelse* partner* stillmem*),v(1) // 90 alters have no generator info 
sum nitalk* niclose* nistrength* nirel* if name_gen==0
list SUBID alter_name *2 if nitalk2==1 & name_gen==0 // one case with interpretor info but no generator info (10185 Beth H)

/*drop empty generators
drop if name_gen==0 & missing(nitalk2) //89 dropped
*/


/*N=130 for unique SUBID in alter data > N=112 in alter-ties data (who are the extra 18 SUBID?)
*T1, completed interviews but missing alter data on ENSO: 6377, 10023, 10042, 10150, 10332, 10345, 10352, 10353, 10360, 10382 
*T2, completed interviews but missing alter data on ENSO: 10150, 10257 (should be T3 but only in T2)
*T3, completed interviews but missing alter data on ENSO: 10075 (should be T4 but only in T3)
 13 in total

3517, 3594, 6409, 6477, 10394, 10397, 10428: 7 in completed Redcap but not found in ENSO, (10428 was interviewed by NETcanvas), where are the 6?
*/
*name generators have weird missing pattern, freq of talk is not carried over as other demographics, so it is chose here.


/*drop missing interpretors
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
*/
*save Ben-focal-alter.dta, replace

/*Missing alter data on Ben's 2021 export but not missing on Kate's 2020 export: 
T1: 6377, 10150, 10352, 10353, 10360, 10382 (drop 6377, 10150, 10352, 10353, check others to see if all those are in the wrong SUBID)
T2: 10023
7 in total, they all contain inaccurate data

multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO Focal\2020 October\October Enso SNAD raw exports\Alter") clear force  
destring respondent_name,force gen(SUBID) 
keep if SUBID==6377 | SUBID==10150 | SUBID==10352 | SUBID==10353 | SUBID==10360 | SUBID==10382 | SUBID==10023 // only keep 7 focals that are missing in Ben's CSV files
drop if _filename!=1 & (SUBID==6377 | SUBID==10150 | SUBID==10352 | SUBID==10353 | SUBID==10360 | SUBID==10382) //dropped one T1 focal that is wrongfully in T2 (SUBID==10150)
drop if _filename!=2 & SUBID==10023 //drop placeholders in T1

duplicates report SUBID alter_name //no duplicate
fre SUBID if _filename==1 & missing(nitalk)
drop if _filename==1 & SUBID==6377 & missing(nitalk) //drop those missing, they are in the wrong SUBID
append using Ben-focal-alter.dta
*/
/*Missing alter data on Ben's 2021 export and Kate's 2020 export: 
T1: 10042, 10332, 10345 
T2: 10257
T3: 10075
5 in total
*/


**stoped here & need to fill in generators***

************************************************************
//4 make relation type variables consistent accross waves
************************************************************

* Change ENSO T4's different format of alter relation type

encode nirelpart4nirelprnt4nirelsib4nir, gen(nirel4)
drop nirelother4

foreach x of varlist nirelother nirelchrch nirelemplr nirelfrnd nirelothrl nirelantun nirelstdnt nirelsib nirelgprnt nirelinlaw nirelgchld nirelothmd nirelrabbi nirelthrpy nirellwyr nirelprnt nirelnghbr nirelclub nirelactvt nirelfinan nirelcowrk nireldoc nirelpart nirelemple nirelchld {
	gen `x'4=.
}
fre nirel4
replace nirelchld4=1 if nirel4==1
replace nirelchrch4=1 if nirel4==2
replace nirelclub4=1 if nirel4==3
replace nirelcowrk4=1 if nirel4==4
replace nireldoc4=1 if nirel4==5
replace nirelemple4=1 if nirel4==6
replace nirelemplr4=1 if nirel4==7
replace nirelfinan4=1 if nirel4==8
replace nirelfrnd4=1 if nirel4==9
replace nirelgchld4=1 if nirel4==10
replace nirelinlaw4=1 if nirel4==11
replace nirelnghbr4=1 if nirel4==12
replace nirelothmd4=1 if nirel4==13
replace nirelothrl4=1 if nirel4==14
replace nirelpart4=1 if nirel4==15
replace nirelsib4=1 if nirel4==16
replace nirelthrpy4=1 if nirel4==17

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

fre nirelother_txt nirelother5_txt
replace nirelchld=1 if nirelother5_txt=="Step Child" 
replace nirellwyr=1 if nirelother_txt=="Cleans home for participant " 
replace nirellwyr=1 if nirelother_txt=="He is reconstructing participant home " 
replace nirelinlaw=1 if nirelother_txt=="Daughter's boyfriend"
replace nirelothmd=1 if nirelother_txt=="Massage TH"

drop *txt*
*make names consistent
replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank

*make college consistent
recode nicollege* (1=1) (0 2=0) (99=.)
egen alter_college=rowmean(nicollege*)
drop nicollege*
save "ENSO-Participant-alter-LONG.dta", replace 

*merge with uniqueID
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\UniqueID  W12345-Focal-20210215", clear first 
keep SUBID TIEID_uniq name 
rename (name TIEID_uniq) (alter_name alterid)
merge m:1 SUBID alter_name using "ENSO-Participant-alter-LONG.dta"
keep if _merge==3
duplicates drop SUBID alter_name alterid,force //drop duplicates due to merge
duplicates tag SUBID alterid,gen(dup) //ENSO alters have the same alterid
list SUBID alter_name alterid if dup==1 //find and fix alterid in raw file
drop _merge dup

save "ENSO-Participant-alter-LONG.dta", replace 




***********************************************************************
// 5. old alters' relation type, generators, and other demo (i.e., gender, college) need to retrive from pilot wave
***********************************************************************

/*keep alters that are old or missing on alter demo*/

egen relmiss=rowtotal(nirel*) //551 alters are missing/0 on all relation type
fre relmiss name_gen nifemale // 90 missing generator; at least 465 missing on gender
keep if exinput==1 | relmiss==0 | name_gen==0 | missing(nifemale) | missing(alter_college) //keep all 795 alters that are old or missing on gender, generator or relation type (should just use exinput to identify old alters, but I am not confident in the data quality, so I check all missing on gender, generator, and relation type)
save "ENSO-oldalters",replace

/*retrive alter demo from pilot data*/

import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\UniqueID  W12345-Focal-20210215", clear first 
drop if time=="ENSO"
keep SUBID TIEID_uniq name 
rename (name TIEID_uniq) (alter_name alterid)

*make names consistent
replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank

*merge with ENSO
merge m:1 SUBID alter_name using "ENSO-oldalters"
keep if _merge==3

*correct names in pilot to be the same as ENSO (identified by merge ENSO section below)
replace alter_name="aly c" if alter_name=="allison c" & SUBID==3477
replace alter_name="chris w" if alter_name=="chris b" & SUBID==3477
replace alter_name="sheryl s" if alter_name=="shirley h" & SUBID==3477
replace alter_name="dr john knoll" if alter_name=="dr john kroll" & SUBID==3537
replace alter_name="sondra m" if alter_name=="sandra m" & SUBID==3568
replace alter_name="tracy a" if alter_name=="traacy a" & SUBID==3568
replace alter_name="larry ad" if alter_name=="larry a d" & SUBID==3738
replace alter_name="stephanie h" if alter_name=="stehanie h" & SUBID==6388
replace alter_name="cynthia b" if alter_name=="cindy b" & SUBID==6404
replace alter_name="dr randy s" if alter_name=="randy s" & SUBID==6418
replace alter_name="mc" if alter_name=="m c" & SUBID==6480
replace alter_name="joyce d" if alter_name=="joice d" & SUBID==6538
replace alter_name="carla s" if alter_name=="crala s" & SUBID==6545
replace alter_name="mary ann f" if alter_name=="mary f" & SUBID==10022
replace alter_name="solomon m" if alter_name=="soloman m" & SUBID==10022
replace alter_name="dr hellman" if alter_name=="dr matt hellman" & SUBID==10023
replace alter_name="roxie t" if alter_name=="ruthie t" & SUBID==10063
replace alter_name="amartllis l" if alter_name=="amaryllis l" & SUBID==10105
replace alter_name="carmen g" if alter_name=="carmen d" & SUBID==10105
replace alter_name="jackie b" if alter_name=="jackie h" & SUBID==10284

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\SNAD-Participant-T1234-CleanB-LONG-20201001",replace

*merge ENSO with pilot
keep SUBID alter_name time imd imr imb hmd hmr hmb rel* tfem tcollege
merge m:1 SUBID alter_name using "ENSO-oldalters.dta"
*this is to identify misspelling between pilot and ENSO
fre SUBID if _merge==2 & SUBID>10338  // 399 ENSO alters with missing demo did not match with pilot

list alter_name _merge if SUBID==3429 & _merge!=3
list alter_name _merge if SUBID==3477 & _merge!=3
list alter_name _merge if SUBID==3537 & _merge!=3
list alter_name _merge if SUBID==3568 & _merge!=3
list alter_name _merge if SUBID==6125 & _merge!=3 
list alter_name _merge if SUBID==6159 & _merge!=3 
list alter_name _merge if SUBID==6377 & _merge!=3 
list alter_name _merge if SUBID==6418 & _merge!=3 
list alter_name _merge if SUBID==6480 & _merge!=3 
list alter_name _merge if SUBID==6502 & _merge!=3 
list alter_name _merge if SUBID==6512 & _merge!=3 
list alter_name _merge if SUBID==6517 & _merge!=3 
list alter_name _merge if SUBID==6530 & _merge!=3 
list alter_name _merge if SUBID==6538 & _merge!=3 
list alter_name _merge if SUBID==6541 & _merge!=3 
list alter_name _merge if SUBID==6564 & _merge!=3 
list alter_name _merge if SUBID==6568 & _merge!=3 
list alter_name _merge if SUBID==6572 & _merge!=3 
list alter_name _merge if SUBID==6574 & _merge!=3 
list alter_name _merge if SUBID==10000 & _merge!=3 
list alter_name _merge if SUBID==10004 & _merge!=3 
list alter_name _merge if SUBID==10018 & _merge!=3 
list alter_name _merge if SUBID==10037 & _merge!=3 
list alter_name _merge if SUBID==10062 & _merge!=3 
list alter_name _merge if SUBID==10063 & _merge!=3 
list alter_name _merge if SUBID==10064 & _merge!=3 
list alter_name _merge if SUBID==10067 & _merge!=3 
list alter_name _merge if SUBID==10125 & _merge!=3 
list alter_name _merge if SUBID==10150 & _merge!=3 
list alter_name _merge if SUBID==10163 & _merge!=3 
list alter_name _merge if SUBID==10194 & _merge!=3 
list alter_name _merge if SUBID==10225 & _merge!=3 
list alter_name _merge if SUBID==10237 & _merge!=3 
list alter_name _merge if SUBID==10276 & _merge!=3 
list alter_name _merge if SUBID==10295 & _merge!=3 
list alter_name _merge if SUBID==10329 & _merge!=3 
list alter_name _merge if SUBID==10332 & _merge!=3 
list alter_name _merge if SUBID==10339 & _merge!=3 
list alter_name _merge if SUBID==10345 & _merge!=3 
list alter_name _merge if SUBID==10346 & _merge!=3 
list alter_name _merge if SUBID==10347 & _merge!=3 
list alter_name _merge if SUBID==10352 & _merge!=3 
list alter_name _merge if SUBID==10353 & _merge!=3 
list alter_name _merge if SUBID==10360 & _merge!=3 
list alter_name _merge if SUBID==10382 & _merge!=3 
list alter_name _merge if SUBID==10405 & _merge!=3 

keep if _merge==3 //drop pilot alters did not match with ENSO old alters
drop _merge
save "ENSO-Participant-alter-retrive-raw",replace

/*retrive generator info*/

use "ENSO-Participant-alter-retrive-raw",clear
replace impmat=imd if name_gen==0
replace impforce=imr if name_gen==0
replace impburdn=imb if name_gen==0
replace hlthcount=hmd if name_gen==0
replace hlthencrg=hmr if name_gen==0
replace hlthburdn=hmb if name_gen==0

*chose one wave of pilot info to keep
egen miss=rowtotal(imp* hlth*)
duplicates tag SUBID alter_name,gen(dup)
drop if dup>0 & miss==0 // drop pilot wave with no info
gsort SUBID alter_name -time //sort time descending, so that first occurence is latest time
duplicates drop SUBID alter_name,force //keep first occurence of duplicates
drop miss dup time imd imr imb hmd hmr hmb rel* tfem nifemale nirel* alter_college //drop variables from pilot, gender, edu, & relation type
save "ENSO-Participant-alter-retrive-generator",replace

/*retrive gender info*/

use "ENSO-Participant-alter-retrive-raw",clear
replace nifemale=tfem if missing(nifemale)

*chose one wave of pilot info to keep
duplicates tag SUBID alter_name,gen(dup)
drop if dup>0 & missing(nifemale) // drop pilot wave with no info
gsort SUBID alter_name -time //sort time descending, so that first occurence is latest time
duplicates drop SUBID alter_name,force //keep first occurence of duplicates
keep nifemale SUBID alter_name //keep the retrived gender data
save "ENSO-Participant-alter-retrive-gender",replace

/*retrive education info*/

use "ENSO-Participant-alter-retrive-raw",clear
replace alter_college=tcollege if missing(alter_college)

*chose one wave of pilot info to keep
duplicates tag SUBID alter_name,gen(dup)
drop if dup>0 & missing(alter_college) // drop pilot wave with no info
gsort SUBID alter_name -time //sort time descending, so that first occurence is latest time
duplicates drop SUBID alter_name,force //keep first occurence of duplicates
keep alter_college SUBID alter_name //keep the retrived gender data
save "ENSO-Participant-alter-retrive-edu",replace

/*retrive relation type info*/

use "ENSO-Participant-alter-retrive-raw",clear
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

*chose one wave of pilot info to keep
egen miss=rowtotal(nirel*)
duplicates tag SUBID alter_name,gen(dup)
drop if dup>0 & miss==0 // drop pilot wave with no info
gsort SUBID alter_name -time //sort time descending, so that first occurence is latest time
duplicates drop SUBID alter_name,force //keep first occurence of duplicates
keep nirel* SUBID alter_name //keep the retrived relation type data
save "ENSO-Participant-alter-retrive-reltype",replace


*merge all retrived data 
merge 1:1 SUBID alter_name using "ENSO-Participant-alter-retrive-gender",nogen
merge 1:1 SUBID alter_name using "ENSO-Participant-alter-retrive-generator",nogen
merge 1:1 SUBID alter_name using "ENSO-Participant-alter-retrive-edu",nogen
duplicates list SUBID alter_name //no duplicate


*append retrived data with ENSO
append using "ENSO-Participant-alter-LONG.dta"  
duplicates drop SUBID alter_name,force //drop duplicates from using data





************************************************************
// 6. clean the variable names across 5 ENSO waves
******************************************************


*this is not necessary if pilot data is not used
egen pilot=rowtotal(hlthburdn hlthcount hlthencrg impburdn impforce impmat),mi
drop if pilot==0 | missing(pilot) //drop names that are not in health and important matter to be consistent with Pilot data 

*******clean name interpretors 
bysort SUBID: egen netsize=count(alter_name)
lab var netsize "Total number of alters mentioned" 

bysort SUBID: egen pcollege=mean(alter_college)
lab var pcollege "Proportion college in network"

destring nirace5 niage,replace force
foreach x of varlist nirace niage {
	egen `x'new=rowmean(`x' `x'2 `x'3 `x'4 `x'5)
	drop `x' `x'2 `x'3 `x'4 `x'5
	rename `x'new `x'
}
rename (nirace niage) (alter_race alter_age)
bysort SUBID: egen mage=mean(alter_age)
lab var mage "Mean age in network"

label define alter_race 1 "Asian" 2 "African American" 3 "White" 4 "Other"
label values alter_race alter_race
recode alter_race (1 2 4=0) (3=1),gen(white)
bysort SUBID: egen pwhite=mean(white)
lab var pwhite "Proportion White in network"


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
save "ENSO-Participant-alter-LONG-pilot-clean.dta", replace 
*save "ENSO-Participant-alter-LONG-clean.dta", replace 

duplicates drop SUBID, force
keep SUBID date_snad netsize-ENSO
drop tfem tkin tclose tfreq thassles numsup white alter_race alter_age //drop alter level variables
save "ENSO-Participant-alter-EGOAGG-pilot-clean.dta", replace 
*save "ENSO-Participant-alter-EGOAGG-clean.dta", replace 
