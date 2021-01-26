****Priject: SNAD
****Author:  Siyun Peng
****Date:    2020/10/01
****Version: 16
****Purpose: Unique ID for all alters


***************************************************************
//	#1 SNAD participant T1, T2, T3, T4+ ENSO
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "ENSO-Participant-T1-Clean-LONG.dta", replace
rename (NIRELPART NIRELPRNT NIRELSIB NIRELCHLD NIRELGPRNT NIRELGCHLD NIRELANTUN NIRELINLAW NIRELOTHER NIRELCOWRK NIRELNGHBR NIRELFRND NIRELEMPLR NIRELEMPLE NIRELSTDNT NIRELLWYR NIRELDOC NIRELOTHMD NIRELTHRPY NIRELRABBI NIRELCHRCH NIRELCLUB NIRELACTVT) ///
       (relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure)
keep SUBID TIEID name date_snad rel*
append using "SNAD-Participant-T1-CleanB-LONG-120419.dta", ///
keep(SUBID TIEID name date_snad rel*) 
gen time=1
replace time==2 if SUBID==10216 | SUBID==10259 //those two ENSO cases were interviewed by pilot grant (see SNAD-Participant clean.do line 3887-3891 for details)
append using "SNAD-Participant-T2-CleanB-LONG-062519.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t2)
append using "SNAD-Participant-T3-CleanB-LONG-062519.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t3)
append using "SNAD-Participant-T4-CleanB-LONG-092520.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t4) 
replace time=2 if redcap_t2==1
replace time=3 if redcap_t3==1
replace time=4 if redcap_t4==1
drop if missing(name)
drop redcap*
replace name =strtrim(name) //remove leading and trailing blanks
replace name =subinstr(name, ".", "",.) //remove .
replace name =strlower(name) //change to lower case
replace name =stritrim(name) //consecutive blanks collapsed to one blank
sort SUBID name time
order SUBID name time date_snad rel* TIEID
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Alter names W1234-duplicate names.dta",replace

duplicates drop SUBID name,force
gen duplicate=0
bysort SUBID: gen TIEID_uniq=_n
order SUBID TIEID_uniq duplicate name time date_snad rel* TIEID
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Alter names W1234.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")


************merge uniqueID file with duplicate names file******************
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Corrected Alter names W1234.xlsx",firstrow clear
keep SUBID TIEID_uniq duplicate name
merge 1:m SUBID name using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Alter names W1234-duplicate names.dta" 
*import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\clean-Alter names W1234.xlsx",firstrow clear //to modify the clean file
sort SUBID time TIEID_uniq name
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\clean-Alter names W1234.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")


***************************************************************
//	#2 SNAD Informants T1, T2, T3, T4+ ENSO
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
/*
use "ENSO-Partner-T1-Clean-LONG.dta", replace
rename (NIRELPART NIRELPRNT NIRELSIB NIRELCHLD NIRELGPRNT NIRELGCHLD NIRELANTUN NIRELINLAW NIRELOTHER NIRELCOWRK NIRELNGHBR NIRELFRND NIRELEMPLR NIRELEMPLE NIRELSTDNT NIRELLWYR NIRELDOC NIRELOTHMD NIRELTHRPY NIRELRABBI NIRELCHRCH NIRELCLUB NIRELACTVT) ///
       (relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure)
keep SUBID TIEID name date_snad rel*
*/
use "SNAD-Partner-T1-Clean-LONG-20200827.dta", replace
keep SUBID TIEID name date_snad rel*
gen time=1
replace time==2 if SUBID==10216 | SUBID==10259 //those two ENSO cases were interviewed by pilot grant (see SNAD-Participant clean.do line 3887-3891 for details)

append using "SNAD-Partner-T2-Clean-LONG-20200827.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t2)
append using "SNAD-Partner-T3-Clean-LONG.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t3)
append using "SNAD-Partner-T4-Clean-LONG.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t4) 
replace time=2 if redcap_t2==1
replace time=3 if redcap_t3==1
replace time=4 if redcap_t4==1
drop if missing(name)
drop redcap*
replace name =strtrim(name) //remove leading and trailing blanks
replace name =subinstr(name, ".", "",.) //remove .
replace name =strlower(name) //change to lower case
replace name =stritrim(name) //consecutive blanks collapsed to one blank
sort SUBID name time
order SUBID name time date_snad rel* TIEID
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Alter names W1234-duplicate names-Informant.xlsx",firstrow(variables) sheet("sheet1") replace missing(".") nolabel
duplicates drop SUBID name,force
gen duplicate=0
bysort SUBID: gen TIEID_uniq_i=_n
order SUBID TIEID_uniq_i duplicate name time date_snad rel* TIEID

export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Alter names W1234-Informant.xlsx",firstrow(variables) sheet("sheet1") replace missing(".") nolabel



************merge uniqueID file with duplicate names file******************
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Corrected Alter names W1234-Informant.xlsx",firstrow clear
keep SUBID TIEID_uniq duplicate name
merge 1:m SUBID name using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\Alter names W1234-duplicate names-Informant.dta" 
sort SUBID time TIEID_uniq name 
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\clean-Alter names W1234-Informant.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")


