****Priject: SNAD
****Author:  Siyun Peng
****Date:    2022/02/22
****Version: 17
****Purpose: label and create variables for IADC

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean" //home
set more off




***************************************************************
**#1 Neuroimaging data
***************************************************************




import excel "IADC-Neuroimaging_10202021.xlsx", sheet("data") firstrow case(lower)clear
labone,nrow(1) //load labels
drop if _n==1 //drop row of labels


*destring date 
rename (dateofmriscan cc_visitdate taudate amydate) (date_mri date_visit date_tau date_amy)
foreach x of varlist date_mri date_visit date_tau date_amy {
	gen `x'_new = date(`x', "MDY"),after(`x') //for 10/20/2014
	drop `x'
	rename `x'_new `x'
	format `x' %td //convert number to DMY format 
}


*label values 
destring ccid,replace
rename ccid SUBID

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean\Neuroimaging-CleanA.dta", replace





***************************************************************
**#2 Clinical data - Cross-sectional variables
***************************************************************






import excel "IADC_clinical_10NOV2021.xlsx", sheet("Cross_sectional_Data") firstrow clear


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
rename sex female
recode female (2=0)
lab var female "Female"

lab def race 1 "White" 2 "Black" 5 "Asian" 50 "Other"
lab val race race
recode race (1=1)(.=.)(else=0),gen(white)

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
recode MARISTAT (1 6=1) (2 3 4 5=0) (9=.),gen(married)
drop MARISTAT
lab var married "Marital status (IADC)"
lab def married 0 "Not married" 1 "Married" 
lab val married married

replace lastdiagx="1" if lastdiagx=="Normal"
replace lastdiagx="2" if lastdiagx=="Impaired, not MCI"
replace lastdiagx="3" if lastdiagx=="MCI"
replace lastdiagx="4" if lastdiagx=="Amnestic MCI-memory impairment" 
replace lastdiagx="5" if lastdiagx=="Amnestic MCI-memory impairment Plus one or more domains"
replace lastdiagx="6" if lastdiagx=="Non-amnestic MCI-multiple domains"
replace lastdiagx="7" if lastdiagx=="Non-amnestic MCI-single domain"
replace lastdiagx="8" if lastdiagx=="Dementia"
replace lastdiagx="" if lastdiagx=="Missing"
destring lastdiagx, replace
recode lastdiagx (1 2=1) (3/7=2) (8=3),gen(diagnosis_iadclast)
lab def diagnosis_iadclast 1 "Normal" 2 "MCI" 3 "Dementia"
lab val diagnosis_iadclast diagnosis_iadclast
lab var diagnosis_iadclast "Latest consensus diagnosis from IADC"

drop lastdiagx lastsubtype contribute normcond syndrome //this is most recent diagnosis which is usually years after SNAD interview

recode APOEGenotype (22=1)(23=2)(24=3)(33=4)(34=5)(44=6)

lab def apoe 1 "E2/E2" 2 "E2/E3" 3 "E2/E4" 4 "E3/E3" 5 "E3/E4" 6 "E4/E4"
lab val APOEGenotype apoe

gen apoerisk=APOEGenotype
recode apoerisk (1/2=0)(4=0)(3=1)(5/6=1)
lab var apoerisk "High risk (heterozygous or homozygous for E4)"

gen apoe=.
replace apoe=1 if APOEGenotype==1 | APOEGenotype==2 | APOEGenotype==4
replace apoe=2 if APOEGenotype==3 | APOEGenotype==5
replace apoe=3 if APOEGenotype==6
lab var apoe "APOE genotype"
lab def apoecat 1 "No E4" 2 "Hetero E4" 3 "Homo E4"
lab val apoe apoecat

*check duplicates
duplicates drop SUBID,force //3564 had a exact copy

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean\Clean data\IADC-Cross-Clean.dta", replace



***************************************************************
**#3 Clinical data - Longitudinal variables
***************************************************************





import excel "IADC_clinical_10NOV2021.xlsx", sheet("Longitudinal Data") firstrow clear
save "IADC-Long-raw",replace

*label variables
import excel "IADC_clinical_10NOV2021.xlsx", ///
sheet("Longitudinal_Variables") firstrow case(lower) clear //read file with value labels 
keep name label 
replace label=subinstr(label, char(34), "", .) //remove quotation from string variable (label cannot handle quotation marks)

append using "IADC-Long-raw",gen(varlabel) //append label info into long data
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

*create variable for AD
gen ad=primarysubtype
replace ad= "Alzheimers disease" if contributel=="Alzheimers disease" //code as AD if other condition says AD even primary subtype is not AD 
gen adtype=1 if ad== "Alzheimers disease"	  
replace	adtype=0 if !missing(ad) & adtype!=1	   
label define ad 0 "Non AD" 1 "AD"
label values adtype ad

*create diagnosis variable + data clean
replace diag="1" if diag=="Normal"
replace diag="2" if diag=="Impaired, not MCI"
replace diag="3" if diag=="MCI"
replace diag="4" if diag=="Amnestic MCI-memory impairment" 
replace diag="5" if diag=="Amnestic MCI-memory impairment Plus one or more domains"
replace diag="6" if diag=="Non-amnestic MCI-multiple domains"
replace diag="7" if diag=="Non-amnestic MCI-single domain"
replace diag="8" if diag=="Dementia"
replace diag="" if diag=="Missing"
destring diag, replace
recode diag (1 2=1) (3/7=2) (8=3),gen(diagnosis)
lab def diagnosisnew 1 "Normal" 2 "MCI" 3 "Dementia"
lab val diagnosis diagnosisnew
lab var diagnosis "Normal, MCI, or dementia"

label var CCI_INFTOT "Informant CCI Total score"
rename age age_i
rename ageatvisit ageiadc


save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean\Clean data\IADC-Long-Clean.dta", replace