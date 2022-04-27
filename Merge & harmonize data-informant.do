****Priject: SNAD
****Author:  Siyun Peng
****Date:    2022/2/3
****Version: 17
****Purpose: Harmonize data from SNAD -Informant
clear

/*Things to fix later: 
3. Ideally ego and alter demo can be filled using all data (thus clean long data first, then EGOAGG)
*/

***************************************************************
**# 1a Append Pilot+ENSO+NC INFORMANT report of FOCAL (pilot match)
***************************************************************



/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\clean data\SNAD-Partner-T1234-Clean-LONG", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-LONG-pilot-clean.dta"
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-LONG-pilot-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
drop pilot
rename time pilot //rename old time indicator in pilots
recode pilot (1/4=1),gen(source) 
replace source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (pilot,ENSO,NC)
replace fimpmat=imd if missing(fimpmat) //generators
replace fimpmat=alterim1 if missing(fimpmat)
replace fimpforce=imr if missing(fimpforce)
replace fimpforce=alterim2 if missing(fimpforce)
replace fimpburdn=imb if missing(fimpburdn)
replace fimpburdn=alterim3 if missing(fimpburdn)
replace fhlthcount=hmd if missing(fhlthcount)
replace fhlthcount=alterhm1 if missing(fhlthcount)
replace fhlthencrg=hmr if missing(fhlthencrg)
replace fhlthencrg=alterhm2 if missing(fhlthencrg)
replace fhlthburdn=hmb if missing(fhlthburdn)
replace fhlthburdn=alterhm3 if missing(fhlthburdn)
gen et_wkndties=alteret1 //ENSO did not ask those
gen et_wkdyties=alteret2 
gen et_family=alteret3 
gen et_cowrkrs=alteret4 
gen et_neighbrs=alteret5 
replace et_anyelse=alteret6 if missing(et_anyelse)
replace et_partner=alteret7 if missing(et_partner)
drop imd imr imb hmd hmr hmb alterim1 alterim2 alterim3 alterhm1 alterhm2 alterhm3 alteret1 alteret2 alteret3 alteret4 alteret5 alteret6 alteret7

replace alterfem=tfem if missing(alterfem) //interpretors
replace alter_college=tcollege if missing(alter_college)
recode fclose howclose ftalk seetalk (1=3) (3=1)
replace altercloseego=fclose if missing(altercloseego)
replace altercloseego=howclose if missing(altercloseego)
replace alterfreqcon=ftalk if missing(alterfreqcon)
replace alterfreqcon=seetalk if missing(alterfreqcon)
replace listen=fsuplstn if missing(listen)
replace care=fsupcare if missing(care)
replace advice=fsupsugg if missing(advice)
replace chores=fsupchor if missing(chores)
replace loan=fsupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhassle=fhassle if missing(alterhassle)
recode difficult (1=3) (3=1)
replace alterhassle=difficult if missing(alterhassle)
rename altercls110 alterstrength
replace alterstrength=strong if missing(alterstrength)
replace alterstrength=fstrength if missing(alterstrength)
recode knowabout (1=3) (3=1)
replace alterhknow=knowabout if missing(alterhknow)
recode trustdoctors (1=3)(3=1)(8=.)
replace alterdtr=trustdoctors if missing(alterdtr)
rename alterdtr altertrust
replace alterquestion=tquestion if missing(alterquestion)

replace relothrel=frelothrl if missing(relothrel)
replace relchurch=frelchrch if missing(relchurch)
replace relboss=frelemplr if missing(relboss)
replace relcowork=frelcowrk if missing(relcowork)
replace relemploy=frelemple if missing(relemploy)
replace relfriend=frelfrnd if missing(relfriend)
replace relauntunc=frelantun if missing(relauntunc)
replace relschool=frelstdnt if missing(relschool)
replace relsibling=frelsib if missing(relsibling)
replace relgrandp=frelgprnt if missing(relgrandp)
replace relinlaw=frelinlaw if missing(relinlaw)
replace relgrandc=frelgchld if missing(relgrandc)
replace relothmed=frelothrmd if missing(relothmed)
replace relrelig=frelrabbi if missing(relrelig)
replace relmental=frelthrpy if missing(relmental)
replace rellawyer=frellwyr if missing(rellawyer)
replace relpartner=frelpart if missing(relpartner)
replace relneigh=frelnghbr if missing(relneigh)
replace relclub=frelclub if missing(relclub)
replace reldoctor=freldoc if missing(reldoctor)
replace relchild=frelchld if missing(relchild)
replace relparent=frelprnt if missing(relparent)
replace relleisure=frelactvt if missing(relleisure)

