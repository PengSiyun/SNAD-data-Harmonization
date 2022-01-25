****Author:  Siyun Peng
****Date:    2022/01/11
****Version: 17
****Purpose: clean REDcap old R01 Informant  



cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\temp" //home
use "REDcap-R01-w2-informant-reformated",clear
append using "REDcap-R01-w1-informant-reformated",gen(time)
recode time (0=2) (1=1)



************************************************************
**# 1. reorder and rename variables
************************************************************



rename redcap_date date_red
rename (grade_mother2 grade_father2 education_mother2 education_father2 dem_martial) (grade_mother grade_father education_mother education_father dem_marital)

*rename variables that are asked both for FOCAL and INFORMANT
rename (health2_ energy2_ spirits2_ living_situation2_ memory2_ family2_ marriage2_ friends2_ no_friends2_ self2_ do_chores2_ do_fun2_ money2_ whole2_ marriage_other2 nofriends2_) ///
       (health_f energy_f spirits_f living_situation_f memory_f family_f marriage_f friends_f no_friends_f self_f do_chores_f do_fun_f money_f whole_f marriage_other_f nofriends_f)
rename (health3_ energy3_ spirits3_ living3_ memory3_ family3_ marriage3_ friends3_ no_friends3_ self3_ do_chores3_ do_fun3_ money3_ whole3_ marriage_other3 nofriends3_) ///
       (health_i energy_i spirits_i living_situation_i memory_i family_i marriage_i friends_i no_friends_i self_i do_chores_i do_iun_i money_i whole_i marriage_other_i nofriends_i)
rename no_friends_* nofriends_feel_*

order patient2,after(assisting_adult2_)
foreach x in twitter instagram pinterest facebook linkedin snapchat whatsapp reddit tumblr skype {
	order followers_`x',after(sm_`x'2_)
}
order sm_other,after(followers_skype)
order religion_other2,after(what_religion)

*cwpuzzle in t2 is a combined measure of cwpuzzle+puzzlegame+cardgame
list SUBID cwpuzzles_f2_ cwpuzzles_d2_ puzzlegame_f2_ puzzlegame_d2_ cardgame_f2_ cardgame_d2_ if time==2 & !missing(cwpuzzles_f2_) //all 3 only do crossword in T1; no change is needed

*remove _ in the end 
rename *_ *

 
	   
************************************************************
**# 2. Create sum scores
************************************************************



replace moca_total=subinstr(moca_total,"/30","",1) //turn 16/30 into 16
replace moca_total=subinstr(moca_total,"/2019","",1) //turn 16/2019 into 16




************************************************************
**# 3. Isolate demographics
************************************************************


preserve

keep SUBID time name_informant ///
demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio dem_employment dem_jobhours ///
grade_mother grade_father education_mother education_father //1st line: demo in Demographics; 2-3 lines: demo in Missing ENSO; 4 line: demo in wave1 of stress and qol

*If missing values occurred in T1 demo, then they could be replaced by T2
sort SUBID time
foreach x of varlist name_informant ///
demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio dem_employment dem_jobhours ///
grade_mother grade_father education_mother education_father {
	bysort SUBID: replace `x'=`x'[2] if missing(`x') 
}

duplicates drop SUBID,force //same as keep time==1

*to be consistent with New R01 data
rename (grade_mother grade_father education_mother education_father) ///
       (education_mother2 education_father2 education_mother1 education_father1)  
rename (demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio) (gender school military marital children step) 
replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,replace

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant-demographics.dta",replace
restore

drop name_informant ///
demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio dem_employment dem_jobhours ///
grade_mother grade_father education_mother education_father //drop demographics 

*check wave indicator
duplicates report SUBID //8 informant did 2 waves, 10339a only in T2
replace time=1 if SUBID=="10339a"
replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,replace

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant.dta",replace

