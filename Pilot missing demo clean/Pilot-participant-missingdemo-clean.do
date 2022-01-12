****Author:  Siyun Peng
****Date:    2021/12/17
****Version: 17
****Purpose: clean Pilot missing demo in Redcap

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot missing demo clean"
do "Pilot-participant-missingdemo-import" //load data


/*drop incomplete interview*/


drop if demographics_questio_v_0==0


/*rename to be consitent with R01 data*/

keep ccid subfname sublname dem_1-dem_18
rename (ccid subfname sublname dem_1-dem_18) (SUBID first_name last_name work work_outside longest_job1 job_activity1 kind_business1 year_start1 year_end1 longest_job2 job_activity2 kind_business2 year_start2 year_end2 different_jobs education_father1 education_mother1 neighbor_white neighbor_black neighbor_hispanic neighbor_asian)
destring SUBID,replace

replace education_father1="6" if education_father1=="PhD"
destring education_father1,replace
recode education_father1 education_mother1 (3 4=3) (5=4) (6=5)

save "pilot-participant-missingdemo",replace





