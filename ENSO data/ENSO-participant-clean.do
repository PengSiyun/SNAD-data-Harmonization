****Author:  Siyun Peng
****Date:    2021/02/19
****Version: 16
****Purpose: clean ENSO 

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home



***************************************************************
**# 1 Merge ENSO data-full
***************************************************************


*EGOAGG data
use "ENSO-Participant-alter-EGOAGG-clean",clear
merge 1:1 SUBID using "ENSO-Participant-altertie-EGOAGG-clean"
fre SUBID if _merge==1 // 19 not in alter tie data
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
keep if inrange(date_red, td(09apr2019), td(25oct2020)) // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020 

replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-clean",replace




***************************************************************
**# 2 Merge ENSO data-pilot
***************************************************************



use "ENSO-Participant-alter-EGOAGG-pilot-clean",clear
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
keep if inrange(date_red, td(09apr2019), td(25oct2020)) // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020 
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Participant-EGOAGG-pilot-clean",replace


