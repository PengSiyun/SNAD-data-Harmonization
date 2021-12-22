

****Project: Clean informate data T1,2
****Author: Siyun Peng & Adam Roth
****Date:    2020/08/31
****Version: 16 SE
****Purpose: Data Analysis


***************************************************************************


*1.  LOADING INFORMANT DATA  T1*


***************************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "SNAD-Partner-T1-2020-07-30.dta", clear


/*DATA CLEANING T1*/
********************************************************************************

rename studyid SUBID

drop if SUBID=="3594"
replace SUBID="3594" if SUBID=="3594a"
drop if SUBID=="3517"
replace SUBID="3517" if SUBID=="3517a"
drop if SUBID=="6450w2"
drop if SUBID=="7777777"
drop if SUBID=="99999"
drop if SUBID=="test 2"

destring SUBID, replace

sort SUBID

*Had duplicate - one interview over phone and one in person
drop if record_id==61

/*some SUBIDs still have two observations each. I think this is because they were
interviewed across two waves. Although many interview dates are missing, I can 
deduce time order by looking at record_id. I think it is safe to drop the latter
record_id for all SUBIDs (only 7 SUBID--so 14 observations).*/
drop if SUBID==6473 & record_id==268
drop if SUBID==6566 & record_id==166
drop if SUBID==10068 & record_id==173
drop if SUBID==10079 & record_id==181
drop if SUBID==10095 & record_id==210
drop if SUBID==10257 & record_id==269
drop if SUBID==10259 & record_id==272

*drop set_study_id_timestamp set_study_id_complete partner_response_timestamp
drop set_study_id_timestamp partner_response_timestamp

rename related_ia1___1 relpartner1
rename related_ia1___2 relparent1
rename related_ia1___3 relsibling1
rename related_ia1___4 relchild1
rename related_ia1___5 relgrandp1
rename related_ia1___6 relgrandc1
rename related_ia1___7 relauntunc1
rename related_ia1___8 relinlaw1
rename related_ia1___9 relothrel1
rename related_ia1___10 relcowork1
rename related_ia1___11 relneigh1
rename related_ia1___12 relfriend1
rename related_ia1___13 relboss1
rename related_ia1___14 relemploy1
rename related_ia1___15 relschool1
rename related_ia1___16 rellawyer1
rename related_ia1___17 reldoctor1
rename related_ia1___18 relothmed1
rename related_ia1___19 relmental1
rename related_ia1___20 relrelig1
rename related_ia1___21 relchurch1
rename related_ia1___22 relclub1
rename related_ia1___23 relleisure1

rename related_ia2___1 relpartner2
rename related_ia2___2 relparent2
rename related_ia2___3 relsibling2
rename related_ia2___4 relchild2
rename related_ia2___5 relgrandp2
rename related_ia2___6 relgrandc2
rename related_ia2___7 relauntunc2
rename related_ia2___8 relinlaw2
rename related_ia2___9 relothrel2
rename related_ia2___10 relcowork2
rename related_ia2___11 relneigh2
rename related_ia2___12 relfriend2
rename related_ia2___13 relboss2
rename related_ia2___14 relemploy2
rename related_ia2___15 relschool2
rename related_ia2___16 rellawyer2
rename related_ia2___17 reldoctor2
rename related_ia2___18 relothmed2
rename related_ia2___19 relmental2
rename related_ia2___20 relrelig2
rename related_ia2___21 relchurch2
rename related_ia2___22 relclub2
rename related_ia2___23 relleisure2

rename related_ia3___1 relpartner3
rename related_ia3___2 relparent3
rename related_ia3___3 relsibling3
rename related_ia3___4 relchild3
rename related_ia3___5 relgrandp3
rename related_ia3___6 relgrandc3
rename related_ia3___7 relauntunc3
rename related_ia3___8 relinlaw3
rename related_ia3___9 relothrel3
rename related_ia3___10 relcowork3
rename related_ia3___11 relneigh3
rename related_ia3___12 relfriend3
rename related_ia3___13 relboss3
rename related_ia3___14 relemploy3
rename related_ia3___15 relschool3
rename related_ia3___16 rellawyer3
rename related_ia3___17 reldoctor3
rename related_ia3___18 relothmed3
rename related_ia3___19 relmental3
rename related_ia3___20 relrelig3
rename related_ia3___21 relchurch3
rename related_ia3___22 relclub3
rename related_ia3___23 relleisure3

rename related_ia4___1 relpartner4
rename related_ia4___2 relparent4
rename related_ia4___3 relsibling4
rename related_ia4___4 relchild4
rename related_ia4___5 relgrandp4
rename related_ia4___6 relgrandc4
rename related_ia4___7 relauntunc4
rename related_ia4___8 relinlaw4
rename related_ia4___9 relothrel4
rename related_ia4___10 relcowork4
rename related_ia4___11 relneigh4
rename related_ia4___12 relfriend4
rename related_ia4___13 relboss4
rename related_ia4___14 relemploy4
rename related_ia4___15 relschool4
rename related_ia4___16 rellawyer4
rename related_ia4___17 reldoctor4
rename related_ia4___18 relothmed4
rename related_ia4___19 relmental4
rename related_ia4___20 relrelig4
rename related_ia4___21 relchurch4
rename related_ia4___22 relclub4
rename related_ia4___23 relleisure4

rename related_ia5___1 relpartner5
rename related_ia5___2 relparent5
rename related_ia5___3 relsibling5
rename related_ia5___4 relchild5
rename related_ia5___5 relgrandp5
rename related_ia5___6 relgrandc5
rename related_ia5___7 relauntunc5
rename related_ia5___8 relinlaw5
rename related_ia5___9 relothrel5
rename related_ia5___10 relcowork5
rename related_ia5___11 relneigh5
rename related_ia5___12 relfriend5
rename related_ia5___13 relboss5
rename related_ia5___14 relemploy5
rename related_ia5___15 relschool5
rename related_ia5___16 rellawyer5
rename related_ia5___17 reldoctor5
rename related_ia5___18 relothmed5
rename related_ia5___19 relmental5
rename related_ia5___20 relrelig5
rename related_ia5___21 relchurch5
rename related_ia5___22 relclub5
rename related_ia5___23 relleisure5

rename related_ia6___1 relpartner6
rename related_ia6___2 relparent6
rename related_ia6___3 relsibling6
rename related_ia6___4 relchild6
rename related_ia6___5 relgrandp6
rename related_ia6___6 relgrandc6
rename related_ia6___7 relauntunc6
rename related_ia6___8 relinlaw6
rename related_ia6___9 relothrel6
rename related_ia6___10 relcowork6
rename related_ia6___11 relneigh6
rename related_ia6___12 relfriend6
rename related_ia6___13 relboss6
rename related_ia6___14 relemploy6
rename related_ia6___15 relschool6
rename related_ia6___16 rellawyer6
rename related_ia6___17 reldoctor6
rename related_ia6___18 relothmed6
rename related_ia6___19 relmental6
rename related_ia6___20 relrelig6
rename related_ia6___21 relchurch6
rename related_ia6___22 relclub6
rename related_ia6___23 relleisure6

rename related_ia7___1 relpartner7
rename related_ia7___2 relparent7
rename related_ia7___3 relsibling7
rename related_ia7___4 relchild7
rename related_ia7___5 relgrandp7
rename related_ia7___6 relgrandc7
rename related_ia7___7 relauntunc7
rename related_ia7___8 relinlaw7
rename related_ia7___9 relothrel7
rename related_ia7___10 relcowork7
rename related_ia7___11 relneigh7
rename related_ia7___12 relfriend7
rename related_ia7___13 relboss7
rename related_ia7___14 relemploy7
rename related_ia7___15 relschool7
rename related_ia7___16 rellawyer7
rename related_ia7___17 reldoctor7
rename related_ia7___18 relothmed7
rename related_ia7___19 relmental7
rename related_ia7___20 relrelig7
rename related_ia7___21 relchurch7
rename related_ia7___22 relclub7
rename related_ia7___23 relleisure7

rename related_ib1___1 relpartner8
rename related_ib1___2 relparent8
rename related_ib1___3 relsibling8
rename related_ib1___4 relchild8
rename related_ib1___5 relgrandp8
rename related_ib1___6 relgrandc8
rename related_ib1___7 relauntunc8
rename related_ib1___8 relinlaw8
rename related_ib1___9 relothrel8
rename related_ib1___10 relcowork8
rename related_ib1___11 relneigh8
rename related_ib1___12 relfriend8
rename related_ib1___13 relboss8
rename related_ib1___14 relemploy8
rename related_ib1___15 relschool8
rename related_ib1___16 rellawyer8
rename related_ib1___17 reldoctor8
rename related_ib1___18 relothmed8
rename related_ib1___19 relmental8
rename related_ib1___20 relrelig8
rename related_ib1___21 relchurch8
rename related_ib1___22 relclub8
rename related_ib1___23 relleisure8

rename related_ib2___1 relpartner9
rename related_ib2___2 relparent9
rename related_ib2___3 relsibling9
rename related_ib2___4 relchild9
rename related_ib2___5 relgrandp9
rename related_ib2___6 relgrandc9
rename related_ib2___7 relauntunc9
rename related_ib2___8 relinlaw9
rename related_ib2___9 relothrel9
rename related_ib2___10 relcowork9
rename related_ib2___11 relneigh9
rename related_ib2___12 relfriend9
rename related_ib2___13 relboss9
rename related_ib2___14 relemploy9
rename related_ib2___15 relschool9
rename related_ib2___16 rellawyer9
rename related_ib2___17 reldoctor9
rename related_ib2___18 relothmed9
rename related_ib2___19 relmental9
rename related_ib2___20 relrelig9
rename related_ib2___21 relchurch9
rename related_ib2___22 relclub9
rename related_ib2___23 relleisure9

rename related_ib3___1 relpartner10
rename related_ib3___2 relparent10
rename related_ib3___3 relsibling10
rename related_ib3___4 relchild10
rename related_ib3___5 relgrandp10
rename related_ib3___6 relgrandc10
rename related_ib3___7 relauntunc10
rename related_ib3___8 relinlaw10
rename related_ib3___9 relothrel10
rename related_ib3___10 relcowork10
rename related_ib3___11 relneigh10
rename related_ib3___12 relfriend10
rename related_ib3___13 relboss10
rename related_ib3___14 relemploy10
rename related_ib3___15 relschool10
rename related_ib3___16 rellawyer10
rename related_ib3___17 reldoctor10
rename related_ib3___18 relothmed10
rename related_ib3___19 relmental10
rename related_ib3___20 relrelig10
rename related_ib3___21 relchurch10
rename related_ib3___22 relclub10
rename related_ib3___23 relleisure10

