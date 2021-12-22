****Author:  Siyun Peng
****Date:    2021/03/23
****Version: 16
****Purpose: UniqueID-ENSO-informant reports of Informant alter

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp" //home

***************************************************************
//	#1 Clean ENSO Informant Informant alter network data 
***************************************************************
use "ENSO-Informant-Informant alter-LONG.dta",replace

gen ENSO=1
gen time="ENSO"
rename (created_on alter_name) (date_snad name_i)
replace date_snad=substr(date_snad, 1, 10) //only keep YMD
replace date_snad= subinstr(date_snad, "-", "", .) //drop -
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY
keep srel* date_snad SUBID name_i ENSO time
rename (date_snad) (date_snad_i)  
bysort SUBID: gen TIEID_uniq_i=_n
tostring SUBID,replace
replace SUBID=SUBID+"a"
order SUBID TIEID_uniq_i name_i time date_snad_i srel* 

export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID W12345-Informant-Informant alter.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")

