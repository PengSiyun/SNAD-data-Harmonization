****Priject: SNAD
****Author:  Siyun Peng, Brea L. Perry
****Date:    2020/10/14
****Version: 16
****Purpose: recode and create data for pilot -participant
clear
*cd "C:\Users\siypeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data" //office
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"



***************************************************************
**# 1 Clean SNAD participant T1
***************************************************************


do "SNADParticipant_STATA_2021-12-21_1106" //import T1 excel into stata
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"

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
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"
do "SNADParticipantWave2_STATA_2021-12-21_1107" //import T2
destring studyid, gen(SUBID) force
keep if SUBID==10104
save "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp\SNAD-Participant-T1-T2Error-062519.dta", replace


do "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\SNADParticipant_STATA_2021-12-21_1106" //import T1 excel into stata
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
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

save "SNAD-Participant-T1-Matrix.dta",replace

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

/*gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"
*/
bysort SUBID: egen nkin=total(tkin)
*bysort SUBID: egen nfriend=total(tfriend)
*gen fkratio=(nfriend+1)/(nkin+1)
*replace fkratio=. if netsize==0
*lab var fkratio "Ratio of friends to kin"

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

egen numsup3=rowtotal(listen care advice),mi
replace numsup3=. if missing(name)
bysort SUBID: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist listen-loan {
	replace `x'=. if missing(name)
	bysort SUBID: egen p`x'=mean(`x') //missing means no alter
}
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"

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

drop name-strong TIEID tfem tkin  tclose tfreq tknow difficult thassles ttrust numsup  //drop alter level variables

save "SNAD-Participant-T1-CleanB-EGOAGG-120419.dta", replace




***************************************************************
**# 2 Clean SNAD participant T2
***************************************************************



cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"
do "SNADParticipantWave2_STATA_2021-12-21_1107" //import T2
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
rename studyid SUBID

drop if SUBID=="6336w3" | SUBID=="10104" //10104 is T1
destring SUBID, replace force

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
/*
gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"
*/
bysort SUBID: egen nkin=total(tkin)
*bysort SUBID: egen nfriend=total(tfriend)
*gen fkratio=(nfriend+1)/(nkin+1)
*replace fkratio=. if netsize==0
*lab var fkratio "Ratio of friends to kin"

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

egen numsup3=rowtotal(listen care advice),mi
replace numsup3=. if missing(name)
bysort SUBID: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist listen-loan {
	replace `x'=. if missing(name)
	bysort SUBID: egen p`x'=mean(`x') //missing means no alter
}
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"


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

replace date_snad=date_iadc if missing(date_snad)

drop interpreters_complete matrix_complete quality_of_life_complete npossties totval dup record_id redcap_data_access_group w2error totnum1

gen time=2

save "SNAD-Participant-T2-CleanB-LONG-062519.dta", replace

duplicates drop SUBID, force

drop TIEID name-strong w1alter-w1stillspeak imd-educationcoll tquestion tfem tkin  tquestion tclose tfreq tknow difficult thassles numsup ttrust tcollege  //drop alter level variables

save "SNAD-Participant-T2-CleanB-EGOAGG-062519.dta", replace





***************************************************************
**# 3 Clean SNAD participant T3
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"
do "SNADParticipantWave3_STATA_2021-12-21_1107" //import T3
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
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
/*
gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"
*/
bysort SUBID: egen nkin=total(tkin)
*bysort SUBID: egen nfriend=total(tfriend)
*gen fkratio=(nfriend+1)/(nkin+1)
*replace fkratio=. if netsize==0
*lab var fkratio "Ratio of friends to kin"

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

egen numsup3=rowtotal(listen care advice),mi
replace numsup3=. if missing(name)
bysort SUBID: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist listen-loan {
	replace `x'=. if missing(name)
	bysort SUBID: egen p`x'=mean(`x') //missing means no alter
}
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"

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

replace date_snad=date_iadc if missing(date_snad)

drop interpreters_complete matrix_complete quality_of_life_complete npossties totval record_id totnum1 

gen time=3

save "SNAD-Participant-T3-CleanB-LONG-062519.dta", replace

duplicates drop SUBID, force

drop TIEID name-strong w2alter-w2stillspeak imd-educationcoll tquestion tfem tkin  tquestion tclose tfreq tknow numsup difficult thassles ttrust tcollege  //drop alter level variables

save "SNAD-Participant-T3-CleanB-EGOAGG-062519.dta", replace



***************************************************************
**# 4 Clean SNAD participant T4
***************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"
do "SNADParticipantWave4_STATA_2021-12-21_1107" //import T4
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"

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
/*
gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend"
*/
bysort SUBID: egen nkin=total(tkin)
*bysort SUBID: egen nfriend=total(tfriend)
*gen fkratio=(nfriend+1)/(nkin+1)
*replace fkratio=. if netsize==0
*lab var fkratio "Ratio of friends to kin"

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

egen numsup3=rowtotal(listen care advice),mi
replace numsup3=. if missing(name)
bysort SUBID: egen msupport3=mean(numsup3)
lab var msupport3 "Mean number of support functions in network (listen, care, advice), HI=MORE"

foreach x of varlist listen-loan {
	replace `x'=. if missing(name)
	bysort SUBID: egen p`x'=mean(`x') //missing means no alter
}
lab var plisten "Prop. listen to you when upset"
lab var pcare "Prop. tell you they care about what happens to you"
lab var padvice "Prop. give suggestions when you have a problem"
lab var pchores "Prop. help you with daily chores"
lab var ploan "Prop. loan money when you are short of money"

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

drop TIEID name-strong w3alter-w3stillspeak imd-educationcoll tquestion tfem tkin  tquestion tclose tfreq tknow numsup difficult thassles ttrust tcollege  //drop alter level variables

save "SNAD-Participant-T4-CleanB-EGOAGG-092520.dta", replace



***************************************************************
**# 5 Merge T1-T4 with uniqueID
***************************************************************

*append pilots
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\temp"
use "SNAD-Participant-T1-CleanB-LONG-120419.dta",clear
append using "SNAD-Participant-T2-CleanB-LONG-062519.dta"
append using "SNAD-Participant-T3-CleanB-LONG-062519.dta"
append using "SNAD-Participant-T4-CleanB-LONG-092520.dta",force
drop if missing(name) 
rename name alter_name

*make names consistent
replace alter_name =strtrim(alter_name) //remove leading and trailing blanks
replace alter_name =subinstr(alter_name, ".", "",.) //remove .
replace alter_name =strlower(alter_name) //change to lower case
replace alter_name =stritrim(alter_name) //consecutive blanks collapsed to one blank

cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean\clean data"
save "SNAD-Participant-T1234-CleanB-LONG",replace

*prepare uniqueID for merge
import excel using "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\UniqueID  W12345-Focal-20210215", clear first 
drop if time=="ENSO" //drop ENSO 
keep SUBID TIEID_uniq name 
rename (TIEID_uniq name) (alterid alter_name)
duplicates drop SUBID alter_name,force //drop alters appears in multiple waves
duplicates tag SUBID alterid,gen(dup) 
list SUBID alter_name if dup>0 //0 alters with the same name but have different id
drop dup

*merge
merge 1:m SUBID alter_name using "SNAD-Participant-T1234-CleanB-LONG",nogen //all matched
save "SNAD-Participant-T1234-CleanB-LONG",replace
