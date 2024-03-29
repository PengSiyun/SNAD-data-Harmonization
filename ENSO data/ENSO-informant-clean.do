****Author:  Siyun Peng
****Date:    2022/01/25
****Version: 17
****Purpose: clean ENSO Informant

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home



***************************************************************
**# 1a Merge ENSO Informant Focal data-full
***************************************************************



/*EGOAGG data*/


use "ENSO-informant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Informant-Focal alter-EGOAGG-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope)
merge 1:1 SUBID using "ENSO-informant-focal altertie-EGOAGG-clean"
fre SUBID if _merge==1 // 11+9 not in alter tie data
fre SUBID if _merge==2 // 0 not in alter data
drop _merge
replace ENSO=1

*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


*clean date_snad in ENSO
replace created_on=substr(created_on, 1, 10) //only keep MDY
replace created_on= subinstr(created_on, "-", "", .) //drop -
gen date_snad = date(created_on,"YMD")
format date_snad %dM_d,_CY

merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 5 in ENSO not in completed Redcap 
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-EGOAGG-clean",replace


/*LONG data*/


use "ENSO-informant-ego-interview",clear
merge 1:m SUBID using "ENSO-Informant-focal alter-LONG-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely,they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope)
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-EGOAGG-clean",nogen //add alter-level data on top of cleaned EGOAGG data
rename (fanyelse fpartner) (et_anyelse et_partner)

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-LONG-clean",replace




***************************************************************
**# 1b Merge ENSO Informant Focal data-pilot
***************************************************************



/*EGOAGG data*/


use "ENSO-informant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Informant-Focal alter-EGOAGG-pilot-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope)
merge 1:1 SUBID using "ENSO-informant-focal altertie-EGOAGG-pilot-clean"
fre SUBID if _merge==1 // 12+9 not in alter tie data
drop _merge
replace ENSO=1
*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


*clean date_snad in ENSO
replace created_on=substr(created_on, 1, 10) //only keep MDY
replace created_on= subinstr(created_on, "-", "", .) //drop -
gen date_snad = date(created_on,"YMD")
format date_snad %dM_d,_CY

merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 6 in ENSO not in completed Redcap (6242, 6406, 10194, 10229, 10259, 10304)
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-EGOAGG-pilot-clean",replace


/*LONG data*/


use "ENSO-informant-ego-interview",clear
merge 1:m SUBID using "ENSO-Informant-focal alter-LONG-pilot-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope)
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-EGOAGG-pilot-clean",nogen //add alter-level data on top of cleaned EGOAGG data
rename (fanyelse fpartner) (et_anyelse et_partner)

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-LONG-pilot-clean",replace





***************************************************************
**# 2a Merge ENSO Informant Informant data-full
***************************************************************



/*EGOAGG data*/


use "ENSO-informant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Informant-Informant alter-EGOAGG-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope) + 13 have no informant alters
merge 1:1 SUBID using "ENSO-informant-informant altertie-EGOAGG-clean"
fre SUBID if _merge==1 // 8+22 not in alter tie data
fre SUBID if _merge==2 // 0 not in alter data
drop _merge
replace ENSO=1

*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


*clean date_snad in ENSO
replace created_on=substr(created_on, 1, 10) //only keep MDY
replace created_on= subinstr(created_on, "-", "", .) //drop -
gen date_snad = date(created_on,"YMD")
format date_snad %dM_d,_CY

merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 2 in ENSO not in completed Redcap 
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-EGOAGG-clean",replace


/*LONG data*/


use "ENSO-informant-ego-interview",clear
merge 1:m SUBID using "ENSO-Informant-informant alter-LONG-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope) + 13 have no informant alters
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-EGOAGG-clean",nogen  //add alter-level data on top of cleaned EGOAGG data

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-LONG-clean",replace




***************************************************************
**# 2b Merge ENSO Informant Informant data (workdays and weekends generators are dropped since beginning of NC)-R01 match
***************************************************************



/*EGOAGG data*/


use "ENSO-informant-ego-interview",clear
merge 1:1 SUBID using "ENSO-Informant-Informant alter-EGOAGG-R01match-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope) + 14 have no informant alters
replace netsize=0 if SUBID==6418 //it had alters in workdays and weekends generators
merge 1:1 SUBID using "ENSO-informant-informant altertie-EGOAGG-R01match-clean"
fre SUBID if _merge==1 // 7+23 not in alter tie data
fre SUBID if _merge==2 // 0 not in alter data
drop _merge
replace ENSO=1

*calculate Effective size
gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"


/*Replace interview date with REDCAP data (ENSO date is not accurate)*/


*clean date_snad in ENSO
replace created_on=substr(created_on, 1, 10) //only keep MDY
replace created_on= subinstr(created_on, "-", "", .) //drop -
gen date_snad = date(created_on,"YMD")
format date_snad %dM_d,_CY

merge 1:m SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old\Cleaned\REDcap-old-R01-informant",keepusing(date_red SUBID) //old R01 REDCAP had pilot+ENSO+NC
fre SUBID if _merge==1 // 2 in ENSO not in completed Redcap 
drop if _merge==2 //REDcap that not in ENSO: probably pilot interview
replace date_red=. if inrange(date_red, td(09apr2019), td(25oct2020))==0 // only keep ENSO: last pilot interview=08apr2019, first NC interview=26oct2020  
sort SUBID date_red
duplicates drop SUBID,force //drop REDCAP outside ENSO time
replace date_snad=date_red if !missing(date_red)
drop _merge date_red

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-EGOAGG-R01match-clean",replace


/*LONG data*/


use "ENSO-informant-ego-interview",clear
merge 1:m SUBID using "ENSO-Informant-informant alter-LONG-R01match-clean",nogen 
replace netsize=. if missing(netsize) //6545,10262,10295,10346,10356,10369,10373,10389,10403 missing alter info completely, they are probably not true 0 alter. Because informant should be count as an alter at least (need to confirm with Hope) + 14 have no informant alters
replace netsize=0 if SUBID==6418 //it had alters in workdays and weekends generators
merge m:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-EGOAGG-R01match-clean",nogen  //add alter-level data on top of cleaned EGOAGG data

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-LONG-R01match-clean",replace


