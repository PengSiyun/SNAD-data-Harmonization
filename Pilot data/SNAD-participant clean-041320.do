****Priject: SNAD
****Author:  Siyun Peng, Brea L. Perry
****Date:    2020/10/14
****Version: 16
****Purpose: recode and create data for analysis -participant
clear
*cd "C:\Users\siypeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data" //office
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"



***************************************************************
//	#1 Clean SNAD participant T1
***************************************************************
use "SNAD-Participant-T1-120419.dta", clear
*create data to add 6 cases to T2 (mistaken as T1)
rename studyid SUBID

replace SUBID="10257w2" if SUBID=="10257" & record_id==315

gen w2error=0
replace w2error=1 if SUBID=="6450w2" | SUBID=="3805w2" | SUBID=="10079w2" | SUBID=="3908w2" | SUBID=="6311w2" | SUBID=="10257w2"
lab var w2error "Should have been wave 2 observation"

drop if w2error==0

replace SUBID="10257" if SUBID=="10257w2"
replace SUBID="6450" if SUBID=="6450w2"
replace SUBID="3805" if SUBID=="3805w2"
replace SUBID="10079" if SUBID=="10079w2"
replace SUBID="3908" if SUBID=="3908w2"
replace SUBID="6311" if SUBID=="6311w2"

destring SUBID, replace

save "SNAD-Participant-T2-T1Error-120419.dta", replace

*create data to add SUBID=10104 to T1 (mistaken as T2)
use "SNAD-Participant-T2-062519.dta", clear
destring studyid, gen(SUBID) force
keep if SUBID==10104
save "SNAD-Participant-T1-T2Error-062519.dta", replace


use "SNAD-Participant-T1-120419.dta", clear

rename studyid SUBID

replace SUBID="10257w2" if SUBID=="10257" & record_id==315
drop if SUBID=="6450w2" | SUBID=="3805w2" | SUBID=="10079w2" | SUBID=="3908w2" | SUBID=="6311w2" | SUBID=="10257w2"

destring SUBID, replace

duplicates tag SUBID, gen(dup)

drop if SUBID==6536 & name1=="" //drop the duplicate with missing data

append using "SNAD-Participant-T1-T2Error-062519.dta", force //add SUBID=10104 to T1 (mistaken as T2)
drop w1alter1-egoquestiondoc studyid //drop variables in T2 but not in T1


rename generator1___1 imd1
rename generator1___2 imr1
rename generator1___3 imb1
rename generator1___4 hmd1
rename generator1___5 hmr1
rename generator1___6 hmb1

rename generator2___1 imd2
rename generator2___2 imr2
rename generator2___3 imb2
rename generator2___4 hmd2
rename generator2___5 hmr2
rename generator2___6 hmb2

rename generator3___1 imd3
rename generator3___2 imr3
rename generator3___3 imb3
rename generator3___4 hmd3
rename generator3___5 hmr3
rename generator3___6 hmb3

rename generator4___1 imd4
rename generator4___2 imr4
rename generator4___3 imb4
rename generator4___4 hmd4
rename generator4___5 hmr4
rename generator4___6 hmb4

rename generator5___1 imd5
rename generator5___2 imr5
rename generator5___3 imb5
rename generator5___4 hmd5
rename generator5___5 hmr5
rename generator5___6 hmb5

rename generator6___1 imd6
rename generator6___2 imr6
rename generator6___3 imb6
rename generator6___4 hmd6
rename generator6___5 hmr6
rename generator6___6 hmb6

rename generator7___1 imd7
rename generator7___2 imr7
rename generator7___3 imb7
rename generator7___4 hmd7
rename generator7___5 hmr7
rename generator7___6 hmb7

rename generator8___1 imd8
rename generator8___2 imr8
rename generator8___3 imb8
rename generator8___4 hmd8
rename generator8___5 hmr8
rename generator8___6 hmb8

rename generator9___1 imd9
rename generator9___2 imr9
rename generator9___3 imb9
rename generator9___4 hmd9
rename generator9___5 hmr9
rename generator9___6 hmb9

rename generator10___1 imd10
rename generator10___2 imr10
rename generator10___3 imb10
rename generator10___4 hmd10
rename generator10___5 hmr10
rename generator10___6 hmb10

rename generator11___1 imd11
rename generator11___2 imr11
rename generator11___3 imb11
rename generator11___4 hmd11
rename generator11___5 hmr11
rename generator11___6 hmb11

rename generator12___1 imd12
rename generator12___2 imr12
rename generator12___3 imb12
rename generator12___4 hmd12
rename generator12___5 hmr12
rename generator12___6 hmb12

rename generator13___1 imd13
rename generator13___2 imr13
rename generator13___3 imb13
rename generator13___4 hmd13
rename generator13___5 hmr13
rename generator13___6 hmb13

rename generator14___1 imd14
rename generator14___2 imr14
rename generator14___3 imb14
rename generator14___4 hmd14
rename generator14___5 hmr14
rename generator14___6 hmb14

rename generator15___1 imd15
rename generator15___2 imr15
rename generator15___3 imb15
rename generator15___4 hmd15
rename generator15___5 hmr15
rename generator15___6 hmb15

rename generator16___1 imd16
rename generator16___2 imr16
rename generator16___3 imb16
rename generator16___4 hmd16
rename generator16___5 hmr16
rename generator16___6 hmb16

rename generator17___1 imd17
rename generator17___2 imr17
rename generator17___3 imb17
rename generator17___4 hmd17
rename generator17___5 hmr17
rename generator17___6 hmb17

rename generator18___1 imd18
rename generator18___2 imr18
rename generator18___3 imb18
rename generator18___4 hmd18
rename generator18___5 hmr18
rename generator18___6 hmb18

rename generator120___1 imd19
rename generator120___2 imr19
rename generator120___3 imb19
rename generator120___4 hmd19
rename generator120___5 hmr19
rename generator120___6 hmb19

rename generator20___1 imd20
rename generator20___2 imr20
rename generator20___3 imb20
rename generator20___4 hmd20
rename generator20___5 hmr20
rename generator20___6 hmb20

rename related1___1 relpartner1
rename related1___2 relparent1
rename related1___3 relsibling1
rename related1___4 relchild1
rename related1___5 relgrandp1
rename related1___6 relgrandc1
rename related1___7 relauntunc1
rename related1___8 relinlaw1
rename related1___9 relothrel1
rename related1___10 relcowork1
rename related1___11 relneigh1
rename related1___12 relfriend1
rename related1___13 relboss1
rename related1___14 relemploy1
rename related1___15 relschool1
rename related1___16 rellawyer1
rename related1___17 reldoctor1
rename related1___18 relothmed1
rename related1___19 relmental1
rename related1___20 relrelig1
rename related1___21 relchurch1
rename related1___22 relclub1
rename related1___23 relleisure1

rename related2___1 relpartner2
rename related2___2 relparent2
rename related2___3 relsibling2
rename related2___4 relchild2
rename related2___5 relgrandp2
rename related2___6 relgrandc2
rename related2___7 relauntunc2
rename related2___8 relinlaw2
rename related2___9 relothrel2
rename related2___10 relcowork2
rename related2___11 relneigh2
rename related2___12 relfriend2
rename related2___13 relboss2
rename related2___14 relemploy2
rename related2___15 relschool2
rename related2___16 rellawyer2
rename related2___17 reldoctor2
rename related2___18 relothmed2
rename related2___19 relmental2
rename related2___20 relrelig2
rename related2___21 relchurch2
rename related2___22 relclub2
rename related2___23 relleisure2

rename related3___1 relpartner3
rename related3___2 relparent3
rename related3___3 relsibling3
rename related3___4 relchild3
rename related3___5 relgrandp3
rename related3___6 relgrandc3
rename related3___7 relauntunc3
rename related3___8 relinlaw3
rename related3___9 relothrel3
rename related3___10 relcowork3
rename related3___11 relneigh3
rename related3___12 relfriend3
rename related3___13 relboss3
rename related3___14 relemploy3
rename related3___15 relschool3
rename related3___16 rellawyer3
rename related3___17 reldoctor3
rename related3___18 relothmed3
rename related3___19 relmental3
rename related3___20 relrelig3
rename related3___21 relchurch3
rename related3___22 relclub3
rename related3___23 relleisure3

rename related4___1 relpartner4
rename related4___2 relparent4
rename related4___3 relsibling4
rename related4___4 relchild4
rename related4___5 relgrandp4
rename related4___6 relgrandc4
rename related4___7 relauntunc4
rename related4___8 relinlaw4
rename related4___9 relothrel4
rename related4___10 relcowork4
rename related4___11 relneigh4
rename related4___12 relfriend4
rename related4___13 relboss4
rename related4___14 relemploy4
rename related4___15 relschool4
rename related4___16 rellawyer4
rename related4___17 reldoctor4
rename related4___18 relothmed4
rename related4___19 relmental4
rename related4___20 relrelig4
rename related4___21 relchurch4
rename related4___22 relclub4
rename related4___23 relleisure4

rename related5___1 relpartner5
rename related5___2 relparent5
rename related5___3 relsibling5
rename related5___4 relchild5
rename related5___5 relgrandp5
rename related5___6 relgrandc5
rename related5___7 relauntunc5
rename related5___8 relinlaw5
rename related5___9 relothrel5
rename related5___10 relcowork5
rename related5___11 relneigh5
rename related5___12 relfriend5
rename related5___13 relboss5
rename related5___14 relemploy5
rename related5___15 relschool5
rename related5___16 rellawyer5
rename related5___17 reldoctor5
rename related5___18 relothmed5
rename related5___19 relmental5
rename related5___20 relrelig5
rename related5___21 relchurch5
rename related5___22 relclub5
rename related5___23 relleisure5

rename related6___1 relpartner6
rename related6___2 relparent6
rename related6___3 relsibling6
rename related6___4 relchild6
rename related6___5 relgrandp6
rename related6___6 relgrandc6
rename related6___7 relauntunc6
rename related6___8 relinlaw6
rename related6___9 relothrel6
rename related6___10 relcowork6
rename related6___11 relneigh6
rename related6___12 relfriend6
rename related6___13 relboss6
rename related6___14 relemploy6
rename related6___15 relschool6
rename related6___16 rellawyer6
rename related6___17 reldoctor6
rename related6___18 relothmed6
rename related6___19 relmental6
rename related6___20 relrelig6
rename related6___21 relchurch6
rename related6___22 relclub6
rename related6___23 relleisure6

rename related7___1 relpartner7
rename related7___2 relparent7
rename related7___3 relsibling7
rename related7___4 relchild7
rename related7___5 relgrandp7
rename related7___6 relgrandc7
rename related7___7 relauntunc7
rename related7___8 relinlaw7
rename related7___9 relothrel7
rename related7___10 relcowork7
rename related7___11 relneigh7
rename related7___12 relfriend7
rename related7___13 relboss7
rename related7___14 relemploy7
rename related7___15 relschool7
rename related7___16 rellawyer7
rename related7___17 reldoctor7
rename related7___18 relothmed7
rename related7___19 relmental7
rename related7___20 relrelig7
rename related7___21 relchurch7
rename related7___22 relclub7
rename related7___23 relleisure7

rename related8___1 relpartner8
rename related8___2 relparent8
rename related8___3 relsibling8
rename related8___4 relchild8
rename related8___5 relgrandp8
rename related8___6 relgrandc8
rename related8___7 relauntunc8
rename related8___8 relinlaw8
rename related8___9 relothrel8
rename related8___10 relcowork8
rename related8___11 relneigh8
rename related8___12 relfriend8
rename related8___13 relboss8
rename related8___14 relemploy8
rename related8___15 relschool8
rename related8___16 rellawyer8
rename related8___17 reldoctor8
rename related8___18 relothmed8
rename related8___19 relmental8
rename related8___20 relrelig8
rename related8___21 relchurch8
rename related8___22 relclub8
rename related8___23 relleisure8

rename related9___1 relpartner9
rename related9___2 relparent9
rename related9___3 relsibling9
rename related9___4 relchild9
rename related9___5 relgrandp9
rename related9___6 relgrandc9
rename related9___7 relauntunc9
rename related9___8 relinlaw9
rename related9___9 relothrel9
rename related9___10 relcowork9
rename related9___11 relneigh9
rename related9___12 relfriend9
rename related9___13 relboss9
rename related9___14 relemploy9
rename related9___15 relschool9
rename related9___16 rellawyer9
rename related9___17 reldoctor9
rename related9___18 relothmed9
rename related9___19 relmental9
rename related9___20 relrelig9
rename related9___21 relchurch9
rename related9___22 relclub9
rename related9___23 relleisure9

rename related10___1 relpartner10
rename related10___2 relparent10
rename related10___3 relsibling10
rename related10___4 relchild10
rename related10___5 relgrandp10
rename related10___6 relgrandc10
rename related10___7 relauntunc10
rename related10___8 relinlaw10
rename related10___9 relothrel10
rename related10___10 relcowork10
rename related10___11 relneigh10
rename related10___12 relfriend10
rename related10___13 relboss10
rename related10___14 relemploy10
rename related10___15 relschool10
rename related10___16 rellawyer10
rename related10___17 reldoctor10
rename related10___18 relothmed10
rename related10___19 relmental10
rename related10___20 relrelig10
rename related10___21 relchurch10
rename related10___22 relclub10
rename related10___23 relleisure10

rename related11___1 relpartner11
rename related11___2 relparent11
rename related11___3 relsibling11
rename related11___4 relchild11
rename related11___5 relgrandp11
rename related11___6 relgrandc11
rename related11___7 relauntunc11
rename related11___8 relinlaw11
rename related11___9 relothrel11
rename related11___10 relcowork11
rename related11___11 relneigh11
rename related11___12 relfriend11
rename related11___13 relboss11
rename related11___14 relemploy11
rename related11___15 relschool11
rename related11___16 rellawyer11
rename related11___17 reldoctor11
rename related11___18 relothmed11
rename related11___19 relmental11
rename related11___20 relrelig11
rename related11___21 relchurch11
rename related11___22 relclub11
rename related11___23 relleisure11

rename related12___1 relpartner12
rename related12___2 relparent12
rename related12___3 relsibling12
rename related12___4 relchild12
rename related12___5 relgrandp12
rename related12___6 relgrandc12
rename related12___7 relauntunc12
rename related12___8 relinlaw12
rename related12___9 relothrel12
rename related12___10 relcowork12
rename related12___11 relneigh12
rename related12___12 relfriend12
rename related12___13 relboss12
rename related12___14 relemploy12
rename related12___15 relschool12
rename related12___16 rellawyer12
rename related12___17 reldoctor12
rename related12___18 relothmed12
rename related12___19 relmental12
rename related12___20 relrelig12
rename related12___21 relchurch12
rename related12___22 relclub12
rename related12___23 relleisure12

rename related13___1 relpartner13
rename related13___2 relparent13
rename related13___3 relsibling13
rename related13___4 relchild13
rename related13___5 relgrandp13
rename related13___6 relgrandc13
rename related13___7 relauntunc13
rename related13___8 relinlaw13
rename related13___9 relothrel13
rename related13___10 relcowork13
rename related13___11 relneigh13
rename related13___12 relfriend13
rename related13___13 relboss13
rename related13___14 relemploy13
rename related13___15 relschool13
rename related13___16 rellawyer13
rename related13___17 reldoctor13
rename related13___18 relothmed13
rename related13___19 relmental13
rename related13___20 relrelig13
rename related13___21 relchurch13
rename related13___22 relclub13
rename related13___23 relleisure13