drop tfem tcollege tclose fclose howclose tfreq ftalk seetalk fsupcare fsupcash fsupchor fsuplstn fsupsugg thassles fhassle difficult strong fstrength tknow knowabout trustdoctors ttrust questiondoc tquestion frel* //keep one name for a measure


save "SNAD-informant focal-LONG-pilotmatch-clean.dta", replace 


/*EGOAGG (ego-level)*/


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
use "SNAD-Partner-T1-Clean-EGOAGG.dta", clear
append using "SNAD-Partner-T2-Clean-EGOAGG.dta"
append using "SNAD-Partner-T3-Clean-EGOAGG.dta",force
append using "SNAD-Partner-T4-Clean-EGOAGG.dta",force
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-EGOAGG-pilot-clean.dta"
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-EGOAGG-pilot-clean-20211112.dta"

*gen source indicator
rename time pilot //rename old time indicator in pilots
recode pilot (1/4=1),gen(source) 
replace source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator (pilot wave may not be accurate: e.g., T3 is actually a T2. Without date, no real way to fix this)
gen time=pilot //pilot waves keep its corresponding waves
bysort SUBID: egen time_pilot=max(pilot) //count pilot waves completed by SUBID
bysort SUBID: egen time_ENSO=max(ENSO) //count ENSO wave completed by SUBID
recode time_pilot time_ENSO (.=0)
replace time=time_pilot+ENSO if !missing(ENSO) //ENSO = total of pilot waves + corresponding ENSO
replace time=time_pilot+time_ENSO+NC if !missing(NC) //NC = total of pilot waves + total wave of ENSO + corresponding NC
drop time_pilot time_ENSO

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-informant focal-EGOAGG-pilotmatch-clean.dta", replace 



***************************************************************
**# 1b Append ENSO+NC data (ENSO added anyone else + study partner generators on top of pilot important/health matters) (ENSO matched)
***************************************************************


/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-LONG-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-LONG-ENSOmatch-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (ENSO,NC)
replace fimpmat=alterim1 if missing(fimpmat) //generators
replace fimpforce=alterim2 if missing(fimpforce)
replace fimpburdn=alterim3 if missing(fimpburdn)
replace fhlthcount=alterhm1 if missing(fhlthcount)
replace fhlthencrg=alterhm2 if missing(fhlthencrg)
replace fhlthburdn=alterhm3 if missing(fhlthburdn)
gen et_wkndties=alteret1 //ENSO did not ask those
gen et_wkdyties=alteret2 
gen et_family=alteret3 
gen et_cowrkrs=alteret4 
gen et_neighbrs=alteret5 
replace et_anyelse=alteret6 if missing(et_anyelse)
replace et_partner=alteret7 if missing(et_partner)
drop alterim1 alterim2 alterim3 alterhm1 alterhm2 alterhm3 alteret1 alteret2 alteret3 alteret4 alteret5 alteret6 alteret7

replace alterfem=tfem if missing(alterfem) //interpretors
recode fclose ftalk (1=3) (3=1)
replace altercloseego=fclose if missing(altercloseego)
replace alterfreqcon=ftalk if missing(alterfreqcon)
replace listen=fsuplstn if missing(listen)
replace care=fsupcare if missing(care)
replace advice=fsupsugg if missing(advice)
replace chores=fsupchor if missing(chores)
replace loan=fsupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhassle=fhassle if missing(alterhassle)
rename altercls110 alterstrength
replace alterstrength=fstrength if missing(alterstrength)
rename alterdtr altertrust

