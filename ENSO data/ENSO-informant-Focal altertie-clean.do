****Author:  Siyun Peng
****Date:    2022/01/19
****Version: 17
****Purpose: clean FOCAL's alter tie data for ENSO-INFORMANT

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home



***************************************************************
**# 1 Check issues in alter-alter ties (A-B and B-A are both in the file! But this does not affect calculation of density)
***************************************************************



multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\ENSO Informant") clear import(stringcols(_all)) force //import multiple csv in a folder (ssc install multimport)
replace respondent_name =subinstr(respondent_name, "a", "",.) //remove a
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs

*make names consistent
foreach i of varlist alter_a_name alter_b_name {
replace `i' =strtrim(`i') //remove leading and trailing blanks
replace `i' =subinstr(`i', ".", "",.) //remove .
replace `i' =strlower(`i') //change to lower case
replace `i' =stritrim(`i') //consecutive blanks collapsed to one blank
}

*drop informant alter tie
destring *tie*,replace
egen nomiss_f=rownonmiss(ftie*)
egen nomiss_i=rownonmiss(stie*)
keep if nomiss_f!=0 //keep focal alter ties
drop stie* nomiss* //drop informant variables

*duplicates within each wave
duplicates report SUBID alter_a_name alter_b_name _filename //no duplicate 

*******check duplicate cases across waves  

*remove place holders (e.g., T2 alters that are from previous waves are in ENSO T1 too, although they are not interviewed in T1 by ENSO)
duplicates list SUBID alter_a_name alter_b_name //no duplicate 

*******check weird alter names across waves  
drop if alter_a_name=="99" | missing(alter_a_name) 
drop if alter_b_name=="99" | missing(alter_b_name) 

*******check weird pattern in tievalue & replace as missing
egen new_tievalue=rowtotal(ftievalue*),mi
drop ftievalue* ftieweight* 
rename new_tievalue tievalue
fre tievalue
label define alterclose 0 "Dont know each other" 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values tievalue alterclose
bysort SUBID: egen tievalue_min=min(tievalue)
bysort SUBID: egen tievalue_max=max(tievalue)
bysort SUBID: gen issue=1 if tievalue_min==tievalue_max & !missing(tievalue_min, tievalue_max)
egen pickone=tag(SUBID) if issue==1
fre SUBID if pickone==1 //17 SUBIDs have issues! (missing data is better than wrong data)

*for me to handcheck with other waves from other softwares
preserve
bysort SUBID: egen tot=max(_n)
keep if issue==1 & pickone==1
keep SUBID tievalue tot
export excel "Informant-focal alter-tie-issue",replace 
restore
replace tievalue=. if issue==1 //code tievalue for 17 SUBIDs as missing


sort issue SUBID
order SUBID tievalue tievalue_min tievalue_max issue
save "ENSO-informant-focal altertie-long.dta",replace



***************************************************************
**# 2 Clean alter-alter ties full data (A-B and B-A are both in the file! But this does not affect calculation of density)
***************************************************************



bysort SUBID: egen npossties=count(tievalue)

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

recode b1density (1=0) (.=.) (else=1),gen(sole) 
lab var sole "Sole bridge status"

save "ENSO-informant-focal altertie-long-clean.dta", replace
replace totnum1=totnum1/2 //it is double counting, so need to divide by 2
keep SUBID *density sole totnum1
duplicates drop SUBID, force
save "ENSO-informant-focal altertie-EGOAGG-clean.dta", replace

**start here

***************************************************************
**# 3 Clean alter-alter ties pilot data (A-B and B-A are both in the file! But this does not affect calculation of density)
***************************************************************



*prepare alter data with pilot generator
use "ENSO-participant-alter-LONG-pilot-clean.dta",clear
rename alter_name alter_a_name
keep SUBID alter_a_name
save "ENSO-participant-alter-LONG-pilot-match-altertie",replace

*prepare alter tie data to merge
use "ENSO-participant-altertie-long.dta",clear
*make names consistent
foreach x of varlist alter_a_name alter_b_name {
    replace `x' =strtrim(`x') //remove leading and trailing blanks
    replace `x' =subinstr(`x', ".", "",.) //remove .
    replace `x' =strlower(`x') //change to lower case
    replace `x' =stritrim(`x') //consecutive blanks collapsed to one blank
}

merge m:1 SUBID alter_a_name using "ENSO-Participant-alter-LONG-pilot-match-altertie"
fre SUBID if _merge==2 //6388 not in alter tie data
keep if _merge==3 //keep alters in alter_a_name that are  important or health matters 
drop alter_a_name _merge
rename alter_b_name alter_a_name

merge m:1 SUBID alter_a_name using "ENSO-Participant-alter-LONG-pilot-match-altertie"
fre SUBID if _merge==2 //6388 + 4 SUBID with netsize=1
keep if _merge==3 //keep alters in alter_b_name that are important or health matters 

bysort SUBID: egen npossties=count(tievalue)

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

recode b1density (1=0) (.=.) (else=1),gen(sole) 
lab var sole "Sole bridge status"

save "ENSO-participant-altertie-long-pilot-clean.dta", replace
replace totnum1=totnum1/2 //it is double counting, so need to divide by 2
keep SUBID *density sole totnum1
duplicates drop SUBID, force
save "ENSO-participant-altertie-EGOAGG-pilot-clean.dta", replace

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code" //reset directory for rule-all do file