rename related14___1 relpartner14
rename related14___2 relparent14
rename related14___3 relsibling14
rename related14___4 relchild14
rename related14___5 relgrandp14
rename related14___6 relgrandc14
rename related14___7 relauntunc14
rename related14___8 relinlaw14
rename related14___9 relothrel14
rename related14___10 relcowork14
rename related14___11 relneigh14
rename related14___12 relfriend14
rename related14___13 relboss14
rename related14___14 relemploy14
rename related14___15 relschool14
rename related14___16 rellawyer14
rename related14___17 reldoctor14
rename related14___18 relothmed14
rename related14___19 relmental14
rename related14___20 relrelig14
rename related14___21 relchurch14
rename related14___22 relclub14
rename related14___23 relleisure14

rename related15___1 relpartner15
rename related15___2 relparent15
rename related15___3 relsibling15
rename related15___4 relchild15
rename related15___5 relgrandp15
rename related15___6 relgrandc15
rename related15___7 relauntunc15
rename related15___8 relinlaw15
rename related15___9 relothrel15
rename related15___10 relcowork15
rename related15___11 relneigh15
rename related15___12 relfriend15
rename related15___13 relboss15
rename related15___14 relemploy15
rename related15___15 relschool15
rename related15___16 rellawyer15
rename related15___17 reldoctor15
rename related15___18 relothmed15
rename related15___19 relmental15
rename related15___20 relrelig15
rename related15___21 relchurch15
rename related15___22 relclub15
rename related15___23 relleisure15

rename related16___1 relpartner16
rename related16___2 relparent16
rename related16___3 relsibling16
rename related16___4 relchild16
rename related16___5 relgrandp16
rename related16___6 relgrandc16
rename related16___7 relauntunc16
rename related16___8 relinlaw16
rename related16___9 relothrel16
rename related16___10 relcowork16
rename related16___11 relneigh16
rename related16___12 relfriend16
rename related16___13 relboss16
rename related16___14 relemploy16
rename related16___15 relschool16
rename related16___16 rellawyer16
rename related16___17 reldoctor16
rename related16___18 relothmed16
rename related16___19 relmental16
rename related16___20 relrelig16
rename related16___21 relchurch16
rename related16___22 relclub16
rename related16___23 relleisure16

rename related17___1 relpartner17
rename related17___2 relparent17
rename related17___3 relsibling17
rename related17___4 relchild17
rename related17___5 relgrandp17
rename related17___6 relgrandc17
rename related17___7 relauntunc17
rename related17___8 relinlaw17
rename related17___9 relothrel17
rename related17___10 relcowork17
rename related17___11 relneigh17
rename related17___12 relfriend17
rename related17___13 relboss17
rename related17___14 relemploy17
rename related17___15 relschool17
rename related17___16 rellawyer17
rename related17___17 reldoctor17
rename related17___18 relothmed17
rename related17___19 relmental17
rename related17___20 relrelig17
rename related17___21 relchurch17
rename related17___22 relclub17
rename related17___23 relleisure17

rename related18___1 relpartner18
rename related18___2 relparent18
rename related18___3 relsibling18
rename related18___4 relchild18
rename related18___5 relgrandp18
rename related18___6 relgrandc18
rename related18___7 relauntunc18
rename related18___8 relinlaw18
rename related18___9 relothrel18
rename related18___10 relcowork18
rename related18___11 relneigh18
rename related18___12 relfriend18
rename related18___13 relboss18
rename related18___14 relemploy18
rename related18___15 relschool18
rename related18___16 rellawyer18
rename related18___17 reldoctor18
rename related18___18 relothmed18
rename related18___19 relmental18
rename related18___20 relrelig18
rename related18___21 relchurch18
rename related18___22 relclub18
rename related18___23 relleisure18

rename related19___1 relpartner19
rename related19___2 relparent19
rename related19___3 relsibling19
rename related19___4 relchild19
rename related19___5 relgrandp19
rename related19___6 relgrandc19
rename related19___7 relauntunc19
rename related19___8 relinlaw19
rename related19___9 relothrel19
rename related19___10 relcowork19
rename related19___11 relneigh19
rename related19___12 relfriend19
rename related19___13 relboss19
rename related19___14 relemploy19
rename related19___15 relschool19
rename related19___16 rellawyer19
rename related19___17 reldoctor19
rename related19___18 relothmed19
rename related19___19 relmental19
rename related19___20 relrelig19
rename related19___21 relchurch19
rename related19___22 relclub19
rename related19___23 relleisure19

rename related20___1 relpartner20
rename related20___2 relparent20
rename related20___3 relsibling20
rename related20___4 relchild20
rename related20___5 relgrandp20
rename related20___6 relgrandc20
rename related20___7 relauntunc20
rename related20___8 relinlaw20
rename related20___9 relothrel20
rename related20___10 relcowork20
rename related20___11 relneigh20
rename related20___12 relfriend20
rename related20___13 relboss20
rename related20___14 relemploy20
rename related20___15 relschool20
rename related20___16 rellawyer20
rename related20___17 reldoctor20
rename related20___18 relothmed20
rename related20___19 relmental20
rename related20___20 relrelig20
rename related20___21 relchurch20
rename related20___22 relclub20
rename related20___23 relleisure20


rename helped1___1 listen1
rename helped1___2 care1
rename helped1___3 advice1
rename helped1___4 chores1
rename helped1___5 loan1

rename helped2___1 listen2
rename helped2___2 care2
rename helped2___3 advice2
rename helped2___4 chores2
rename helped2___5 loan2

rename helped3___1 listen3
rename helped3___2 care3
rename helped3___3 advice3
rename helped3___4 chores3
rename helped3___5 loan3

rename helped4___1 listen4
rename helped4___2 care4
rename helped4___3 advice4
rename helped4___4 chores4
rename helped4___5 loan4

rename helped5___1 listen5
rename helped5___2 care5
rename helped5___3 advice5
rename helped5___4 chores5
rename helped5___5 loan5

rename helped6___1 listen6
rename helped6___2 care6
rename helped6___3 advice6
rename helped6___4 chores6
rename helped6___5 loan6

rename helped7___1 listen7
rename helped7___2 care7
rename helped7___3 advice7
rename helped7___4 chores7
rename helped7___5 loan7

rename helped8___1 listen8
rename helped8___2 care8
rename helped8___3 advice8
rename helped8___4 chores8
rename helped8___5 loan8

rename helped9___1 listen9
rename helped9___2 care9
rename helped9___3 advice9
rename helped9___4 chores9
rename helped9___5 loan9

rename helped10___1 listen10
rename helped10___2 care10
rename helped10___3 advice10
rename helped10___4 chores10
rename helped10___5 loan10

rename helped11___1 listen11
rename helped11___2 care11
rename helped11___3 advice11
rename helped11___4 chores11
rename helped11___5 loan11

rename helped12___1 listen12
rename helped12___2 care12
rename helped12___3 advice12
rename helped12___4 chores12
rename helped12___5 loan12

rename helped13___1 listen13
rename helped13___2 care13
rename helped13___3 advice13
rename helped13___4 chores13
rename helped13___5 loan13

rename helped14___1 listen14
rename helped14___2 care14
rename helped14___3 advice14
rename helped14___4 chores14
rename helped14___5 loan14

rename helped15___1 listen15
rename helped15___2 care15
rename helped15___3 advice15
rename helped15___4 chores15
rename helped15___5 loan15

rename helped16___1 listen16
rename helped16___2 care16
rename helped16___3 advice16
rename helped16___4 chores16
rename helped16___5 loan16

rename helped17___1 listen17
rename helped17___2 care17
rename helped17___3 advice17
rename helped17___4 chores17
rename helped17___5 loan17

rename helped18___1 listen18
rename helped18___2 care18
rename helped18___3 advice18
rename helped18___4 chores18
rename helped18___5 loan18

rename helped19___1 listen19
rename helped19___2 care19
rename helped19___3 advice19
rename helped19___4 chores19
rename helped19___5 loan19

rename helped20___1 listen20
rename helped20___2 care20
rename helped20___3 advice20
rename helped20___4 chores20
rename helped20___5 loan20

recode matrix_1_2-matrix_19_20 (1=3)(2=2)(3=1)(4=0) //0 = do not know each other
label define alterclose 0 "Dont know each other" 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values matrix_* alterclose
/* count of each categories of alter-alter closeness
egen alterclose0=anycount(matrix_1_2-matrix_19_20),v(0)
egen alterclose0sum=total(alterclose0)
egen alterclose1=anycount(matrix_1_2-matrix_19_20),v(1)
egen alterclose1sum=total(alterclose1)
egen alterclose2=anycount(matrix_1_2-matrix_19_20),v(2)
egen alterclose2sum=total(alterclose2)
egen alterclose3=anycount(matrix_1_2-matrix_19_20),v(3)
egen alterclose3sum=total(alterclose3)
sum *sum
*/
egen npossties=rownonmiss(matrix_1_2-matrix_19_20)
egen totval=rowtotal(matrix_1_2-matrix_19_20),mi
gen density=totval/npossties
lab var density "Valued density of networks from matrix"

*drop people did not complete name gernarators (this step is needed so that they are not treated as 0 net size)
recode generators_complete interpreters_complete matrix_complete (0=.) //those complete indicators are not accurate, some cases says not completed but have names in the data
egen complete=rowmean(generators_complete interpreters_complete matrix_complete)
drop if missing(complete) & missing(name1)
drop complete

foreach x of varlist matrix_1_2-matrix_19_20 {
gen new`x'=`x'
}
recode matrix_1_2-matrix_19_20 (2/3=1)(0/1=0)
egen totnum=rowtotal(matrix_1_2-matrix_19_20),mi
gen bdensity=totnum/npossties
lab var bdensity "Density of networks close\very close"

recode newmatrix_1_2-newmatrix_19_20 (1/3=1)(0=0)
egen totnum1=rowtotal(newmatrix_1_2-newmatrix_19_20),mi
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"

egen sole=rowmin(newmatrix_1_2-newmatrix_19_20) 
recode sole (0=1) (1=0) //same as recode b1density (1=0)
lab var sole "Sole bridge status"

drop totnum newmatrix_1_2-newmatrix_19_20 matrix_1_2-matrix_19_20
tostring name*,replace //prepare for reshape

reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong, i(SUBID) j(TIEID)
replace name="" if name=="." // convert . into missing in string
 
sort SUBID TIEID

bysort SUBID: egen netsize=count(name)
lab var netsize "Total number of alters mentioned"

gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into  professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi //cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"

bysort SUBID: egen nkin=total(tkin)
bysort SUBID: egen nfriend=total(tfriend)
gen fkratio=(nfriend+1)/(nkin+1)
replace fkratio=. if netsize==0
lab var fkratio "Ratio of friends to kin"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"

drop seetalkr

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network"
gen knowaboutr=knowabout
recode knowaboutr (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutr)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE"
drop knowaboutr

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
drop trustdoctorsr

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

revrs difficult, replace //reverse code
bysort SUBID: egen mhassles=mean(difficult)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode difficult (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE)
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength"

egen qol=rowmean(health-whole)
lab var qol "Quality of life scale, HI=BETTER"

drop interpreters_complete matrix_complete quality_of_life_complete npossties totval dup record_id redcap_data_access_group totnum1

gen time=1

save "SNAD-Participant-T1-CleanB-LONG-120419.dta", replace

duplicates drop SUBID, force

drop name-strong TIEID tfem tkin tfriend tclose tfreq tknow difficult thassles ttrust numsup  //drop alter level variables

save "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", replace














***************************************************************
//	#2 Clean SNAD participant T2
***************************************************************
use "SNAD-Participant-T2-062519.dta", clear

rename studyid SUBID

drop if SUBID=="6336w3" | SUBID=="10104" //10104 is T1
destring SUBID, replace

duplicates tag SUBID, gen(dup)
sort SUBID

drop if SUBID==6302 & name1==""
drop if SUBID==6368 & name1==""

duplicates drop SUBID, force

drop if SUBID==3805 | SUBID==3908 | SUBID==6311 | SUBID==10079 | SUBID==10257 | SUBID==6450

drop if SUBID==.

append using "SNAD-Participant-T2-T1Error-120419.dta", force


rename generator1___1 imd1
rename generator1___2 imr1
rename generator1___3 imb1
rename generator1___4 hmd1
rename generator1___5 hmr1
rename generator1___6 hmb1

rename generator2___1 imd2
rename generator2___2 imr2
rename generator2___3 imb2
rename generator2___4 hmd2
rename generator2___5 hmr2
rename generator2___6 hmb2

rename generator3___1 imd3
rename generator3___2 imr3
rename generator3___3 imb3
rename generator3___4 hmd3
rename generator3___5 hmr3
rename generator3___6 hmb3

rename generator4___1 imd4
rename generator4___2 imr4
rename generator4___3 imb4
rename generator4___4 hmd4
rename generator4___5 hmr4
rename generator4___6 hmb4

rename generator5___1 imd5
rename generator5___2 imr5
rename generator5___3 imb5
rename generator5___4 hmd5
rename generator5___5 hmr5
rename generator5___6 hmb5

rename generator6___1 imd6
rename generator6___2 imr6
rename generator6___3 imb6
rename generator6___4 hmd6
rename generator6___5 hmr6
rename generator6___6 hmb6

rename generator7___1 imd7
rename generator7___2 imr7
rename generator7___3 imb7
rename generator7___4 hmd7
rename generator7___5 hmr7
rename generator7___6 hmb7

rename generator8___1 imd8
rename generator8___2 imr8
rename generator8___3 imb8
rename generator8___4 hmd8
rename generator8___5 hmr8
rename generator8___6 hmb8

rename generator9___1 imd9
rename generator9___2 imr9
rename generator9___3 imb9
rename generator9___4 hmd9
rename generator9___5 hmr9
rename generator9___6 hmb9

rename generator10___1 imd10
rename generator10___2 imr10
rename generator10___3 imb10
rename generator10___4 hmd10
rename generator10___5 hmr10
rename generator10___6 hmb10

rename generator11___1 imd11
rename generator11___2 imr11
rename generator11___3 imb11
rename generator11___4 hmd11
rename generator11___5 hmr11
rename generator11___6 hmb11

rename generator12___1 imd12
rename generator12___2 imr12
rename generator12___3 imb12
rename generator12___4 hmd12
rename generator12___5 hmr12
rename generator12___6 hmb12

rename generator13___1 imd13
rename generator13___2 imr13
rename generator13___3 imb13
rename generator13___4 hmd13
rename generator13___5 hmr13
rename generator13___6 hmb13

rename generator14___1 imd14
rename generator14___2 imr14
rename generator14___3 imb14
rename generator14___4 hmd14
rename generator14___5 hmr14
rename generator14___6 hmb14

rename generator15___1 imd15
rename generator15___2 imr15
rename generator15___3 imb15
rename generator15___4 hmd15
rename generator15___5 hmr15
rename generator15___6 hmb15

rename generator16___1 imd16
rename generator16___2 imr16
rename generator16___3 imb16
rename generator16___4 hmd16
rename generator16___5 hmr16
rename generator16___6 hmb16

rename generator17___1 imd17
rename generator17___2 imr17
rename generator17___3 imb17
rename generator17___4 hmd17
rename generator17___5 hmr17
rename generator17___6 hmb17

