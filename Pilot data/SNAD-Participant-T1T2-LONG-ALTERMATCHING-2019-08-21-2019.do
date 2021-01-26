
*Identifying recurring and non-recurring alters
clear
set maxvar 32767, perm

use "C:\Users\adrroth\Documents\Adam\SNAD\SNAD Data\SNAD-Participant-T1T2-CleanB-LONG-062519.dta" , clear

replace name =strrtrim(name)
replace name =strltrim(name)
replace name =subinstr(name, ".", "",.)
replace name = strlower(name)
replace name =stritrim(name)

keep name

*saving new file to pull unique names and assign tie id to unique names
save "C:\Users\adrroth\Documents\Adam\SNAD\SNAD Data\alter names.dta", replace
duplicates drop
gen tid = _n
save "C:\Users\adrroth\Documents\Adam\SNAD\SNAD Data\alter names.dta", replace


use "C:\Users\adrroth\Documents\Adam\SNAD\SNAD Data\SNAD-Participant-T1T2-CleanB-LONG-062519.dta" , clear

replace name =strrtrim(name)
replace name =strltrim(name)
replace name =subinstr(name, ".", "",.)
replace name = strlower(name)
replace name =stritrim(name)

replace w1alter =strrtrim(w1alter)
replace w1alter =strltrim(w1alter)
replace w1alter =subinstr(w1alter, ".", "",.)
replace w1alter = strlower(w1alter)
replace w1alter =stritrim(w1alter)


merge m:1 name using "C:\Users\adrroth\Documents\Adam\SNAD\SNAD Data\alter names.dta"

duplicates tag SUBID tid, gen(tiddup)


*creating var indicating is SUBID was only interviewed for network data at W1 (w1only)
gen w1only=1 if SUBID==3568|SUBID==3637|SUBID==3676| SUBID==3679|SUBID==3711|SUBID==3720|SUBID==3732|SUBID==3788|SUBID==3810|SUBID==3833|SUBID==3837|SUBID==3854|SUBID==3972|SUBID==5032|SUBID==5037|SUBID==5108|SUBID==6003|SUBID==6106|SUBID==6145|SUBID==6147|SUBID==6190|SUBID==6193|SUBID==6234|SUBID==6237|SUBID==6241|SUBID==6242|SUBID==6259|SUBID==6277|SUBID==6288|SUBID==6316|SUBID==6341|SUBID==6342|SUBID==6372|SUBID==6390|SUBID==6408| SUBID==6440|SUBID==6449|SUBID==6452|SUBID==6453|SUBID==6455|SUBID==6468|SUBID==6473|SUBID==6483|SUBID==6486|SUBID==6505|SUBID==6511|SUBID==6513|SUBID==6519|SUBID==6520|SUBID==6535|SUBID==6536|SUBID==6543|SUBID==6545|SUBID==6563|SUBID==6564|SUBID==6565|SUBID==6566|SUBID==6571|SUBID==6574|SUBID==6586|SUBID==8132|SUBID==9000|SUBID==10012|SUBID==10019|SUBID==10023|SUBID==10025|SUBID==10027|SUBID==10029|SUBID==10033|SUBID==10037|SUBID==10038|SUBID==10040|SUBID==10042|SUBID==10046|SUBID==10059|SUBID==10061|SUBID==10064|SUBID==10067|SUBID==10070|SUBID==10080|SUBID==10082|SUBID==10088|SUBID==10089|SUBID==10096|SUBID==10101|SUBID==10113|SUBID==10130|SUBID==10138|SUBID==10139|SUBID==10143|SUBID==10144|SUBID==10145|SUBID==10150|SUBID==10159|SUBID==10160|SUBID==10161|SUBID==10164|SUBID==10167|SUBID==10168| SUBID==10169|SUBID==10173|SUBID==10174|SUBID==10175|SUBID==10179|SUBID==10180|SUBID==10181|SUBID==10185|SUBID==10187|SUBID==10191|SUBID==10194|SUBID==10196|SUBID==10197|SUBID==10205|SUBID==10208|SUBID==10209|SUBID==10216|SUBID==10219|SUBID==10225|SUBID==10226|SUBID==10227|SUBID==10229|SUBID==10230|SUBID==10231|SUBID==10233|SUBID==10234|SUBID==10235|SUBID==10236|SUBID==10243|SUBID==10249|SUBID==10253|SUBID==10259|SUBID==10260|SUBID==10277|SUBID==10280|SUBID==10282|SUBID==10284|SUBID==10289|SUBID==10304|SUBID==10314
replace w1only=0 if w1only==.


/*Newly added ties at W2 are indicated by tiddup var (tiddup=0 & time==2). BUT...
There are some typos that need to be checked manually (e.g., Carol @ W1 Caryl @ W2)*/


/*Below code shows that the 1's are ucertainly repeated ties whereas the 0s are questionable 
as to whether they are truly newly added ties...*/
tab tiddup if time==2

bysort SUBID: list SUBID TIEID name tid tiddu time w1alter w1mention w1reas w1stil if w1only==0



*Also need to look into dropped ties...



/*reshaping date to wide
gen timestr = time
tostring timestr, replace
gen tiestr = TIEID
tostring tiestr, replace
gen timetie = tiestr + "w" + timestr

drop _merge
reshape wide TIEID-tiestr , i(SUBID) j(timetie) s

