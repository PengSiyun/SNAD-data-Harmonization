****Author:  Siyun Peng
****Date:    2022/01/19
****Version: 17
****Purpose: clean Informant's report of Focal alter data for ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

/*Things to fix later: 
1. Alter age, race, hispanic, edu are skipped for old alters, but pilot data did not collect those
3. SUBID=10216,10259 are in pilot T1 and ENSO T1

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
drop 


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



************************************************************
**# 3 make relation type variables consistent accross waves
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


