****Author:  Siyun Peng
****Date:    12/11/2020
****Version: 16
****Purpose: produce a excel file of all waves of ENSO

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean" //home
/*
rename respondent_name SUBID
rename alter_name name
rename alter_id TIEID
*/

***************************************************************
//	#1 Clean ENSO focal ego data 
***************************************************************
*figure out unique focal interviews and double with other data to see consistency (139 unique SBUID in alter file and in ego file)
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\October Enso Focal raw exports\Ego data") clear force //import multiple csv in a folder (ssc install multimport)
destring respondent_name,replace force 
drop if missing(respondent_name) //drop all SUBID with string character (like testkate)
preserve
duplicates drop respondent_name, force // 95 duplicate respondent_name dropped, this should not happen
count // 139 unique focal interviews
save "ENSO-Focal-ego-unique SUBID",replace
restore

*identify focal interviews with duplicate cases for latter correction
duplicates tag respondent_name, gen(duplicate) 
recode duplicate (1/4=1)
drop if duplicate==0
duplicates drop respondent_name, force  
count //76 duplicate respondent_name
keep respondent_name
sort respondent_name
save "ENSO-Focal-ego-duplicate SUBID",replace

***************************************************************
//	#2 Clean ENSO focal alter data 
***************************************************************
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\October Enso Focal raw exports") clear force //import multiple csv in a folder (ssc install multimport)
destring respondent_name,replace force 
drop if missing(respondent_name) //drop all SUBID with string character (like testkate)

*fixed things in ENSO
duplicates tag respondent_name alter_name, gen(duplicate) // 492 duplicate names in respondent_name, this should not happen
recode duplicate (1/4=1)

rename nirelpart4nirelprnt4nirelsib4nir nirel4 //variable need to be fixed for W4
drop nirelother_txt nirelother5_txt //no need for this string variable
destring niage,replace force

foreach x of varlist nirelpart nirelprnt nirelsib nirelchld nirelgprnt nirelgchld nirelantun nirelinlaw nirelother nirelcowrk nirelnghbr nirelfrnd nirelemplr nirelemple nirelstdnt nirellwyr nireldoc nirelothmd nirelthrpy nirelrabbi nirelchrch nirelclub nirelactvt niage impmat impforce impburdn hlthcount hlthencrg hlthburdn wkndties wkdyties family cowrkrs neighbrs anyelse partner nitalk {
	egen `x'_all=rowtotal(*`x'*),mi
}
*one variable for all waves of relationship type
egen nirel=rowtotal(nirelpart_all nirelprnt_all nirelsib_all nirelchld_all nirelgprnt_all nirelgchld_all nirelantun_all nirelinlaw_all nirelother_all nirelcowrk_all nirelnghbr_all nirelfrnd_all nirelemplr_all nirelemple_all nirelstdnt_all nirellwyr_all nireldoc_all nirelothmd_all nirelthrpy_all nirelrabbi_all nirelchrch_all nirelclub_all nirelactvt_all), mi
recode nirel (0=.) //T1235 relationship type
encode nirel4,gen(nirel4_new) //T4 relationship type
recode nirel4_new (1/17=1)
egen nirel_all=rowtotal(nirel nirel4_new),mi
*one variable for all waves of name generators
egen generators_all=rowtotal(impmat_all impforce_all impburdn_all hlthcount_all hlthencrg_all hlthburdn_all wkndties_all wkdyties_all family_all cowrkrs_all neighbrs_all anyelse_all partner_all), mi
recode generators_all (0=.) 

sort respondent_name alter_name
order _filename duplicate interview_id respondent_id respondent_name alter_id alter_name created_on modified_on ///
generators_all nirel_all nitalk_all impmat_all impforce_all impburdn_all hlthcount_all ///
hlthencrg_all hlthburdn_all wkndties_all wkdyties_all family_all cowrkrs_all neighbrs_all anyelse_all partner_all 
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO-Focal-Alter names.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")
*create a list of SUBID/respondent_name with duplicates
egen pickone=tag(interview_id),mi
keep if pickone==1 //keep all cases with different interview dates
duplicates tag respondent_name,gen(dup)
drop if dup==0 //drop focal without duplicates
duplicates drop respondent_name, force //drop extra duplicate
count //75 duplicate respondent_name, which is inconsistent with 76 in ego file
keep respondent_name
merge 1:1 respondent_name using "ENSO-Focal-ego-duplicate SUBID"
list if _m==2 //respondent_name=10039 mistakely have the same interview_id, need to be keep in the list
keep respondent_name
sort respondent_name
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO-Focal-Alter names.xlsx",firstrow(variables) sheet("Duplicate ID") missing(".")

***************************************************************
//	#3 Clean ENSO focal alter-alter tie data 
***************************************************************
*figure out unique focal interviews and double with other data to see consistency (129 unique SBUID in alter-alter tie file <139 in other files!!)
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\October Enso Focal raw exports\Alter ties") clear force //import multiple csv in a folder (ssc install multimport)
destring respondent_name,replace force 
drop if missing(respondent_name) //drop all SUBID with string character (like testkate)
duplicates drop respondent_name, force 
count //129 unique SUBID <139!!!
merge 1:1 respondent_name using "ENSO-Focal-ego-unique SUBID"
keep if _m==2 //10 respondent_name are missing in alter-alter file
keep respondent_name
sort respondent_name
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO-Focal-Alter names.xlsx",firstrow(variables) sheet("Missing ID in alter-alter tie") missing(".")