replace relothrel=frelothrl if missing(relothrel)
replace relchurch=frelchrch if missing(relchurch)
replace relboss=frelemplr if missing(relboss)
replace relcowork=frelcowrk if missing(relcowork)
replace relemploy=frelemple if missing(relemploy)
replace relfriend=frelfrnd if missing(relfriend)
replace relauntunc=frelantun if missing(relauntunc)
replace relschool=frelstdnt if missing(relschool)
replace relsibling=frelsib if missing(relsibling)
replace relgrandp=frelgprnt if missing(relgrandp)
replace relinlaw=frelinlaw if missing(relinlaw)
replace relgrandc=frelgchld if missing(relgrandc)
replace relothmed=frelothrmd if missing(relothmed)
replace relrelig=frelrabbi if missing(relrelig)
replace relmental=frelthrpy if missing(relmental)
replace rellawyer=frellwyr if missing(rellawyer)
replace relpartner=frelpart if missing(relpartner)
replace relneigh=frelnghbr if missing(relneigh)
replace relclub=frelclub if missing(relclub)
replace reldoctor=freldoc if missing(reldoctor)
replace relchild=frelchld if missing(relchild)
replace relparent=frelprnt if missing(relparent)
replace relleisure=frelactvt if missing(relleisure)

drop tfem tclose fclose tfreq ftalk fsupcare fsupcash fsupchor fsuplstn fsupsugg thassles fhassle fstrength frel* //keep one name for a measure

save "SNAD-informant focal-LONG-ENSOmatch-clean.dta", replace 


