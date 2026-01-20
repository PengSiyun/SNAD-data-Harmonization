****Project: Create index for complex concepts
****Author:  Siyun Peng
****Date:    2022/04/27
****Version: 17
****Purpose: Create bridging and Cognitive reserve measures for SNAD


***************************************************************
**# 1 create bridging variable
***************************************************************


	/*load data in loop*/

	
cd "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data"
local files: dir . files "SNAD-Analysis-focal*match*dta" //load file names for loop

foreach file of local files {
    use "`file'", clear //Load focal matched data
	
	
	/*compute bridging ties*/
	

	sem (Bridging -> netsize diverse weakest density efctsize sole) if netsize>0 & !missing(netsize) ///
    , var(Bridging@1) method(mlmv) vce(cluster SUBID) cov(e.netsize*e.efctsize) cov(e.netsize*e.density) cov(e.diverse*e.density) cov(e.density*e.sole) cov(e.diverse*e.weakest) cov(e.netsize*e.diverse) cov(e.weakest*e.sole)
estat gof, stats(all)
estat mindices

predict bridging,latent(Bridging) 
label var bridging "Bridging capital"

*adjust bridging when netsize=0 or missing
replace bridging=. if missing(netsize) 
sum bridging
local min=r(min)
replace bridging=`min' if netsize==0 //set bridging to minimum value when netsize=0


    /*compute bonding ties*/
	

alpha family marriage friends,gen(rq)
lab var rq "Relationship quality"
alpha family_help1-problems_friends1,gen(pss)
lab var pss "Perceived social support"
sem (Bonding -> pkin plisten pcare padvice mstrength netsize rq	pss), var(Bonding@1) method(mlmv) vce(cluster SUBID) cov(e.pkin*e.netsize) cov(e.rq*e.pss) cov(e.pkin*e.mstrength) cov(e.mstrength*e.rq) cov(e.mstrength*e.pss) cov(e.netsize*e.pss) cov(e.netsize*e.rq) cov(e.pcare*e.pss)
estat gof, stats(all)
estat mindices

predict bonding,latent(Bonding) 
label var bonding "Bonding capital"

*adjust bonding when netsize=0 or missing
replace bonding=. if missing(netsize) 
sum bonding
local min=r(min)
replace bonding=`min' if netsize==0 //set bonding to minimum value when netsize=0



	/*compute cognitive reserve*/


    *prepare MRI measure 
destring lh_* rh_* icv meanhippvol meanamygvol,replace force // add back wmhypointensities once we have it
egen frolobe=rowmean(lh_caudalmiddlefrontal_thick rh_caudalmiddlefrontal_thick lh_rostralmiddlefrontal_thicknes rh_rostralmiddlefrontal_thicknes lh_superiorfrontal_thick rh_superiorfrontal_thick lh_lateralorbitofrontal_thick rh_lateralorbitofrontal_thick lh_medialorbitofrontal_thick rh_medialorbitofrontal_thick lh_parsopercularis_thick rh_parsopercularis_thick lh_parsorbitalis_thick rh_parsorbitalis_thick lh_parstriangularis_thick rh_parstriangularis_thick lh_frontalpole_thick rh_frontalpole_thick) 
egen parlobe=rowmean(lh_inferiorparietal_thick rh_inferiorparietal_thick lh_superiorparietal_thick rh_superiorparietal_thick lh_supramarginal_thick rh_supramarginal_thick lh_precuneus_thick rh_precuneus_thick)   
egen temlobe=rowmean(lh_bankssts_thick rh_bankssts_thick lh_entorhinal_thick rh_entorhinal_thick lh_inferiortemporal_thick rh_inferiortemporal_thick lh_middletemporal_thick rh_middletemporal_thick lh_superiortemporal_thick rh_superiortemporal_thick lh_fusiform_thick rh_fusiform_thick lh_parahippocampal_thick rh_parahippocampal_thick lh_temporalpole_thick rh_temporalpole_thick lh_transversetemporal_thick rh_transversetemporal_thick)   	
egen occlobe=rowmean(lh_cuneus_thick rh_cuneus_thick lh_lingual_thick rh_lingual_thick lh_lateraloccipital_thick rh_lateraloccipital_thick lh_pericalcarine_thick rh_pericalcarine_thick)
egen medtemp=rowmean(lh_entorhinal_thick rh_entorhinal_thick lh_fusiform_thick rh_fusiform_thick lh_parahippocampal_thick rh_parahippocampal_thick rh_temporalpole_thick lh_temporalpole_thick) 

*gen wmh=log(wmhypointensities) 

*label var wmh "White matter hyperintensities (log)"
label var frolobe "Frontal lobe thickness"
label var parlobe "Parietal lobe thickness"
label var temlobe "Temporal lobe thickness"
label var occlobe "Occipital lobe thickness"
label var medtemp "Medial temporal lobe thickness"


	*compute CR
reg moca_raw icv meanhippvol meanamygvol frolobe parlobe temlobe occlobe ,vce(robust) //add back wmh
predict residual, residuals
egen reserve=std(residual) 
drop residual
label var reserve "Cognitive reserve"
		

	/*compute UDS composites*/

**1 Create standardized scores to sample average **

recode veg animals udsbentc udsbentd minttots (95/99=.)

gen negTraila= -trail_a_time 
gen negTrailb= -trail_b_time 
regress negTrailb negTraila
predict Trailb_resid, residuals

egen reydelaySD=std(delayed_rey_sum)
foreach var in craftdre negTraila digforsl digbacls animals veg udsbentc udsbentd minttots  {
		egen `var'SD=std(`var')
		}

** 2 Create sample-specific composites**

		* Attention: Digit Span Forward/Backward (2-item)
		egen attention=rowmean(digforslSD digbaclsSD)  // note: higher is better
		
		* Speed of Processing: Trails A
		gen speed=negTrailaSD  // note: higher is better 
		
		* Executive Function: : Trails B [task-switching] (1-item) // formerly also Verbal Fluency (F & L words); 
		egen execfxn = std(Trailb_resid) // note: higher is better
		// formerly, egen exec=rowmean(UDSVERFCSD UDSVERLCSD negTrailbSD), but the alpha was too low 
		
		* Episodic Memory: Craft Story 21 (Recall Paraphrase); Rey AVLT Delayed Recall; Benson Complex Figure Recall (3-item)
		egen epmem=rowmean(craftdreSD reydelaySD udsbentdSD) // note: higher is better 
		
		* Language: Animal and Vegetable Naming, Multilingual Naming Test (3-item)
		egen language=rowmean(animalsSD vegSD minttotsSD)
		
		* Visual/Spatial: Benson Complex Figure Copy (1 item only)
		gen visual=udsbentcSD
		
** 3 Checking for outliers**
foreach x in attention speed execfxn epmem language visual {
gen outlier_`x' = `x'
recode outlier_`x' (min/-2=1) (else=0)
}
egen outlier_tot = rowtotal(outlier_attention outlier_speed outlier_execfxn outlier_epmem outlier_language outlier_visual)	
fre outlier_tot
list SUBID source if outlier_tot > 2

/*
** BONUS Create standardized latent scores from Kiselica et al. 2020 **
gen zCRAFTVRS = (CRAFTVRS - 21.9)/6.45
gen zUDSBENTC = (UDSBENTC -15.58)/1.31
gen zDIGIF = (digif - 8.34)/2.3
gen zDIGIB = (digib - 7.12)/2.2
gen zANIMALS = (animals - 21.63)/5.58

gen zVEG = (veg - 14.89)/4.04
gen zTRAILA = ((trail_a_time - 31.21)/12.25)*-1
gen zTRAILB = ((trail_b_time - 80.32)/38.42)*-1
gen zCRAFTDVR = (CRAFTDVR - 19.08)/6.53
gen zUDSBENTD = (UDSBENTD - 11.5)/2.9
gen zMINTTOTS = (MINTTOTS - 30.12)/2
gen zUDSVERTN = (UDSVER_TOT - 28.44)/8.14

***unadjusted for sex, age, or education
gen pop_speed_exec = (.581*zTRAILB) + (.437*zTRAILA) + (.57*zUDSVERTN)
gen pop_visual = (.427*zUDSBENTC) + (.685*zUDSBENTD)
gen pop_epmem = (.909*zCRAFTVRS) + (.952*zCRAFTDVR)
gen pop_attention = (.602*zDIGIF) + (.828*zDIGIB)
gen pop_language = (.456*zVEG) + (.637*zANIMALS) + (.497*zMINTTOTS)
gen gen_cog = (1.075*speed_exec) + (.507*visual) + (.404*ep_memory) + (.611*attention) + (.966*language)
*/		
		
		
	/*calculate heterogeneity network measures*/


gen diff_gender = 1-pfem if female==1	
replace diff_gender = pfem if female==0	
lab var diff_gender "Gender heterogeneity"

gen diff_college = 1-pcollege if edu==4 | edu==5
replace diff_college = pcollege if edu<4 & !missing(edu)	
lab var diff_college "Education heterogeneity" //only college or not is collected in R01

gen diff_white = 1-pwhite if white==1	
replace diff_white = pwhite if white==0	
lab var diff_white "Race heterogeneity (White vs. nonWhite)"

recode race (2=1) (3=2) (5=3) (1 4 6=4), gen(race4) //1Asian 2Black 3White 4Other, 4 categories in alter race
gen     diff_race = 1-pwhite if race4==3	
replace diff_race = 1-pblack if race4==2	
replace diff_race = 1-pasian if race4==1	
replace diff_race = 1-pother if race4==4	
lab var diff_race "Race heterogeneity"
drop race4

		
	/*merge with occupation complexity & prestige*/


	*complexity
merge m:1 SUBID using "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Occupation\occ_complexSNAD_03292022"
drop if _merge==2 //drop cases not in the cleanned data
drop _merge
	*prestige
merge m:1 SUBID using "C:\Users\siyunpeng\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Occupation\OccPrestigeSNAD_03292022"
drop if _merge==2 //drop cases not in the cleanned data
drop _merge

	/*save files*/
	
	save "`file'", replace
}