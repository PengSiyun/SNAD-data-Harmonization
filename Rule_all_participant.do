****Priject: SNAD
****Author:  Siyun Peng
****Date:    2021/12/22
****Version: 17
****Purpose: do file that runs all do files for SNAD participant


clear


**********************************************************************
**# 1 Pilot missing demo in Redcap: phone interviews to collect Demographics from ENSO; ENSO skipped demo if they participant in pilots
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot missing demo clean"
do "Pilot-participant-missingdemo-clean" //import & clean


**********************************************************************
**# 2 Redcap R01 data: demographics for R01 + all non Network data from SNAD
**********************************************************************


*clean old R01 created by Evan (Evan creates separate Redcap projects for each wave of R01; in each R01 wave, waves were created to track participant's pilot waves+R01 waves. It is an inefficient system, a new R01 project was created to streamline the process)
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old"
do "REDcapold-participant-w1-reshape" //import & reshape w1: 1st time R01 participants were assgined to different waves depending on their pilot participantions. Reshape this to represent 1 R01 wave.
do "REDcapold-participant-w2-reshape" //import & reshape w2
do "REDcapold-participant-clean" //clean reshaped data



*clean new R01 created by Peng
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01"
do "REDcap-participant-clean" //import & clean


**********************************************************************
**# 3 IADRC data: clinical + neuroimaging
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\IADRC clean"
do "IADRC-import excel-2021" //import and clean IADRC data


**********************************************************************
**# 4 Pilot data: Network
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"
do "SNAD-participant-pilot-clean-041320" //import and clean pilot data


**********************************************************************
**# 5 ENSO data: Network + some Demo
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code"
do "ENSO-participant-ego-clean" //import & clean ego level data
do "ENSO-participant-alter-clean" //import & clean alter level data
do "ENSO-participant-altertie-clean" //import & clean alter-alter tie level data
do "ENSO-participant-clean" //merge ENSO data together


**********************************************************************
**# 6 Netcanvas (NC) data: Network 
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\code"
*do "Unzip files-participant" //Unzip files into corresponding folders (only need to be done once data were downloaded from NC)
do "Netcanvas-participant-clean" //Clean 


**********************************************************************
**# 7 Merge & harmonize all sources of data 
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes"
do "Merge & harmonize data-participant" 


**********************************************************************
**# 8 Compute latent variables (e.g., Bridging capital, Cognitive resserve) 
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes"
do "Create latent variables" 


/*Summary of workflow
1. run Pilot missing demo in Redcap //pilot missing and old RO1 must precede R01
2. run REDCAP clean //redcap before ENSO
3. run IADRC clean 
4. run pilot clean
5. run ENSO clean
6. run NC clean
7. run Merge & harmonize 
8. run Create latent variables