/*EGOAGG (ego-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-EGOAGG-clean.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-EGOAGG-ENSOmatch-clean-20211112.dta"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-informant focal-EGOAGG-ENSOmatch-clean.dta", replace 




***************************************************************
**# 1c Append full participant ENSO+NC (R01raw)
***************************************************************


/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant focal-LONG-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-LONG-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (ENSO,NC)
replace fimpmat=alterim1 if missing(fimpmat) //generators
replace fimpforce=alterim2 if missing(fimpforce)
replace fimpburdn=alterim3 if missing(fimpburdn)
replace fhlthcount=alterhm1 if missing(fhlthcount)
replace fhlthencrg=alterhm2 if missing(fhlthencrg)
replace fhlthburdn=alterhm3 if missing(fhlthburdn)
gen et_wkndties=alteret1 //ENSO did not ask those
gen et_wkdyties=alteret2 
gen et_family=alteret3 
gen et_cowrkrs=alteret4 
gen et_neighbrs=alteret5 
replace et_anyelse=alteret6 if missing(et_anyelse)
replace et_partner=alteret7 if missing(et_partner)
drop alterim1 alterim2 alterim3 alterhm1 alterhm2 alterhm3 alteret1 alteret2 alteret3 alteret4 alteret5 alteret6 alteret7

replace alterfem=tfem if missing(alterfem) //interpretors
recode fclose ftalk (1=3) (3=1)
replace altercloseego=fclose if missing(altercloseego)
replace alterfreqcon=ftalk if missing(alterfreqcon)
replace listen=fsuplstn if missing(listen)
replace care=fsupcare if missing(care)
replace advice=fsupsugg if missing(advice)
replace chores=fsupchor if missing(chores)
replace loan=fsupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhassle=fhassle if missing(alterhassle)
rename altercls110 alterstrength
replace alterstrength=fstrength if missing(alterstrength)
rename alterdtr altertrust

replace relothrel=frelothrl if missing(relothrel)
replace relchurch=frelchrch if missing(relchurch)
replace relboss=frelemplr if missing(relboss)
replace relcowork=frelcowrk if missing(relcowork)
replace relemploy=frelemple if missing(relemploy)
replace relfriend=frelfrnd if missing(relfriend)
replace relauntunc=frelantun if missing(relauntunc)
replace relschool=frelstdnt if missing(relschool)
replace relsibling=frelsib if missing(relsibling)
replace relgrandp=frelgprnt if missing(relgrandp)
replace relinlaw=frelinlaw if missing(relinlaw)
replace relgrandc=frelgchld if missing(relgrandc)
replace relothmed=frelothrmd if missing(relothmed)
replace relrelig=frelrabbi if missing(relrelig)
replace relmental=frelthrpy if missing(relmental)
replace rellawyer=frellwyr if missing(rellawyer)
replace relpartner=frelpart if missing(relpartner)
replace relneigh=frelnghbr if missing(relneigh)
replace relclub=frelclub if missing(relclub)
replace reldoctor=freldoc if missing(reldoctor)
replace relchild=frelchld if missing(relchild)
replace relparent=frelprnt if missing(relparent)
replace relleisure=frelactvt if missing(relleisure)

drop tfem tclose fclose tfreq ftalk fsupcare fsupcash fsupchor fsuplstn fsupsugg thassles fhassle fstrength frel* //keep one name for a measure

save "SNAD-informant focal-LONG-clean.dta", replace 


/*EGOAGG (ego-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-informant focal-EGOAGG-clean.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-EGOAGG-clean-20211112.dta"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n
save "SNAD-informant focal-EGOAGG-clean.dta", replace 





***************************************************************
**# 1d Append NC matched data (workdays and weekends generators are dropped at early of 2021) (NCmatch)
***************************************************************



/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-LONG-NCmatch-clean-20211112.dta",clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

save "SNAD-informant focal-LONG-NCmatch-clean.dta", replace 


/*EGOAGG (ego-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant focal-EGOAGG-NCmatch-clean-20211112.dta",clear
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-informant focal-EGOAGG-NCmatch-clean.dta", replace 



***************************************************************
**# 2a Append ENSO+NC INFORMANT report of INFORMANT (NC drop weekend & weekdays ties) (R01 match)
***************************************************************



/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-LONG-R01match-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant informant-LONG-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (ENSO,NC)
replace simpmat=iim1 if missing(simpmat) //generators
replace simpforce=iim2 if missing(simpforce)
replace simpburdn=iim3 if missing(simpburdn)
replace shlthcount=iihm1 if missing(shlthcount)
replace shlthencrg=iihm2 if missing(shlthencrg)
replace shlthburdn=iihm3 if missing(shlthburdn)
replace scaregiv=iet1 if missing(scaregiv)
replace sfamily=iet2 if missing(sfamily)
replace scowrkrs=iet3 if missing(scowrkrs)
replace sneighbrs=iet4 if missing(sneighbrs)
replace sanyelse=iet5 if missing(sanyelse) //swkndties,swkdyties,spartner not asked in NC
drop iim1 iim2 iim3 iihm1 iihm2 iihm3 iet1 iet2 iet3 iet4 iet5 

replace alterfem=tfem if missing(alterfem) //interpretors
replace alterprox=alterproxi if missing(alterprox) 
replace ialterdisc=stlkcare if missing(ialterdisc) 
replace alterhealthi=shlthprob if missing(alterhealthi) 
replace alterdtr=informalterphyi if missing(alterdtr) 
replace alterquestion=informalterresearch if missing(alterquestion) 
recode sclose stalk (1=3) (3=1)
replace alterclosei=sclose if missing(alterclosei)
replace alterfreqconi=stalk if missing(alterfreqconi)
replace listen=ssuplstn if missing(listen)
replace care=ssupcare if missing(care)
replace advice=ssupsugg if missing(advice)
replace chores=ssupchor if missing(chores)
replace loan=ssupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhasslei=shassle if missing(alterhasslei)
rename alterclosenessi alterstrength
replace alterstrength=sstrength if missing(alterstrength)

replace relothrel=srelothrl if missing(relothrel)
replace relchurch=srelchrch if missing(relchurch)
replace relboss=srelemplr if missing(relboss)
replace relcowork=srelcowrk if missing(relcowork)
replace relemploy=srelemple if missing(relemploy)
replace relfriend=srelfrnd if missing(relfriend)
replace relauntunc=srelantun if missing(relauntunc)
replace relschool=srelstdnt if missing(relschool)
replace relsibling=srelsib if missing(relsibling)
replace relgrandp=srelgprnt if missing(relgrandp)
replace relinlaw=srelinlaw if missing(relinlaw)
replace relgrandc=srelgchld if missing(relgrandc)
replace relothmed=srelothrmd if missing(relothmed)
replace relrelig=srelrabbi if missing(relrelig)
replace relmental=srelthrpy if missing(relmental)
replace rellawyer=srellwyr if missing(rellawyer)
replace relpartner=srelpart if missing(relpartner)
replace relneigh=srelnghbr if missing(relneigh)
replace relclub=srelclub if missing(relclub)
replace reldoctor=sreldoc if missing(reldoctor)
replace relchild=srelchld if missing(relchild)
replace relparent=srelprnt if missing(relparent)
replace relleisure=srelactvt if missing(relleisure)

drop tfem informalterresearch informalterphyi ttrust hlthprob shlthprob tlkcare stlkcare alterproxi tclose sclose tfreq stalk ssupcare ssupcash ssupchor ssuplstn ssupsugg thassles shassle sstrength srel* //keep one name for a measure

save "SNAD-informant informant-LONG-R01match-clean.dta", replace 


/*EGOAGG (ego-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-EGOAGG-R01match-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant informant-EGOAGG-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-informant informant-EGOAGG-R01match-clean.dta", replace 



***************************************************************
**# 2b Append ENSO+NC data (full/raw) 
***************************************************************


/*LONG (alter-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-LONG-clean.dta",clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant informant-LONG-clean-20211112.dta"
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*make variable names consistent across softwares (ENSO,NC)
replace simpmat=iim1 if missing(simpmat) //generators
replace simpforce=iim2 if missing(simpforce)
replace simpburdn=iim3 if missing(simpburdn)
replace shlthcount=iihm1 if missing(shlthcount)
replace shlthencrg=iihm2 if missing(shlthencrg)
replace shlthburdn=iihm3 if missing(shlthburdn)
replace scaregiv=iet1 if missing(scaregiv)
replace sfamily=iet2 if missing(sfamily)
replace scowrkrs=iet3 if missing(scowrkrs)
replace sneighbrs=iet4 if missing(sneighbrs)
replace sanyelse=iet5 if missing(sanyelse) //swkndties,swkdyties,spartner not asked in NC
drop iim1 iim2 iim3 iihm1 iihm2 iihm3 iet1 iet2 iet3 iet4 iet5 

replace alterfem=tfem if missing(alterfem) //interpretors
replace alterprox=alterproxi if missing(alterprox) 
replace ialterdisc=stlkcare if missing(ialterdisc) 
replace alterhealthi=shlthprob if missing(alterhealthi) 
replace alterdtr=informalterphyi if missing(alterdtr) 
replace alterquestion=informalterresearch if missing(alterquestion) 
recode sclose stalk (1=3) (3=1)
replace alterclosei=sclose if missing(alterclosei)
replace alterfreqconi=stalk if missing(alterfreqconi)
replace listen=ssuplstn if missing(listen)
replace care=ssupcare if missing(care)
replace advice=ssupsugg if missing(advice)
replace chores=ssupchor if missing(chores)
replace loan=ssupcash if missing(loan)
rename (listen care advice chores loan) (sup_listen sup_care sup_advice sup_chores sup_loan)
replace alterhasslei=shassle if missing(alterhasslei)
rename alterclosenessi alterstrength
replace alterstrength=sstrength if missing(alterstrength)

replace relothrel=srelothrl if missing(relothrel)
replace relchurch=srelchrch if missing(relchurch)
replace relboss=srelemplr if missing(relboss)
replace relcowork=srelcowrk if missing(relcowork)
replace relemploy=srelemple if missing(relemploy)
replace relfriend=srelfrnd if missing(relfriend)
replace relauntunc=srelantun if missing(relauntunc)
replace relschool=srelstdnt if missing(relschool)
replace relsibling=srelsib if missing(relsibling)
replace relgrandp=srelgprnt if missing(relgrandp)
replace relinlaw=srelinlaw if missing(relinlaw)
replace relgrandc=srelgchld if missing(relgrandc)
replace relothmed=srelothrmd if missing(relothmed)
replace relrelig=srelrabbi if missing(relrelig)
replace relmental=srelthrpy if missing(relmental)
replace rellawyer=srellwyr if missing(rellawyer)
replace relpartner=srelpart if missing(relpartner)
replace relneigh=srelnghbr if missing(relneigh)
replace relclub=srelclub if missing(relclub)
replace reldoctor=sreldoc if missing(reldoctor)
replace relchild=srelchld if missing(relchild)
replace relparent=srelprnt if missing(relparent)
replace relleisure=srelactvt if missing(relleisure)

drop tfem informalterresearch informalterphyi ttrust hlthprob shlthprob tlkcare stlkcare alterproxi tclose sclose tfreq stalk ssupcare ssupcash ssupchor ssuplstn ssupsugg thassles shassle sstrength srel* //keep one name for a measure


save "SNAD-informant informant-LONG-clean.dta", replace 


/*EGOAGG (ego-level)*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Clean data\ENSO-Informant informant-EGOAGG-clean.dta", clear
append using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\cleaned\NC-informant informant-EGOAGG-clean-20211112.dta"

*gen source indicator
gen source=2 if ENSO==1
replace source=3 if !missing(NC)
label define source 1 "Pilot" 2 "ENSO" 3 "NC"
label values source source
label var source "Data source"

*gen time indicator
sort SUBID date_snad
bysort SUBID: gen time=_n

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
save "SNAD-informant informant-EGOAGG-clean.dta", replace 





***************************************************************
**# 3 Clean Demographics info: INFORMANT demo is only collected in R01
***************************************************************



/*Merge Demo in ENSO with demo in Redcap*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\temp\ENSO-informant-ego-clean",clear 
merge 1:1 SUBID using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-informant-demographics.dta" 

*married was collected as demo before new R01; IADC did not collect married
rename married_enso married_enso_demo

*harmonize demo from 2 sources (Redcap, ENSO)
recode gender_red sex_enso (1=0) (2=1)
gen female=gender_red 
replace female=sex_enso if missing(female)
drop gender_red sex_enso

recode race_red (5=1) (.=.) (else=0),gen(white)
drop race_red 

replace military_red=veteran_enso if missing(military_red)
rename military_red veteran
drop veteran_enso

replace children_red=biochild_enso if missing(children_red)
replace step_red="2" if step_red=="2 adopted"
destring step_red,replace force
replace step_red=othchild_enso if missing(step_red)
egen kids=rowtotal(children_red step_red),mi
drop children_red biochild_enso step_red othchild_enso

rename school_red edu
replace edu=educat_enso if missing(edu)
drop educat_enso _merge

rename date_of_birth_red dobdate

save "Demographics-informant.dta", replace



***************************************************************
**# 4 Match REDCap_R01 with SNAD
***************************************************************



/*create match data for Redcap (Redcap data is only colleted since R01)*/


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "SNAD-informant focal-EGOAGG-clean.dta", clear //full/raw data cleaned above
merge 1:1 SUBID date_snad using "SNAD-informant informant-EGOAGG-clean.dta",nogen //to ensure all informant are here (some may skip informant informant interview)
keep SUBID date_snad 
sort SUBID date_snad
bysort SUBID: gen time=_n
egen tot_wave=max(time)
reshape wide date_snad, i(SUBID) j(time)
save "SNAD-MatchData-informant.dta", replace //match all SNAD ego regardless of they have important/health matter


