****Author:  Siyun Peng
****Date:    2021/12/16
****Version: 17
****Purpose: clean REDcap R01 Participant  


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01" //home
do "REDcap-R01-Informant-import" //import excel from Redcap into stata
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\temp" //home

*to do: 
*6404a is missing moca_total
*how to create sum score of facial memory, emotion cognition?
*how to obtain qualtrics data for facial memory?


************************************************************
**# 1. Keep completed interviews
************************************************************



*double check all completed interviews have gift_date
replace gift_datei=coord_datei if missing(gift_datei)
fre gift_datei gift_card_receipt_complete 

*keep completed interviews
gen date_red = dofc(gift_datei) //remove hours and minutes
format date_red %td
bysort record_id: replace date_red=date_red[2] if missing(date_red)&redcap_event_name=="demographics_arm_1" //fill in date for Demo line using 1st wave line
bysort record_id: replace ccid=ccid[1] if missing(ccid) //fill in ccid for wave lines line using demo line
drop if missing(date_red)

*Drop tracking and sensitive info (REDcap data export order is based on Designer)
drop check_each_box_to_show_tha___4-gift_card_receipt_complete





************************************************************
**# 2. rename variables
************************************************************




rename ccid SUBID
rename city_w1 city_moca
rename *_w1 * //drop _w1

*Cognitive tests
rename total_score moca_total //
replace moca_total=subinstr(moca_total,"/30","",1) //turn 16/30 into 16

*rename variables that are asked both for FOCAL and INFORMANT
rename (nofriends2_w1___1 nofriends3_w1___1) (nofriends_f nofriends_i)
foreach x of varlist health2-marriage_other2 {
	renvars `x',postdrop(1) //drop last character in var name; ssc install renvars
}
foreach x of varlist health-marriage_other {
	rename `x' `x'_f
}
foreach x of varlist health3-marriage_other3 {
	renvars `x',postdrop(1) //drop last character in var name; ssc install renvars
}
foreach x of varlist health-marriage_other {
	rename `x' `x'_i
}

*rename variables that are not clear
rename no_friends_* nofriends_feel_*

order patient2,after(assisting_adult2)
foreach x in twitter instagram pinterest facebook linkedin snapchat whatsapp reddit tumblr skype {
	order followers_`x',after(sm_`x'2)
}
order sm_other,after(followers_skype)
order religion_other2,after(what_religion)

*race
gen race=.
order race,before(race___1)
replace race=6 if race___6==1 //other
replace race=5 if race___5==1 //White
replace race=4 if race___4==1 //pacific islander
replace race=1 if race___1==1 //Native American
replace race=2 if race___2==1 //Asian
replace race=3 if race___3==1 //Black
drop race___*
label define race 1 "American Indian or Alaskan Native" 2 "Asian" 3 "African American" 4 "Pacific Islander" 5 "White" 6 "Other"
label values race race
replace SUBID =subinstr(SUBID, "a", "",.) //remove a
destring SUBID,replace





************************************************************
**# 3. Append with old R01
************************************************************



/*append demo*/

preserve

keep if redcap_event_name=="demographics_arm_1" //keep demo line
keep SUBID-zip_code race-education_father2

*prepare for append
replace education_father2="12" if education_father2=="GED"
destring education_father2,replace
tostring step,replace
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant-demographics.dta"

foreach x of varlist * {
	bysort SUBID: replace `x'=`x'[2] if missing(`x') //copy values from old R01 if missing
}
duplicates drop SUBID,force //drop old R01


*check conflict and fix it in the new R01
/*
foreach x of varlist gender race school military children education_mother1 education_father1 marital {
  bysort SUBID: egen `x'_t=mean(`x')
}
fre *_t
list SUBID first_name last_name gender if gender_t==1.5
*/

rename * *_red //to differentiate from IADRC demo variables
rename  SUBID_red SUBID
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-informant-demographics.dta",replace

restore


/*append the rest*/


*prepare for append
tostring workhours day_week2 followers_*,replace
drop if redcap_event_name=="demographics_arm_1" //drop demo line
drop first_name-demographics_complete //drop demo variables

append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant.dta"
drop time //wave indicator in old R01
sort SUBID date_red
bysort SUBID: gen time=_n //create new wave indicator
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-informant.dta",replace




