****Author:  Siyun Peng
****Date:    2021/07/07
****Version: 17
****Purpose: clean REDcap R01 Participant  

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\temp" //home
use "REDcap-R01-w2-participant-reformated",clear
tostring workhours_, replace force
append using "REDcap-R01-w1-participant-reformated",gen(time)
recode time (0=2) (1=1)
duplicates report SUBID //29 focal did 2 waves

************************************************************
**# 1. reorder and rename variables
************************************************************
order marriage_other,after(marriage)
order nofriends no_friends_,after(friends)
rename no_friends_ nofriends_feel
order  activities_hear, after(drvisit_) 
rename (drvisit_ doctor_) (hearing_drvisit vision_drvisit)
order other_relation,after(person_relationship_)
order patient_name,after(assisting_adult_)
order require_expanded,after(require_care_)
rename (person_relationship_ other_relation) (patient_relation patient_relation_other)
order contacts_phone,before(social_media1___1_)
foreach x in twitter instagram pinterest facebook linkedin snapchat whatsapp reddit tumblr skype {
	order followers_`x',after(sm_`x'1_)
}
order sm_other,after(followers_skype)
order volunteer_hours, after(volunteer_often)
order other_specify, after(volunteer_why)
order volunteer_other,after(volunteer_act___14_)
order religion_other,after(what_religion)


************************************************************
**# 2. rename multiple choices that is not clear
************************************************************
rename (volunteer_act___2_ volunteer_act___3_ volunteer_act___4_ volunteer_act___5_ volunteer_act___6_ volunteer_act___7_ volunteer_act___8_ volunteer_act___9_ volunteer_act___10_ volunteer_act___11_ volunteer_act___12_ volunteer_act___13_ volunteer_act___14_) ///
       (volunteer_act___coach_ volunteer_act___teach_ volunteer_act___mentor_ volunteer_act___usher_ volunteer_act___food_ volunteer_act___cloth_ volunteer_act___fund_ volunteer_act___med_ volunteer_act___office_ volunteer_act___manage_ volunteer_act___art_ volunteer_act___drive_ volunteer_act___other_)

************************************************************
**# 3. Create sum scores
************************************************************

rename total_score_ moca_raw
replace moca_raw=subinstr(moca_raw,"/30","",1) //turn 16/30 into 16
rename (trailseconds_ trailsecond_) (trail_a_time trail_b_time)
egen rey_sum=rowtotal(reycorrect_ reycorrect2_ reycorrect3_ reycorrect4_ reycorrect5_),mi

*get delayed Rey from Hope (delayed_rey_sum)
*how to create sum score of facial memory, emotion cognition?
*how to obtain qualtrics data for facial memory?

*remove _ in the end to be consistent with IADRC mail-in
rename city_ city2
rename *_ *


************************************************************
**# 4. Isolate demographics
************************************************************


preserve

keep SUBID time first_name last_name date_of_birth ///
demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio ///
race gender school military marital children step ///
longest_job-long_live15 kind_business kind2_business grade_mother grade_father education_mother education_father family_finances //1st line: demo in Demographics; 2nd line: demo in Missing ENSO; 3rd line: demo in wave1 of stress and qol; 4th line: variables that are in demo of new R01

*If missing values occurred in T1 demo, then they could be replaced by T2
sort SUBID time
foreach x of varlist first_name last_name date_of_birth ///
demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio ///
race gender school military marital children step ///
longest_job-long_live15 kind_business kind2_business grade_mother grade_father education_mother education_father family_finances {
	bysort SUBID: replace `x'=`x'[2] if missing(`x') 
}

duplicates drop SUBID,force //same as keep time==1
rename (long_business long_business2 long2_business long2_business2) (year_start1 year_end1 year_start2 year_end2) //consistent with new R01

*Harmonize variables that collected from multiple sections
replace demographics_sex=gender if missing(demographics_sex)
replace dem_education=school if missing(dem_education)
recode military (1=1) (2=0)
replace dem_military=military if missing(dem_military)
replace dem_marital=marital if missing(dem_marital)
replace dem_biochild=children if missing(dem_biochild)
replace dem_nonbio=subinstr(dem_nonbio, " step children", "",.)
destring dem_nonbio,replace
replace dem_nonbio=step if missing(dem_nonbio)

drop gender school military marital children step time
rename (demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio) (gender school military marital children step) //consistent with new R01

tostring long_live*,replace 

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant-demographics.dta",replace
restore

drop first_name last_name date_of_birth ///
demographics_sex dem_education dem_military dem_marital dem_biochild dem_nonbio ///
race gender school military marital children step ///
longest_job-long_live15 kind_business kind2_business grade_mother grade_father education_mother education_father family_finances //drop demographics 

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant.dta",replace