rename generator18___1 imd18
rename generator18___2 imr18
rename generator18___3 imb18
rename generator18___4 hmd18
rename generator18___5 hmr18
rename generator18___6 hmb18

rename generator120___1 imd19
rename generator120___2 imr19
rename generator120___3 imb19
rename generator120___4 hmd19
rename generator120___5 hmr19
rename generator120___6 hmb19

rename generator20___1 imd20
rename generator20___2 imr20
rename generator20___3 imb20
rename generator20___4 hmd20
rename generator20___5 hmr20
rename generator20___6 hmb20


rename related1___1 relpartner1
rename related1___2 relparent1
rename related1___3 relsibling1
rename related1___4 relchild1
rename related1___5 relgrandp1
rename related1___6 relgrandc1
rename related1___7 relauntunc1
rename related1___8 relinlaw1
rename related1___9 relothrel1
rename related1___10 relcowork1
rename related1___11 relneigh1
rename related1___12 relfriend1
rename related1___13 relboss1
rename related1___14 relemploy1
rename related1___15 relschool1
rename related1___16 rellawyer1
rename related1___17 reldoctor1
rename related1___18 relothmed1
rename related1___19 relmental1
rename related1___20 relrelig1
rename related1___21 relchurch1
rename related1___22 relclub1
rename related1___23 relleisure1

rename related2___1 relpartner2
rename related2___2 relparent2
rename related2___3 relsibling2
rename related2___4 relchild2
rename related2___5 relgrandp2
rename related2___6 relgrandc2
rename related2___7 relauntunc2
rename related2___8 relinlaw2
rename related2___9 relothrel2
rename related2___10 relcowork2
rename related2___11 relneigh2
rename related2___12 relfriend2
rename related2___13 relboss2
rename related2___14 relemploy2
rename related2___15 relschool2
rename related2___16 rellawyer2
rename related2___17 reldoctor2
rename related2___18 relothmed2
rename related2___19 relmental2
rename related2___20 relrelig2
rename related2___21 relchurch2
rename related2___22 relclub2
rename related2___23 relleisure2

rename related3___1 relpartner3
rename related3___2 relparent3
rename related3___3 relsibling3
rename related3___4 relchild3
rename related3___5 relgrandp3
rename related3___6 relgrandc3
rename related3___7 relauntunc3
rename related3___8 relinlaw3
rename related3___9 relothrel3
rename related3___10 relcowork3
rename related3___11 relneigh3
rename related3___12 relfriend3
rename related3___13 relboss3
rename related3___14 relemploy3
rename related3___15 relschool3
rename related3___16 rellawyer3
rename related3___17 reldoctor3
rename related3___18 relothmed3
rename related3___19 relmental3
rename related3___20 relrelig3
rename related3___21 relchurch3
rename related3___22 relclub3
rename related3___23 relleisure3

rename related4___1 relpartner4
rename related4___2 relparent4
rename related4___3 relsibling4
rename related4___4 relchild4
rename related4___5 relgrandp4
rename related4___6 relgrandc4
rename related4___7 relauntunc4
rename related4___8 relinlaw4
rename related4___9 relothrel4
rename related4___10 relcowork4
rename related4___11 relneigh4
rename related4___12 relfriend4
rename related4___13 relboss4
rename related4___14 relemploy4
rename related4___15 relschool4
rename related4___16 rellawyer4
rename related4___17 reldoctor4
rename related4___18 relothmed4
rename related4___19 relmental4
rename related4___20 relrelig4
rename related4___21 relchurch4
rename related4___22 relclub4
rename related4___23 relleisure4

rename related5___1 relpartner5
rename related5___2 relparent5
rename related5___3 relsibling5
rename related5___4 relchild5
rename related5___5 relgrandp5
rename related5___6 relgrandc5
rename related5___7 relauntunc5
rename related5___8 relinlaw5
rename related5___9 relothrel5
rename related5___10 relcowork5
rename related5___11 relneigh5
rename related5___12 relfriend5
rename related5___13 relboss5
rename related5___14 relemploy5
rename related5___15 relschool5
rename related5___16 rellawyer5
rename related5___17 reldoctor5
rename related5___18 relothmed5
rename related5___19 relmental5
rename related5___20 relrelig5
rename related5___21 relchurch5
rename related5___22 relclub5
rename related5___23 relleisure5

rename related6___1 relpartner6
rename related6___2 relparent6
rename related6___3 relsibling6
rename related6___4 relchild6
rename related6___5 relgrandp6
rename related6___6 relgrandc6
rename related6___7 relauntunc6
rename related6___8 relinlaw6
rename related6___9 relothrel6
rename related6___10 relcowork6
rename related6___11 relneigh6
rename related6___12 relfriend6
rename related6___13 relboss6
rename related6___14 relemploy6
rename related6___15 relschool6
rename related6___16 rellawyer6
rename related6___17 reldoctor6
rename related6___18 relothmed6
rename related6___19 relmental6
rename related6___20 relrelig6
rename related6___21 relchurch6
rename related6___22 relclub6
rename related6___23 relleisure6

rename related7___1 relpartner7
rename related7___2 relparent7
rename related7___3 relsibling7
rename related7___4 relchild7
rename related7___5 relgrandp7
rename related7___6 relgrandc7
rename related7___7 relauntunc7
rename related7___8 relinlaw7
rename related7___9 relothrel7
rename related7___10 relcowork7
rename related7___11 relneigh7
rename related7___12 relfriend7
rename related7___13 relboss7
rename related7___14 relemploy7
rename related7___15 relschool7
rename related7___16 rellawyer7
rename related7___17 reldoctor7
rename related7___18 relothmed7
rename related7___19 relmental7
rename related7___20 relrelig7
rename related7___21 relchurch7
rename related7___22 relclub7
rename related7___23 relleisure7

rename related8___1 relpartner8
rename related8___2 relparent8
rename related8___3 relsibling8
rename related8___4 relchild8
rename related8___5 relgrandp8
rename related8___6 relgrandc8
rename related8___7 relauntunc8
rename related8___8 relinlaw8
rename related8___9 relothrel8
rename related8___10 relcowork8
rename related8___11 relneigh8
rename related8___12 relfriend8
rename related8___13 relboss8
rename related8___14 relemploy8
rename related8___15 relschool8
rename related8___16 rellawyer8
rename related8___17 reldoctor8
rename related8___18 relothmed8
rename related8___19 relmental8
rename related8___20 relrelig8
rename related8___21 relchurch8
rename related8___22 relclub8
rename related8___23 relleisure8

rename related9___1 relpartner9
rename related9___2 relparent9
rename related9___3 relsibling9
rename related9___4 relchild9
rename related9___5 relgrandp9
rename related9___6 relgrandc9
rename related9___7 relauntunc9
rename related9___8 relinlaw9
rename related9___9 relothrel9
rename related9___10 relcowork9
rename related9___11 relneigh9
rename related9___12 relfriend9
rename related9___13 relboss9
rename related9___14 relemploy9
rename related9___15 relschool9
rename related9___16 rellawyer9
rename related9___17 reldoctor9
rename related9___18 relothmed9
rename related9___19 relmental9
rename related9___20 relrelig9
rename related9___21 relchurch9
rename related9___22 relclub9
rename related9___23 relleisure9

rename related10___1 relpartner10
rename related10___2 relparent10
rename related10___3 relsibling10
rename related10___4 relchild10
rename related10___5 relgrandp10
rename related10___6 relgrandc10
rename related10___7 relauntunc10
rename related10___8 relinlaw10
rename related10___9 relothrel10
rename related10___10 relcowork10
rename related10___11 relneigh10
rename related10___12 relfriend10
rename related10___13 relboss10
rename related10___14 relemploy10
rename related10___15 relschool10
rename related10___16 rellawyer10
rename related10___17 reldoctor10
rename related10___18 relothmed10
rename related10___19 relmental10
rename related10___20 relrelig10
rename related10___21 relchurch10
rename related10___22 relclub10
rename related10___23 relleisure10

rename related11___1 relpartner11
rename related11___2 relparent11
rename related11___3 relsibling11
rename related11___4 relchild11
rename related11___5 relgrandp11
rename related11___6 relgrandc11
rename related11___7 relauntunc11
rename related11___8 relinlaw11
rename related11___9 relothrel11
rename related11___10 relcowork11
rename related11___11 relneigh11
rename related11___12 relfriend11
rename related11___13 relboss11
rename related11___14 relemploy11
rename related11___15 relschool11
rename related11___16 rellawyer11
rename related11___17 reldoctor11
rename related11___18 relothmed11
rename related11___19 relmental11
rename related11___20 relrelig11
rename related11___21 relchurch11
rename related11___22 relclub11
rename related11___23 relleisure11

rename related12___1 relpartner12
rename related12___2 relparent12
rename related12___3 relsibling12
rename related12___4 relchild12
rename related12___5 relgrandp12
rename related12___6 relgrandc12
rename related12___7 relauntunc12
rename related12___8 relinlaw12
rename related12___9 relothrel12
rename related12___10 relcowork12
rename related12___11 relneigh12
rename related12___12 relfriend12
rename related12___13 relboss12
rename related12___14 relemploy12
rename related12___15 relschool12
rename related12___16 rellawyer12
rename related12___17 reldoctor12
rename related12___18 relothmed12
rename related12___19 relmental12
rename related12___20 relrelig12
rename related12___21 relchurch12
rename related12___22 relclub12
rename related12___23 relleisure12

rename related13___1 relpartner13
rename related13___2 relparent13
rename related13___3 relsibling13
rename related13___4 relchild13
rename related13___5 relgrandp13
rename related13___6 relgrandc13
rename related13___7 relauntunc13
rename related13___8 relinlaw13
rename related13___9 relothrel13
rename related13___10 relcowork13
rename related13___11 relneigh13
rename related13___12 relfriend13
rename related13___13 relboss13
rename related13___14 relemploy13
rename related13___15 relschool13
rename related13___16 rellawyer13
rename related13___17 reldoctor13
rename related13___18 relothmed13
rename related13___19 relmental13
rename related13___20 relrelig13
rename related13___21 relchurch13
rename related13___22 relclub13
rename related13___23 relleisure13

rename related14___1 relpartner14
rename related14___2 relparent14
rename related14___3 relsibling14
rename related14___4 relchild14
rename related14___5 relgrandp14
rename related14___6 relgrandc14
rename related14___7 relauntunc14
rename related14___8 relinlaw14
rename related14___9 relothrel14
rename related14___10 relcowork14
rename related14___11 relneigh14
rename related14___12 relfriend14
rename related14___13 relboss14
rename related14___14 relemploy14
rename related14___15 relschool14
rename related14___16 rellawyer14
rename related14___17 reldoctor14
rename related14___18 relothmed14
rename related14___19 relmental14
rename related14___20 relrelig14
rename related14___21 relchurch14
rename related14___22 relclub14
rename related14___23 relleisure14

rename related15___1 relpartner15
rename related15___2 relparent15
rename related15___3 relsibling15
rename related15___4 relchild15
rename related15___5 relgrandp15
rename related15___6 relgrandc15
rename related15___7 relauntunc15
rename related15___8 relinlaw15
rename related15___9 relothrel15
rename related15___10 relcowork15
rename related15___11 relneigh15
rename related15___12 relfriend15
rename related15___13 relboss15
rename related15___14 relemploy15
rename related15___15 relschool15
rename related15___16 rellawyer15
rename related15___17 reldoctor15
rename related15___18 relothmed15
rename related15___19 relmental15
rename related15___20 relrelig15
rename related15___21 relchurch15
rename related15___22 relclub15
rename related15___23 relleisure15

rename related16___1 relpartner16
rename related16___2 relparent16
rename related16___3 relsibling16
rename related16___4 relchild16
rename related16___5 relgrandp16
rename related16___6 relgrandc16
rename related16___7 relauntunc16
rename related16___8 relinlaw16
rename related16___9 relothrel16
rename related16___10 relcowork16
rename related16___11 relneigh16
rename related16___12 relfriend16
rename related16___13 relboss16
rename related16___14 relemploy16
rename related16___15 relschool16
rename related16___16 rellawyer16
rename related16___17 reldoctor16
rename related16___18 relothmed16
rename related16___19 relmental16
rename related16___20 relrelig16
rename related16___21 relchurch16
rename related16___22 relclub16
rename related16___23 relleisure16

rename related17___1 relpartner17
rename related17___2 relparent17
rename related17___3 relsibling17
rename related17___4 relchild17
rename related17___5 relgrandp17
rename related17___6 relgrandc17
rename related17___7 relauntunc17
rename related17___8 relinlaw17
rename related17___9 relothrel17
rename related17___10 relcowork17
rename related17___11 relneigh17
rename related17___12 relfriend17
rename related17___13 relboss17
rename related17___14 relemploy17
rename related17___15 relschool17
rename related17___16 rellawyer17
rename related17___17 reldoctor17
rename related17___18 relothmed17
rename related17___19 relmental17
rename related17___20 relrelig17
rename related17___21 relchurch17
rename related17___22 relclub17
rename related17___23 relleisure17

rename related18___1 relpartner18
rename related18___2 relparent18
rename related18___3 relsibling18
rename related18___4 relchild18
rename related18___5 relgrandp18
rename related18___6 relgrandc18
rename related18___7 relauntunc18
rename related18___8 relinlaw18
rename related18___9 relothrel18
rename related18___10 relcowork18
rename related18___11 relneigh18
rename related18___12 relfriend18
rename related18___13 relboss18
rename related18___14 relemploy18
rename related18___15 relschool18
rename related18___16 rellawyer18
rename related18___17 reldoctor18
rename related18___18 relothmed18
rename related18___19 relmental18
rename related18___20 relrelig18
rename related18___21 relchurch18
rename related18___22 relclub18
rename related18___23 relleisure18

rename related19___1 relpartner19
rename related19___2 relparent19
rename related19___3 relsibling19
rename related19___4 relchild19
rename related19___5 relgrandp19
rename related19___6 relgrandc19
rename related19___7 relauntunc19
rename related19___8 relinlaw19
rename related19___9 relothrel19
rename related19___10 relcowork19
rename related19___11 relneigh19
rename related19___12 relfriend19
rename related19___13 relboss19
rename related19___14 relemploy19
rename related19___15 relschool19
rename related19___16 rellawyer19
rename related19___17 reldoctor19
rename related19___18 relothmed19
rename related19___19 relmental19
rename related19___20 relrelig19
rename related19___21 relchurch19
rename related19___22 relclub19
rename related19___23 relleisure19

rename related20___1 relpartner20
rename related20___2 relparent20
rename related20___3 relsibling20
rename related20___4 relchild20
rename related20___5 relgrandp20
rename related20___6 relgrandc20
rename related20___7 relauntunc20
rename related20___8 relinlaw20
rename related20___9 relothrel20
rename related20___10 relcowork20
rename related20___11 relneigh20
rename related20___12 relfriend20
rename related20___13 relboss20
rename related20___14 relemploy20
rename related20___15 relschool20
rename related20___16 rellawyer20
rename related20___17 reldoctor20
rename related20___18 relothmed20
rename related20___19 relmental20
rename related20___20 relrelig20
rename related20___21 relchurch20
rename related20___22 relclub20
rename related20___23 relleisure20


rename helped1___1 listen1
rename helped1___2 care1
rename helped1___3 advice1
rename helped1___4 chores1
rename helped1___5 loan1

rename helped2___1 listen2
rename helped2___2 care2
rename helped2___3 advice2
rename helped2___4 chores2
rename helped2___5 loan2

