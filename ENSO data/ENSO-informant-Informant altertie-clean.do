****Author:  Siyun Peng
****Date:    2022/01/19
****Version: 17
****Purpose: clean INFORMANT's alter tie data for ENSO-INFORMANT

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
keep if nomiss_i!=0 //keep informant alter ties
drop ftie* nomiss* //drop focal variables

*duplicates within each wave
duplicates report SUBID alter_a_name alter_b_name _filename //no duplicate 

*******check duplicate cases across waves  

*remove place holders (e.g., T2 alters that are from previous waves are in ENSO T1 too, although they are not interviewed in T1 by ENSO)
duplicates list SUBID alter_a_name alter_b_name //no duplicate 

*******check weird alter names across waves  
drop if alter_a_name=="99" | missing(alter_a_name) 
drop if alter_b_name=="99" | missing(alter_b_name) 

*******check weird pattern in tievalue & replace as missing
egen new_tievalue=rowtotal(stievalue*),mi
drop stievalue* stieweight* 
rename new_tievalue tievalue
fre tievalue
label define alterclose 0 "Dont know each other" 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values tievalue alterclose
bysort SUBID: egen tievalue_min=min(tievalue)
bysort SUBID: egen tievalue_max=max(tievalue)
bysort SUBID: gen issue=1 if tievalue_min==tievalue_max & !missing(tievalue_min, tievalue_max)
egen pickone=tag(SUBID) if issue==1
fre SUBID if pickone==1 //8 SUBIDs have issues! (missing data is better than wrong data)

*handcheck with other waves from other softwares
preserve
bysort SUBID: egen tot=max(_n)
keep if issue==1 & pickone==1
keep SUBID tievalue tot
export excel "Informant-informant alter-tie-issue",replace 
restore
replace tievalue=. if issue==1 //code tievalue for 8 SUBIDs as missing


sort issue SUBID
order SUBID tievalue tievalue_min tievalue_max issue
save "ENSO-informant-informant altertie-long.dta",replace



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

save "ENSO-informant-informant altertie-long-clean.dta", replace
replace totnum1=totnum1/2 //it is double counting, so need to divide by 2
keep SUBID *density sole totnum1
duplicates drop SUBID, force
save "ENSO-informant-informant altertie-EGOAGG-clean.dta", replace


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code" //reset directory for rule-all do file