rename related_ib4___1 relpartner11
rename related_ib4___2 relparent11
rename related_ib4___3 relsibling11
rename related_ib4___4 relchild11
rename related_ib4___5 relgrandp11
rename related_ib4___6 relgrandc11
rename related_ib4___7 relauntunc11
rename related_ib4___8 relinlaw11
rename related_ib4___9 relothrel11
rename related_ib4___10 relcowork11
rename related_ib4___11 relneigh11
rename related_ib4___12 relfriend11
rename related_ib4___13 relboss11
rename related_ib4___14 relemploy11
rename related_ib4___15 relschool11
rename related_ib4___16 rellawyer11
rename related_ib4___17 reldoctor11
rename related_ib4___18 relothmed11
rename related_ib4___19 relmental11
rename related_ib4___20 relrelig11
rename related_ib4___21 relchurch11
rename related_ib4___22 relclub11
rename related_ib4___23 relleisure11

rename related_ic1___1 relpartner12
rename related_ic1___2 relparent12
rename related_ic1___3 relsibling12
rename related_ic1___4 relchild12
rename related_ic1___5 relgrandp12
rename related_ic1___6 relgrandc12
rename related_ic1___7 relauntunc12
rename related_ic1___8 relinlaw12
rename related_ic1___9 relothrel12
rename related_ic1___10 relcowork12
rename related_ic1___11 relneigh12
rename related_ic1___12 relfriend12
rename related_ic1___13 relboss12
rename related_ic1___14 relemploy12
rename related_ic1___15 relschool12
rename related_ic1___16 rellawyer12
rename related_ic1___17 reldoctor12
rename related_ic1___18 relothmed12
rename related_ic1___19 relmental12
rename related_ic1___20 relrelig12
rename related_ic1___21 relchurch12
rename related_ic1___22 relclub12
rename related_ic1___23 relleisure12

rename related_ic2___1 relpartner13
rename related_ic2___2 relparent13
rename related_ic2___3 relsibling13
rename related_ic2___4 relchild13
rename related_ic2___5 relgrandp13
rename related_ic2___6 relgrandc13
rename related_ic2___7 relauntunc13
rename related_ic2___8 relinlaw13
rename related_ic2___9 relothrel13
rename related_ic2___10 relcowork13
rename related_ic2___11 relneigh13
rename related_ic2___12 relfriend13
rename related_ic2___13 relboss13
rename related_ic2___14 relemploy13
rename related_ic2___15 relschool13
rename related_ic2___16 rellawyer13
rename related_ic2___17 reldoctor13
rename related_ic2___18 relothmed13
rename related_ic2___19 relmental13
rename related_ic2___20 relrelig13
rename related_ic2___21 relchurch13
rename related_ic2___22 relclub13
rename related_ic2___23 relleisure13

rename related_ic3___1 relpartner14
rename related_ic3___2 relparent14
rename related_ic3___3 relsibling14
rename related_ic3___4 relchild14
rename related_ic3___5 relgrandp14
rename related_ic3___6 relgrandc14
rename related_ic3___7 relauntunc14
rename related_ic3___8 relinlaw14
rename related_ic3___9 relothrel14
rename related_ic3___10 relcowork14
rename related_ic3___11 relneigh14
rename related_ic3___12 relfriend14
rename related_ic3___13 relboss14
rename related_ic3___14 relemploy14
rename related_ic3___15 relschool14
rename related_ic3___16 rellawyer14
rename related_ic3___17 reldoctor14
rename related_ic3___18 relothmed14
rename related_ic3___19 relmental14
rename related_ic3___20 relrelig14
rename related_ic3___21 relchurch14
rename related_ic3___22 relclub14
rename related_ic3___23 relleisure14

rename related_ic4___1 relpartner15
rename related_ic4___2 relparent15
rename related_ic4___3 relsibling15
rename related_ic4___4 relchild15
rename related_ic4___5 relgrandp15
rename related_ic4___6 relgrandc15
rename related_ic4___7 relauntunc15
rename related_ic4___8 relinlaw15
rename related_ic4___9 relothrel15
rename related_ic4___10 relcowork15
rename related_ic4___11 relneigh15
rename related_ic4___12 relfriend15
rename related_ic4___13 relboss15
rename related_ic4___14 relemploy15
rename related_ic4___15 relschool15
rename related_ic4___16 rellawyer15
rename related_ic4___17 reldoctor15
rename related_ic4___18 relothmed15
rename related_ic4___19 relmental15
rename related_ic4___20 relrelig15
rename related_ic4___21 relchurch15
rename related_ic4___22 relclub15
rename related_ic4___23 relleisure15

rename related_ha1___1 relpartner16
rename related_ha1___2 relparent16
rename related_ha1___3 relsibling16
rename related_ha1___4 relchild16
rename related_ha1___5 relgrandp16
rename related_ha1___6 relgrandc16
rename related_ha1___7 relauntunc16
rename related_ha1___8 relinlaw16
rename related_ha1___9 relothrel16
rename related_ha1___10 relcowork16
rename related_ha1___11 relneigh16
rename related_ha1___12 relfriend16
rename related_ha1___13 relboss16
rename related_ha1___14 relemploy16
rename related_ha1___15 relschool16
rename related_ha1___16 rellawyer16
rename related_ha1___17 reldoctor16
rename related_ha1___18 relothmed16
rename related_ha1___19 relmental16
rename related_ha1___20 relrelig16
rename related_ha1___21 relchurch16
rename related_ha1___22 relclub16
rename related_ha1___23 relleisure16

rename related_ha2___1 relpartner17
rename related_ha2___2 relparent17
rename related_ha2___3 relsibling17
rename related_ha2___4 relchild17
rename related_ha2___5 relgrandp17
rename related_ha2___6 relgrandc17
rename related_ha2___7 relauntunc17
rename related_ha2___8 relinlaw17
rename related_ha2___9 relothrel17
rename related_ha2___10 relcowork17
rename related_ha2___11 relneigh17
rename related_ha2___12 relfriend17
rename related_ha2___13 relboss17
rename related_ha2___14 relemploy17
rename related_ha2___15 relschool17
rename related_ha2___16 rellawyer17
rename related_ha2___17 reldoctor17
rename related_ha2___18 relothmed17
rename related_ha2___19 relmental17
rename related_ha2___20 relrelig17
rename related_ha2___21 relchurch17
rename related_ha2___22 relclub17
rename related_ha2___23 relleisure17

rename related_ha3___1 relpartner18
rename related_ha3___2 relparent18
rename related_ha3___3 relsibling18
rename related_ha3___4 relchild18
rename related_ha3___5 relgrandp18
rename related_ha3___6 relgrandc18
rename related_ha3___7 relauntunc18
rename related_ha3___8 relinlaw18
rename related_ha3___9 relothrel18
rename related_ha3___10 relcowork18
rename related_ha3___11 relneigh18
rename related_ha3___12 relfriend18
rename related_ha3___13 relboss18
rename related_ha3___14 relemploy18
rename related_ha3___15 relschool18
rename related_ha3___16 rellawyer18
rename related_ha3___17 reldoctor18
rename related_ha3___18 relothmed18
rename related_ha3___19 relmental18
rename related_ha3___20 relrelig18
rename related_ha3___21 relchurch18
rename related_ha3___22 relclub18
rename related_ha3___23 relleisure18

rename related_ha4___1 relpartner19
rename related_ha4___2 relparent19
rename related_ha4___3 relsibling19
rename related_ha4___4 relchild19
rename related_ha4___5 relgrandp19
rename related_ha4___6 relgrandc19
rename related_ha4___7 relauntunc19
rename related_ha4___8 relinlaw19
rename related_ha4___9 relothrel19
rename related_ha4___10 relcowork19
rename related_ha4___11 relneigh19
rename related_ha4___12 relfriend19
rename related_ha4___13 relboss19
rename related_ha4___14 relemploy19
rename related_ha4___15 relschool19
rename related_ha4___16 rellawyer19
rename related_ha4___17 reldoctor19
rename related_ha4___18 relothmed19
rename related_ha4___19 relmental19
rename related_ha4___20 relrelig19
rename related_ha4___21 relchurch19
rename related_ha4___22 relclub19
rename related_ha4___23 relleisure19

rename related_ha5___1 relpartner20
rename related_ha5___2 relparent20
rename related_ha5___3 relsibling20
rename related_ha5___4 relchild20
rename related_ha5___5 relgrandp20
rename related_ha5___6 relgrandc20
rename related_ha5___7 relauntunc20
rename related_ha5___8 relinlaw20
rename related_ha5___9 relothrel20
rename related_ha5___10 relcowork20
rename related_ha5___11 relneigh20
rename related_ha5___12 relfriend20
rename related_ha5___13 relboss20
rename related_ha5___14 relemploy20
rename related_ha5___15 relschool20
rename related_ha5___16 rellawyer20
rename related_ha5___17 reldoctor20
rename related_ha5___18 relothmed20
rename related_ha5___19 relmental20
rename related_ha5___20 relrelig20
rename related_ha5___21 relchurch20
rename related_ha5___22 relclub20
rename related_ha5___23 relleisure20

rename related_ha6___1 relpartner21
rename related_ha6___2 relparent21
rename related_ha6___3 relsibling21
rename related_ha6___4 relchild21
rename related_ha6___5 relgrandp21
rename related_ha6___6 relgrandc21
rename related_ha6___7 relauntunc21
rename related_ha6___8 relinlaw21
rename related_ha6___9 relothrel21
rename related_ha6___10 relcowork21
rename related_ha6___11 relneigh21
rename related_ha6___12 relfriend21
rename related_ha6___13 relboss21
rename related_ha6___14 relemploy21
rename related_ha6___15 relschool21
rename related_ha6___16 rellawyer21
rename related_ha6___17 reldoctor21
rename related_ha6___18 relothmed21
rename related_ha6___19 relmental21
rename related_ha6___20 relrelig21
rename related_ha6___21 relchurch21
rename related_ha6___22 relclub21
rename related_ha6___23 relleisure21

rename related_ha7___1 relpartner22
rename related_ha7___2 relparent22
rename related_ha7___3 relsibling22
rename related_ha7___4 relchild22
rename related_ha7___5 relgrandp22
rename related_ha7___6 relgrandc22
rename related_ha7___7 relauntunc22
rename related_ha7___8 relinlaw22
rename related_ha7___9 relothrel22
rename related_ha7___10 relcowork22
rename related_ha7___11 relneigh22
rename related_ha7___12 relfriend22
rename related_ha7___13 relboss22
rename related_ha7___14 relemploy22
rename related_ha7___15 relschool22
rename related_ha7___16 rellawyer22
rename related_ha7___17 reldoctor22
rename related_ha7___18 relothmed22
rename related_ha7___19 relmental22
rename related_ha7___20 relrelig22
rename related_ha7___21 relchurch22
rename related_ha7___22 relclub22
rename related_ha7___23 relleisure22