rename helped3___1 listen3
rename helped3___2 care3
rename helped3___3 advice3
rename helped3___4 chores3
rename helped3___5 loan3

rename helped4___1 listen4
rename helped4___2 care4
rename helped4___3 advice4
rename helped4___4 chores4
rename helped4___5 loan4

rename helped5___1 listen5
rename helped5___2 care5
rename helped5___3 advice5
rename helped5___4 chores5
rename helped5___5 loan5

rename helped6___1 listen6
rename helped6___2 care6
rename helped6___3 advice6
rename helped6___4 chores6
rename helped6___5 loan6

rename helped7___1 listen7
rename helped7___2 care7
rename helped7___3 advice7
rename helped7___4 chores7
rename helped7___5 loan7

rename helped8___1 listen8
rename helped8___2 care8
rename helped8___3 advice8
rename helped8___4 chores8
rename helped8___5 loan8

rename helped9___1 listen9
rename helped9___2 care9
rename helped9___3 advice9
rename helped9___4 chores9
rename helped9___5 loan9

rename helped10___1 listen10
rename helped10___2 care10
rename helped10___3 advice10
rename helped10___4 chores10
rename helped10___5 loan10

rename helped11___1 listen11
rename helped11___2 care11
rename helped11___3 advice11
rename helped11___4 chores11
rename helped11___5 loan11

rename helped12___1 listen12
rename helped12___2 care12
rename helped12___3 advice12
rename helped12___4 chores12
rename helped12___5 loan12

rename helped13___1 listen13
rename helped13___2 care13
rename helped13___3 advice13
rename helped13___4 chores13
rename helped13___5 loan13

rename helped14___1 listen14
rename helped14___2 care14
rename helped14___3 advice14
rename helped14___4 chores14
rename helped14___5 loan14

rename helped15___1 listen15
rename helped15___2 care15
rename helped15___3 advice15
rename helped15___4 chores15
rename helped15___5 loan15

rename helped16___1 listen16
rename helped16___2 care16
rename helped16___3 advice16
rename helped16___4 chores16
rename helped16___5 loan16

rename helped17___1 listen17
rename helped17___2 care17
rename helped17___3 advice17
rename helped17___4 chores17
rename helped17___5 loan17

rename helped18___1 listen18
rename helped18___2 care18
rename helped18___3 advice18
rename helped18___4 chores18
rename helped18___5 loan18

rename helped19___1 listen19
rename helped19___2 care19
rename helped19___3 advice19
rename helped19___4 chores19
rename helped19___5 loan19

rename helped20___1 listen20
rename helped20___2 care20
rename helped20___3 advice20
rename helped20___4 chores20
rename helped20___5 loan20

*drop people did not complete name gernarators (this step is needed so that they are not treated as 0 net size)
recode generators_complete interpreters_complete matrix_complete (0=.) //those complete indicators are not accurate, some cases says not completed but have names in the data
egen complete=rowmean(generators_complete interpreters_complete matrix_complete)
drop if missing(complete) & missing(name1)
drop complete

recode matrix_1_2-matrix_19_20 (1=3)(2=2)(3=1)(4=0) // 0 = do not know each other

egen npossties=rownonmiss(matrix_1_2-matrix_19_20)
egen totval=rowtotal(matrix_1_2-matrix_19_20),mi
gen density=totval/npossties
lab var density "Valued density of networks from matrix"

foreach x of varlist matrix_1_2-matrix_19_20 {
gen new`x'=`x'
}
recode matrix_1_2-matrix_19_20 (2/3=1)(0/1=0)
egen totnum=rowtotal(matrix_1_2-matrix_19_20),mi
gen bdensity=totnum/npossties
lab var bdensity "Density of networks close\very close"

recode newmatrix_1_2-newmatrix_19_20 (1/3=1)(0=0)
egen totnum1=rowtotal(newmatrix_1_2-newmatrix_19_20),mi
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"

egen sole=rowmin(newmatrix_1_2-newmatrix_19_20) 
recode sole (0=1) (1=0) //same as recode b1density (1=0)
lab var sole "Sole bridge status"

drop matrix_1_2-matrix_19_20 totnum newmatrix_1_2-newmatrix_19_20

tostring name* w1alter* w1reasondropspecify*,replace //prepare for reshape
reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong w1alter w1mention w1reasondrop w1reasondropspecify w1stillspeak ///
questiondoc education educationcoll, i(SUBID) j(TIEID)
replace name="" if name=="." // convert . into missing in string
replace w1alter="" if w1alter=="." // convert . into missing in string
replace w1reasondropspecify="" if w1reasondropspecify=="." // convert . into missing in string

sort SUBID TIEID


bysort SUBID: egen netsize=count(name)
lab var netsize "Total number of alters mentioned"

gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into  professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"

bysort SUBID: egen nkin=total(tkin)
bysort SUBID: egen nfriend=total(tfriend)
gen fkratio=(nfriend+1)/(nkin+1)
replace fkratio=. if netsize==0
lab var fkratio "Ratio of friends to kin"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"

drop seetalkr

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network"
gen knowaboutr=knowabout
recode knowaboutr (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutr)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE"
drop knowaboutr

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
drop trustdoctorsr

gen tquestion=questiondoc //new variable for wave2
recode tquestion (99=.)
bysort SUBID:  egen mquestion=mean(tquestion)
lab var mquestion "Mean questions doctors in network, HI=MORE"

recode education educationcoll (99=.)(8=.) //new variable for wave2
gen tcollege=0
replace tcollege=1 if education>4 | educationcoll==1
replace tcollege=. if education==. & educationcoll==.
lab var tcollege "Alter educ is college (Bachelor's) degree or higher"
bysort SUBID: egen pcollege=mean(tcollege)
lab var pcollege "Prop of alters with Bachelor's degree in network"

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

revrs difficult, replace //reverse code
bysort SUBID: egen mhassles=mean(difficult)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode difficult (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE)
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength"

egen qol=rowmean(health-whole)
lab var qol "Quality of life scale, HI=BETTER"

drop interpreters_complete matrix_complete quality_of_life_complete npossties totval dup record_id redcap_data_access_group w2error totnum1

gen time=2

save "SNAD-Participant-T2-CleanB-LONG-062519.dta", replace

duplicates drop SUBID, force

drop TIEID name-strong w1alter-w1stillspeak imd-educationcoll tquestion tfem tkin tfriend tquestion tclose tfreq tknow difficult thassles numsup ttrust tcollege  //drop alter level variables

save "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta", replace





***************************************************************
//	#3 Clean SNAD participant T3
***************************************************************
use "SNAD-Participant-T3-062519.dta", clear

rename studyid SUBID

drop if SUBID=="8888888888test" | SUBID=="" //cases with no valid info
destring SUBID, replace

duplicates list SUBID
sort SUBID

rename generator1___1 imd1
rename generator1___2 imr1
rename generator1___3 imb1
rename generator1___4 hmd1
rename generator1___5 hmr1
rename generator1___6 hmb1

rename generator2___1 imd2
rename generator2___2 imr2
rename generator2___3 imb2
rename generator2___4 hmd2
rename generator2___5 hmr2
rename generator2___6 hmb2

rename generator3___1 imd3
rename generator3___2 imr3
rename generator3___3 imb3
rename generator3___4 hmd3
rename generator3___5 hmr3
rename generator3___6 hmb3

rename generator4___1 imd4
rename generator4___2 imr4
rename generator4___3 imb4
rename generator4___4 hmd4
rename generator4___5 hmr4
rename generator4___6 hmb4

rename generator5___1 imd5
rename generator5___2 imr5
rename generator5___3 imb5
rename generator5___4 hmd5
rename generator5___5 hmr5
rename generator5___6 hmb5

rename generator6___1 imd6
rename generator6___2 imr6
rename generator6___3 imb6
rename generator6___4 hmd6
rename generator6___5 hmr6
rename generator6___6 hmb6

rename generator7___1 imd7
rename generator7___2 imr7
rename generator7___3 imb7
rename generator7___4 hmd7
rename generator7___5 hmr7
rename generator7___6 hmb7

rename generator8___1 imd8
rename generator8___2 imr8
rename generator8___3 imb8
rename generator8___4 hmd8
rename generator8___5 hmr8
rename generator8___6 hmb8

rename generator9___1 imd9
rename generator9___2 imr9
rename generator9___3 imb9
rename generator9___4 hmd9
rename generator9___5 hmr9
rename generator9___6 hmb9

rename generator10___1 imd10
rename generator10___2 imr10
rename generator10___3 imb10
rename generator10___4 hmd10
rename generator10___5 hmr10
rename generator10___6 hmb10

rename generator11___1 imd11
rename generator11___2 imr11
rename generator11___3 imb11
rename generator11___4 hmd11
rename generator11___5 hmr11
rename generator11___6 hmb11

rename generator12___1 imd12
rename generator12___2 imr12
rename generator12___3 imb12
rename generator12___4 hmd12
rename generator12___5 hmr12
rename generator12___6 hmb12

rename generator13___1 imd13
rename generator13___2 imr13
rename generator13___3 imb13
rename generator13___4 hmd13
rename generator13___5 hmr13
rename generator13___6 hmb13

rename generator14___1 imd14
rename generator14___2 imr14
rename generator14___3 imb14
rename generator14___4 hmd14
rename generator14___5 hmr14
rename generator14___6 hmb14

rename generator15___1 imd15
rename generator15___2 imr15
rename generator15___3 imb15
rename generator15___4 hmd15
rename generator15___5 hmr15
rename generator15___6 hmb15

rename generator16___1 imd16
rename generator16___2 imr16
rename generator16___3 imb16
rename generator16___4 hmd16
rename generator16___5 hmr16
rename generator16___6 hmb16

rename generator17___1 imd17
rename generator17___2 imr17
rename generator17___3 imb17
rename generator17___4 hmd17
rename generator17___5 hmr17
rename generator17___6 hmb17

rename generator18___1 imd18
rename generator18___2 imr18
rename generator18___3 imb18
rename generator18___4 hmd18
rename generator18___5 hmr18
rename generator18___6 hmb18

rename generator120___1 imd19
rename generator120___2 imr19
rename generator120___3 imb19
rename generator120___4 hmd19
rename generator120___5 hmr19
rename generator120___6 hmb19

rename generator20___1 imd20
rename generator20___2 imr20
rename generator20___3 imb20
rename generator20___4 hmd20
rename generator20___5 hmr20
rename generator20___6 hmb20


rename related1___1 relpartner1
rename related1___2 relparent1
rename related1___3 relsibling1
rename related1___4 relchild1
rename related1___5 relgrandp1
rename related1___6 relgrandc1
rename related1___7 relauntunc1
rename related1___8 relinlaw1
rename related1___9 relothrel1
rename related1___10 relcowork1
rename related1___11 relneigh1
rename related1___12 relfriend1
rename related1___13 relboss1
rename related1___14 relemploy1
rename related1___15 relschool1
rename related1___16 rellawyer1
rename related1___17 reldoctor1
rename related1___18 relothmed1
rename related1___19 relmental1
rename related1___20 relrelig1
rename related1___21 relchurch1
rename related1___22 relclub1
rename related1___23 relleisure1

rename related2___1 relpartner2
rename related2___2 relparent2
rename related2___3 relsibling2
rename related2___4 relchild2
rename related2___5 relgrandp2
rename related2___6 relgrandc2
rename related2___7 relauntunc2
rename related2___8 relinlaw2
rename related2___9 relothrel2
rename related2___10 relcowork2
rename related2___11 relneigh2
rename related2___12 relfriend2
rename related2___13 relboss2
rename related2___14 relemploy2
rename related2___15 relschool2
rename related2___16 rellawyer2
rename related2___17 reldoctor2
rename related2___18 relothmed2
rename related2___19 relmental2
rename related2___20 relrelig2
rename related2___21 relchurch2
rename related2___22 relclub2
rename related2___23 relleisure2

rename related3___1 relpartner3
rename related3___2 relparent3
rename related3___3 relsibling3
rename related3___4 relchild3
rename related3___5 relgrandp3
rename related3___6 relgrandc3
rename related3___7 relauntunc3
rename related3___8 relinlaw3
rename related3___9 relothrel3
rename related3___10 relcowork3
rename related3___11 relneigh3
rename related3___12 relfriend3
rename related3___13 relboss3
rename related3___14 relemploy3
rename related3___15 relschool3
rename related3___16 rellawyer3
rename related3___17 reldoctor3
rename related3___18 relothmed3
rename related3___19 relmental3
rename related3___20 relrelig3
rename related3___21 relchurch3
rename related3___22 relclub3
rename related3___23 relleisure3

rename related4___1 relpartner4
rename related4___2 relparent4
rename related4___3 relsibling4
rename related4___4 relchild4
rename related4___5 relgrandp4
rename related4___6 relgrandc4
rename related4___7 relauntunc4
rename related4___8 relinlaw4
rename related4___9 relothrel4
rename related4___10 relcowork4
rename related4___11 relneigh4
rename related4___12 relfriend4
rename related4___13 relboss4
rename related4___14 relemploy4
rename related4___15 relschool4
rename related4___16 rellawyer4
rename related4___17 reldoctor4
rename related4___18 relothmed4
rename related4___19 relmental4
rename related4___20 relrelig4
rename related4___21 relchurch4
rename related4___22 relclub4
rename related4___23 relleisure4

rename related5___1 relpartner5
rename related5___2 relparent5
rename related5___3 relsibling5
rename related5___4 relchild5
rename related5___5 relgrandp5
rename related5___6 relgrandc5
rename related5___7 relauntunc5
rename related5___8 relinlaw5
rename related5___9 relothrel5
rename related5___10 relcowork5
rename related5___11 relneigh5
rename related5___12 relfriend5
rename related5___13 relboss5
rename related5___14 relemploy5
rename related5___15 relschool5
rename related5___16 rellawyer5
rename related5___17 reldoctor5
rename related5___18 relothmed5
rename related5___19 relmental5
rename related5___20 relrelig5
rename related5___21 relchurch5
rename related5___22 relclub5
rename related5___23 relleisure5

rename related6___1 relpartner6
rename related6___2 relparent6
rename related6___3 relsibling6
rename related6___4 relchild6
rename related6___5 relgrandp6
rename related6___6 relgrandc6
rename related6___7 relauntunc6
rename related6___8 relinlaw6
rename related6___9 relothrel6
rename related6___10 relcowork6
rename related6___11 relneigh6
rename related6___12 relfriend6
rename related6___13 relboss6
rename related6___14 relemploy6
rename related6___15 relschool6
rename related6___16 rellawyer6
rename related6___17 reldoctor6
rename related6___18 relothmed6
rename related6___19 relmental6
rename related6___20 relrelig6
rename related6___21 relchurch6
rename related6___22 relclub6
rename related6___23 relleisure6

rename related7___1 relpartner7
rename related7___2 relparent7
rename related7___3 relsibling7
rename related7___4 relchild7
rename related7___5 relgrandp7
rename related7___6 relgrandc7
rename related7___7 relauntunc7
rename related7___8 relinlaw7
rename related7___9 relothrel7
rename related7___10 relcowork7
rename related7___11 relneigh7
rename related7___12 relfriend7
rename related7___13 relboss7
rename related7___14 relemploy7
rename related7___15 relschool7
rename related7___16 rellawyer7
rename related7___17 reldoctor7
rename related7___18 relothmed7
rename related7___19 relmental7
rename related7___20 relrelig7
rename related7___21 relchurch7
rename related7___22 relclub7
rename related7___23 relleisure7

