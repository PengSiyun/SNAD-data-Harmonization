# SNAD-data-Harmonization

Goal: Harmonize 5+ years of social network data, clinical data, and neuroimaging data from 6 sources and softwares
Please refer to Wiki for questions.

Run "Rule_all" do file will excute all necessary do files in order to produce cleaned data

Short summary of workflow of the Rule_all_participant do file:
1. run Pilot missing demo in Redcap: phone interviews to collect Demographics from ENSO; ENSO skipped demo if they participant in pilots
2. run REDCAP clean: demographics for R01 + psycho/social/behavioral data from SNAD
3. run IADRC clean: clinical + neuroimaging
4. run pilot clean: Social network data
5. run ENSO clean: Social Network + some Demographics
6. run NC clean: Social Network 
7. run Merge & harmonize: Merge and harmonize all data above ready for data analysis 

Short summary of workflow of the Rule_all_informant do file:
1. run REDCAP clean 
2. run pilot clean
3. run ENSO clean
4. run NC clean
5. run Merge & harmonize 
