****Priject: SNAD
****Author:  Siyun Peng
****Date:    2022/04/22 
****Version: 17
****Purpose: do file that runs all do files for SNAD informant


clear


**********************************************************************
**# 1 Redcap R01 data: demographics for R01 + all non Network data from SNAD
**********************************************************************


*clean old R01 created by Evan (Evan creates separate Redcap projects for each wave of R01; in each R01 wave, waves were created to track participant's pilot waves+R01 waves. It is an inefficient system, a new R01 project was created to streamline the process)
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01-old"
do "REDcapold-informant-w1-reshape" //import & reshape w1: 1st time R01 participants were assgined to different waves depending on their pilot participantions. Reshape this to represent 1 R01 wave.
do "REDcapold-informant-w2-reshape" //import & reshape w2
do "REDcapold-informant-clean" //clean reshaped data



*clean new R01 created by Peng
cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Redcap R01"
do "REDcap-informant-clean" //import & clean



**********************************************************************
**# 2 Pilot data: Network
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Pilot clean"
do "SNAD-Partner-pilot-clean" //import and clean pilot data


**********************************************************************
**# 3 ENSO data: Network + some Demo
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\ENSO clean\Code"
do "ENSO-informant-ego-clean" //import & clean ego level data
do "ENSO-informant-Focal alter-clean" //import & clean FOCAL alter level data
do "ENSO-informant-Informant alter-clean" //import & clean INFORMANT alter level data
do "ENSO-informant-Focal altertie-clean" //import & clean FOCAL alter-alter tie level data
do "ENSO-informant-Informant altertie-clean" //import & clean INFORMANT alter-alter tie level data
do "ENSO-informant-clean" //merge ENSO data together


**********************************************************************
**# 4 Netcanvas (NC) data: Network 
**********************************************************************


cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes\Netcanvas\code"
*do "Unzip files-informant" //Unzip files into corresponding folders (only need to be done once data were downloaded from NC)
do "Netcanvas-informant-focal-clean" //Clean Focal alter 
do "Netcanvas-informant-informant-clean" //Clean Informant alter 


**********************************************************************
**# 5 Merge & harmonize all sources of data 
**********************************************************************



cd "C:\Users\bluep\Dropbox\peng\Academia\Work with Brea\SNAD\SNAD data\codes"
do "Merge & harmonize data-informant" 





/*Summary of workflow
1. run REDCAP clean //redcap before ENSO
2. run pilot clean
3. run ENSO clean
4. run NC clean
5. run Merge & harmonize 