rename related8___1 relpartner8
rename related8___2 relparent8
rename related8___3 relsibling8
rename related8___4 relchild8
rename related8___5 relgrandp8
rename related8___6 relgrandc8
rename related8___7 relauntunc8
rename related8___8 relinlaw8
rename related8___9 relothrel8
rename related8___10 relcowork8
rename related8___11 relneigh8
rename related8___12 relfriend8
rename related8___13 relboss8
rename related8___14 relemploy8
rename related8___15 relschool8
rename related8___16 rellawyer8
rename related8___17 reldoctor8
rename related8___18 relothmed8
rename related8___19 relmental8
rename related8___20 relrelig8
rename related8___21 relchurch8
rename related8___22 relclub8
rename related8___23 relleisure8

rename related9___1 relpartner9
rename related9___2 relparent9
rename related9___3 relsibling9
rename related9___4 relchild9
rename related9___5 relgrandp9
rename related9___6 relgrandc9
rename related9___7 relauntunc9
rename related9___8 relinlaw9
rename related9___9 relothrel9
rename related9___10 relcowork9
rename related9___11 relneigh9
rename related9___12 relfriend9
rename related9___13 relboss9
rename related9___14 relemploy9
rename related9___15 relschool9
rename related9___16 rellawyer9
rename related9___17 reldoctor9
rename related9___18 relothmed9
rename related9___19 relmental9
rename related9___20 relrelig9
rename related9___21 relchurch9
rename related9___22 relclub9
rename related9___23 relleisure9

rename related10___1 relpartner10
rename related10___2 relparent10
rename related10___3 relsibling10
rename related10___4 relchild10
rename related10___5 relgrandp10
rename related10___6 relgrandc10
rename related10___7 relauntunc10
rename related10___8 relinlaw10
rename related10___9 relothrel10
rename related10___10 relcowork10
rename related10___11 relneigh10
rename related10___12 relfriend10
rename related10___13 relboss10
rename related10___14 relemploy10
rename related10___15 relschool10
rename related10___16 rellawyer10
rename related10___17 reldoctor10
rename related10___18 relothmed10
rename related10___19 relmental10
rename related10___20 relrelig10
rename related10___21 relchurch10
rename related10___22 relclub10
rename related10___23 relleisure10

rename related11___1 relpartner11
rename related11___2 relparent11
rename related11___3 relsibling11
rename related11___4 relchild11
rename related11___5 relgrandp11
rename related11___6 relgrandc11
rename related11___7 relauntunc11
rename related11___8 relinlaw11
rename related11___9 relothrel11
rename related11___10 relcowork11
rename related11___11 relneigh11
rename related11___12 relfriend11
rename related11___13 relboss11
rename related11___14 relemploy11
rename related11___15 relschool11
rename related11___16 rellawyer11
rename related11___17 reldoctor11
rename related11___18 relothmed11
rename related11___19 relmental11
rename related11___20 relrelig11
rename related11___21 relchurch11
rename related11___22 relclub11
rename related11___23 relleisure11

rename related12___1 relpartner12
rename related12___2 relparent12
rename related12___3 relsibling12
rename related12___4 relchild12
rename related12___5 relgrandp12
rename related12___6 relgrandc12
rename related12___7 relauntunc12
rename related12___8 relinlaw12
rename related12___9 relothrel12
rename related12___10 relcowork12
rename related12___11 relneigh12
rename related12___12 relfriend12
rename related12___13 relboss12
rename related12___14 relemploy12
rename related12___15 relschool12
rename related12___16 rellawyer12
rename related12___17 reldoctor12
rename related12___18 relothmed12
rename related12___19 relmental12
rename related12___20 relrelig12
rename related12___21 relchurch12
rename related12___22 relclub12
rename related12___23 relleisure12

rename related13___1 relpartner13
rename related13___2 relparent13
rename related13___3 relsibling13
rename related13___4 relchild13
rename related13___5 relgrandp13
rename related13___6 relgrandc13
rename related13___7 relauntunc13
rename related13___8 relinlaw13
rename related13___9 relothrel13
rename related13___10 relcowork13
rename related13___11 relneigh13
rename related13___12 relfriend13
rename related13___13 relboss13
rename related13___14 relemploy13
rename related13___15 relschool13
rename related13___16 rellawyer13
rename related13___17 reldoctor13
rename related13___18 relothmed13
rename related13___19 relmental13
rename related13___20 relrelig13
rename related13___21 relchurch13
rename related13___22 relclub13
rename related13___23 relleisure13

rename related14___1 relpartner14
rename related14___2 relparent14
rename related14___3 relsibling14
rename related14___4 relchild14
rename related14___5 relgrandp14
rename related14___6 relgrandc14
rename related14___7 relauntunc14
rename related14___8 relinlaw14
rename related14___9 relothrel14
rename related14___10 relcowork14
rename related14___11 relneigh14
rename related14___12 relfriend14
rename related14___13 relboss14
rename related14___14 relemploy14
rename related14___15 relschool14
rename related14___16 rellawyer14
rename related14___17 reldoctor14
rename related14___18 relothmed14
rename related14___19 relmental14
rename related14___20 relrelig14
rename related14___21 relchurch14
rename related14___22 relclub14
rename related14___23 relleisure14

rename related15___1 relpartner15
rename related15___2 relparent15
rename related15___3 relsibling15
rename related15___4 relchild15
rename related15___5 relgrandp15
rename related15___6 relgrandc15
rename related15___7 relauntunc15
rename related15___8 relinlaw15
rename related15___9 relothrel15
rename related15___10 relcowork15
rename related15___11 relneigh15
rename related15___12 relfriend15
rename related15___13 relboss15
rename related15___14 relemploy15
rename related15___15 relschool15
rename related15___16 rellawyer15
rename related15___17 reldoctor15
rename related15___18 relothmed15
rename related15___19 relmental15
rename related15___20 relrelig15
rename related15___21 relchurch15
rename related15___22 relclub15
rename related15___23 relleisure15

rename related16___1 relpartner16
rename related16___2 relparent16
rename related16___3 relsibling16
rename related16___4 relchild16
rename related16___5 relgrandp16
rename related16___6 relgrandc16
rename related16___7 relauntunc16
rename related16___8 relinlaw16
rename related16___9 relothrel16
rename related16___10 relcowork16
rename related16___11 relneigh16
rename related16___12 relfriend16
rename related16___13 relboss16
rename related16___14 relemploy16
rename related16___15 relschool16
rename related16___16 rellawyer16
rename related16___17 reldoctor16
rename related16___18 relothmed16
rename related16___19 relmental16
rename related16___20 relrelig16
rename related16___21 relchurch16
rename related16___22 relclub16
rename related16___23 relleisure16

rename related17___1 relpartner17
rename related17___2 relparent17
rename related17___3 relsibling17
rename related17___4 relchild17
rename related17___5 relgrandp17
rename related17___6 relgrandc17
rename related17___7 relauntunc17
rename related17___8 relinlaw17
rename related17___9 relothrel17
rename related17___10 relcowork17
rename related17___11 relneigh17
rename related17___12 relfriend17
rename related17___13 relboss17
rename related17___14 relemploy17
rename related17___15 relschool17
rename related17___16 rellawyer17
rename related17___17 reldoctor17
rename related17___18 relothmed17
rename related17___19 relmental17
rename related17___20 relrelig17
rename related17___21 relchurch17
rename related17___22 relclub17
rename related17___23 relleisure17

rename related18___1 relpartner18
rename related18___2 relparent18
rename related18___3 relsibling18
rename related18___4 relchild18
rename related18___5 relgrandp18
rename related18___6 relgrandc18
rename related18___7 relauntunc18
rename related18___8 relinlaw18
rename related18___9 relothrel18
rename related18___10 relcowork18
rename related18___11 relneigh18
rename related18___12 relfriend18
rename related18___13 relboss18
rename related18___14 relemploy18
rename related18___15 relschool18
rename related18___16 rellawyer18
rename related18___17 reldoctor18
rename related18___18 relothmed18
rename related18___19 relmental18
rename related18___20 relrelig18
rename related18___21 relchurch18
rename related18___22 relclub18
rename related18___23 relleisure18

rename related19___1 relpartner19
rename related19___2 relparent19
rename related19___3 relsibling19
rename related19___4 relchild19
rename related19___5 relgrandp19
rename related19___6 relgrandc19
rename related19___7 relauntunc19
rename related19___8 relinlaw19
rename related19___9 relothrel19
rename related19___10 relcowork19
rename related19___11 relneigh19
rename related19___12 relfriend19
rename related19___13 relboss19
rename related19___14 relemploy19
rename related19___15 relschool19
rename related19___16 rellawyer19
rename related19___17 reldoctor19
rename related19___18 relothmed19
rename related19___19 relmental19
rename related19___20 relrelig19
rename related19___21 relchurch19
rename related19___22 relclub19
rename related19___23 relleisure19

rename related20___1 relpartner20
rename related20___2 relparent20
rename related20___3 relsibling20
rename related20___4 relchild20
rename related20___5 relgrandp20
rename related20___6 relgrandc20
rename related20___7 relauntunc20
rename related20___8 relinlaw20
rename related20___9 relothrel20
rename related20___10 relcowork20
rename related20___11 relneigh20
rename related20___12 relfriend20
rename related20___13 relboss20
rename related20___14 relemploy20
rename related20___15 relschool20
rename related20___16 rellawyer20
rename related20___17 reldoctor20
rename related20___18 relothmed20
rename related20___19 relmental20
rename related20___20 relrelig20
rename related20___21 relchurch20
rename related20___22 relclub20
rename related20___23 relleisure20


rename helped1___1 listen1
rename helped1___2 care1
rename helped1___3 advice1
rename helped1___4 chores1
rename helped1___5 loan1

rename helped2___1 listen2
rename helped2___2 care2
rename helped2___3 advice2
rename helped2___4 chores2
rename helped2___5 loan2

rename helped3___1 listen3
rename helped3___2 care3
rename helped3___3 advice3
rename helped3___4 chores3
rename helped3___5 loan3

rename helped4___1 listen4
rename helped4___2 care4
rename helped4___3 advice4
rename helped4___4 chores4
rename helped4___5 loan4

rename helped5___1 listen5
rename helped5___2 care5
rename helped5___3 advice5
rename helped5___4 chores5
rename helped5___5 loan5

rename helped6___1 listen6
rename helped6___2 care6
rename helped6___3 advice6
rename helped6___4 chores6
rename helped6___5 loan6

rename helped7___1 listen7
rename helped7___2 care7
rename helped7___3 advice7
rename helped7___4 chores7
rename helped7___5 loan7

rename helped8___1 listen8
rename helped8___2 care8
rename helped8___3 advice8
rename helped8___4 chores8
rename helped8___5 loan8

rename helped9___1 listen9
rename helped9___2 care9
rename helped9___3 advice9
rename helped9___4 chores9
rename helped9___5 loan9

rename helped10___1 listen10
rename helped10___2 care10
rename helped10___3 advice10
rename helped10___4 chores10
rename helped10___5 loan10

rename helped11___1 listen11
rename helped11___2 care11
rename helped11___3 advice11
rename helped11___4 chores11
rename helped11___5 loan11

rename helped12___1 listen12
rename helped12___2 care12
rename helped12___3 advice12
rename helped12___4 chores12
rename helped12___5 loan12

rename helped13___1 listen13
rename helped13___2 care13
rename helped13___3 advice13
rename helped13___4 chores13
rename helped13___5 loan13

rename helped14___1 listen14
rename helped14___2 care14
rename helped14___3 advice14
rename helped14___4 chores14
rename helped14___5 loan14

rename helped15___1 listen15
rename helped15___2 care15
rename helped15___3 advice15
rename helped15___4 chores15
rename helped15___5 loan15

rename helped16___1 listen16
rename helped16___2 care16
rename helped16___3 advice16
rename helped16___4 chores16
rename helped16___5 loan16

rename helped17___1 listen17
rename helped17___2 care17
rename helped17___3 advice17
rename helped17___4 chores17
rename helped17___5 loan17

rename helped18___1 listen18
rename helped18___2 care18
rename helped18___3 advice18
rename helped18___4 chores18
rename helped18___5 loan18

rename helped19___1 listen19
rename helped19___2 care19
rename helped19___3 advice19
rename helped19___4 chores19
rename helped19___5 loan19

rename helped20___1 listen20
rename helped20___2 care20
rename helped20___3 advice20
rename helped20___4 chores20
rename helped20___5 loan20

*drop people did not complete name gernarators (this step is needed so that they are not treated as 0 net size)
recode generators_complete interpreters_complete matrix_complete (0=.) //those complete indicators are not accurate, some cases says not completed but have names in the data
egen complete=rowmean(generators_complete interpreters_complete matrix_complete)
drop if missing(complete) & missing(name1)
drop complete

recode matrix_1_2-matrix_19_20 (1=3)(2=2)(3=1)(4=0) // 0 = do not know each other

egen npossties=rownonmiss(matrix_1_2-matrix_19_20)
egen totval=rowtotal(matrix_1_2-matrix_19_20),mi
gen density=totval/npossties
lab var density "Valued density of networks from matrix"

foreach x of varlist matrix_1_2-matrix_19_20 {
gen new`x'=`x'
}
recode matrix_1_2-matrix_19_20 (2/3=1)(0/1=0)
egen totnum=rowtotal(matrix_1_2-matrix_19_20),mi
gen bdensity=totnum/npossties
lab var bdensity "Density of networks close\very close"

recode newmatrix_1_2-newmatrix_19_20 (1/3=1)(0=0)
egen totnum1=rowtotal(newmatrix_1_2-newmatrix_19_20),mi
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"

egen sole=rowmin(newmatrix_1_2-newmatrix_19_20) 
recode sole (0=1) (1=0) //same as recode b1density (1=0)
lab var sole "Sole bridge status"

drop matrix_1_2-matrix_19_20 totnum newmatrix_1_2-newmatrix_19_20

tostring name* w2alter* w2reasondropspecify*,replace //prepare for reshape
reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong w2alter w2mention w2reasondrop w2reasondropspecify w2stillspeak ///
questiondoc education educationcoll, i(SUBID) j(TIEID)
replace name="" if name=="." // convert . into missing in string
replace w2alter="" if w2alter=="." // convert . into missing in string
replace w2reasondropspecify="" if w2reasondropspecify=="." // convert . into missing in string

sort SUBID TIEID


bysort SUBID: egen netsize=count(name)
lab var netsize "Total number of alters mentioned"

gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into  professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity"


gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"

bysort SUBID: egen nkin=total(tkin)
bysort SUBID: egen nfriend=total(tfriend)
gen fkratio=(nfriend+1)/(nkin+1)
replace fkratio=. if netsize==0
lab var fkratio "Ratio of friends to kin"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"

drop seetalkr

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network"
gen knowaboutr=knowabout
recode knowaboutr (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutr)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE"
drop knowaboutr

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
drop trustdoctorsr

gen tquestion=questiondoc //new variable for wave2
recode tquestion (99=.)
bysort SUBID:  egen mquestion=mean(tquestion)
lab var mquestion "Mean questions doctors in network, HI=MORE"

