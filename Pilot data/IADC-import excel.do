****Priject: SNAD
****Author:  Brea L. Perry, Siyun Peng
****Date:    2020/08/19
****Version: 16
****Purpose: label and create variables for IADC

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data" //home
set more off

*Cross variables

import excel "IADC_SNAD_25AUG2020.xlsx", sheet("Cross_sectional_Data") firstrow clear

save "IADC-Cross-082520.dta", replace

lab var subid "Subject Identifier"
lab var sex "Gender"
lab var race "Race"
lab var hispanic "Reports Hispanic ethnicity"
lab var birthyr "Year of birth"
lab var birthmnth "Month of birth"
lab var status "Subject status"
lab var grade "Number of grades completed"
lab var hascaregiver "Does subject have a caregiver?"
lab var enrolldate "First visit as IADC participant"
lab var death "Deceased"
lab var deathmnth "Month of death"
lab var deathyr "Year of death"
lab var PRESTAT "Presumed disease status at enrollment"
lab var PRIMLANG "Primary language"
lab var LIVSITUA "Living situation at enrollment"
lab var INDEPEND "Independence level at enrollment"
lab var RESIDENC "Residence type at enrollment"
lab var MARISTAT "Marital status at enrollment"
lab var sibs "Number of siblings"
lab var kids "Number of children"
lab var lastvisit "Most recent IADC visit"
lab var lastdiagx "Most recent diagnosis"
lab var lastsubtype "Most recent subtype"
lab var syndrome "UDS Version 3.0 Diagnostic Syndrome"
lab var contribute "Other conditions contributing to diagnosis of cognitive issues"
lab var normcond "If normal cognition, other conditions present"
lab var APOEGenotype "APOE genotype - E4 related to AZ"

rename subid SUBID

replace sex="1" if sex=="F"
replace sex="2" if sex=="M"
destring sex, replace

lab def sex 1 "Female" 2 "Male"
lab val sex sex

lab def race 1 "White" 2 "Black" 5 "Asian" 50 "Other"
lab val race race

replace hascaregiver="1" if hascaregiver=="Y"
replace hascaregiver="0" if hascaregiver=="N"
destring hascaregiver, replace

lab def prestat 1 "Case/patient/proband" 2 "Control/normal" 3 "No presumed status"
lab val PRESTAT prestat

lab def primlang 1 "English" 2 "Spanish"
lab val PRIMLANG primlang

lab def livsit 1 "Lives alone" 2 "Lives with partner/spouse" 3 "Lives with relative/friend" 5 "Lives with group" 6 "Other"
lab val LIVSITUA livsit

lab def indep 1 "Able to live independently" 2 "Requires assistance with complex activities" 3 "Requires assistance with basic activities" 4 "Completely dependent" 9 "Unknown"
lab val INDEPEND indep

lab def resid 1 "Single family residence" 2 "Retirement community" 3 "Assisted living" 4 "Skilled nursing facility" 5 "Other" 9 "Unknown"
lab val RESIDENC resid

lab def mar 1 "Married" 2 "Widowed" 3 "Divorced" 4 "Separated" 5 "Never married" 6 "Living as married"
lab val MARISTAT mar

replace lastdiagx="1" if lastdiagx=="Amnestic MCI-memory impairment" | lastdiagx=="MCI"
replace lastdiagx="2" if lastdiagx=="Amnestic MCI-memory impairment Plus one or more domains"
replace lastdiagx="3" if lastdiagx=="Dementia"
replace lastdiagx="4" if lastdiagx=="Impaired, not MCI"
replace lastdiagx="5" if lastdiagx=="Non-amnestic MCI-multiple domains"
replace lastdiagx="6" if lastdiagx=="Normal"
replace lastdiagx="7" if lastdiagx=="Non-amnestic MCI-single domain"
replace lastdiagx="" if lastdiagx=="Missing"

destring lastdiagx, replace

