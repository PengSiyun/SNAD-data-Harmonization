cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\Snad_Enso_Export"

****T1 completed case according to alter tie file
import delimited "focal_bl_alter_tie_export_17-1_2021-01-14T10 05 05.889371-05 00",  clear
destring respondent_name, force gen(SUBID) //convert nonnumeric strings to missing values
duplicates drop SUBID, force
fre SUBID // n=44

****T2 completed case according to alter tie file
import delimited "focal_t2_alter_tie_export_20-1_2021-01-14T10 05 51.847440-05 00",  clear
destring respondent_name, force gen(SUBID) //convert nonnumeric strings to missing values
duplicates drop SUBID, force
fre SUBID // n=16

****T3 completed case according to alter tie file
import delimited "focal_t3_alter_tie_export_21-1_2021-01-14T10 05 57.039659-05 00",  clear
destring respondent_name, force gen(SUBID) //convert nonnumeric strings to missing values
duplicates drop SUBID, force
fre SUBID // n=26

****T4 completed case according to alter tie file
import delimited "focal_t4_alter_tie_export_22-1_2021-01-14T10 06 02.743373-05 00",  clear
destring respondent_name, force gen(SUBID) //convert nonnumeric strings to missing values
duplicates drop SUBID, force
fre SUBID // n=24

****T5 completed case according to alter tie file
import delimited "focal_t5_alter_tie_export_26-1_2021-01-14T10 06 08.763529-05 00",  clear
destring respondent_name, force gen(SUBID) //convert nonnumeric strings to missing values
duplicates drop SUBID, force
fre SUBID // n=3

****All completed cases by ENSO
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\Snad_Enso_Export") clear force  //import multiple csv in a folder (ssc install multimport)
destring respondent_name,force gen(SUBID) 
duplicates drop SUBID, force
drop if missing(SUBID)
fre SUBID //N=112
fre _filename // T3=25 not 26 suggesting SUBID=3564 in T3 is also in T4
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\ENSO clean\ENSO-SUBID completed alter ties.xlsx",firstrow(variables) sheet("SUBID completed alter ties") missing(".")