recode education educationcoll (99=.)(8=.) //new variable for wave2
gen tcollege=0
replace tcollege=1 if education>4 | educationcoll==1
replace tcollege=. if education==. & educationcoll==.
lab var tcollege "Alter educ is college (Bachelor's) degree or higher"
bysort SUBID: egen pcollege=mean(tcollege)
lab var pcollege "Prop of alters with Bachelor's degree in network"

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

revrs difficult, replace //reverse code
bysort SUBID: egen mhassles=mean(difficult)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode difficult (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE)
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength"

egen qol=rowmean(health-whole)
lab var qol "Quality of life scale, HI=BETTER"

drop interpreters_complete matrix_complete quality_of_life_complete npossties totval record_id totnum1 

gen time=3

save "SNAD-Participant-T3-CleanB-LONG-062519.dta", replace

duplicates drop SUBID, force

drop TIEID name-strong w2alter-w2stillspeak imd-educationcoll tquestion tfem tkin tfriend tquestion tclose tfreq tknow numsup difficult thassles ttrust tcollege  //drop alter level variables

save "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta", replace



***************************************************************
//	#3 Clean SNAD participant T4
***************************************************************
use "SNAD-Participant-T4-092520.dta", clear

rename studyid SUBID
destring SUBID, replace
duplicates list SUBID
sort SUBID

rename generator1___1 imd1
rename generator1___2 imr1
rename generator1___3 imb1
rename generator1___4 hmd1
rename generator1___5 hmr1
rename generator1___6 hmb1

rename generator2___1 imd2
rename generator2___2 imr2
rename generator2___3 imb2
rename generator2___4 hmd2
rename generator2___5 hmr2
rename generator2___6 hmb2

rename generator3___1 imd3
rename generator3___2 imr3
rename generator3___3 imb3
rename generator3___4 hmd3
rename generator3___5 hmr3
rename generator3___6 hmb3

rename generator4___1 imd4
rename generator4___2 imr4
rename generator4___3 imb4
rename generator4___4 hmd4
rename generator4___5 hmr4
rename generator4___6 hmb4

rename generator5___1 imd5
rename generator5___2 imr5
rename generator5___3 imb5
rename generator5___4 hmd5
rename generator5___5 hmr5
rename generator5___6 hmb5

rename generator6___1 imd6
rename generator6___2 imr6
rename generator6___3 imb6
rename generator6___4 hmd6
rename generator6___5 hmr6
rename generator6___6 hmb6

rename generator7___1 imd7
rename generator7___2 imr7
rename generator7___3 imb7
rename generator7___4 hmd7
rename generator7___5 hmr7
rename generator7___6 hmb7

rename generator8___1 imd8
rename generator8___2 imr8
rename generator8___3 imb8
rename generator8___4 hmd8
rename generator8___5 hmr8
rename generator8___6 hmb8

rename generator9___1 imd9
rename generator9___2 imr9
rename generator9___3 imb9
rename generator9___4 hmd9
rename generator9___5 hmr9
rename generator9___6 hmb9

rename generator10___1 imd10
rename generator10___2 imr10
rename generator10___3 imb10
rename generator10___4 hmd10
rename generator10___5 hmr10
rename generator10___6 hmb10

rename generator11___1 imd11
rename generator11___2 imr11
rename generator11___3 imb11
rename generator11___4 hmd11
rename generator11___5 hmr11
rename generator11___6 hmb11

rename generator12___1 imd12
rename generator12___2 imr12
rename generator12___3 imb12
rename generator12___4 hmd12
rename generator12___5 hmr12
rename generator12___6 hmb12

rename generator13___1 imd13
rename generator13___2 imr13
rename generator13___3 imb13
rename generator13___4 hmd13
rename generator13___5 hmr13
rename generator13___6 hmb13

rename generator14___1 imd14
rename generator14___2 imr14
rename generator14___3 imb14
rename generator14___4 hmd14
rename generator14___5 hmr14
rename generator14___6 hmb14

rename generator15___1 imd15
rename generator15___2 imr15
rename generator15___3 imb15
rename generator15___4 hmd15
rename generator15___5 hmr15
rename generator15___6 hmb15

rename generator16___1 imd16
rename generator16___2 imr16
rename generator16___3 imb16
rename generator16___4 hmd16
rename generator16___5 hmr16
rename generator16___6 hmb16

rename generator17___1 imd17
rename generator17___2 imr17
rename generator17___3 imb17
rename generator17___4 hmd17
rename generator17___5 hmr17
rename generator17___6 hmb17

rename generator18___1 imd18
rename generator18___2 imr18
rename generator18___3 imb18
rename generator18___4 hmd18
rename generator18___5 hmr18
rename generator18___6 hmb18

rename generator120___1 imd19
rename generator120___2 imr19
rename generator120___3 imb19
rename generator120___4 hmd19
rename generator120___5 hmr19
rename generator120___6 hmb19

rename generator20___1 imd20
rename generator20___2 imr20
rename generator20___3 imb20
rename generator20___4 hmd20
rename generator20___5 hmr20
rename generator20___6 hmb20


rename related1___1 relpartner1
rename related1___2 relparent1
rename related1___3 relsibling1
rename related1___4 relchild1
rename related1___5 relgrandp1
rename related1___6 relgrandc1
rename related1___7 relauntunc1
rename related1___8 relinlaw1
rename related1___9 relothrel1
rename related1___10 relcowork1
rename related1___11 relneigh1
rename related1___12 relfriend1
rename related1___13 relboss1
rename related1___14 relemploy1
rename related1___15 relschool1
rename related1___16 rellawyer1
rename related1___17 reldoctor1
rename related1___18 relothmed1
rename related1___19 relmental1
rename related1___20 relrelig1
rename related1___21 relchurch1
rename related1___22 relclub1
rename related1___23 relleisure1

rename related2___1 relpartner2
rename related2___2 relparent2
rename related2___3 relsibling2
rename related2___4 relchild2
rename related2___5 relgrandp2
rename related2___6 relgrandc2
rename related2___7 relauntunc2
rename related2___8 relinlaw2
rename related2___9 relothrel2
rename related2___10 relcowork2
rename related2___11 relneigh2
rename related2___12 relfriend2
rename related2___13 relboss2
rename related2___14 relemploy2
rename related2___15 relschool2
rename related2___16 rellawyer2
rename related2___17 reldoctor2
rename related2___18 relothmed2
rename related2___19 relmental2
rename related2___20 relrelig2
rename related2___21 relchurch2
rename related2___22 relclub2
rename related2___23 relleisure2

rename related3___1 relpartner3
rename related3___2 relparent3
rename related3___3 relsibling3
rename related3___4 relchild3
rename related3___5 relgrandp3
rename related3___6 relgrandc3
rename related3___7 relauntunc3
rename related3___8 relinlaw3
rename related3___9 relothrel3
rename related3___10 relcowork3
rename related3___11 relneigh3
rename related3___12 relfriend3
rename related3___13 relboss3
rename related3___14 relemploy3
rename related3___15 relschool3
rename related3___16 rellawyer3
rename related3___17 reldoctor3
rename related3___18 relothmed3
rename related3___19 relmental3
rename related3___20 relrelig3
rename related3___21 relchurch3
rename related3___22 relclub3
rename related3___23 relleisure3

rename related4___1 relpartner4
rename related4___2 relparent4
rename related4___3 relsibling4
rename related4___4 relchild4
rename related4___5 relgrandp4
rename related4___6 relgrandc4
rename related4___7 relauntunc4
rename related4___8 relinlaw4
rename related4___9 relothrel4
rename related4___10 relcowork4
rename related4___11 relneigh4
rename related4___12 relfriend4
rename related4___13 relboss4
rename related4___14 relemploy4
rename related4___15 relschool4
rename related4___16 rellawyer4
rename related4___17 reldoctor4
rename related4___18 relothmed4
rename related4___19 relmental4
rename related4___20 relrelig4
rename related4___21 relchurch4
rename related4___22 relclub4
rename related4___23 relleisure4

rename related5___1 relpartner5
rename related5___2 relparent5
rename related5___3 relsibling5
rename related5___4 relchild5
rename related5___5 relgrandp5
rename related5___6 relgrandc5
rename related5___7 relauntunc5
rename related5___8 relinlaw5
rename related5___9 relothrel5
rename related5___10 relcowork5
rename related5___11 relneigh5
rename related5___12 relfriend5
rename related5___13 relboss5
rename related5___14 relemploy5
rename related5___15 relschool5
rename related5___16 rellawyer5
rename related5___17 reldoctor5
rename related5___18 relothmed5
rename related5___19 relmental5
rename related5___20 relrelig5
rename related5___21 relchurch5
rename related5___22 relclub5
rename related5___23 relleisure5

rename related6___1 relpartner6
rename related6___2 relparent6
rename related6___3 relsibling6
rename related6___4 relchild6
rename related6___5 relgrandp6
rename related6___6 relgrandc6
rename related6___7 relauntunc6
rename related6___8 relinlaw6
rename related6___9 relothrel6
rename related6___10 relcowork6
rename related6___11 relneigh6
rename related6___12 relfriend6
rename related6___13 relboss6
rename related6___14 relemploy6
rename related6___15 relschool6
rename related6___16 rellawyer6
rename related6___17 reldoctor6
rename related6___18 relothmed6
rename related6___19 relmental6
rename related6___20 relrelig6
rename related6___21 relchurch6
rename related6___22 relclub6
rename related6___23 relleisure6

rename related7___1 relpartner7
rename related7___2 relparent7
rename related7___3 relsibling7
rename related7___4 relchild7
rename related7___5 relgrandp7
rename related7___6 relgrandc7
rename related7___7 relauntunc7
rename related7___8 relinlaw7
rename related7___9 relothrel7
rename related7___10 relcowork7
rename related7___11 relneigh7
rename related7___12 relfriend7
rename related7___13 relboss7
rename related7___14 relemploy7
rename related7___15 relschool7
rename related7___16 rellawyer7
rename related7___17 reldoctor7
rename related7___18 relothmed7
rename related7___19 relmental7
rename related7___20 relrelig7
rename related7___21 relchurch7
rename related7___22 relclub7
rename related7___23 relleisure7

rename related8___1 relpartner8
rename related8___2 relparent8
rename related8___3 relsibling8
rename related8___4 relchild8
rename related8___5 relgrandp8
rename related8___6 relgrandc8
rename related8___7 relauntunc8
rename related8___8 relinlaw8
rename related8___9 relothrel8
rename related8___10 relcowork8
rename related8___11 relneigh8
rename related8___12 relfriend8
rename related8___13 relboss8
rename related8___14 relemploy8
rename related8___15 relschool8
rename related8___16 rellawyer8
rename related8___17 reldoctor8
rename related8___18 relothmed8
rename related8___19 relmental8
rename related8___20 relrelig8
rename related8___21 relchurch8
rename related8___22 relclub8
rename related8___23 relleisure8

rename related9___1 relpartner9
rename related9___2 relparent9
rename related9___3 relsibling9
rename related9___4 relchild9
rename related9___5 relgrandp9
rename related9___6 relgrandc9
rename related9___7 relauntunc9
rename related9___8 relinlaw9
rename related9___9 relothrel9
rename related9___10 relcowork9
rename related9___11 relneigh9
rename related9___12 relfriend9
rename related9___13 relboss9
rename related9___14 relemploy9
rename related9___15 relschool9
rename related9___16 rellawyer9
rename related9___17 reldoctor9
rename related9___18 relothmed9
rename related9___19 relmental9
rename related9___20 relrelig9
rename related9___21 relchurch9
rename related9___22 relclub9
rename related9___23 relleisure9

rename related10___1 relpartner10
rename related10___2 relparent10
rename related10___3 relsibling10
rename related10___4 relchild10
rename related10___5 relgrandp10
rename related10___6 relgrandc10
rename related10___7 relauntunc10
rename related10___8 relinlaw10
rename related10___9 relothrel10
rename related10___10 relcowork10
rename related10___11 relneigh10
rename related10___12 relfriend10
rename related10___13 relboss10
rename related10___14 relemploy10
rename related10___15 relschool10
rename related10___16 rellawyer10
rename related10___17 reldoctor10
rename related10___18 relothmed10
rename related10___19 relmental10
rename related10___20 relrelig10
rename related10___21 relchurch10
rename related10___22 relclub10
rename related10___23 relleisure10

rename related11___1 relpartner11
rename related11___2 relparent11
rename related11___3 relsibling11
rename related11___4 relchild11
rename related11___5 relgrandp11
rename related11___6 relgrandc11
rename related11___7 relauntunc11
rename related11___8 relinlaw11
rename related11___9 relothrel11
rename related11___10 relcowork11
rename related11___11 relneigh11
rename related11___12 relfriend11
rename related11___13 relboss11
rename related11___14 relemploy11
rename related11___15 relschool11
rename related11___16 rellawyer11
rename related11___17 reldoctor11
rename related11___18 relothmed11
rename related11___19 relmental11
rename related11___20 relrelig11
rename related11___21 relchurch11
rename related11___22 relclub11
rename related11___23 relleisure11

rename related12___1 relpartner12
rename related12___2 relparent12
rename related12___3 relsibling12
rename related12___4 relchild12
rename related12___5 relgrandp12
rename related12___6 relgrandc12
rename related12___7 relauntunc12
rename related12___8 relinlaw12
rename related12___9 relothrel12
rename related12___10 relcowork12
rename related12___11 relneigh12
rename related12___12 relfriend12
rename related12___13 relboss12
rename related12___14 relemploy12
rename related12___15 relschool12
rename related12___16 rellawyer12
rename related12___17 reldoctor12
rename related12___18 relothmed12
rename related12___19 relmental12
rename related12___20 relrelig12
rename related12___21 relchurch12
rename related12___22 relclub12
rename related12___23 relleisure12

rename related13___1 relpartner13
rename related13___2 relparent13
rename related13___3 relsibling13
rename related13___4 relchild13
rename related13___5 relgrandp13
rename related13___6 relgrandc13
rename related13___7 relauntunc13
rename related13___8 relinlaw13
rename related13___9 relothrel13
rename related13___10 relcowork13
rename related13___11 relneigh13
rename related13___12 relfriend13
rename related13___13 relboss13
rename related13___14 relemploy13
rename related13___15 relschool13
rename related13___16 rellawyer13
rename related13___17 reldoctor13
rename related13___18 relothmed13
rename related13___19 relmental13
rename related13___20 relrelig13
rename related13___21 relchurch13
rename related13___22 relclub13
rename related13___23 relleisure13

rename related14___1 relpartner14
rename related14___2 relparent14
rename related14___3 relsibling14
rename related14___4 relchild14
rename related14___5 relgrandp14
rename related14___6 relgrandc14
rename related14___7 relauntunc14
rename related14___8 relinlaw14
rename related14___9 relothrel14
rename related14___10 relcowork14
rename related14___11 relneigh14
rename related14___12 relfriend14
rename related14___13 relboss14
rename related14___14 relemploy14
rename related14___15 relschool14
rename related14___16 rellawyer14
rename related14___17 reldoctor14
rename related14___18 relothmed14
rename related14___19 relmental14
rename related14___20 relrelig14
rename related14___21 relchurch14
rename related14___22 relclub14
rename related14___23 relleisure14

