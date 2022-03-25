****Author:  Siyun Peng
****Date:    2022/01/14
****Version: 17
****Purpose: clean ego data for ENSO INFORMANT

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home





************************************************************
// 1. clean ego to match with alter level (goal: get a list of people completed ego interview)
************************************************************


multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\ENSO Informant\Ego") clear force import(stringcols(_all)) //import multiple csv in a folder (ssc install multimport)
replace respondent_name =subinstr(respondent_name, "a", "",.) //remove a
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs
replace SUBID=10288 if SUBID==10228 //typo
drop if SUBID==10039 | SUBID==10216 //imcomplete interview 

*drop duplicates
duplicates drop SUBID,force
keep SUBID 
save "ENSO-informant-ego-interview",replace




************************************************************
**# 2. retrive ego demo info for baseline ENSO interview (not collected for other wave)
************************************************************
*Race is not collected, data is not reliable



import delimited "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\ENSO Informant\Ego\bl_ego_export_19-1_2021-02-26T10 35 42.492407-05 00.csv", clear
replace respondent_name =subinstr(respondent_name, "a", "",.) //remove a
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs
egen nomiss=rownonmiss(spgender-weekdays), strok
drop if nomiss==0 //drop case with all missing values
replace SUBID=10288 if SUBID==10228 //typo

*label clean
rename spgender sex_enso
label define sex_enso 1 "Male" 2 "Female"
label values sex_enso sex_enso

replace speducat =subinstr(speducat, `"""' , "",.) //remove "
destring speducat,replace  
label define speducat 1 "Less than high school" 2 "High school" 3 "Some college (no degree)" 4 "College degree" 5 "Advanced degree"
label values speducat speducat

replace spmarstat =subinstr(spmarstat, `"""' , "",.) //remove "
destring spmarstat,replace  
recode spmarstat (1 4 5 6=0) (2 3=1),gen(married_enso)
lab def married 0 "Not married" 1 "Married" 
lab val married_enso married
drop spmarstat

recode spveteran (2=0) (1=1)
lab def spveteran 1 "yes" 0 "no"
lab val spveteran spveteran

destring spempstat,replace  
lab def spempstat 1 "Working full time" 2 "Working part time" 3 "Unemployed and looking for work" 4 "Unemployed and not looking for work" 5 "Retired" 6 "Disabled" 7 "Homemaker" 8 "Student"
lab val spempstat spempstat

lab var spemphrs "Hours of work"

rename sp* *_enso

foreach x of varlist emphrs_enso othchild_enso {
	replace `x' = "0" if `x' == "None"
    destring `x',replace
}

*check duplicates
duplicates list SUBID //6377, 10327

*manually check and drop duplicates within each wave
sort SUBID
order SUBID sex married educat_enso interview_id
drop if SUBID==6377 & interview_id==585
drop if SUBID==10327 & interview_id==230
duplicates report SUBID //no duplicates
keep SUBID *_enso //keep demo info only
save "ENSO-informant-ego-clean",replace


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code" //reset directory for rule-all do file