rename related_hb1___1 relpartner23
rename related_hb1___2 relparent23
rename related_hb1___3 relsibling23
rename related_hb1___4 relchild23
rename related_hb1___5 relgrandp23
rename related_hb1___6 relgrandc23
rename related_hb1___7 relauntunc23
rename related_hb1___8 relinlaw23
rename related_hb1___9 relothrel23
rename related_hb1___10 relcowork23
rename related_hb1___11 relneigh23
rename related_hb1___12 relfriend23
rename related_hb1___13 relboss23
rename related_hb1___14 relemploy23
rename related_hb1___15 relschool23
rename related_hb1___16 rellawyer23
rename related_hb1___17 reldoctor23
rename related_hb1___18 relothmed23
rename related_hb1___19 relmental23
rename related_hb1___20 relrelig23
rename related_hb1___21 relchurch23
rename related_hb1___22 relclub23
rename related_hb1___23 relleisure23

rename related_hb2___1 relpartner24
rename related_hb2___2 relparent24
rename related_hb2___3 relsibling24
rename related_hb2___4 relchild24
rename related_hb2___5 relgrandp24
rename related_hb2___6 relgrandc24
rename related_hb2___7 relauntunc24
rename related_hb2___8 relinlaw24
rename related_hb2___9 relothrel24
rename related_hb2___10 relcowork24
rename related_hb2___11 relneigh24
rename related_hb2___12 relfriend24
rename related_hb2___13 relboss24
rename related_hb2___14 relemploy24
rename related_hb2___15 relschool24
rename related_hb2___16 rellawyer24
rename related_hb2___17 reldoctor24
rename related_hb2___18 relothmed24
rename related_hb2___19 relmental24
rename related_hb2___20 relrelig24
rename related_hb2___21 relchurch24
rename related_hb2___22 relclub24
rename related_hb2___23 relleisure24

rename related_hb3___1 relpartner25
rename related_hb3___2 relparent25
rename related_hb3___3 relsibling25
rename related_hb3___4 relchild25
rename related_hb3___5 relgrandp25
rename related_hb3___6 relgrandc25
rename related_hb3___7 relauntunc25
rename related_hb3___8 relinlaw25
rename related_hb3___9 relothrel25
rename related_hb3___10 relcowork25
rename related_hb3___11 relneigh25
rename related_hb3___12 relfriend25
rename related_hb3___13 relboss25
rename related_hb3___14 relemploy25
rename related_hb3___15 relschool25
rename related_hb3___16 rellawyer25
rename related_hb3___17 reldoctor25
rename related_hb3___18 relothmed25
rename related_hb3___19 relmental25
rename related_hb3___20 relrelig25
rename related_hb3___21 relchurch25
rename related_hb3___22 relclub25
rename related_hb3___23 relleisure25

rename related_hb4___1 relpartner26
rename related_hb4___2 relparent26
rename related_hb4___3 relsibling26
rename related_hb4___4 relchild26
rename related_hb4___5 relgrandp26
rename related_hb4___6 relgrandc26
rename related_hb4___7 relauntunc26
rename related_hb4___8 relinlaw26
rename related_hb4___9 relothrel26
rename related_hb4___10 relcowork26
rename related_hb4___11 relneigh26
rename related_hb4___12 relfriend26
rename related_hb4___13 relboss26
rename related_hb4___14 relemploy26
rename related_hb4___15 relschool26
rename related_hb4___16 rellawyer26
rename related_hb4___17 reldoctor26
rename related_hb4___18 relothmed26
rename related_hb4___19 relmental26
rename related_hb4___20 relrelig26
rename related_hb4___21 relchurch26
rename related_hb4___22 relclub26
rename related_hb4___23 relleisure26

rename related_hc1___1 relpartner27
rename related_hc1___2 relparent27
rename related_hc1___3 relsibling27
rename related_hc1___4 relchild27
rename related_hc1___5 relgrandp27
rename related_hc1___6 relgrandc27
rename related_hc1___7 relauntunc27
rename related_hc1___8 relinlaw27
rename related_hc1___9 relothrel27
rename related_hc1___10 relcowork27
rename related_hc1___11 relneigh27
rename related_hc1___12 relfriend27
rename related_hc1___13 relboss27
rename related_hc1___14 relemploy27
rename related_hc1___15 relschool27
rename related_hc1___16 rellawyer27
rename related_hc1___17 reldoctor27
rename related_hc1___18 relothmed27
rename related_hc1___19 relmental27
rename related_hc1___20 relrelig27
rename related_hc1___21 relchurch27
rename related_hc1___22 relclub27
rename related_hc1___23 relleisure27

rename related_hc2___1 relpartner28
rename related_hc2___2 relparent28
rename related_hc2___3 relsibling28
rename related_hc2___4 relchild28
rename related_hc2___5 relgrandp28
rename related_hc2___6 relgrandc28
rename related_hc2___7 relauntunc28
rename related_hc2___8 relinlaw28
rename related_hc2___9 relothrel28
rename related_hc2___10 relcowork28
rename related_hc2___11 relneigh28
rename related_hc2___12 relfriend28
rename related_hc2___13 relboss28
rename related_hc2___14 relemploy28
rename related_hc2___15 relschool28
rename related_hc2___16 rellawyer28
rename related_hc2___17 reldoctor28
rename related_hc2___18 relothmed28
rename related_hc2___19 relmental28
rename related_hc2___20 relrelig28
rename related_hc2___21 relchurch28
rename related_hc2___22 relclub28
rename related_hc2___23 relleisure28

rename related_hc3___1 relpartner29
rename related_hc3___2 relparent29
rename related_hc3___3 relsibling29
rename related_hc3___4 relchild29
rename related_hc3___5 relgrandp29
rename related_hc3___6 relgrandc29
rename related_hc3___7 relauntunc29
rename related_hc3___8 relinlaw29
rename related_hc3___9 relothrel29
rename related_hc3___10 relcowork29
rename related_hc3___11 relneigh29
rename related_hc3___12 relfriend29
rename related_hc3___13 relboss29
rename related_hc3___14 relemploy29
rename related_hc3___15 relschool29
rename related_hc3___16 rellawyer29
rename related_hc3___17 reldoctor29
rename related_hc3___18 relothmed29
rename related_hc3___19 relmental29
rename related_hc3___20 relrelig29
rename related_hc3___21 relchurch29
rename related_hc3___22 relclub29
rename related_hc3___23 relleisure29

rename related_hc4___1 relpartner30
rename related_hc4___2 relparent30
rename related_hc4___3 relsibling30
rename related_hc4___4 relchild30
rename related_hc4___5 relgrandp30
rename related_hc4___6 relgrandc30
rename related_hc4___7 relauntunc30
rename related_hc4___8 relinlaw30
rename related_hc4___9 relothrel30
rename related_hc4___10 relcowork30
rename related_hc4___11 relneigh30
rename related_hc4___12 relfriend30
rename related_hc4___13 relboss30
rename related_hc4___14 relemploy30
rename related_hc4___15 relschool30
rename related_hc4___16 rellawyer30
rename related_hc4___17 reldoctor30
rename related_hc4___18 relothmed30
rename related_hc4___19 relmental30
rename related_hc4___20 relrelig30
rename related_hc4___21 relchurch30
rename related_hc4___22 relclub30
rename related_hc4___23 relleisure30

rename helped_ia1___1 listen1
rename helped_ia1___2 care1
rename helped_ia1___3 advice1
rename helped_ia1___4 chores1
rename helped_ia1___5 loan1

rename helped_ia2___1 listen2
rename helped_ia2___2 care2
rename helped_ia2___3 advice2
rename helped_ia2___4 chores2
rename helped_ia2___5 loan2

rename helped_ia3___1 listen3
rename helped_ia3___2 care3
rename helped_ia3___3 advice3
rename helped_ia3___4 chores3
rename helped_ia3___5 loan3

rename helped_ia4___1 listen4
rename helped_ia4___2 care4
rename helped_ia4___3 advice4
rename helped_ia4___4 chores4
rename helped_ia4___5 loan4

rename helped_ia5___1 listen5
rename helped_ia5___2 care5
rename helped_ia5___3 advice5
rename helped_ia5___4 chores5
rename helped_ia5___5 loan5

rename helped_ia6___1 listen6
rename helped_ia6___2 care6
rename helped_ia6___3 advice6
rename helped_ia6___4 chores6
rename helped_ia6___5 loan6

rename helped_ia7___1 listen7
rename helped_ia7___2 care7
rename helped_ia7___3 advice7
rename helped_ia7___4 chores7
rename helped_ia7___5 loan7

rename helped_ib1___1 listen8
rename helped_ib1___2 care8
rename helped_ib1___3 advice8
rename helped_ib1___4 chores8
rename helped_ib1___5 loan8

rename helped_ib2___1 listen9
rename helped_ib2___2 care9
rename helped_ib2___3 advice9
rename helped_ib2___4 chores9
rename helped_ib2___5 loan9

rename helped_ib3___1 listen10
rename helped_ib3___2 care10
rename helped_ib3___3 advice10
rename helped_ib3___4 chores10
rename helped_ib3___5 loan10

rename helped_ib4___1 listen11
rename helped_ib4___2 care11
rename helped_ib4___3 advice11
rename helped_ib4___4 chores11
rename helped_ib4___5 loan11

rename helped_ic1___1 listen12
rename helped_ic1___2 care12
rename helped_ic1___3 advice12
rename helped_ic1___4 chores12
rename helped_ic1___5 loan12

rename helped_ic2___1 listen13
rename helped_ic2___2 care13
rename helped_ic2___3 advice13
rename helped_ic2___4 chores13
rename helped_ic2___5 loan13

rename helped_ic3___1 listen14
rename helped_ic3___2 care14
rename helped_ic3___3 advice14
rename helped_ic3___4 chores14
rename helped_ic3___5 loan14

rename helped_ic4___1 listen15
rename helped_ic4___2 care15
rename helped_ic4___3 advice15
rename helped_ic4___4 chores15
rename helped_ic4___5 loan15

rename helped_ha1___1 listen16
rename helped_ha1___2 care16
rename helped_ha1___3 advice16
rename helped_ha1___4 chores16
rename helped_ha1___5 loan16

rename helped_ha2___1 listen17
rename helped_ha2___2 care17
rename helped_ha2___3 advice17
rename helped_ha2___4 chores17
rename helped_ha2___5 loan17

rename helped_ha3___1 listen18
rename helped_ha3___2 care18
rename helped_ha3___3 advice18
rename helped_ha3___4 chores18
rename helped_ha3___5 loan18

rename helped_ha4___1 listen19
rename helped_ha4___2 care19
rename helped_ha4___3 advice19
rename helped_ha4___4 chores19
rename helped_ha4___5 loan19

rename helped_ha5___1 listen20
rename helped_ha5___2 care20
rename helped_ha5___3 advice20
rename helped_ha5___4 chores20
rename helped_ha5___5 loan20

rename helped_ha6___1 listen21
rename helped_ha6___2 care21
rename helped_ha6___3 advice21
rename helped_ha6___4 chores21
rename helped_ha6___5 loan21

rename helped_ha7___1 listen22
rename helped_ha7___2 care22
rename helped_ha7___3 advice22
rename helped_ha7___4 chores22
rename helped_ha7___5 loan22

