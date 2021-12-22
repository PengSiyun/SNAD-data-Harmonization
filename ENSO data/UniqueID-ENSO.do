****Author:  Siyun Peng
****Date:    11/4/2020
****Version: 16
****Purpose: label and create variables for ENSO

clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean" //home

***************************************************************
//	#1 Clean ENSO participant network data 
***************************************************************
multimport delimited, dir("C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\October Enso Focal raw exports") clear force //import multiple csv in a folder (ssc install multimport)
destring respondent_name,replace force
drop if missing(respondent_name)
rename respondent_name SUBID
rename alter_name name
rename alter_id TIEID

*fixed things in ENSO
duplicates drop SUBID name, force // 492 duplicate names in SUBID, this should not happen
drop nirelpart4nirelprnt4nirelsib4nir //variable need to be fixed for W4
drop nirelother_txt nirelother5_txt //no need for this string variable
destring niage,replace force

foreach x of varlist nirelpart nirelprnt nirelsib nirelchld nirelgprnt nirelgchld nirelantun nirelinlaw nirelother nirelcowrk nirelnghbr nirelfrnd nirelemplr nirelemple nirelstdnt nirellwyr nireldoc nirelothmd nirelthrpy nirelrabbi nirelchrch nirelclub nirelactvt niage {
	egen `x'new=rowtotal(*`x'*),mi
	drop `x'
	rename `x'new `x'
}
gen ENSO=1
gen time="ENSO"
rename created_on date_snad
replace date_snad=substr(date_snad, 1, 10) //only keep YMD
replace date_snad= subinstr(date_snad, "-", "", .) //drop -
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY
keep nirel* niage date_snad SUBID TIEID name ENSO time
save "ENSO-Participant-Clean-LONG.dta", replace

*append with pilot data

rename (nirelpart nirelprnt nirelsib nirelchld nirelgprnt nirelgchld nirelantun nirelinlaw nirelother nirelcowrk nirelnghbr nirelfrnd nirelemplr nirelemple nirelstdnt nirellwyr nireldoc nirelothmd nirelthrpy nirelrabbi nirelchrch nirelclub nirelactvt) ///
       (relpartner relparent relsibling relchild relgrandp relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure)
rename niage age
keep SUBID TIEID name date_snad rel* time age
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
append using "SNAD-Participant-T1-CleanB-LONG-120419.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t1)
append using "SNAD-Participant-T2-CleanB-LONG-062519.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t2)
append using "SNAD-Participant-T3-CleanB-LONG-062519.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t3)
append using "SNAD-Participant-T4-CleanB-LONG-092520.dta", ///
keep(SUBID TIEID name date_snad rel*) gen(redcap_t4) 
replace time="1" if redcap_t1==1
replace time="2" if redcap_t2==1
replace time="3" if redcap_t3==1
replace time="4" if redcap_t4==1
drop if missing(name)
drop redcap*
replace name =strtrim(name) //remove leading and trailing blanks
replace name =subinstr(name, ".", "",.) //remove .
replace name =strlower(name) //change to lower case
replace name =stritrim(name) //consecutive blanks collapsed to one blank
sort SUBID name time
order SUBID name time date_snad rel* TIEID
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Alter names W12345-duplicate names.dta",replace

************merge uniqueID file with duplicate names file******************
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\Drop ties\clean-Alter names W1234.xlsx",firstrow clear
keep SUBID name TIEID_uniq duplicate
merge m:m SUBID name using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Alter names W12345-duplicate names.dta" 

bysort SUBID: egen t1=mean(TIEID_uniq) //missing=ENSO respodents who never did pilot
bysort SUBID: replace TIEID_uniq=_n if missing(t1) //create unique id for those ENSO cases
replace duplicate="0" if missing(t1)
drop t1
sort SUBID time TIEID_uniq name
export excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\clean-Alter names W12345.xlsx",firstrow(variables) sheet("sheet1") replace missing(".")

/* need to fix problems in other waves before doing the below
bysort SUBID: egen netsize=count(name)
lab var netsize "Total number of alters mentioned"

gen tfem=nifemale
lab var tfem "Alter is female"
drop nifemale
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen)
egen othfam=rowtotal(nirelsib nirelantun nirelgprnt nirelgchld nirelothrl),mi //group into other family
egen fri=rowtotal(nirelfrnd nirelactvt),mi //group into friend
egen work=rowtotal(nirelemple nirelemplr nirelcowrk),mi //group into workmate
egen church=rowtotal(nirelrabbi nirelchrch),mi //group into religious group
recode othfam fri work church (1/10=1)
foreach x of varlist othfam fri work church nirelpart nirelprnt nirelinlaw nirelchld nirelnghbr nirelstdnt nirelclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(othfam fri work church nirelpart nirelprnt nirelinlaw nirelchld nirelnghbr nirelstdnt nirelclub)
recode othfam fri work church nirelpart nirelprnt nirelinlaw nirelchld nirelnghbr nirelstdnt nirelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(uothfam+ufri+uwork+uchurch+unirelpart+unirelprnt+unirelinlaw+unirelchld+unirelnghbr+unirelstdnt+unirelclub),mi //relmental relothmed rellawyer reldoctor are left out due to not fit into cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories)
drop miss uothfam-unirelclub othfam fri work church
lab var diverse "Network diversity"

gen tkin=nirelsib+nirelantun+nirelgprnt+nirelgchld+nirelothrl+nirelpart+nirelprnt+nirelinlaw+nirelchld
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

encode niclose,gen(tclose)
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=tclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser 

gen tfreq=nitalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=nitalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"
drop seetalkr

egen numsup=rowtotal(nisupcare nisupcash nisupchor nisuplstn nisupsugg),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

encode nihassle,gen(hassle)
revrs hassle, replace //reverse code
bysort SUBID: egen mhassles=mean(hassle)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode hassle (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

bysort SUBID: egen mstrength=mean(nistrength)
lab var mstrength "Mean tie strength in network, HI=MORE"
bysort SUBID: egen weakest=min(nistrength)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(nistrength)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(nistrength)
lab var sdstrength "Standard deveiation of tie strength"

gen ENSO=1
gen time=.
rename created_on date_snad
replace date_snad=substr(date_snad, 1, 10) //only keep YMD
replace date_snad= subinstr(date_snad, "-", "", .) //drop -
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY
/*
foreach x of varlist netsize-sdstrength {
	rename `x' `x'1
}
*/
save "ENSO-Participant-Clean-LONG.dta", replace

duplicates drop SUBID, force
keep SUBID date_snad netsize-sdstrength
drop tfem tkin tclose tfreq thassles numsup nihassle hassle //drop alter level variables
save "ENSO-Participant-Clean-EGOAGG.dta", replace 