lab def lastd 1 "Amnestic MCI-memory impairment" 2 "Amnesiastic MCI-memory impairment plus 1+ domains" 3 "Dementia" 4 "Impaired, not MCI" 5 "Non-amnestic MCI-multiple domains" 6 "Normal" 7 "Non-amnestic MCI-single domain"
lab val lastdiagx lastd

recode APOEGenotype (22=1)(23=2)(24=3)(33=4)(34=5)(44=6)

lab def apoe 1 "E2/E2" 2 "E2/E3" 3 "E2/E4" 4 "E3/E3" 5 "E3/E4" 6 "E4/E4"
lab val APOEGenotype apoe


save "IADC-Cross-CleanA-082520.dta", replace

*Longitudinal variables
import excel "IADC_SNAD_25AUG2020.xlsx", sheet("Longitudinal Data") firstrow clear
save "IADC-Long-082520.dta", replace

*label variables
import excel "IADC_SNAD_25AUG2020.xlsx", ///
sheet("Longitudinal_Variables") firstrow case(lower) clear //read file with value labels 
keep name label 
replace label=subinstr(label, char(34), "", .) //remove quotation from string variable (label cannot handle quotation marks)

append using "IADC-Long-082520.dta",gen(varlabel) //append label info into long data
fre varlabel //368 variable labels
forvalues i = 1/368 {
    la var `=name[`i']' "`=label[`i']'" //label line 1 of name with line 1 of label
}
drop if varlabel==0 //drop cases only contain variable names and labels
drop name label varlabel 

rename subid SUBID

lab def progr 1 "From N to MCI" 2 "From MCI to D"
lab val progression progr

lab def mem 0 "No" 1 "Yes, but this does not worry me" 2 "Yes, and this worries me"
lab val memwors mem
lab val memory_inf mem

lab def cci 0 "Normal" 1 "Has difficulty, but does by self" 2 "Requires assistance" 3 "Dependent" 8 "N/A" 9 "Unknown"
lab val BILLS-TRAVEL cci

lab def inform 1 "Spouse" 2 "Child" 3 "Other"
lab val NPIQINF inform

lab def sev 1 "Mild" 2 "Moderate" 3 "Severe"
lab val DELSEV HALLSEV AGITSEV DEPDSEV ANXSEV ELATSEV APASEV DISNSEV IRRSEV MOTSEV NITESEV APPSEV sev

lab def alcfreq 0 "< once a month" 1 "About once a month" 2 "About once a week" 3 "A few times a week" 4 "Daily or almost daily"
lab val ALCFREQ alcfreq
 
lab def tbi 0 "Absent" 1 "Recent/active" 2 "Remote/inactive" 9 "Unknown"
lab val TBI tbi

lab def packs 1 "1 cig to < 1/2 pack" 2 "1/2 to 1 pack" 3 "1 to 1 1/2 packs" 4 "1 1/2 to < 2 packs" 5 "2 packs or more" 8 "N/A" 9 "Unknown"
lab val PACKSPER packs

lab val ALCOHOL-PSYCDIS tbi

save "IADC-Long-CleanA-082520.dta", replace

*Imaging data
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
import excel "IADC-Neuroimaging-041320.xlsx", sheet("SNAD subject list") clear //firstrow is not used due to some var names in excel do not conform to var names format in stata (e.g., too long or start with a number).