rename helped_hb1___1 listen23
rename helped_hb1___2 care23
rename helped_hb1___3 advice23
rename helped_hb1___4 chores23
rename helped_hb1___5 loan23

rename helped_hb2___1 listen24
rename helped_hb2___2 care24
rename helped_hb2___3 advice24
rename helped_hb2___4 chores24
rename helped_hb2___5 loan24

rename helped_hb3___1 listen25
rename helped_hb3___2 care25
rename helped_hb3___3 advice25
rename helped_hb3___4 chores25
rename helped_hb3___5 loan25

rename helped_hb4___1 listen26
rename helped_hb4___2 care26
rename helped_hb4___3 advice26
rename helped_hb4___4 chores26
rename helped_hb4___5 loan26

rename helped_hc1___1 listen27
rename helped_hc1___2 care27
rename helped_hc1___3 advice27
rename helped_hc1___4 chores27
rename helped_hc1___5 loan27

rename helped_hc2___1 listen28
rename helped_hc2___2 care28
rename helped_hc2___3 advice28
rename helped_hc2___4 chores28
rename helped_hc2___5 loan28

rename helped_hc3___1 listen29
rename helped_hc3___2 care29
rename helped_hc3___3 advice29
rename helped_hc3___4 chores29
rename helped_hc3___5 loan29

rename helped_hc4___1 listen30
rename helped_hc4___2 care30
rename helped_hc4___3 advice30
rename helped_hc4___4 chores30
rename helped_hc4___5 loan30

rename gender_ia1 gender1
rename howclose_ia1 howclose1
rename seetalk_ia1 seetalk1
rename knowabout_ia1 knowabout1
rename trustdoctors_ia1 trustdoctors1
rename difficult_ia1 difficult1
rename strong_ia1 strong1

rename gender_ia2 gender2
rename howclose_ia2 howclose2
rename seetalk_ia2 seetalk2
rename knowabout_ia2 knowabout2
rename trustdoctors_ia2 trustdoctors2
rename difficult_ia2 difficult2
rename strong_ia2 strong2

rename gender_ia3 gender3
rename howclose_ia3 howclose3
rename seetalk_ia3 seetalk3
rename knowabout_ia3 knowabout3
rename trustdoctors_ia3 trustdoctors3
rename difficult_ia3 difficult3
rename strong_ia3 strong3

rename gender_ia4 gender4
rename howclose_ia4 howclose4
rename seetalk_ia4 seetalk4
rename knowabout_ia4 knowabout4
rename trustdoctors_ia4 trustdoctors4
rename difficult_ia4 difficult4
rename strong_ia4 strong4

rename gender_ia5 gender5
rename howclose_ia5 howclose5
rename seetalk_ia5 seetalk5
rename knowabout_ia5 knowabout5
rename trustdoctors_ia5 trustdoctors5
rename difficult_ia5 difficult5
rename strong_ia5 strong5

rename gender_ia6 gender6
rename howclose_ia6 howclose6
rename seetalk_ia6 seetalk6
rename knowabout_ia6 knowabout6
rename trustdoctors_ia6 trustdoctors6
rename difficult_ia6 difficult6
rename strong_ia6 strong6

rename gender_ia7 gender7
rename howclose_ia7 howclose7
rename seetalk_ia7 seetalk7
rename knowabout_ia7 knowabout7
rename trustdoctors_ia7 trustdoctors7
rename difficult_ia7 difficult7
rename strong_ia7 strong7

rename gender_ib1 gender8
rename howclose_ib1 howclose8
rename seetalk_ib1 seetalk8
rename knowabout_ib1 knowabout8
rename trustdoctors_ib1 trustdoctors8
rename difficult_ib1 difficult8
rename strong_ib1 strong8

rename gender_ib2 gender9
rename howclose_ib2 howclose9
rename seetalk_ib2 seetalk9
rename knowabout_ib2 knowabout9
rename trustdoctors_ib2 trustdoctors9
rename difficult_ib2 difficult9
rename strong_ib2 strong9

rename gender_ib3 gender10
rename howclose_ib3 howclose10
rename seetalk_ib3 seetalk10
rename knowabout_ib3 knowabout10
rename trustdoctors_ib3 trustdoctors10
rename difficult_ib3 difficult10
rename strong_ib3 strong10

rename gender_ib4 gender11
rename howclose_ib4 howclose11
rename seetalk_ib4 seetalk11
rename knowabout_ib4 knowabout11
rename trustdoctors_ib4 trustdoctors11
rename difficult_ib4 difficult11
rename strong_ib4 strong11

rename gender_ic1 gender12
rename howclose_ic1 howclose12
rename seetalk_ic1 seetalk12
rename knowabout_ic1 knowabout12
rename trustdoctors_ic1 trustdoctors12
rename difficult_ic1 difficult12
rename strong_ic1 strong12

rename gender_ic2 gender13
rename howclose_ic2 howclose13
rename seetalk_ic2 seetalk13
rename knowabout_ic2 knowabout13
rename trustdoctors_ic2 trustdoctors13
rename difficult_ic2 difficult13
rename strong_ic2 strong13

rename gender_ic3 gender14
rename howclose_ic3 howclose14
rename seetalk_ic3 seetalk14
rename knowabout_ic3 knowabout14
rename trustdoctors_ic3 trustdoctors14
rename difficult_ic3 difficult14
rename strong_ic3 strong14

rename gender_ic4 gender15
rename howclose_ic4 howclose15
rename seetalk_ic4 seetalk15
rename knowabout_ic4 knowabout15
rename trustdoctors_ic4 trustdoctors15
rename difficult_ic4 difficult15
rename strong_ic4 strong15

rename gender_ha1 gender16
rename howclose_ha1 howclose16
rename seetalk_ha1 seetalk16
rename knowabout_ha1 knowabout16
rename trustdoctors_ha1 trustdoctors16
rename difficult_ha1 difficult16
rename strong_ha1 strong16

rename gender_ha2 gender17
rename howclose_ha2 howclose17
rename seetalk_ha2 seetalk17
rename knowabout_ha2 knowabout17
rename trustdoctors_ha2 trustdoctors17
rename difficult_ha2 difficult17
rename strong_ha2 strong17

rename gender_ha3 gender18
rename howclose_ha3 howclose18
rename seetalk_ha3 seetalk18
rename knowabout_ha3 knowabout18
rename trustdoctors_ha3 trustdoctors18
rename difficult_ha3 difficult18
rename strong_ha3 strong18

rename gender_ha4 gender19
rename howclose_ha4 howclose19
rename seetalk_ha4 seetalk19
rename knowabout_ha4 knowabout19
rename trustdoctors_ha4 trustdoctors19
rename difficult_ha4 difficult19
rename strong_ha4 strong19

rename gender_ha5 gender20
rename howclose_ha5 howclose20
rename seetalk_ha5 seetalk20
rename knowabout_ha5 knowabout20
rename trustdoctors_ha5 trustdoctors20
rename difficult_ha5 difficult20
rename strong_ha5 strong20

rename gender_ha6 gender21
rename howclose_ha6 howclose21
rename seetalk_ha6 seetalk21
rename knowabout_ha6 knowabout21
rename trustdoctors_ha6 trustdoctors21
rename difficult_ha6 difficult21
rename strong_ha6 strong21

rename gender_ha7 gender22
rename howclose_ha7 howclose22
rename seetalk_ha7 seetalk22
rename knowabout_ha7 knowabout22
rename trustdoctors_ha7 trustdoctors22
rename difficult_ha7 difficult22
rename strong_ha7 strong22

rename gender_hb1 gender23
rename howclose_hb1 howclose23
rename seetalk_hb1 seetalk23
rename knowabout_hb1 knowabout23
rename trustdoctors_hb1 trustdoctors23
rename difficult_hb1 difficult23
rename strong_hb1 strong23

rename gender_hb2 gender24
rename howclose_hb2 howclose24
rename seetalk_hb2 seetalk24
rename knowabout_hb2 knowabout24
rename trustdoctors_hb2 trustdoctors24
rename difficult_hb2 difficult24
rename strong_hb2 strong24

rename gender_hb3 gender25
rename howclose_hb3 howclose25
rename seetalk_hb3 seetalk25
rename knowabout_hb3 knowabout25
rename trustdoctors_hb3 trustdoctors25
rename difficult_hb3 difficult25
rename strong_hb3 strong25

rename gender_hb4 gender26
rename howclose_hb4 howclose26
rename seetalk_hb4 seetalk26
rename knowabout_hb4 knowabout26
rename trustdoctors_hb4 trustdoctors26
rename difficult_hb4 difficult26
rename strong_hb4 strong26

rename gender_hc1 gender27
rename howclose_hc1 howclose27
rename seetalk_hc1 seetalk27
rename knowabout_hc1 knowabout27
rename trustdoctors_hc1 trustdoctors27
rename difficult_hc1 difficult27
rename strong_hc1 strong27

rename gender_hc2 gender28
rename howclose_hc2 howclose28
rename seetalk_hc2 seetalk28
rename knowabout_hc2 knowabout28
rename trustdoctors_hc2 trustdoctors28
rename difficult_hc2 difficult28
rename strong_hc2 strong28

rename gender_hc3 gender29
rename howclose_hc3 howclose29
rename seetalk_hc3 seetalk29
rename knowabout_hc3 knowabout29
rename trustdoctors_hc3 trustdoctors29
rename difficult_hc3 difficult29
rename strong_hc3 strong29

rename gender_hc4 gender30
rename howclose_hc4 howclose30
rename seetalk_hc4 seetalk30
rename knowabout_hc4 knowabout30
rename trustdoctors_hc4 trustdoctors30
rename difficult_hc4 difficult30
rename strong_hc4 strong30

rename name_ia1 name1
rename name_ia2 name2
rename name_ia3 name3
rename name_ia4 name4
rename name_ia5 name5
rename name_ia6 name6
rename name_ia7 name7
rename name_ib1 name8
rename name_ib2 name9
rename name_ib3 name10
rename name_ib4 name11
rename name_ic1 name12
rename name_ic2 name13
rename name_ic3 name14
rename name_ic4 name15 //1-15 are important matter names
rename name_ha1 name16
rename name_ha2 name17
rename name_ha3 name18
rename name_ha4 name19
rename name_ha5 name20
rename name_ha6 name21
rename name_ha7 name22
rename name_hb1 name23
rename name_hb2 name24
rename name_hb3 name25
rename name_hb4 name26
rename name_hc1 name27
rename name_hc2 name28
rename name_hc3 name29
rename name_hc4 name30 //16-30 are health matter names