rename related15___1 relpartner15
rename related15___2 relparent15
rename related15___3 relsibling15
rename related15___4 relchild15
rename related15___5 relgrandp15
rename related15___6 relgrandc15
rename related15___7 relauntunc15
rename related15___8 relinlaw15
rename related15___9 relothrel15
rename related15___10 relcowork15
rename related15___11 relneigh15
rename related15___12 relfriend15
rename related15___13 relboss15
rename related15___14 relemploy15
rename related15___15 relschool15
rename related15___16 rellawyer15
rename related15___17 reldoctor15
rename related15___18 relothmed15
rename related15___19 relmental15
rename related15___20 relrelig15
rename related15___21 relchurch15
rename related15___22 relclub15
rename related15___23 relleisure15

rename related16___1 relpartner16
rename related16___2 relparent16
rename related16___3 relsibling16
rename related16___4 relchild16
rename related16___5 relgrandp16
rename related16___6 relgrandc16
rename related16___7 relauntunc16
rename related16___8 relinlaw16
rename related16___9 relothrel16
rename related16___10 relcowork16
rename related16___11 relneigh16
rename related16___12 relfriend16
rename related16___13 relboss16
rename related16___14 relemploy16
rename related16___15 relschool16
rename related16___16 rellawyer16
rename related16___17 reldoctor16
rename related16___18 relothmed16
rename related16___19 relmental16
rename related16___20 relrelig16
rename related16___21 relchurch16
rename related16___22 relclub16
rename related16___23 relleisure16

rename related17___1 relpartner17
rename related17___2 relparent17
rename related17___3 relsibling17
rename related17___4 relchild17
rename related17___5 relgrandp17
rename related17___6 relgrandc17
rename related17___7 relauntunc17
rename related17___8 relinlaw17
rename related17___9 relothrel17
rename related17___10 relcowork17
rename related17___11 relneigh17
rename related17___12 relfriend17
rename related17___13 relboss17
rename related17___14 relemploy17
rename related17___15 relschool17
rename related17___16 rellawyer17
rename related17___17 reldoctor17
rename related17___18 relothmed17
rename related17___19 relmental17
rename related17___20 relrelig17
rename related17___21 relchurch17
rename related17___22 relclub17
rename related17___23 relleisure17

rename related18___1 relpartner18
rename related18___2 relparent18
rename related18___3 relsibling18
rename related18___4 relchild18
rename related18___5 relgrandp18
rename related18___6 relgrandc18
rename related18___7 relauntunc18
rename related18___8 relinlaw18
rename related18___9 relothrel18
rename related18___10 relcowork18
rename related18___11 relneigh18
rename related18___12 relfriend18
rename related18___13 relboss18
rename related18___14 relemploy18
rename related18___15 relschool18
rename related18___16 rellawyer18
rename related18___17 reldoctor18
rename related18___18 relothmed18
rename related18___19 relmental18
rename related18___20 relrelig18
rename related18___21 relchurch18
rename related18___22 relclub18
rename related18___23 relleisure18

rename related19___1 relpartner19
rename related19___2 relparent19
rename related19___3 relsibling19
rename related19___4 relchild19
rename related19___5 relgrandp19
rename related19___6 relgrandc19
rename related19___7 relauntunc19
rename related19___8 relinlaw19
rename related19___9 relothrel19
rename related19___10 relcowork19
rename related19___11 relneigh19
rename related19___12 relfriend19
rename related19___13 relboss19
rename related19___14 relemploy19
rename related19___15 relschool19
rename related19___16 rellawyer19
rename related19___17 reldoctor19
rename related19___18 relothmed19
rename related19___19 relmental19
rename related19___20 relrelig19
rename related19___21 relchurch19
rename related19___22 relclub19
rename related19___23 relleisure19

rename related20___1 relpartner20
rename related20___2 relparent20
rename related20___3 relsibling20
rename related20___4 relchild20
rename related20___5 relgrandp20
rename related20___6 relgrandc20
rename related20___7 relauntunc20
rename related20___8 relinlaw20
rename related20___9 relothrel20
rename related20___10 relcowork20
rename related20___11 relneigh20
rename related20___12 relfriend20
rename related20___13 relboss20
rename related20___14 relemploy20
rename related20___15 relschool20
rename related20___16 rellawyer20
rename related20___17 reldoctor20
rename related20___18 relothmed20
rename related20___19 relmental20
rename related20___20 relrelig20
rename related20___21 relchurch20
rename related20___22 relclub20
rename related20___23 relleisure20


rename helped1___1 listen1
rename helped1___2 care1
rename helped1___3 advice1
rename helped1___4 chores1
rename helped1___5 loan1

rename helped2___1 listen2
rename helped2___2 care2
rename helped2___3 advice2
rename helped2___4 chores2
rename helped2___5 loan2

rename helped3___1 listen3
rename helped3___2 care3
rename helped3___3 advice3
rename helped3___4 chores3
rename helped3___5 loan3

rename helped4___1 listen4
rename helped4___2 care4
rename helped4___3 advice4
rename helped4___4 chores4
rename helped4___5 loan4

rename helped5___1 listen5
rename helped5___2 care5
rename helped5___3 advice5
rename helped5___4 chores5
rename helped5___5 loan5

rename helped6___1 listen6
rename helped6___2 care6
rename helped6___3 advice6
rename helped6___4 chores6
rename helped6___5 loan6

rename helped7___1 listen7
rename helped7___2 care7
rename helped7___3 advice7
rename helped7___4 chores7
rename helped7___5 loan7

rename helped8___1 listen8
rename helped8___2 care8
rename helped8___3 advice8
rename helped8___4 chores8
rename helped8___5 loan8

rename helped9___1 listen9
rename helped9___2 care9
rename helped9___3 advice9
rename helped9___4 chores9
rename helped9___5 loan9

rename helped10___1 listen10
rename helped10___2 care10
rename helped10___3 advice10
rename helped10___4 chores10
rename helped10___5 loan10

rename helped11___1 listen11
rename helped11___2 care11
rename helped11___3 advice11
rename helped11___4 chores11
rename helped11___5 loan11

rename helped12___1 listen12
rename helped12___2 care12
rename helped12___3 advice12
rename helped12___4 chores12
rename helped12___5 loan12

rename helped13___1 listen13
rename helped13___2 care13
rename helped13___3 advice13
rename helped13___4 chores13
rename helped13___5 loan13

rename helped14___1 listen14
rename helped14___2 care14
rename helped14___3 advice14
rename helped14___4 chores14
rename helped14___5 loan14

rename helped15___1 listen15
rename helped15___2 care15
rename helped15___3 advice15
rename helped15___4 chores15
rename helped15___5 loan15

rename helped16___1 listen16
rename helped16___2 care16
rename helped16___3 advice16
rename helped16___4 chores16
rename helped16___5 loan16

rename helped17___1 listen17
rename helped17___2 care17
rename helped17___3 advice17
rename helped17___4 chores17
rename helped17___5 loan17

rename helped18___1 listen18
rename helped18___2 care18
rename helped18___3 advice18
rename helped18___4 chores18
rename helped18___5 loan18

rename helped19___1 listen19
rename helped19___2 care19
rename helped19___3 advice19
rename helped19___4 chores19
rename helped19___5 loan19

rename helped20___1 listen20
rename helped20___2 care20
rename helped20___3 advice20
rename helped20___4 chores20
rename helped20___5 loan20

*drop people did not complete name gernarators (this step is needed so that they are not treated as 0 net size)
recode generators_complete interpreters_complete matrix_complete (0=.) //those complete indicators are not accurate, some cases says not completed but have names in the data
egen complete=rowmean(generators_complete interpreters_complete matrix_complete)
drop if missing(complete) & missing(name1) // 1 case dropped
drop complete

recode matrix_1_2-matrix_19_20 (1=3)(2=2)(3=1)(4=0) // 0 = do not know each other

egen npossties=rownonmiss(matrix_1_2-matrix_19_20)
egen totval=rowtotal(matrix_1_2-matrix_19_20),mi
gen density=totval/npossties
lab var density "Valued density of networks from matrix"

foreach x of varlist matrix_1_2-matrix_19_20 {
gen new`x'=`x'
}
recode matrix_1_2-matrix_19_20 (2/3=1)(0/1=0)
egen totnum=rowtotal(matrix_1_2-matrix_19_20),mi
gen bdensity=totnum/npossties
lab var bdensity "Density of networks close\very close"

recode newmatrix_1_2-newmatrix_19_20 (1/3=1)(0=0)
egen totnum1=rowtotal(newmatrix_1_2-newmatrix_19_20),mi
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other"

egen sole=rowmin(newmatrix_1_2-newmatrix_19_20) 
recode sole (0=1) (1=0) //same as recode b1density (1=0)
lab var sole "Sole bridge status"

drop matrix_1_2-matrix_19_20 totnum newmatrix_1_2-newmatrix_19_20

tostring name* w3alter* w3reasondropspecify*,replace //prepare for reshape
reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong w3alter w3mention w3reasondrop w3reasondropspecify w3stillspeak ///
questiondoc education educationcoll, i(SUBID) j(TIEID)
replace name="" if name=="." // convert . into missing in string
replace w3alter="" if w3alter=="." // convert . into missing in string
replace w3reasondropspecify="" if w3reasondropspecify=="." // convert . into missing in string

sort SUBID TIEID


bysort SUBID: egen netsize=count(name)
lab var netsize "Total number of alters mentioned"

gen efctsize=netsize-2*totnum1/netsize
label var efctsize "Effective size"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into  professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity"


gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"

bysort SUBID: egen nkin=total(tkin)
bysort SUBID: egen nfriend=total(tfriend)
gen fkratio=(nfriend+1)/(nkin+1)
replace fkratio=. if netsize==0
lab var fkratio "Ratio of friends to kin"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network"

drop seetalkr

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network"
gen knowaboutr=knowabout
recode knowaboutr (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutr)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE"
drop knowaboutr

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE"
drop trustdoctorsr

gen tquestion=questiondoc //new variable for wave2
recode tquestion (99=.)
bysort SUBID:  egen mquestion=mean(tquestion)
lab var mquestion "Mean questions doctors in network, HI=MORE"

recode education educationcoll (99=.)(8=.) //new variable for wave2
gen tcollege=0
replace tcollege=1 if education>4 | educationcoll==1
replace tcollege=. if education==. & educationcoll==.
lab var tcollege "Alter educ is college (Bachelor's) degree or higher"
bysort SUBID: egen pcollege=mean(tcollege)
lab var pcollege "Prop of alters with Bachelor's degree in network"

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE"

revrs difficult, replace //reverse code
bysort SUBID: egen mhassles=mean(difficult)
lab var mhassles "Mean hassles in network, HI=MORE)"
recode difficult (1=0) (2/3=1),gen(thassles)
lab var thassles "Alter hassles, causes problems sometimes or a lot"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE)
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength"

egen qol=rowmean(health-whole)
lab var qol "Quality of life scale, HI=BETTER"

drop interpreters_complete matrix_complete quality_of_life_complete npossties totval record_id totnum1 

gen time=4

save "SNAD-Participant-T4-CleanB-LONG-092520.dta", replace

duplicates drop SUBID, force

drop TIEID name-strong w3alter-w3stillspeak imd-educationcoll tquestion tfem tkin tfriend tquestion tclose tfreq tknow numsup difficult thassles ttrust tcollege  //drop alter level variables

save "SNAD-Participant-T4-CleanB-EGOAGG-092520.dta", replace






***************************************************************
//	#4 Append SNAD participant T1, T2, T3, T4+ ENSO
***************************************************************
*ego aggregate data
use "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", clear
append using "ENSO-Participant-T1-Clean-EGOAGG-pilot.dta"
append using "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta"
append using "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta"
append using "SNAD-Participant-T4-CleanB-EGOAGG-092520.dta",force
duplicates tag SUBID time,gen(dup) 
list SUBID date_snad time ENSO if dup==1 //2 T1 ENSO cases appears in T1 Redcap too (should not happen!)
list time if SUBID==10216
replace time=2 if ENSO==1 & SUBID==10216 // recode ENSO case into the correct wave considering pilot data
list time if SUBID==10259
replace time=2 if ENSO==1 & SUBID==10259 
save "SNAD-Participant-T1234-CleanB-EGOAGG-20201001.dta", replace

*create match data for IADC
use "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", clear
merge 1:1 SUBID using "ENSO-Participant-T1-Clean-EGOAGG-pilot.dta"
rename date_snad date_snad1
keep SUBID date_snad1 ENSO
merge 1:1 SUBID using "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta"
rename date_snad date_snad2
keep SUBID date_snad1 date_snad2 ENSO
merge 1:1 SUBID using "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta" 
rename date_snad date_snad3
keep SUBID date_snad1 date_snad2 date_snad3 ENSO
merge 1:1 SUBID using "SNAD-Participant-T4-CleanB-EGOAGG-092520.dta" 
rename date_snad date_snad4
keep SUBID date_snad1 date_snad2 date_snad3 date_snad4 ENSO //create data of SNAD date to match SNAD with IADC
save "SNAD-MatchData-20201001.dta", replace

*long data
use "SNAD-Participant-T1-CleanB-LONG-120419.dta", clear
append using "SNAD-Participant-T2-CleanB-LONG-062519.dta"
append using "SNAD-Participant-T3-CleanB-LONG-062519.dta"
append using "SNAD-Participant-T4-CleanB-LONG-092520.dta",force
append using "ENSO-Participant-T1-Clean-LONG-pilot.dta" //ENSO have different TIEID

sort SUBID TIEID time

save "SNAD-Participant-T1234-CleanB-LONG-20201001.dta", replace

***************************************************************
//	#4 Clean Demographics info
***************************************************************
use "IADC-Cross-CleanA-082520.dta", clear

gen female=sex
recode female (2=0)
lab var female "Subject is female"

gen black=race
recode black (2=1)(1=0)(5=0)
lab var black "Subject is black"

gen apoerisk=APOEGenotype
recode apoerisk (1/2=0)(4=0)(3=1)(5/6=1)
lab var apoerisk "High risk (heterozygous or homozygous for E4)"

gen apoe=.
replace apoe=1 if APOEGenotype==1 | APOEGenotype==2 | APOEGenotype==4
replace apoe=2 if APOEGenotype==3 | APOEGenotype==5
replace apoe=3 if APOEGenotype==6
lab var apoe "APOE genotype"
lab def apoecat 1 "No E4" 2 "Hetero E4" 3 "Homo E4"
lab val apoe apoecat

recode MARISTAT (1 6=1) (2 3 4 5=0) (9=.),gen(married)
drop MARISTAT
lab var married "Marital status (IADC)"
lab def married 0 "Not married" 1 "Married" 
lab val married married

drop lastdiagx lastsubtype contribute normcond syndrome //this is most recent diagnosis which is usually years after SNAD interview

save "IADC-Cross-CleanB-082520.dta", replace



***************************************************************
//	#5 Match IADC with SNAD
***************************************************************
*drop cases of IADC that are 62 days apart from SNAD at any wave
use "IADC-Long-CleanA-082520.dta", clear

rename age age_i
gen age=round(ageatvisit,1)
drop ageatvisit
merge m:1 SUBID using "SNAD-MatchData-20201001.dta" //1 peole with SNAD but no IADC, SUBID=10234

order date_snad4 date_snad3 date_snad2 date_snad1, after(visitdate)

gen match=.
replace match=1 if visitdate==date_snad1 & !missing(visitdate)
replace match=2 if visitdate==date_snad2 & !missing(visitdate)
replace match=3 if visitdate==date_snad3 & !missing(visitdate)
replace match=4 if visitdate==date_snad4 & !missing(visitdate)

order match, after(visitdate)