/*match date with Redcap*/


use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01\Cleaned\REDcap-R01-informant.dta",clear
merge m:1 SUBID using "SNAD-MatchData-informant.dta"
drop if _merge==1 //drop 2 people in Redcap not complete network (10347a,10480a)
drop if _merge==2 //drop 5 people did not do REDCap
order SUBID date_red date_snad*

*extract total number of waves in SNAD
sum tot_wave
local num=`r(max)' 
gen matchred=.
forvalues i=1/`num' {
	replace matchred=`i' if date_red==date_snad`i' & !missing(date_red) //exact match
	gen diffred`i'=abs(date_red-date_snad`i') //calculate difference between visits
}

egen minval = rowmin(diffred*) //SNAD date closest to REDCap date
forvalues i=1/`num' {
	replace diffred`i'=. if minval!=diffred`i' //only keep matched wave
}

*match within 60 days (Network data collection may be completed later due to time)
forvalues i=1/`num' {
	fre diffred`i' if matchred==.
	replace matchred=`i' if diffred`i'<=60 & missing(matchred)
}

duplicates list SUBID matchred if !missing(matchred) //0 duplicates

*check interviews lag>60 days
fre SUBID if missing(matchred) //2 not matched (3564a,10250a)
list SUBID date_red date_snad* if missing(matchred) //check to make sure the date diff is not close to 60 
list matchred date_red date_snad* diffred* if SUBID==3564 