rename	matrix_ia1_ia2	matrix_1_2
rename	matrix_ia1_ia3	matrix_1_3
rename	matrix_ia1_ia4	matrix_1_4
rename	matrix_ia1_ia5	matrix_1_5
rename	matrix_ia1_ia6	matrix_1_6
rename	matrix_ia1_ia7	matrix_1_7
rename	matrix_ia1_ib1	matrix_1_8
rename	matrix_ia1_ib2	matrix_1_9
rename	matrix_ia1_ib3	matrix_1_10
rename	matrix_ia1_ib4	matrix_1_11
rename	matrix_ia1_ic1	matrix_1_12
rename	matrix_ia1_ic2	matrix_1_13
rename	matrix_ia1_ic3	matrix_1_14
rename	matrix_ia1_ic4	matrix_1_15
rename	matrix_ia1_ha1	matrix_1_16
rename	matrix_ia1_ha2	matrix_1_17
rename	matrix_ia1_ha3	matrix_1_18
rename	matrix_ia1_ha4	matrix_1_19
rename	matrix_ia1_ha5	matrix_1_20
rename	matrix_ia1_ha6	matrix_1_21
rename	matrix_ia1_ha7	matrix_1_22
rename	matrix_ia1_hb1	matrix_1_23
rename	matrix_ia1_hb2	matrix_1_24
rename	matrix_ia1_hb3	matrix_1_25
rename	matrix_ia1_hb4	matrix_1_26
rename	matrix_ia1_hc1	matrix_1_27
rename	matrix_ia1_hc2	matrix_1_28
rename	matrix_ia1_hc3	matrix_1_29
rename	matrix_ia1_hc4	matrix_1_30
rename	matrix_ia2_ia3	matrix_2_3
rename	matrix_ia2_ia4	matrix_2_4
rename	matrix_ia2_ia5	matrix_2_5
rename	matrix_ia2_ia6	matrix_2_6
rename	matrix_ia2_ia7	matrix_2_7
rename	matrix_ia2_ib1	matrix_2_8
rename	matrix_ia2_ib2	matrix_2_9
rename	matrix_ia2_ib3	matrix_2_10
rename	matrix_ia2_ib4	matrix_2_11
rename	matrix_ia2_ic1	matrix_2_12
rename	matrix_ia2_ic2	matrix_2_13
rename	matrix_ia2_ic3	matrix_2_14
rename	matrix_ia2_ic4	matrix_2_15
rename	matrix_ia2_ha1	matrix_2_16
rename	matrix_ia2_ha2	matrix_2_17
rename	matrix_ia2_ha3	matrix_2_18
rename	matrix_ia2_ha4	matrix_2_19
rename	matrix_ia2_ha5	matrix_2_20
rename	matrix_ia2_ha6	matrix_2_21
rename	matrix_ia2_ha7	matrix_2_22
rename	matrix_ia2_hb1	matrix_2_23
rename	matrix_ia2_hb2	matrix_2_24
rename	matrix_ia2_hb3	matrix_2_25
rename	matrix_ia2_hb4	matrix_2_26
rename	matrix_ia2_hc1	matrix_2_27
rename	matrix_ia2_hc2	matrix_2_28
rename	matrix_ia2_hc3	matrix_2_29
rename	matrix_ia2_hc4	matrix_2_30
rename	matrix_ia3_ia4	matrix_3_4
rename	matrix_ia3_ia5	matrix_3_5
rename	matrix_ia3_ia6	matrix_3_6
rename	matrix_ia3_ia7	matrix_3_7
rename	matrix_ia3_ib1	matrix_3_8
rename	matrix_ia3_ib2	matrix_3_9
rename	matrix_ia3_ib3	matrix_3_10
rename	matrix_ia3_ib4	matrix_3_11
rename	matrix_ia3_ic1	matrix_3_12
rename	matrix_ia3_ic2	matrix_3_13
rename	matrix_ia3_ic3	matrix_3_14
rename	matrix_ia3_ic4	matrix_3_15
rename	matrix_ia3_ha1	matrix_3_16
rename	matrix_ia3_ha2	matrix_3_17
rename	matrix_ia3_ha3	matrix_3_18
rename	matrix_ia3_ha4	matrix_3_19
rename	matrix_ia3_ha5	matrix_3_20
rename	matrix_ia3_ha6	matrix_3_21
rename	matrix_ia3_ha7	matrix_3_22
rename	matrix_ia3_hb1	matrix_3_23
rename	matrix_ia3_hb2	matrix_3_24
rename	matrix_ia3_hb3	matrix_3_25
rename	matrix_ia3_hb4	matrix_3_26
rename	matrix_ia3_hc1	matrix_3_27
rename	matrix_ia3_hc2	matrix_3_28
rename	matrix_ia3_hc3	matrix_3_29
rename	matrix_ia3_hc4	matrix_3_30
rename	matrix_ia4_ia5	matrix_4_5
rename	matrix_ia4_ia6	matrix_4_6
rename	matrix_ia4_ia7	matrix_4_7
rename	matrix_ia4_ib1	matrix_4_8
rename	matrix_ia4_ib2	matrix_4_9
rename	matrix_ia4_ib3	matrix_4_10
rename	matrix_ia4_ib4	matrix_4_11
rename	matrix_ia4_ic1	matrix_4_12
rename	matrix_ia4_ic2	matrix_4_13
rename	matrix_ia4_ic3	matrix_4_14
rename	matrix_ia4_ic4	matrix_4_15
rename	matrix_ia4_ha1	matrix_4_16
rename	matrix_ia4_ha2	matrix_4_17
rename	matrix_ia4_ha3	matrix_4_18
rename	matrix_ia4_ha4	matrix_4_19
rename	matrix_ia4_ha5	matrix_4_20
rename	matrix_ia4_ha6	matrix_4_21
rename	matrix_ia4_ha7	matrix_4_22
rename	matrix_ia4_hb1	matrix_4_23
rename	matrix_ia4_hb2	matrix_4_24
rename	matrix_ia4_hb3	matrix_4_25
rename	matrix_ia4_hb4	matrix_4_26
rename	matrix_ia4_hc1	matrix_4_27
rename	matrix_ia4_hc2	matrix_4_28
rename	matrix_ia4_hc3	matrix_4_29
rename	matrix_ia4_hc4	matrix_4_30
rename	matrix_ia5_ia6	matrix_5_6
rename	matrix_ia5_ia7	matrix_5_7
rename	matrix_ia5_ib1	matrix_5_8
rename	matrix_ia5_ib2	matrix_5_9
rename	matrix_ia5_ib3	matrix_5_10
rename	matrix_ia5_ib4	matrix_5_11
rename	matrix_ia5_ic1	matrix_5_12
rename	matrix_ia5_ic2	matrix_5_13
rename	matrix_ia5_ic3	matrix_5_14
rename	matrix_ia5_ic4	matrix_5_15
rename	matrix_ia5_ha1	matrix_5_16
rename	matrix_ia5_ha2	matrix_5_17
rename	matrix_ia5_ha3	matrix_5_18
rename	matrix_ia5_ha4	matrix_5_19
rename	matrix_ia5_ha5	matrix_5_20
rename	matrix_ia5_ha6	matrix_5_21
rename	matrix_ia5_ha7	matrix_5_22
rename	matrix_ia5_hb1	matrix_5_23
rename	matrix_ia5_hb2	matrix_5_24
rename	matrix_ia5_hb3	matrix_5_25
rename	matrix_ia5_hb4	matrix_5_26
rename	matrix_ia5_hc1	matrix_5_27
rename	matrix_ia5_hc2	matrix_5_28
rename	matrix_ia5_hc3	matrix_5_29
rename	matrix_ia5_hc4	matrix_5_30
rename	matrix_ia6_ia7	matrix_6_7
rename	matrix_ia6_ib1	matrix_6_8
rename	matrix_ia6_ib2	matrix_6_9
rename	matrix_ia6_ib3	matrix_6_10
rename	matrix_ia6_ib4	matrix_6_11
rename	matrix_ia6_ic1	matrix_6_12
rename	matrix_ia6_ic2	matrix_6_13
rename	matrix_ia6_ic3	matrix_6_14
rename	matrix_ia6_ic4	matrix_6_15
rename	matrix_ia6_ha1	matrix_6_16
rename	matrix_ia6_ha2	matrix_6_17
rename	matrix_ia6_ha3	matrix_6_18
rename	matrix_ia6_ha4	matrix_6_19
rename	matrix_ia6_ha5	matrix_6_20
rename	matrix_ia6_ha6	matrix_6_21
rename	matrix_ia6_ha7	matrix_6_22
rename	matrix_ia6_hb1	matrix_6_23
rename	matrix_ia6_hb2	matrix_6_24
rename	matrix_ia6_hb3	matrix_6_25
rename	matrix_ia6_hb4	matrix_6_26
rename	matrix_ia6_hc1	matrix_6_27
rename	matrix_ia6_hc2	matrix_6_28
rename	matrix_ia6_hc3	matrix_6_29
rename	matrix_ia6_hc4	matrix_6_30
rename	matrix_ia7_ib1	matrix_7_8
rename	matrix_ia7_ib2	matrix_7_9
rename	matrix_ia7_ib3	matrix_7_10
rename	matrix_ia7_ib4	matrix_7_11
rename	matrix_ia7_ic1	matrix_7_12
rename	matrix_ia7_ic2	matrix_7_13
rename	matrix_ia7_ic3	matrix_7_14
rename	matrix_ia7_ic4	matrix_7_15
rename	matrix_ia7_ha1	matrix_7_16
rename	matrix_ia7_ha2	matrix_7_17
rename	matrix_ia7_ha3	matrix_7_18
rename	matrix_ia7_ha4	matrix_7_19
rename	matrix_ia7_ha5	matrix_7_20
rename	matrix_ia7_ha6	matrix_7_21
rename	matrix_ia7_ha7	matrix_7_22
rename	matrix_ia7_hb1	matrix_7_23
rename	matrix_ia7_hb2	matrix_7_24
rename	matrix_ia7_hb3	matrix_7_25
rename	matrix_ia7_hb4	matrix_7_26
rename	matrix_ia7_hc1	matrix_7_27
rename	matrix_ia7_hc2	matrix_7_28
rename	matrix_ia7_hc3	matrix_7_29
rename	matrix_ia7_hc4	matrix_7_30
rename	matrix_ib1_ib2	matrix_8_9
rename	matrix_ib1_ib3	matrix_8_10
rename	matrix_ib1_ib4	matrix_8_11
rename	matrix_ib1_ic1	matrix_8_12
rename	matrix_ib1_ic2	matrix_8_13
rename	matrix_ib1_ic3	matrix_8_14
rename	matrix_ib1_ic4	matrix_8_15
rename	matrix_ib1_ha1	matrix_8_16
rename	matrix_ib1_ha2	matrix_8_17
rename	matrix_ib1_ha3	matrix_8_18
rename	matrix_ib1_ha4	matrix_8_19
rename	matrix_ib1_ha5	matrix_8_20
rename	matrix_ib1_ha6	matrix_8_21
rename	matrix_ib1_ha7	matrix_8_22
rename	matrix_ib1_hb1	matrix_8_23
rename	matrix_ib1_hb2	matrix_8_24
rename	matrix_ib1_hb3	matrix_8_25
rename	matrix_ib1_hb4	matrix_8_26
rename	matrix_ib1_hc1	matrix_8_27
rename	matrix_ib1_hc2	matrix_8_28
rename	matrix_ib1_hc3	matrix_8_29
rename	matrix_ib1_hc4	matrix_8_30
rename	matrix_ib2_ib3	matrix_9_10
rename	matrix_ib2_ib4	matrix_9_11
rename	matrix_ib2_ic1	matrix_9_12
rename	matrix_ib2_ic2	matrix_9_13
rename	matrix_ib2_ic3	matrix_9_14
rename	matrix_ib2_ic4	matrix_9_15
rename	matrix_ib2_ha1	matrix_9_16
rename	matrix_ib2_ha2	matrix_9_17
rename	matrix_ib2_ha3	matrix_9_18
rename	matrix_ib2_ha4	matrix_9_19
rename	matrix_ib2_ha5	matrix_9_20
rename	matrix_ib2_ha6	matrix_9_21
rename	matrix_ib2_ha7	matrix_9_22
rename	matrix_ib2_hb1	matrix_9_23
rename	matrix_ib2_hb2	matrix_9_24
rename	matrix_ib2_hb3	matrix_9_25
rename	matrix_ib2_hb4	matrix_9_26
rename	matrix_ib2_hc1	matrix_9_27
rename	matrix_ib2_hc2	matrix_9_28
rename	matrix_ib2_hc3	matrix_9_29
rename	matrix_ib2_hc4	matrix_9_30
rename	matrix_ib3_ib4	matrix_10_11
rename	matrix_ib3_ic1	matrix_10_12
rename	matrix_ib3_ic2	matrix_10_13
rename	matrix_ib3_ic3	matrix_10_14
rename	matrix_ib3_ic4	matrix_10_15
rename	matrix_ib3_ha1	matrix_10_16
rename	matrix_ib3_ha2	matrix_10_17
rename	matrix_ib3_ha3	matrix_10_18
rename	matrix_ib3_ha4	matrix_10_19
rename	matrix_ib3_ha5	matrix_10_20
rename	matrix_ib3_ha6	matrix_10_21
rename	matrix_ib3_ha7	matrix_10_22
rename	matrix_ib3_hb1	matrix_10_23
rename	matrix_ib3_hb2	matrix_10_24
rename	matrix_ib3_hb3	matrix_10_25
rename	matrix_ib3_hb4	matrix_10_26
rename	matrix_ib3_hc1	matrix_10_27
rename	matrix_ib3_hc2	matrix_10_28
rename	matrix_ib3_hc3	matrix_10_29
rename	matrix_ib3_hc4	matrix_10_30
rename	matrix_ib4_ic1	matrix_11_12
rename	matrix_ib4_ic2	matrix_11_13
rename	matrix_ib4_ic3	matrix_11_14
rename	matrix_ib4_ic4	matrix_11_15
rename	matrix_ib4_ha1	matrix_11_16
rename	matrix_ib4_ha2	matrix_11_17
rename	matrix_ib4_ha3	matrix_11_18
rename	matrix_ib4_ha4	matrix_11_19
rename	matrix_ib4_ha5	matrix_11_20
rename	matrix_ib4_ha6	matrix_11_21
rename	matrix_ib4_ha7	matrix_11_22
rename	matrix_ib4_hb1	matrix_11_23
rename	matrix_ib4_hb2	matrix_11_24
rename	matrix_ib4_hb3	matrix_11_25
rename	matrix_ib4_hb4	matrix_11_26
rename	matrix_ib4_hc1	matrix_11_27
rename	matrix_ib4_hc2	matrix_11_28
rename	matrix_ib4_hc3	matrix_11_29
rename	matrix_ib4_hc4	matrix_11_30
rename	matrix_ic1_ic2	matrix_12_13
rename	matrix_ic1_ic3	matrix_12_14
rename	matrix_ic1_ic4	matrix_12_15
rename	matrix_ic1_ha1	matrix_12_16
rename	matrix_ic1_ha2	matrix_12_17
rename	matrix_ic1_ha3	matrix_12_18
rename	matrix_ic1_ha4	matrix_12_19
rename	matrix_ic1_ha5	matrix_12_20
rename	matrix_ic1_ha6	matrix_12_21
rename	matrix_ic1_ha7	matrix_12_22
rename	matrix_ic1_hb1	matrix_12_23
rename	matrix_ic1_hb2	matrix_12_24
rename	matrix_ic1_hb3	matrix_12_25
rename	matrix_ic1_hb4	matrix_12_26
rename	matrix_ic1_hc1	matrix_12_27
rename	matrix_ic1_hc2	matrix_12_28
rename	matrix_ic1_hc3	matrix_12_29
rename	matrix_ic1_hc4	matrix_12_30
rename	matrix_ic2_ic3	matrix_13_14
rename	matrix_ic2_ic4	matrix_13_15
rename	matrix_ic2_ha1	matrix_13_16
rename	matrix_ic2_ha2	matrix_13_17
rename	matrix_ic2_ha3	matrix_13_18
rename	matrix_ic2_ha4	matrix_13_19
rename	matrix_ic2_ha5	matrix_13_20
rename	matrix_ic2_ha6	matrix_13_21
rename	matrix_ic2_ha7	matrix_13_22
rename	matrix_ic2_hb1	matrix_13_23
rename	matrix_ic2_hb2	matrix_13_24
rename	matrix_ic2_hb3	matrix_13_25
rename	matrix_ic2_hb4	matrix_13_26
rename	matrix_ic2_hc1	matrix_13_27
rename	matrix_ic2_hc2	matrix_13_28
rename	matrix_ic2_hc3	matrix_13_29
rename	matrix_ic2_hc4	matrix_13_30
rename	matrix_ic3_ic4	matrix_14_15
rename	matrix_ic3_ha1	matrix_14_16
rename	matrix_ic3_ha2	matrix_14_17
rename	matrix_ic3_ha3	matrix_14_18
rename	matrix_ic3_ha4	matrix_14_19
rename	matrix_ic3_ha5	matrix_14_20
rename	matrix_ic3_ha6	matrix_14_21
rename	matrix_ic3_ha7	matrix_14_22
rename	matrix_ic3_hb1	matrix_14_23
rename	matrix_ic3_hb2	matrix_14_24
rename	matrix_ic3_hb3	matrix_14_25
rename	matrix_ic3_hb4	matrix_14_26
rename	matrix_ic3_hc1	matrix_14_27
rename	matrix_ic3_hc2	matrix_14_28
rename	matrix_ic3_hc3	matrix_14_29
rename	matrix_ic3_hc4	matrix_14_30
rename	matrix_ic4_ha1	matrix_15_16
rename	matrix_ic4_ha2	matrix_15_17
rename	matrix_ic4_ha3	matrix_15_18
rename	matrix_ic4_ha4	matrix_15_19
rename	matrix_ic4_ha5	matrix_15_20
rename	matrix_ic4_ha6	matrix_15_21
rename	matrix_ic4_ha7	matrix_15_22
rename	matrix_ic4_hb1	matrix_15_23
rename	matrix_ic4_hb2	matrix_15_24
rename	matrix_ic4_hb3	matrix_15_25
rename	matrix_ic4_hb4	matrix_15_26
rename	matrix_ic4_hc1	matrix_15_27
rename	matrix_ic4_hc2	matrix_15_28
rename	matrix_ic4_hc3	matrix_15_29
rename	matrix_ic4_hc4	matrix_15_30
rename	matrix_ha1_ha2	matrix_16_17
rename	matrix_ha1_ha3	matrix_16_18
rename	matrix_ha1_ha4	matrix_16_19
rename	matrix_ha1_ha5	matrix_16_20
rename	matrix_ha1_ha6	matrix_16_21
rename	matrix_ha1_ha7	matrix_16_22
rename	matrix_ha1_hb1	matrix_16_23
rename	matrix_ha1_hb2	matrix_16_24
rename	matrix_ha1_hb3	matrix_16_25
rename	matrix_ha1_hb4	matrix_16_26
rename	matrix_ha1_hc1	matrix_16_27
rename	matrix_ha1_hc2	matrix_16_28
rename	matrix_ha1_hc3	matrix_16_29
rename	matrix_ha1_hc4	matrix_16_30
rename	matrix_ha2_ha3	matrix_17_18
rename	matrix_ha2_ha4	matrix_17_19
rename	matrix_ha2_ha5	matrix_17_20
rename	matrix_ha2_ha6	matrix_17_21
rename	matrix_ha2_ha7	matrix_17_22
rename	matrix_ha2_hb1	matrix_17_23
rename	matrix_ha2_hb2	matrix_17_24
rename	matrix_ha2_hb3	matrix_17_25
rename	matrix_ha2_hb4	matrix_17_26
rename	matrix_ha2_hc1	matrix_17_27
rename	matrix_ha2_hc2	matrix_17_28
rename	matrix_ha2_hc3	matrix_17_29
rename	matrix_ha2_hc4	matrix_17_30
rename	matrix_ha3_ha4	matrix_18_19
rename	matrix_ha3_ha5	matrix_18_20
rename	matrix_ha3_ha6	matrix_18_21
rename	matrix_ha3_ha7	matrix_18_22
rename	matrix_ha3_hb1	matrix_18_23
rename	matrix_ha3_hb2	matrix_18_24
rename	matrix_ha3_hb3	matrix_18_25
rename	matrix_ha3_hb4	matrix_18_26
rename	matrix_ha3_hc1	matrix_18_27
rename	matrix_ha3_hc2	matrix_18_28
rename	matrix_ha3_hc3	matrix_18_29
rename	matrix_ha3_hc4	matrix_18_30
rename	matrix_ha4_ha5	matrix_19_20
rename	matrix_ha4_ha6	matrix_19_21
rename	matrix_ha4_ha7	matrix_19_22
rename	matrix_ha4_hb1	matrix_19_23
rename	matrix_ha4_hb2	matrix_19_24
rename	matrix_ha4_hb3	matrix_19_25
rename	matrix_ha4_hb4	matrix_19_26
rename	matrix_ha4_hc1	matrix_19_27
rename	matrix_ha4_hc2	matrix_19_28
rename	matrix_ha4_hc3	matrix_19_29
rename	matrix_ha4_hc4	matrix_19_30
rename	matrix_ha5_ha6	matrix_20_21
rename	matrix_ha5_ha7	matrix_20_22
rename	matrix_ha5_hb1	matrix_20_23
rename	matrix_ha5_hb2	matrix_20_24
rename	matrix_ha5_hb3	matrix_20_25
rename	matrix_ha5_hb4	matrix_20_26
rename	matrix_ha5_hc1	matrix_20_27
rename	matrix_ha5_hc2	matrix_20_28
rename	matrix_ha5_hc3	matrix_20_29
rename	matrix_ha5_hc4	matrix_20_30
rename	matrix_ha6_ha7	matrix_21_22
rename	matrix_ha6_hb1	matrix_21_23
rename	matrix_ha6_hb2	matrix_21_24
rename	matrix_ha6_hb3	matrix_21_25
rename	matrix_ha6_hb4	matrix_21_26
rename	matrix_ha6_hc1	matrix_21_27
rename	matrix_ha6_hc2	matrix_21_28
rename	matrix_ha6_hc3	matrix_21_29
rename	matrix_ha6_hc4	matrix_21_30
rename	matrix_ha7_hb1	matrix_22_23
rename	matrix_ha7_hb2	matrix_22_24
rename	matrix_ha7_hb3	matrix_22_25
rename	matrix_ha7_hb4	matrix_22_26
rename	matrix_ha7_hc1	matrix_22_27
rename	matrix_ha7_hc2	matrix_22_28
rename	matrix_ha7_hc3	matrix_22_29
rename	matrix_ha7_hc4	matrix_22_30
rename	matrix_hb1_hb2	matrix_23_24
rename	matrix_hb1_hb3	matrix_23_25
rename	matrix_hb1_hb4	matrix_23_26
rename	matrix_hb1_hc1	matrix_23_27
rename	matrix_hb1_hc2	matrix_23_28
rename	matrix_hb1_hc3	matrix_23_29
rename	matrix_hb1_hc4	matrix_23_30
rename	matrix_hb2_hb3	matrix_24_25
rename	matrix_hb2_hb4	matrix_24_26
rename	matrix_hb2_hc1	matrix_24_27
rename	matrix_hb2_hc2	matrix_24_28
rename	matrix_hb2_hc3	matrix_24_29
rename	matrix_hb2_hc4	matrix_24_30
rename	matrix_hb3_hb4	matrix_25_26
rename	matrix_hb3_hc1	matrix_25_27
rename	matrix_hb3_hc2	matrix_25_28
rename	matrix_hb3_hc3	matrix_25_29
rename	matrix_hb3_hc4	matrix_25_30
rename	matrix_hb4_hc1	matrix_26_27
rename	matrix_hb4_hc2	matrix_26_28
rename	matrix_hb4_hc3	matrix_26_29
rename	matrix_hb4_hc4	matrix_26_30
rename	matrix_hc1_hc2	matrix_27_28
rename	matrix_hc1_hc3	matrix_27_29
rename	matrix_hc1_hc4	matrix_27_30
rename	matrix_hc2_hc3	matrix_28_29
rename	matrix_hc2_hc4	matrix_28_30
rename	matrix_hc3_hc4	matrix_29_30


