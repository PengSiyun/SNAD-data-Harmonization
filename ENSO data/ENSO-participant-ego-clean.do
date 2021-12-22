****Author:  Siyun Peng
****Date:    2021/02/14
****Version: 16
****Purpose: clean ego data for ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

*Race is not collected, data is not reliable
************************************************************
// 1. retrive ego info for baseline ENSO interview (not collected for other wave)
************************************************************
import delimited "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\ENSO Focal\Ego\focal_bl_ego_export_17-1_2021-01-14T10 05 01.920140-05 00.csv", clear
destring respondent_name,force gen(SUBID) 
drop if missing(SUBID) | SUBID==445566 //drop all test runs
replace SUBID=10400 if SUBID==1400
drop if SUBID==10339 //ENSO interviewer thought 10039 is a misspelling of 10339 in ENSO, thus leave incomplete data for 10339 and restart interview for 10039
replace SUBID=10339 if SUBID==10039 //actually 10039 is the wrong number, it should be 10339

*label clean
rename fsgender sex_enso
label define sex_enso 1 "Male" 2 "Female"
label values sex_enso sex_enso

label define fseducat 1 "Less than high school" 2 "High school" 3 "Some college (no degree)" 4 "College degree" 5 "Advanced degree"
label values fseducat fseducat

recode fsmarstat (1 4 5 6=0) (2 3=1),gen(married_enso)
lab def married 0 "Not married" 1 "Married" 
lab val married_enso married
drop fsmarstat

recode fsveteran (2=0) (1=1)
lab def fsveteran 1 "yes" 0 "no"
lab val fsveteran fsveteran

lab def fsempstat 1 "Working full time" 2 "Working part time" 3 "Unemployed and looking for work" 4 "Unemployed and not looking for work" 5 "Retired" 6 "Disabled" 7 "Homemaker" 8 "Student"
lab val fsempstat fsempstat

lab var fsemphrs "Hours of work"

rename fs* *_enso

foreach x of varlist emphrs_enso othchild_enso {
	replace `x' = "0" if `x' == "None"
    destring `x',replace
}

*check duplicates
duplicates list SUBID //6377, 6574, 10067, 10127, 10163, 10216, 10239, 10262, 10327, 10332, 10339, 10360: 12 duplicates

*manually check and drop duplicates within each wave
sort SUBID
order SUBID sex married educat_enso interview_id
drop if SUBID==6377 & interview_id==703
drop if SUBID==6574 & interview_id==200
drop if SUBID==10067 //All missing
drop if SUBID==10127 //All missing
drop if SUBID==10163 & interview_id==632
drop if SUBID==10216 & interview_id==462
drop if SUBID==10239 & interview_id==633
drop if SUBID==10262 & interview_id==446
drop if SUBID==10327 & interview_id==231 //different edu from IADRC
drop if SUBID==10332 & interview_id==706 //different edu from IADRC
drop if SUBID==10339 & interview_id==708 
drop if SUBID==10360 & interview_id==710 
duplicates report SUBID //no duplicates
keep SUBID *_enso //keep demo info only
save "ENSO-Participant-ego-clean",replace


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code" //reset directory for rule-all do file