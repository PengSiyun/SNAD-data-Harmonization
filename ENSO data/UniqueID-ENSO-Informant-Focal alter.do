****Author:  Siyun Peng
****Date:    2021/03/23
****Version: 16
****Purpose: UniqueID-ENSO-informant reports of Focal alter

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

***************************************************************
//	#1 Clean ENSO Informant focal alter network data 
***************************************************************
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\ENSO-Informant-Focal alter-LONG.dta",replace

gen ENSO=1
gen time="ENSO"
rename (created_on alter_name) (date_snad name_i)
replace date_snad=substr(date_snad, 1, 10) //only keep YMD
replace date_snad= subinstr(date_snad, "-", "", .) //drop -
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY
keep frel* date_snad SUBID TIEID name ENSO time
rename (date_snad) (date_snad_i)  
save "UniqueID-ENSO-Informant-Focal-LONG.dta", replace

*append with pilot data

rename (frelpart frelprnt frelsib frelchld frelgprnt frelgchld frelantun frelinlaw frelother frelcowrk frelnghbr frelfrnd frelemplr frelemple frelstdnt frellwyr freldoc frelothrmd frelthrpy frelrabbi frelchrch frelclub frelactvt) ///
       (relpartner_i relparent_i relsibling_i relchild_i relgrandp_i relgrandc_i relauntunc_i relinlaw_i relothrel_i relcowork_i relneigh_i relfriend_i relboss_i relemploy_i relschool_i rellawyer_i reldoctor_i relothmed_i relmental_i relrelig_i relchurch_i relclub_i relleisure_i)
keep SUBID TIEID name_i date_snad_i rel* time 

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
append using "SNAD-Partner-T1-Clean-LONG-20200827.dta", ///
keep(SUBID TIEID name_i date_snad rel*) gen(redcap_t1)
append using "SNAD-Partner-T2-Clean-LONG-20200827.dta", ///
keep(SUBID TIEID name_i date_snad rel*) gen(redcap_t2)
append using "SNAD-Partner-T3-Clean-LONG.dta", ///
keep(SUBID TIEID name_i date_snad rel*) gen(redcap_t3)
append using "SNAD-Partner-T4-Clean-LONG.dta", ///
keep(SUBID TIEID name_i date_snad rel*) gen(redcap_t4) 
replace time="1" if redcap_t1==1
replace time="2" if redcap_t2==1
replace time="3" if redcap_t3==1
replace time="4" if redcap_t4==1
drop if missing(name_i)
drop redcap*
replace name_i =strtrim(name_i) //remove leading and trailing blanks
replace name_i =subinstr(name_i, ".", "",.) //remove .
replace name_i =strlower(name_i) //change to lower case
replace name_i =stritrim(name_i) //consecutive blanks collapsed to one blank
sort SUBID name_i time
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\Alter names W12345-duplicate names-Informant-Focal alter.dta",replace
duplicates drop SUBID name_i,force
/*Use old corrected file to fill in uniqueID and duplicate
merge 1:1 SUBID name_i using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Alter names W12345-Informant-corrected-old", keepusing(SUBID name_i duplicate TIEID_uniq_i)
drop if _merge==2
recode duplicate (.=0) (1/10=1)
*/
gen duplicate=0
bysort SUBID: gen TIEID_uniq_i=_n
order SUBID TIEID_uniq_i duplicate name_i time date_snad_i rel* TIEID
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Alter names W12345-Informant-Focal alter.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")

************merge uniqueID file with duplicate names file******************
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Alter names W12345-Informant-Focal alter-corrected.xlsx",firstrow clear
keep SUBID name_i TIEID_uniq_i duplicate
merge 1:m SUBID name_i using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\Alter names W12345-duplicate names-Informant-Focal alter.dta" 
label var duplicate "Differenct names for the same person"
sort SUBID time name_i //easier to figure out alters of latest wave for interviewers
tostring SUBID,replace
replace SUBID=SUBID+"a"
order SUBID TIEID_uniq_i duplicate name_i time date_snad_i rel* 
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Focal alter.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")