drop if set_study_id_complete==0 //drop people did not do interviews (this indicator is accurate)

/* name1-name15 are important matter, name16-name30 are health matter
egen imd=rownonmiss(name1-name15), strok //strok specifies name is string variables
egen hmd=rownonmiss(name16-name30), strok 
recode (imd hmd) (0=0) (1/15=1) 
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"
*/

recode matrix_1_2-matrix_29_30 (1=3)(2=2)(3=1)(4=0) // 0 = do not know each other
label define alterclose 0 "Dont know each other" 1 "Not very close" 2 "Sort of close" 3 "Very close"
label values matrix_* alterclose
/* count of each categories of alter-alter closeness
egen alterclose0=anycount(matrix_1_2-matrix_29_30),v(0)
egen alterclose0sum=total(alterclose0)
egen alterclose1=anycount(matrix_1_2-matrix_29_30),v(1)
egen alterclose1sum=total(alterclose1)
egen alterclose2=anycount(matrix_1_2-matrix_29_30),v(2)
egen alterclose2sum=total(alterclose2)
egen alterclose3=anycount(matrix_1_2-matrix_29_30),v(3)
egen alterclose3sum=total(alterclose3)
sum *sum
*/

egen npossties=rownonmiss(matrix_1_2-matrix_29_30)
egen totval=rowtotal(matrix_1_2-matrix_29_30),mi
gen density=totval/npossties
lab var density "Valued density of networks from matrix - study partner point of view"