*due to long names in excels and truncate of variable name to 32 characters is needed
foreach v of varlist A-S {
	local newname = strtoname(`v'[1]) //truncate a name to 32 bytes using names saved in row 1
	rename `v' `newname'
}
foreach v of varlist T-MC {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't1 //add wave indicators 
}
foreach v of varlist MD-YM {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't2 //add wave indicators 
}
foreach v of varlist YN-AKW {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't3 //add wave indicators 
}
foreach v of varlist AKX-AXG {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't4 //add wave indicators 
}
foreach v of varlist AXH-BJQ {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't5 //add wave indicators 
}
foreach v of varlist BJR-BWA {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't6 //add wave indicators 
}
foreach v of varlist BWB-CIK {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't7 //add wave indicators 
}
foreach v of varlist CIL-CUU {
	local newname = strtoname(`v'[1])
	rename `v' `newname'
	local wave = substr("`newname'", 1, length("`newname'")-2) //remove last 2 characters
	rename `newname' `wave't8 //add wave indicators 
}
rename CCID SUBID

unab vars: ScanID_t1-cdrsb_t1 //puts the result in a local macro
local stubs : subinstr local vars "t1" "t", all //each occurrence of "t1" is replaced by t
reshape long `stubs', i(SUBID) j(ImageWave) 

labone,nrow(2817) //load labels
drop if _n>2808 //drop rows/cases of labels and names
gen scanwave=substr(ScanID_t, -1, .)
destring scanwave,replace
gen diff=scanwave-ImageWave
list SUBID scanwave ImageWave if diff!=0 & !missing(diff) //list inconsistance between imagewave and scanwave found in Shannon's data (use this info to fix imagewave in line 239)
drop diff scanwave
save "Neuroimaging-CleanA-041320.dta", replace

/*fill missing/weird data in Amyloid ScanDate*/ 
import excel "Amy date Information for Neuroimaging-041320.xlsx", clear firstrow 
rename (IADCClinicalCoreID AmyloidScanDate LinkidCFNID_VisitNumber) (SUBID date_amy ScanID_t)
keep SUBID date_amy ScanID_t
drop if missing(date_amy)
/*14 people with weird SUBID, I leave it in the data rather than drop/fix it. Because they are not interviewed by SNAD or IADC clincical core 
replace SUBID= "a"+SUBID //add a to SUBID, so it has at least 5 characters
replace SUBID=substr(SUBID, -5, .)
replace SUBID= subinstr(SUBID, "a", "", .) //drop a
*/
*retrive imagewave
gen scanwave=substr(ScanID_t, -1, .)
*fix inconsistance between imagewave and scanwave found in Shannon's data (line 219)
destring scanwave,replace 
gen ImageWave=scanwave
replace ImageWave=4 if scanwave==1 & SUBID=="3429" 
replace ImageWave=5 if scanwave==2 & SUBID=="3429" 
replace ImageWave=4 if scanwave==1 & SUBID=="3537" 
replace ImageWave=4 if scanwave==1 & SUBID=="3677" 
replace ImageWave=5 if scanwave==2 & SUBID=="3677" 
replace ImageWave=2 if scanwave==1 & SUBID=="3810" 
replace ImageWave=3 if scanwave==2 & SUBID=="3810"
replace ImageWave=4 if scanwave==3 & SUBID=="3810" 
replace ImageWave=5 if scanwave==4 & SUBID=="3810" 
replace ImageWave=6 if scanwave==5 & SUBID=="3810" 
replace ImageWave=7 if scanwave==6 & SUBID=="3810" 
replace ImageWave=8 if scanwave==1 & SUBID=="3810" 
replace ImageWave=4 if scanwave==1 & SUBID=="6176" 
replace ImageWave=4 if scanwave==1 & SUBID=="6216" 
replace ImageWave=3 if scanwave==1 & SUBID=="6340" 
replace ImageWave=4 if scanwave==1 & SUBID=="6530"
replace ImageWave=2 if scanwave==1 & SUBID=="6572" 
duplicates list ImageWave SUBID
list if SUBID=="3810"
replace ImageWave=8 if inrange(date_amy, td(30jan2019), td(11dec2019)) & SUBID=="3810" //inrange specify date range
drop scanwave ScanID_t
*merge by code
merge 1:1 SUBID ImageWave using "Neuroimaging-CleanA-041320.dta"
drop if _merge==1 //drop people only have date info 
drop _merge
drop AmyDate_t //drop the messed up amydate from Shannon's data
save "Neuroimaging-CleanA-041320.dta", replace
