****Project: Create index for complex concepts
****Author:  Siyun Peng
****Date:    2022/04/27
****Version: 17
****Purpose: Create bridging and Cognitive reserve measures for SNAD


***************************************************************
**# 1 create bridging variable
***************************************************************


	/*load data in loop*/

	
cd "C:\Users\peng_admin\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\clean data"
local files: dir . files "SNAD-Analysis-focal*match*dta" //load file names for loop

foreach file of local files {
    use "`file'", clear //Load focal matched data
	
	
	/*compute bridging ties*/
	
	
	sem (Bridging -> netsize diverse weakest density efctsize sole) if netsize>0 & !missing(netsize) ///
    , var(Bridging@1) method(mlmv) cov(e.netsize*e.efctsize) cov(e.netsize*e.density) cov(e.diverse*e.density) cov(e.density*e.sole) cov(e.diverse*e.weakest) cov(e.netsize*e.diverse) cov(e.weakest*e.sole)
estat gof, stats(all)
estat mindices

predict bridging,latent(Bridging) 
label var bridging "Bridging capital"

*adjust bridging when netsize=0 or missing
replace bridging=. if missing(netsize) 
sum bridging
local min=r(min)
replace bridging=`min' if netsize==0 //set bridging to minimum value when netsize=0


	/*compute cognitive reserve*/


    *prepare MRI measure 
destring lh_* rh_* wmhypointensities icv totalhippvol totalamygvol,replace
egen frolobe=rowmean(lh_caudalmiddlefrontal_thick rh_caudalmiddlefrontal_thick lh_rostralmiddlefrontal_thicknes rh_rostralmiddlefrontal_thicknes lh_superiorfrontal_thick rh_superiorfrontal_thick lh_lateralorbitofrontal_thick rh_lateralorbitofrontal_thick lh_medialorbitofrontal_thick rh_medialorbitofrontal_thick lh_parsopercularis_thick rh_parsopercularis_thick lh_parsorbitalis_thick rh_parsorbitalis_thick lh_parstriangularis_thick rh_parstriangularis_thick lh_frontalpole_thick rh_frontalpole_thick) 
egen parlobe=rowmean(lh_inferiorparietal_thick rh_inferiorparietal_thick lh_superiorparietal_thick rh_superiorparietal_thick lh_supramarginal_thick rh_supramarginal_thick lh_precuneus_thick rh_precuneus_thick)   
egen temlobe=rowmean(lh_bankssts_thick rh_bankssts_thick lh_entorhinal_thick rh_entorhinal_thick lh_inferiortemporal_thick rh_inferiortemporal_thick lh_middletemporal_thick rh_middletemporal_thick lh_superiortemporal_thick rh_superiortemporal_thick lh_fusiform_thick rh_fusiform_thick lh_parahippocampal_thick rh_parahippocampal_thick lh_temporalpole_thick rh_temporalpole_thick lh_transversetemporal_thick rh_transversetemporal_thick)   	
egen occlobe=rowmean(lh_cuneus_thick rh_cuneus_thick lh_lingual_thick rh_lingual_thick lh_lateraloccipital_thick rh_lateraloccipital_thick lh_pericalcarine_thick rh_pericalcarine_thick)
egen medtemp=rowmean(lh_entorhinal_thick rh_entorhinal_thick lh_fusiform_thick rh_fusiform_thick lh_parahippocampal_thick rh_parahippocampal_thick rh_temporalpole_thick lh_temporalpole_thick) 

gen wmh=log(wmhypointensities)

label var wmh "White matter hyperintensities (log)"
label var frolobe "Frontal lobe thickness"
label var parlobe "Parietal lobe thickness"
label var temlobe "Temporal lobe thickness"
label var occlobe "Occipital lobe thickness"
label var medtemp "Medial temporal lobe thickness"


	*compute CR
reg moca_raw icv totalhippvol totalamygvol wmh frolobe parlobe temlobe occlobe ,vce(robust)
predict residual, residuals
egen reserve=std(residual) 
drop residual
label var reserve "Cognitive reserve"
		

	/*merge with occupation complexity & prestige*/


	*complexity
merge m:1 SUBID using "C:\Users\peng_admin\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\occ_complexSNAD_03292022"
drop if _merge==2 //drop cases not in the cleanned data
drop _merge
	*prestige
merge m:1 SUBID using "C:\Users\peng_admin\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\OccPrestigeSNAD_03292022"
drop if _merge==2 //drop cases not in the cleanned data
drop _merge

	/*save files*/
	
	save "`file'", replace
}