foreach x of varlist matrix_1_2-matrix_29_30 {
gen new`x'=`x'
}
recode matrix_1_2-matrix_29_30 (2/3=1)(0/1=0)
egen totnum=rowtotal(matrix_1_2-matrix_29_30),mi
gen bdensity=totnum/npossties
lab var bdensity "Density of networks close\very close"

recode newmatrix_1_2-newmatrix_19_20 (1/3=1)(0=0)
egen totnum1=rowtotal(newmatrix_1_2-newmatrix_29_30),mi
gen b1density=totnum1/npossties
lab var b1density "Density of networks know each other-partner"

drop matrix_1_2-matrix_29_30 totnum newmatrix_1_2-newmatrix_29_30


/* Reshaping data into long format to create alter specific variables*/
********************************************************************************

*imd hmd need to be added to the reshape command
reshape long name gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong, i(SUBID) j(TIEID)

*Fixing typos and leading/trailing blanks in alter names
replace name="" if name=="." // convert . into missing in string
replace name=subinstr(name,".","",.) //remove . in names
replace name=strtrim(name) //remove leading/trailing space in names
replace name=stritrim(name) //collapse consecutive spaces into one space 

**Clean up duplicate names in 6 name generators (this is unique step for this wave due to lack of generator indicators---a different coding system)

duplicates tag SUBID name if !missing(name) ,gen(dup)

drop if inrange(dup, 1, 100) & missing(gender) //drop duplicates with incomplete data
duplicates list SUBID name if !missing(name)

drop if SUBID==3517 & TIEID==13 
drop if SUBID==3955 & TIEID==16
drop if SUBID==6277 & TIEID==11
drop if SUBID==6277 & TIEID==18
drop if SUBID==6341 & TIEID==8
drop if SUBID==6341 & TIEID==19
drop if SUBID==6440 & TIEID==9

bysort SUBID: egen netsize=count(name)
lab var netsize "Total number of alters mentioned-partner"

gen efctsize=netsize-2*(totnum1-netsize)/netsize
label var efctsize "Effective size-partner"

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
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity-partner"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member-partner"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin-partner"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion-partner"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend-partner"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close-partner"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network-partner"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE-partner"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often-partner"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network-partner"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE-partner"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network-partner"

drop seetalk

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age-partner"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network-partner"
gen knowaboutrp=knowabout
recode knowaboutrp (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutrp)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE-partner"
drop knowaboutrp

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot-partner"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network-partner"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE-partner"
drop trustdoctorsr

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions-partner"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE-partner"

gen thassles=difficult
bysort SUBID: egen mhassles=mean(thassles)
lab var mhassles "Mean hassles in network, HI=MORE-partner"
recode thassles (1/2=1)(3=0)
lab var thassles "Alter hassles, causes problems sometimes or a lot-partner"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network-partner"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE-partner"
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score-partner"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength-partner"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength-partner"

drop record_id redcap_survey_identifier

foreach x of varlist date_snad-sdstrength {
rename `x' `x'_i
}
gen time=1
save "SNAD-Partner-T1-Clean-LONG-20200827.dta", replace

duplicates drop SUBID, force

drop name_i-strong_i TIEID tfem_i tkin_i tfriend_i tclose_i tfreq_i tknow_i difficult_i thassles_i ttrust_i numsup_i //drop alter level variables

save "SNAD-Partner-T1-Clean-EGOAGG-20200827.dta", replace


 
 
 
***************************************************************************


*2.  LOADING INFORMANT DATA  T2*


***************************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "SNAD-Partner-T2.dta", clear


* DATA CLEANING T2*
***************************************************************************

rename studyid SUBID
duplicates list SUBID
*fix duplicates
list if SUBID==3315
drop if SUBID==3315 & missing(date_snad) //drop empty entry
list if SUBID==10031 
drop if SUBID==10031 & missing(date_snad) // drop empty entry
list if SUBID==. 
drop if missing(SUBID) //drop empty entry


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
lab var density "Valued density of networks from matrix - study partner point of view"

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
lab var b1density "Density of networks know each other-partner"

drop matrix_1_2-matrix_19_20 totnum newmatrix_1_2-newmatrix_19_20


*Reshaping data into long format to create alter specific variables
********************************************************************************

tostring name* w1alter* w1reasondropspecify*,replace //prepare for reshape
reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong ///
w1alter w1mention w1reasondrop w1reasondropspecify w1stillspeak, i(SUBID) j(TIEID)

replace w1alter="" if w1alter=="." // convert . into missing in string
replace w1reasondropspecify="" if w1reasondropspecify=="." // convert . into missing in string

*Fixing typos and leading/trailing blanks in alter names
replace name="" if name=="." // convert . into missing in string
replace name=subinstr(name,".","",.) //remove . in names
replace name=strtrim(name) //remove leading/trailing space in names
replace name=stritrim(name) //collapse consecutive spaces into one space 

duplicates list SUBID name if !missing(name) //no duplicate names 

bysort SUBID: egen netsize=count(name) 
lab var netsize "Total number of alters mentioned-partner"

gen efctsize=netsize-2*(totnum1-netsize)/netsize
label var efctsize "Effective size-partner"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity-partner"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member-partner"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin-partner"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion-partner"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend-partner"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close-partner"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network-partner"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE-partner"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often-partner"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network-partner"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE-partner"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network-partner"

drop seetalk

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age-partner"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network-partner"
gen knowaboutrp=knowabout
recode knowaboutrp (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutrp)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE-partner"
drop knowaboutrp

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot-partner"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network-partner"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE-partner"
drop trustdoctorsr

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions-partner"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE-partner"

gen thassles=difficult
bysort SUBID: egen mhassles=mean(thassles)
lab var mhassles "Mean hassles in network, HI=MORE-partner"
recode thassles (1/2=1)(3=0)
lab var thassles "Alter hassles, causes problems sometimes or a lot-partner"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network-partner"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE-partner"
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score-partner"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength-partner"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength-partner"

drop record_id 

foreach x of varlist date_snad-sdstrength {
rename `x' `x'_i
}
gen time=2
save "SNAD-Partner-T2-Clean-LONG-20200827.dta", replace

duplicates drop SUBID, force

drop name_i-strong_i TIEID tfem_i tkin_i tfriend_i tclose_i tfreq_i tknow_i difficult_i thassles_i ttrust_i numsup_i //drop alter level variables

save "SNAD-Partner-T2-Clean-EGOAGG-20200827.dta", replace


***************************************************************************


*3.  LOADING INFORMANT DATA  T3*


***************************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "SNAD-Partner-T3.dta", clear


* DATA CLEANING T3*
***************************************************************************

rename studyid SUBID
duplicates list SUBID //no duplicates
drop if missing(SUBID) //drop empty entry


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
lab var density "Valued density of networks from matrix - study partner point of view"

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
lab var b1density "Density of networks know each other-partner"

drop matrix_1_2-matrix_19_20 totnum newmatrix_1_2-newmatrix_19_20


*Reshaping data into long format to create alter specific variables
********************************************************************************

tostring name* w2alter* w2reasondropspecify*,replace //prepare for reshape
reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong ///
w2alter w2mention w2reasondrop w2reasondropspecify w2stillspeak, i(SUBID) j(TIEID)

replace w2alter="" if w2alter=="." // convert . into missing in string
replace w2reasondropspecify="" if w2reasondropspecify=="." // convert . into missing in string