drop time _merge

gen date_snad=.
forvalues i=1/`num' {
	replace date_snad=date_snad`i' if matchred==`i'
	drop date_snad`i'
}
format date_snad %td
drop if missing(matchred)

save "red-Clean-snadMatch-informant.dta",replace




***************************************************************
**# 5a Merge files - FOCAL
***************************************************************




*load Redcap data
use "red-Clean-snadMatch-informant.dta", clear 
gen pilot=. //Redcap has R01 only


/*add SNAD data (pilot match)*/


merge 1:1 SUBID date_snad pilot using "SNAD-informant focal-EGOAGG-pilotmatch-clean.dta"
drop if _merge==1 //drop cases have no SNAD data
drop _merge

*add Demographics info
merge m:1 SUBID using "Demographics-informant.dta"
drop if _merge==2 //Demo data not matched with network data
drop _merge 

personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday (Only new Redcap R01 started collect dob)
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-informant focal-pilotmatch-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID NC ENSO pilot using "SNAD-informant focal-LONG-pilotmatch-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-Analysis-informant focal-LONG-pilotmatch-20211222",replace



/*add SNAD data (ENSO matched)*/


use "red-Clean-snadMatch-informant.dta", clear 

merge 1:1 SUBID date_snad using "SNAD-informant focal-EGOAGG-ENSOmatch-clean"
drop if _merge==1 //drop cases have no R01 SNAD data
drop _merge 

*add Demographics info
merge m:1 SUBID using "Demographics-informant.dta" 
drop if _merge==2 //Demo data not matched with network data
drop _merge 
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday (Only new Redcap R01 started collect dob)
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap 
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-informant focal-ENSOmatch-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID NC ENSO using "SNAD-informant focal-LONG-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-Analysis-informant focal-LONG-ENSOmatch-20211222",replace





/*add SNAD data (R01 Full/raw)*/


use "red-Clean-snadMatch-informant.dta", clear 

merge 1:1 SUBID date_snad using "SNAD-informant focal-EGOAGG-clean"
drop if _merge==1 //drop cases have no R01 SNAD data
drop _merge 

*add Demographics info
merge m:1 SUBID using "Demographics-informant.dta" 
drop if _merge==2 //Demo data not matched with network data
drop _merge 
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday (Only new Redcap R01 started collect dob)
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap 
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-informant focal-R01raw-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID NC ENSO using "SNAD-informant focal-LONG-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-Analysis-informant focal-LONG-R01raw-20211222",replace




/*add SNAD data (NC latest match)*/


use "red-Clean-snadMatch-informant.dta", clear 
merge 1:1 SUBID date_snad using "SNAD-informant focal-EGOAGG-NCmatch-clean.dta"
drop if _merge==1 //drop cases have no SNAD data
drop _merge

*add Demographics info
merge m:1 SUBID using "Demographics-informant.dta"
drop if _merge==2 //Demo data not matched with network data
drop _merge 

personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday (Only new Redcap R01 started collect dob)
recode marital (1 4 5 6=0) (2 3=1)
rename marital married
label values married married_enso
drop married_enso
drop empstat_enso emphrs_enso

save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-informant focal-NCmatch-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID date_snad using "SNAD-informant focal-LONG-NCmatch-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-Analysis-informant focal-LONG-NCmatch-20211222",replace





***************************************************************
**# 5b Merge files - INFORMANT
***************************************************************



*load Redcap data
use "red-Clean-snadMatch-informant.dta", clear 


/*add SNAD data (R01 matched)*/


merge 1:1 SUBID date_snad using "SNAD-informant informant-EGOAGG-R01match-clean"
drop if _merge==1 //drop cases have no R01 SNAD data
drop _merge 

*add Demographics info
merge m:1 SUBID using "Demographics-informant.dta" 
drop if _merge==2 //Demo data not matched with network data
drop _merge 
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday (Only new Redcap R01 started collect dob)
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap 
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-informant informant-R01match-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID NC ENSO using "SNAD-informant informant-LONG-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-Analysis-informant informant-LONG-R01match-20211222",replace





/*add SNAD data (R01 Full/raw)*/


use "red-Clean-snadMatch-informant.dta", clear 

merge 1:1 SUBID date_snad using "SNAD-informant informant-EGOAGG-clean"
drop if _merge==1 //drop cases have no R01 SNAD data
drop _merge 

*add Demographics info
merge m:1 SUBID using "Demographics-informant.dta" 
drop if _merge==2 //Demo data not matched with network data
drop _merge 
personage dobdate date_snad, gen(agesnad) //create age based on SNAD date; install personage if not alreday (Only new Redcap R01 started collect dob)
recode marital (1 4 5 6=0) (2 3=1)
replace marital=married_enso if missing(marital) & ENSO==1 //ENSO marital is not in Redcap 
rename marital married
label values married married_enso
drop married_enso

replace employment=empstat_enso if missing(employment) & ENSO==1
drop empstat_enso

tostring emphrs_enso,replace
replace workhours=emphrs_enso if missing(workhours) & ENSO==1
drop emphrs_enso
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\SNAD-Analysis-informant informant-R01raw-20211222",replace

*add LONG data (alter-level)
merge 1:m SUBID NC ENSO using "SNAD-informant informant-LONG-clean",nogen //add alter-level on top of EGOAGG
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data\Alter-level\SNAD-Analysis-informant informant-LONG-R01raw-20211222",replace