****Author:  Siyun Peng
****Date:    2021/02/19
****Version: 16
****Purpose: clean ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home


***************************************************************
**# 1a Merge ENSO data-full
***************************************************************


/*EGOAGG data*/


use "ENSO-Participant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Participant-alter-EGOAGG-clean",nogen 
replace netsize=0 if missing(netsize) //6477,10394,10397 true 0 alter
merge 1:1 SUBID using "ENSO-Participant-altertie-EGOAGG-clean"
fre SUBID if _merge==1 // 19+3 not in alter tie data
fre SUBID if _merge==2 // 0 not in alter data
drop _merge
replace ENSO=1

*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 6 in ENSO not in completed Redcap (6242, 6406, 10194, 10229, 10259, 10304)
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-clean",replace


/*LONG data*/


use "ENSO-Participant-ego-interview",clear
merge 1:m SUBID using "ENSO-Participant-alter-LONG-clean",nogen 
replace netsize=0 if missing(netsize) //6477,10394,10397 true 0 alter
drop date_snad //use updated date_snad from above
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-clean",nogen  //add alter-level data on top of cleaned EGOAGG data
rename (wkndties wkdyties family cowrkrs neighbrs anyelse partner) (et_wkndties et_wkdyties et_family et_cowrkrs et_neighbrs et_anyelse et_partner)

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-LONG-clean",replace



***************************************************************
**# 1b Merge ENSO data-pilot
***************************************************************



/*EGOAGG data*/


use "ENSO-Participant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Participant-alter-EGOAGG-pilot-clean",nogen 
replace netsize=0 if missing(netsize) //6477,10394,10397 true 0 alter + 7 no alters in IM/HM generators
merge 1:1 SUBID using "ENSO-Participant-altertie-EGOAGG-pilot-clean"
fre SUBID if _merge==1 // 16 not in alter tie data
drop _merge
replace ENSO=1
*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 6 in ENSO not in completed Redcap (6242, 6406, 10194, 10229, 10259, 10304)
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-pilot-clean",replace


/*LONG data*/


use "ENSO-Participant-ego-interview",clear
merge 1:m SUBID using "ENSO-Participant-alter-LONG-pilot-clean",nogen 
replace netsize=0 if missing(netsize) //6477,10394,10397 true 0 alter + 7 no alters in IM/HM generators
drop date_snad //use updated date_snad from above
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-pilot-clean",nogen //add alter-level data on top of cleaned EGOAGG data
rename (wkndties wkdyties family cowrkrs neighbrs anyelse partner) (et_wkndties et_wkdyties et_family et_cowrkrs et_neighbrs et_anyelse et_partner)

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-LONG-pilot-clean",replace





***************************************************************
**# 1c Merge ENSO data-NC latest (workdays and weekends generators are dropped at early of 2021)
***************************************************************



/*EGOAGG data*/


use "ENSO-Participant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Participant-alter-EGOAGG-match-clean",nogen 
replace netsize=0 if missing(netsize) //6477,10394,10397 true 0 alter + 6 no alters in matched generators
merge 1:1 SUBID using "ENSO-Participant-altertie-EGOAGG-match-clean"
fre SUBID if _merge==1 // 13 not in alter tie data
drop _merge
replace ENSO=1
*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-participant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 6 in ENSO not in completed Redcap (6242, 6406, 10194, 10229, 10259, 10304)
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-match-clean",replace


/*LONG data*/


use "ENSO-Participant-ego-interview",clear
merge 1:m SUBID using "ENSO-Participant-alter-LONG-match-clean",nogen 
replace netsize=0 if missing(netsize) //6477,10394,10397 true 0 alter + 6 no alters in matched generators
drop date_snad //use updated date_snad from above
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-match-clean",nogen //add alter-level data on top of cleaned EGOAGG data
rename (wkndties wkdyties family cowrkrs neighbrs anyelse partner) (et_wkndties et_wkdyties et_family et_cowrkrs et_neighbrs et_anyelse et_partner)

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-LONG-match-clean",replace