gen diff1=abs(visitdate-date_snad1)
gen diff2=abs(visitdate-date_snad2)
gen diff3=abs(visitdate-date_snad3)
gen diff4=abs(visitdate-date_snad4)

egen minval = rowmin(diff1 diff2 diff3 diff4) //SNAD date closest to IADC date
replace diff1=. if minval!=diff1
replace diff2=. if minval!=diff2
replace diff3=. if minval!=diff3
replace diff4=. if minval!=diff4

fre diff1 if match==.
replace match=1 if diff1<=60

fre diff2 if match==.
replace match=2 if diff2<=61

fre diff3 if match==.
replace match=3 if diff3<=60

fre diff4 if match==.
replace match=4 if diff4<=60

duplicates list SUBID match if !missing(match) //no mismatch
drop if match==.

rename match time
rename visitdate iadcdate
drop _merge minval diff1 diff2 diff3 diff4

save "IADC-Long-CleanB-20201001.dta", replace


***************************************************************
//	#6 Match Neuroimaging with SNAD
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "Neuroimaging-CleanA-041320.dta" ,replace
destring SUBID ICV_t-cdrsb_t,replace
*mri date
gen date_mri1 = date(DateofMRIScan_t, "MDY") //for 10/20/2014
format date_mri1 %td //convert number to DMY format 
replace DateofMRIScan_t = subinstr(DateofMRIScan_t, "-", "", .) //for 31-May-17
gen date_mri2 = date(DateofMRIScan_t, "DM20Y") if missing(date_mri1)
format date_mri2 %td
gen date_mri=date_mri1
replace date_mri=date_mri2 if missing(date_mri1)
format date_mri %td
list date_mri date_mri1 date_mri2 DateofMRIScan_t
drop date_mri1 date_mri2 DateofMRIScan_t
*tau date
replace Taudate_t = subinstr(Taudate_t, "-", "", .) //drop -
gen date_tau = date(Taudate_t, "DM20Y") 
format date_tau %td
list date_tau Taudate_t 
drop Taudate_t
*Amy date
format date_amy %td

merge m:1 SUBID using "SNAD-MatchData-20201001.dta"
drop if _merge==1 //drop people did not do SNAD
drop _merge
save "Neuroimaging-CleanA2-20201001.dta" ,replace

*match MRI with SNAD
*drop cases of IADC that are 1 year apart from SNAD at any wave
use "Neuroimaging-CleanA2-20201001.dta" ,replace
keep SUBID ICV_t-date_snad4 //drop demographic variables
gen matchmri=.
replace matchmri=1 if date_mri==date_snad1 & !missing(date_mri)
replace matchmri=2 if date_mri==date_snad2 & !missing(date_mri)
replace matchmri=3 if date_mri==date_snad3 & !missing(date_mri)
replace matchmri=4 if date_mri==date_snad4 & !missing(date_mri)

gen diffmri1=abs(date_mri-date_snad1)
gen diffmri2=abs(date_mri-date_snad2)
gen diffmri3=abs(date_mri-date_snad3)
gen diffmri4=abs(date_mri-date_snad4)

gen same=1 if diffmri1==diffmri2 & !missing(diffmri1,diffmri2) 
replace same=1 if diffmri1==diffmri3 & !missing(diffmri1,diffmri3) 
replace same=1 if diffmri3==diffmri2 & !missing(diffmri3,diffmri2) 
replace same=1 if diffmri4==diffmri3 & !missing(diffmri4,diffmri3) 

fre same //no case with the same time lag for T1 T2 T3 T4

egen minval = rowmin(diffmri1 diffmri2 diffmri3 diffmri4) //SNAD date closest to Neuroimaging date
replace diffmri1=. if minval!=diffmri1
replace diffmri2=. if minval!=diffmri2
replace diffmri3=. if minval!=diffmri3
replace diffmri4=. if minval!=diffmri4

fre diffmri1 if matchmri==. & diffmri1<400
replace matchmri=1 if diffmri1<=365 // or 186 for half a year

fre diffmri2 if matchmri==. & diffmri2<400
replace matchmri=2 if diffmri2<=365 // or 181 for half a year

fre diffmri3 if matchmri==. & diffmri3<400
replace matchmri=3 if diffmri3<=365 // or 181 for half a year

fre diffmri4 if matchmri==. & diffmri4<400
replace matchmri=4 if diffmri4<=365 // or 181 for half a year

gen time=matchmri
drop if missing(time)
duplicates tag SUBID time,gen(dup) 
list SUBID time minval diffmri1 diffmri2 diffmri3 diffmri4 date_mri date_snad1 date_snad2 date_snad3 date_snad4 if dup>0 //check 8 records of mri are assigned to the same wave
replace time=. if minval==337 & SUBID==5032 
replace time=. if minval==357 & SUBID==6417  
replace time=1 if minval==3 & SUBID==6541 
replace time=. if minval==272 & SUBID==10002  
replace time=2 if minval==2 & SUBID==10087  
replace time=. if minval==329 & SUBID==10088  
replace time=. if minval==350 & SUBID==10101  
replace time=3 if minval==164 & SUBID==6409  

keep time date_mri SUBID-rh_insula_volume_t //drop non-MRI data
drop if missing(time)
save "MRI-Clean-20201001.dta" ,replace

*match TauDate_ with SNAD
use "Neuroimaging-CleanA2-20201001.dta" ,replace
keep SUBID date_snad1 date_snad2 date_snad3 date_snad4 date_tau AV1451_crus_EntCtx_t-AV1451_crus_GlobalCtx_t 

gen matchtau=.
replace matchtau=1 if date_tau==date_snad1 & !missing(date_tau)
replace matchtau=2 if date_tau==date_snad2 & !missing(date_tau)
replace matchtau=3 if date_tau==date_snad3 & !missing(date_tau)
replace matchtau=4 if date_tau==date_snad4 & !missing(date_tau)

gen difftau1=abs(date_tau-date_snad1)
gen difftau2=abs(date_tau-date_snad2)
gen difftau3=abs(date_tau-date_snad3)
gen difftau4=abs(date_tau-date_snad4)

gen same=1 if difftau1==difftau2 & !missing(difftau1,difftau2)
replace same=1 if difftau1==difftau3 & !missing(difftau1,difftau3) 
replace same=1 if difftau3==difftau2 & !missing(difftau3,difftau2) 
replace same=1 if difftau4==difftau3 & !missing(difftau4,difftau3) 

fre same //no case with the same time lag for T1 T2 T3 T4

egen minval = rowmin(difftau1 difftau2 difftau3 difftau4) //SNAD date closest to Neuroimaging date
replace difftau1=. if minval!=difftau1
replace difftau2=. if minval!=difftau2
replace difftau3=. if minval!=difftau3
replace difftau4=. if minval!=difftau4

fre difftau1 if matchtau==.
replace matchtau=1 if difftau1<=365  // or 180 for half a year

fre difftau2 if matchtau==.
replace matchtau=2 if difftau2<=365 // or 180 for half a year

fre difftau3 if matchtau==.
replace matchtau=3 if difftau3<=365 // or 180 for half a year

fre difftau4 if matchtau==.
replace matchtau=4 if difftau4<=365 // or 180 for half a year

gen time=matchtau
drop if missing(time)
duplicates tag SUBID time,gen(dup) 
list SUBID time minval difftau* date_tau date_snad* if dup>0 //no duplicate
drop matchtau minval difftau* same dup
save "TAU-Clean-20201001.dta" ,replace

*match AmyDate_ with SNAD 
use "Neuroimaging-CleanA2-20201001.dta" ,replace
keep SUBID date_snad1 date_snad2 date_snad3 date_snad4 date_amy AbPos_t GlCtx_Cent_CL_t // Amy_Cent_LateralParietal_ Amy_Cent_Precuneus_ not included in ths data Shannon sent
gen matchamy=.
replace matchamy=1 if date_amy==date_snad1 & !missing(date_amy)
replace matchamy=2 if date_amy==date_snad2 & !missing(date_amy)
replace matchamy=3 if date_amy==date_snad3 & !missing(date_amy)
replace matchamy=4 if date_amy==date_snad4 & !missing(date_amy)

gen diffamy1=abs(date_amy-date_snad1)
gen diffamy2=abs(date_amy-date_snad2)
gen diffamy3=abs(date_amy-date_snad3)
gen diffamy4=abs(date_amy-date_snad4)

gen same=1 if diffamy1==diffamy2 & !missing(diffamy1,diffamy2)
replace same=1 if diffamy1==diffamy3 & !missing(diffamy1,diffamy3) 
replace same=1 if diffamy3==diffamy2 & !missing(diffamy3,diffamy2) 
replace same=1 if diffamy4==diffamy3 & !missing(diffamy4,diffamy3) 

fre same //no case with the same time lag for T1 T2 T3 T4

egen minval = rowmin(diffamy1 diffamy2 diffamy3 diffamy4) //SNAD date closest to Neuroimaging date
replace diffamy1=. if minval!=diffamy1
replace diffamy2=. if minval!=diffamy2
replace diffamy3=. if minval!=diffamy3
replace diffamy4=. if minval!=diffamy4

fre diffamy1 if matchamy==.
replace matchamy=1 if diffamy1<=365  // or 180 for half a year

fre diffamy2 if matchamy==.
replace matchamy=2 if diffamy2<=365 // or 180 for half a year

fre diffamy3 if matchamy==.
replace matchamy=3 if diffamy3<=365 // or 180 for half a year

fre diffamy4 if matchamy==.
replace matchamy=4 if diffamy4<=365 // or 180 for half a year

gen time=matchamy
drop if missing(time)
duplicates tag SUBID time,gen(dup) 
list SUBID time minval diffamy* date_amy date_snad* if dup>0 //check and fix 2 duplicates
replace time=2 if minval==50 & SUBID==3908
replace time=. if minval==300 & SUBID==6417
drop if missing(time)

drop matchamy minval diffamy* same dup
save "AMY-Clean-20201001.dta" ,replace

***************************************************************
//	#7 Merge files
***************************************************************
*load Demographics info
use "IADC-Cross-CleanB-082520.dta", clear 

*add SNAD data
merge 1:m SUBID using "SNAD-Participant-T1234-CleanB-EGOAGG-20201001.dta" 
list enrolldate date_snad if _merge==2 // 1 people (4 cases for 4 waves) interviewed with SNAD but not IADC (Need to get IADC in the future)
drop if _merge==1 //drop cases have no SNAD data
drop _merge 

*add IADC data
merge 1:1 SUBID time using "IADC-Long-CleanB-20201001.dta" 
list iadcdate date_snad if _merge==1 //22 cases missing IADC data due to >60 days apart from SNAD at least one wave
drop _merge 

*add Neuroimaging data
merge 1:1 SUBID time using "MRI-Clean-20201001.dta" //183 matched
drop _merge

merge 1:1 SUBID time using "TAU-Clean-20201001.dta" //76 matched
drop _merge

merge 1:1 SUBID time using "AMY-Clean-20201001.dta" //85 matched
drop _merge

/*create age based on SNAD date
tostring birthyr birthmnth,replace
destring birthmnth,gen(month)
gen birthmnth2="0"+ birthmnth if month<10
replace birthmnth2=birthmnth if missing(birthmnth2)
gen dob=birthyr+birthmnth2+"15"
destring dob,replace force
*ssc install todate //install todate if not alreday 
todate dob, gen(dobdate) p(yyyymmdd) f(%dd_m_cy)
personage dobdate date_snad1, gen(agesnad1) //install personage if not alreday 
personage dobdate date_snad2, gen(agesnad2) //install personage if not alreday 
gen agesnad=agesnad1
replace agesnad=agesnad2 if time==2
*/

***************************************************************
//	#8 Exclusion criteria for all analyses (see do.file in Box for explaination for exlusion)
***************************************************************

*Drop people who should not be in the study based on exlusion criteria for SAND: MoCA<10, age<45, Prion disease, and bipolar at T1
tostring SUBID,replace
drop if SUBID=="3810" | SUBID=="6259" | SUBID=="6341" | SUBID=="6493" | SUBID=="6513" ///
      | SUBID=="6535" | SUBID=="6580" | SUBID=="10059" | SUBID=="10072" | SUBID=="10073" | SUBID=="10082" ///
      | SUBID=="10088" | SUBID=="10101" | SUBID=="10161" | SUBID=="10167" | SUBID=="10179" ///
      | SUBID=="10181" | SUBID=="10205" | SUBID=="10219" | SUBID=="10233" | SUBID=="5032" ///
	  | SUBID=="6387" | SUBID=="10226" 
*create variable for AD
gen ad=primarysubtype
replace ad= "Alzheimers disease" if contributel=="Alzheimers disease" //code as AD if other condition says AD even primary subtype is not AD 
gen adtype=1 if ad== "Alzheimers disease"	  
replace	adtype=0 if !missing(ad) & adtype!=1	   
label define ad 0 "Non AD" 1 "AD"
label values adtype ad
*create diagnosis variable + data clean
encode diag,gen(diagnosis) //convert string to numeric
recode diagnosis (4 7=1) (1 2 5 6 =2) (3=3)
lab def diagnosisnew 1 "Normal" 2 "MCI" 3 "Dementia"
lab val diagnosis diagnosisnew
lab var diagnosis "Normal, MCI, or dementia"

label var CCI_INFTOT "Informant CCI Total score"
save "SNAD-Analysis-T1234-20201001-Imaging from Shannon.dta", replace

*merge old imaging data with shannon's new version (need to add old imaging to T3)
use "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\Peng\SNAD-Analysis-T1T2-20200311-old imaging",replace 
keep SUBID time ICV_-Amy_Cent_Precuneus_
foreach x of varlist ICV_-Amy_Cent_Precuneus_ {
	rename `x' `x'old
}
merge 1:1 SUBID time using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\SNAD-Analysis-T1234-20201001-Imaging from Shannon.dta"
drop _merge //the 2 not matched cases were interviewed by IADC but not SNAD
save "SNAD-Analysis-T1234-20201001-all imaging.dta", replace


/* Alternative way to merge (Not recommended)
merge 1:m SUBID using "IADC-Long-CleanB-062519.dta" 

*add IADC demographic info for 7 people have IADC interviews >60 days apart from SNAD in all waves (marital status can be from 2000 and never updated)
recode time (.=1) if _merge==1 
expand 2 if _merge==1,gen(copy)
replace time=2 if copy==1 

list if _merge==2 // 6 people interviewed with SNAD but not IADC (Need to get IADC in the future)

drop _merge copy
sort SUBID time
order time, after(SUBID)


duplicates tag SUBID time, gen(dup)
fre dup
list SUBID if dup==1

duplicates drop SUBID time, force

merge 1:1 SUBID time using "SNAD-Participant-T1T2-CleanB-EGOAGG-062519.dta" 
duplicates list SUBID time 
duplicates list SUBID if _merge==2 //144 people have only 1 wave of data from IADC
egen racedup=mean(race) , by(SUBID) 
tab racedup race
replace race=racedup if missing(race)
fre race
drop _merge racedup

merge 1:1 SUBID time using "Neuroimaging-CleanB-062519.dta"
drop _merge

encode diag,gen(diagnosis) //convert string to numeric

recode diagnosis (4 7=1) (1 2 5 6 =2) (3=3)
lab def diagnosisnew 1 "Normal" 2 "MCI" 3 "Dementia"
lab val diagnosis diagnosisnew
lab var diagnosis "Normal, MCI, or dementia"

save "SNAD-Analysis-T1T2-062519.dta", replace


log close
*/