*Fixing typos and leading/trailing blanks in alter names
replace name="" if name=="." // convert . into missing in string
replace name=subinstr(name,".","",.) //remove . in names
replace name=strtrim(name) //remove leading/trailing space in names
replace name=stritrim(name) //collapse consecutive spaces into one space 

duplicates list SUBID name if !missing(name) //no duplicate names 

bysort SUBID: egen netsize=count(name) 
lab var netsize "Total number of alters mentioned-partner"

gen efctsize=netsize-2*(totnum1-netsize)/netsize
label var efctsize "Effective size-partner"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity-partner"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member-partner"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin-partner"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion-partner"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend-partner"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close-partner"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network-partner"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE-partner"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often-partner"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network-partner"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE-partner"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network-partner"

drop seetalk

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age-partner"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network-partner"
gen knowaboutrp=knowabout
recode knowaboutrp (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutrp)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE-partner"
drop knowaboutrp

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot-partner"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network-partner"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE-partner"
drop trustdoctorsr

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions-partner"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE-partner"

gen thassles=difficult
bysort SUBID: egen mhassles=mean(thassles)
lab var mhassles "Mean hassles in network, HI=MORE-partner"
recode thassles (1/2=1)(3=0)
lab var thassles "Alter hassles, causes problems sometimes or a lot-partner"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network-partner"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE-partner"
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score-partner"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength-partner"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength-partner"

drop record_id 

foreach x of varlist date_snad-sdstrength {
rename `x' `x'_i
}
gen time=3
save "SNAD-Partner-T3-Clean-LONG.dta", replace

duplicates drop SUBID, force

drop name_i-strong_i TIEID tfem_i tkin_i tfriend_i tclose_i tfreq_i tknow_i difficult_i thassles_i ttrust_i numsup_i //drop alter level variables

save "SNAD-Partner-T3-Clean-EGOAGG.dta", replace




***************************************************************************


*4.  LOADING INFORMANT DATA  T4*


***************************************************************************
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data"
use "SNAD-Partner-T4-092520.dta", clear


* DATA CLEANING T4*
***************************************************************************

rename studyid SUBID
duplicates list SUBID //no duplicates
drop if missing(SUBID) //drop empty entry


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
lab var density "Valued density of networks from matrix - study partner point of view"

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
lab var b1density "Density of networks know each other-partner"

drop matrix_1_2-matrix_19_20 totnum newmatrix_1_2-newmatrix_19_20


*Reshaping data into long format to create alter specific variables
********************************************************************************

tostring name* w3alter* w3reasondropspecify*,replace //prepare for reshape
reshape long name imd imr imb hmd hmr hmb gender relpartner relparent relsibling relchild relgrandp ///
relgrandc relauntunc relinlaw relothrel relcowork relneigh relfriend relboss relemploy relschool ///
rellawyer reldoctor relothmed relmental relrelig relchurch relclub relleisure howclose seetalk knowabout ///
trustdoctors listen care advice chores loan difficult strong ///
w3alter w3mention w3reasondrop w3reasondropspecify w3stillspeak, i(SUBID) j(TIEID)

replace w3alter="" if w3alter=="." // convert . into missing in string
replace w3reasondropspecify="" if w3reasondropspecify=="." // convert . into missing in string

*Fixing typos and leading/trailing blanks in alter names
replace name="" if name=="." // convert . into missing in string
replace name=subinstr(name,".","",.) //remove . in names
replace name=strtrim(name) //remove leading/trailing space in names
replace name=stritrim(name) //collapse consecutive spaces into one space 

duplicates list SUBID name if !missing(name) //no duplicate names 

bysort SUBID: egen netsize=count(name) 
lab var netsize "Total number of alters mentioned-partner"

gen efctsize=netsize-2*(totnum1-netsize)/netsize
label var efctsize "Effective size-partner"

gen tfem=gender
recode tfem (2=1)(1=0)
lab var tfem "Alter is female"
drop gender
bysort SUBID: egen pfem=mean(tfem)
lab var pfem "Proportion female in network"

replace imd=. if missing(name)
bysort SUBID: egen pimd=mean(imd)
replace hmd=. if missing(name)
bysort SUBID: egen phmd=mean(hmd)
lab var pimd "Proportion important matters discussants"
lab var phmd "Proportion health matters discussants"

*diversity measure (Cohen)
egen othfam=rowtotal(relsibling relgrandp relgrandc relauntunc relothrel),mi //group into other family
egen fri=rowtotal(relfriend relleisure),mi //group into friend
egen work=rowtotal(relemploy relboss relcowork),mi //group into workmate
egen church=rowtotal(relrelig relchurch),mi //group into religious group
egen prof=rowtotal(relmental relothmed reldoctor rellawyer),mi //group into professional group

recode othfam fri work church prof (1/10=1)
foreach x of varlist relpartner relparent relinlaw relchild othfam relneigh fri work relschool church prof relclub {
egen u`x' = tag(SUBID `x') if `x'>0 & !missing(`x') // e.g., count multiple friends as 1 friend
}
egen miss=rowtotal(relpartner-relleisure)
recode urelpartner-urelclub (0=.) if miss==0 & netsize>0 //if a named alter is not specified for relation type then treat as missing
bysort SUBID: egen diverse=total(urelpartner+urelparent+urelinlaw+urelchild+uothfam+urelneigh+ufri+uwork+urelschool+uchurch+uprof+urelclub),mi // cohen's 12 categories(volunteer is not in this data thus leaving us 11 of 12 Cohen's categories, and I add a group call prof as a replacement)
drop miss urelpartner-urelclub othfam fri work church prof
lab var diverse "Network diversity-partner"

gen tkin=relpartner+relparent+relsibling+relchild+relgrandp+relgrandc+relauntunc+relinlaw+relothrel
recode tkin (1/9=1)
replace tkin=. if missing(name)
lab var tkin "Alter is family member-partner"
bysort SUBID: egen pkin=mean(tkin)
lab var pkin "Proportion of network that is kin-partner"

gen tfriend=relfriend+relleisure
recode tfriend (1/2=1)
replace tfriend=. if missing(name)
lab var tfriend "Alter is friend or companion-partner"
bysort SUBID: egen pfriend=mean(tfriend)
lab var pfriend "Proportion of network that is friend-partner"

gen tclose=howclose
recode tclose (2/3=0)
lab var tclose "Alter is very close-partner"
bysort SUBID: egen pclose=mean(tclose)
lab var pclose "Proportion very close in network-partner"
gen howcloser=howclose
recode howcloser (1=3)(3=1)
bysort SUBID: egen mclose=mean(howcloser)
lab var mclose "Mean closeness in network, HI=MORE-partner"
drop howcloser

gen tfreq=seetalk
recode tfreq (2/3=0)
lab var tfreq "Alter sees or talks to ego often-partner"
bysort SUBID: egen pfreq=mean(tfreq)
lab var pfreq "Proportion often in contact in network-partner"
gen seetalkr=seetalk
recode seetalkr (1=3)(3=1)
bysort SUBID: egen mfreq=mean(seetalkr)
lab var mfreq "Mean freq of contact in network, HI=MORE-partner"
bysort SUBID: egen sdfreq=sd(seetalkr)
lab var sdfreq "Standard deviation of freq of contact in network-partner"

drop seetalk

gen tknow=knowabout
recode tknow (2/3=0)
lab var tknow "Alter knows a lot about memory loss, confusion, or other similar problems that you might be experiencing as you age-partner"
bysort SUBID: egen pknow=mean(tknow)
lab var pknow "Proportion knows a lot in network-partner"
gen knowaboutrp=knowabout
recode knowaboutrp (1=3)(3=1)
bysort SUBID: egen mknow=mean(knowaboutrp)
lab var mknow "Mean knowledge of aging problems in network, HI=MORE-partner"
drop knowaboutrp

gen ttrust=trustdoctors
recode ttrust (2/3=0)(8=.)
lab var ttrust "Alter trusts doctors a lot-partner"
bysort SUBID: egen ptrust=mean(ttrust)
lab var ptrust "Proportion who trust doctors in network-partner"
gen trustdoctorsr=trustdoctors
recode trustdoctorsr (1=3)(3=1)(8=.)
bysort SUBID: egen mtrust=mean(trustdoctorsr)
lab var mtrust "Mean trust in doctors in network, HI=MORE-partner"
drop trustdoctorsr

egen numsup=rowtotal(listen-loan),mi
replace numsup=. if missing(name)
lab var numsup "Number of support functions-partner"
bysort SUBID: egen msupport=mean(numsup)
lab var msupport "Mean number of support functions in network, HI=MORE-partner"

gen thassles=difficult
bysort SUBID: egen mhassles=mean(thassles)
lab var mhassles "Mean hassles in network, HI=MORE-partner"
recode thassles (1/2=1)(3=0)
lab var thassles "Alter hassles, causes problems sometimes or a lot-partner"
bysort SUBID: egen phassles=mean(thassles)
lab var phassles "Proportion that hassle, cause problems in network-partner"

bysort SUBID: egen mstrength=mean(strong)
lab var mstrength "Mean tie strength in network, HI=MORE-partner"
bysort SUBID: egen weakest=min(strong)
lab var weakest "Minimum tie strength score-partner"
bysort SUBID: egen iqrstrength=iqr(strong)
lab var iqrstrength "Interquartile range of tie strength-partner"
bysort SUBID: egen sdstrength=sd(strong)
lab var sdstrength "Standard deveiation of tie strength-partner"

drop record_id 

foreach x of varlist date_snad-sdstrength {
rename `x' `x'_i
}
gen time=4
save "SNAD-Partner-T4-Clean-LONG.dta", replace

duplicates drop SUBID, force

drop name_i-strong_i TIEID tfem_i tkin_i tfriend_i tclose_i tfreq_i tknow_i difficult_i thassles_i ttrust_i numsup_i //drop alter level variables

save "SNAD-Partner-T4-Clean-EGOAGG.dta", replace




***************************************************************
//	#3 Append SNAD Informant T1, T2, T3, T4
***************************************************************
*ego aggregate data
use "SNAD-Partner-T1-Clean-EGOAGG-20200827.dta", clear
append using "SNAD-Partner-T2-Clean-EGOAGG-20200827.dta" //14 focal in T2 never in T1
append using "SNAD-Partner-T3-Clean-EGOAGG.dta",force //force: fix string/number mismatch
append using "SNAD-Partner-T4-Clean-EGOAGG.dta",force //force: fix string/number mismatch

sort SUBID time

save "SNAD-Partner-T1234-Clean-EGOAGG-20201002.dta", replace

*long data
use "SNAD-Partner-T1-Clean-LONG-20200827.dta", clear
append using "SNAD-Partner-T2-Clean-LONG-20200827.dta" 
append using "SNAD-Partner-T3-Clean-LONG.dta",force
append using "SNAD-Partner-T4-Clean-LONG.dta",force

sort SUBID TIEID time

save "SNAD-Partner-T1234-Clean-LONG-20201002.dta", replace