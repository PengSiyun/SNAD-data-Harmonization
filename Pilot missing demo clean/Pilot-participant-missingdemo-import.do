version 13
clear

import delimited record_id subcc_id subfname sublname iadrcstatus subj_phone cr1 cr1e cr2 cr2e cr3 cr3e cr4 cr4e cr5 cr5e face_sheet_complete ccid int_name res_name interest phone_script_complete consent_auth consent_guar consent_guary consent_ic consent_ntime consent_notint consent_read consent_sign consent_print consent_date phone_consent_complete dem_1 dem_1_2 dem_2 dem_3 dem_4 dem_5 dem_6 dem_7 dem_8 dem_9 dem_10 dem_11 dem_12 dem_13 dem_14 dem_15 dem_16 dem_17 dem_18 thanks demographics_questio_v_0 using "PilotInterviewMissin_DATA_NOHDRS_2021-12-16_1115.csv", varnames(nonames)

label data "PilotInterviewMissin_DATA_NOHDRS_2021-12-16_1115.csv"

label define iadrcstatus_ 1 "Active, In person" 2 "Active, Phone Visit" 3 "Active, Brain Donation Only" 4 "Deceased" 5 "Discontinued" 6 "Lost to follow up" 
label define cr1_ 1 "Left Voicemail" 2 "Completed interview" 3 "Rescheduled for later" 4 "Verbal Refusal" 
label define cr2_ 1 "Left Voicemail" 2 "Completed interview" 3 "Rescheduled for later" 4 "Verbal Refusal" 
label define cr3_ 1 "Left Voicemail" 2 "Completed interview" 3 "Rescheduled for later" 4 "Verbal Refusal" 
label define cr4_ 1 "Left Voicemail" 2 "Completed interview" 3 "Rescheduled for later" 4 "Verbal Refusal" 
label define cr5_ 1 "Left Voicemail" 2 "Completed interview" 3 "Rescheduled for later" 4 "Verbal Refusal" 
label define face_sheet_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define interest_ 1 "Yes" 0 "No" 
label define phone_script_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define consent_auth_ 1 "Yes" 0 "No" 
label define consent_guar_ 1 "Yes" 0 "No" 
label define consent_guary_ 1 "Yes" 0 "No" 
label define consent_ic_ 1 "Yes" 2 "No time" 3 "Not interested" 
label define consent_read_ 1 "Yes" 0 "No" 
label define phone_consent_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define dem_1_ 1 "Full time" 2 "Part time" 3 "Homemaker" 
label define dem_1_2_ 1 "Yes" 0 "No" 
label define dem_4_ 1 "Manufacturer" 2 "Retailer" 3 "Wholesaler" 4 "Service Provider" 5 "Construction" 6 "Mining" 7 "Farming" 8 "Fishing" 9 "Forestry" 10 "Government" 11 "Other" 
label define dem_9_ 1 "Manufacturer" 2 "Retailer" 3 "Wholesaler" 4 "Service Provider" 5 "Construction" 6 "Mining" 7 "Farming" 8 "Fishing" 9 "Forestry" 10 "Government" 11 "Other" 
label define dem_15_ 1 "None" 2 "Almost none" 3 "Very few" 4 "Less than half" 5 "Close to half" 6 "More than half" 
label define dem_16_ 1 "None" 2 "Almost none" 3 "Very few" 4 "Less than half" 5 "Close to half" 6 "More than half" 
label define dem_17_ 1 "None" 2 "Almost none" 3 "Very few" 4 "Less than half" 5 "Close to half" 6 "More than half" 
label define dem_18_ 1 "None" 2 "Almost none" 3 "Very few" 4 "Less than half" 5 "Close to half" 6 "More than half" 
label define demographics_questio_v_0_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

label values iadrcstatus iadrcstatus_
label values cr1 cr1_
label values cr2 cr2_
label values cr3 cr3_
label values cr4 cr4_
label values cr5 cr5_
label values face_sheet_complete face_sheet_complete_
label values interest interest_
label values phone_script_complete phone_script_complete_
label values consent_auth consent_auth_
label values consent_guar consent_guar_
label values consent_guary consent_guary_
label values consent_ic consent_ic_
label values consent_read consent_read_
label values phone_consent_complete phone_consent_complete_
label values dem_1 dem_1_
label values dem_1_2 dem_1_2_
label values dem_4 dem_4_
label values dem_9 dem_9_
label values dem_15 dem_15_
label values dem_16 dem_16_
label values dem_17 dem_17_
label values dem_18 dem_18_
label values demographics_questio_v_0 demographics_questio_v_0_



tostring consent_date, replace
gen double _temp_ = Clock(consent_date,"YMDhms")
drop consent_date
rename _temp_ consent_date
format consent_date %tCMonth_dd,_CCYY_HH:MM:SS

label variable record_id "Record ID"
label variable subcc_id "Subject ID"
label variable subfname "Subject first name:"
label variable sublname "Subject last name:"
label variable iadrcstatus "Subject IADRC status:"
label variable subj_phone "Subject Phone Number:"
label variable cr1 "Contact Result 1:"
label variable cr1e "Explain above:"
label variable cr2 "Contact Result 2"
label variable cr2e "Explain above:"
label variable cr3 "Contact Result 3"
label variable cr3e "Explain above:"
label variable cr4 "Contact Result 4:"
label variable cr4e "Explain above:"
label variable cr5 "Contact Result 5:"
label variable cr5e "Explain above:"
label variable face_sheet_complete "Complete?"
label variable ccid "CCID"
label variable int_name "Interviewer name:"
label variable res_name "Respondent name:"
label variable interest "Is the subject interested?"
label variable phone_script_complete "Complete?"
label variable consent_auth "Are you legally authorized to provide consent for the potential subject?  (or: Are you legally authorized to provide consent for yourself?)  [Note: if another individual is completing the screen on behalf of the enrollee, all following statements will be edited to replace you/your with he/she,  his/her, or the potential subjects name.]  IF NO: Im sorry. Ill need to speak to someone authorized to consent for the potential subject to continue.  (Ask if an LAR is available, if not end the call.)"
label variable consent_guar "I also need to ask if you have a court-appointed or legal guardian that makes decisions for you. Is there anyone who makes health care decisions for you or on your behalf?"
label variable consent_guary "Is this someone who has been legally appointed by a judge (to make healthcare decisions for you)?  IF YES: Im sorry. Based on our current criteria, you are not eligible to complete the questionnaire today. I do not need to ask you any more questions. Thank you so much for your time today. (END; DOCUMENT INELIGIBILITY ON COVER)"
label variable consent_ic "OK. Today I would like to ask you some questions regarding your demographics and educational history. This questionnaire is part of the SNAD study and associated with the Indiana Alzheimers Disease Research Center. If you agree to participate, you will be one of approximately 300 study participants to complete this questionnaire. Minor risks are associated with taking part in this research study. First, although we take precautions to avoid loss of confidentiality, this is always a potential risk of participating in scientfic research. Second, you may experience mental fatigue associated with answering a large number of questions, some of which may be cognitively complex. Third, you may experience anxiety or discomfort when answering questions about sensitive or painful topics. If you become fatigued or anxious, you may stop participating at any time. You are also free to refuse to answer any questions in the interview.  Efforts will be made to keep your personal information confidential. We cannot guarantee absolute confidentiality. Your personal information may be disclosed if required by law. Your personal identity (such as your name, address, or other identifying information) will not be revealed in any published form, presentations, or writings about the results obtained in this study. All electronic data will be kept in databases maintained and protected by Indiana University, and data on paper forms will be stored in secured files at the IADC and the Department of Sociology at Indiana University, Bloomington.  Organizations that may inspect and/or copy your research records for quality assurance and data analysis include groups such as the study investigator and his/her research associates, the Indiana University Institutional Review Board (IRB) or its designees (as allowed by law), state or federal agencies, specifically the Office for Human Research Protections (OHRP), and the National Institutes of Health (NIH), who may need access to your medical and/or research records.  To help us protect your privacy, the IADC and NACC have obtained a Certificate of Confidentiality from the National Institutes of Health. With this Certificate, the researchers cannot be forced to disclose information that may identify you, even by a court subpoena, in any federal, state, or local civil, criminal, administrative, legislative, or other proceedings. The researchers will use the Certificate to resist any demands for information that would identify you, except as explained below.  The Certificate cannot be used to resist a demand for information from personnel of the United States Government that is used for auditing or evaluation of federally funded projects or for information that must be disclosed in order to meet the requirements of the U.S. Food and Drug Administration (FDA). A Certificate of Confidentiality does not prevent you or a member of your family from voluntarily releasing information about yourself or your involvement in this research. If an insurer, employer, or other person obtains your written consent to receive research information, then the researchers may not use the Certificate to withhold that information. For questions about the study, please call the study coordinator, Hope Sheean at 317-963-2762, or the investigators Dr. Brea Perry at 812-856-0447, Dr. Liana Apostolova at 317-963-7436, or Dr. Andrew Saykin at 317-963-7229, Monday through Friday, 8:00 AM - 5:00 PM.  For questions about your rights as a research participant or to discuss problems, complaints or concerns about a research study, or to obtain information, or offer input, contact the Indiana University Human Subjects Office at 317-278-3458 or 800-696-2949. This activity will take approximately 5-10 minutes. Are you interested in completing this today?  PROBE IF NEEDED: This was the survey that asked questions about the people in your life, and about your physical and mental health. There was a short portion of memory questions and you saw one of our neurologists in Goodman Hall.  PROBE IF NEEDED: Your responses will be strictly confidential. By providing your honest answers for this academic study, youll be helping us make Hoosiers healthier.  [IF YES, proceed to the informed consent script] [IF NO, NOT NOW, arrange a convenient time to call back] "
label variable consent_ntime "NO TIME (2) - Thats ok! When is a better time to complete this over the phone? _________________________ Thank you for your time today. Ill talk to you soon. (END) "
label variable consent_notint "NOT INTERESTED (0) - Do you mind telling me why you are not interested? (DOCUMENT REASON)  I understand. Thank you very much for your time. (END SCREENING)"
label variable consent_read "I HAVE READ THIS VERBAL CONSENT TO THE SUBJECT/LEGALLY AUTHORIZED REPRESENTATIVE.    "
label variable consent_sign "SIGNATURE OF TEAM MEMBER:"
label variable consent_print "PRINTED NAME OF TEAM MEMBER:"
label variable consent_date "Date"
label variable phone_consent_complete "Complete?"
label variable dem_1 "During the major part of your working life, did you work full-time, part-time, or were you a homemaker?"
label variable dem_1_2 "Did you ever work outside the home?"
label variable dem_2 "First, please think about the job you had the longest period of time. What kind of work were you doing? (For example: registered nurse, personnel manager, supervisor, secretary, accountant)"
label variable dem_3 "What were your most important activities or duties? Describe the activity at the location where you were employed. (For example: patient care, directing hiring policies, supervising employees, typing and filing, reconciling financial records) "
label variable dem_4 "What type of business was it? What did they make, or what service did they provide? (open response, then interviewer circles relevant answer category)"
label variable dem_5 "What year did you start working at this company? "
label variable dem_6 "How many years did you work there? "
label variable dem_7 "Now please think about the job you had for the second longest period of time. What kind of work were you doing? (For example: registered nurse, personnel manager, supervisor of order department, secretary, accountant) "
label variable dem_8 "What were your most important activities or duties? Describe the activity at the location where you were employed. (For example: patient care, directing hiring policies, supervising order clerks, typing and filing, reconciling financial records)"
label variable dem_9 "What type of business was it? What did they make, or what service did they provide? (open response (then interviewer circles relevant code)"
label variable dem_10 "What year did you start working for this company?"
label variable dem_11 "How many years did you work there? "
label variable dem_12 "In all, how many different jobs have you had as an adult?IF UNSURE, ASK FOR ESTIMATE [open response]"
label variable dem_13 "What is your fathers highest level of education?"
label variable dem_14 "What is your mothers highest level of education?"
label variable dem_15 "Think about the neighborhood or community where you lived for the majority of your life. In      that neighborhood or community, how many of your neighbors were white?"
label variable dem_16 "Think about the neighborhood or community where you lived for the majority of your life. In that neighborhood or community, how many of your neighbors were black?"
label variable dem_17 "Think about the neighborhood or community where you lived for the majority of your life. In      that neighborhood or community, how many of your neighbors were hispanic/latino?"
label variable dem_18 "Think about the neighborhood or community where you lived for the majority of your life. In      that neighborhood or community, how many of your neighbors were Asian?"
label variable thanks "Thank you for your time and answering all of our questions. This information will help us to better understand the previous data we have collected and potentially better the lives of hoosiers. At this time do you have any questions? [below list any problems with the interview to document]"
label variable demographics_questio_v_0 "Complete?"

order record_id subcc_id subfname sublname iadrcstatus subj_phone cr1 cr1e cr2 cr2e cr3 cr3e cr4 cr4e cr5 cr5e face_sheet_complete ccid int_name res_name interest phone_script_complete consent_auth consent_guar consent_guary consent_ic consent_ntime consent_notint consent_read consent_sign consent_print consent_date phone_consent_complete dem_1 dem_1_2 dem_2 dem_3 dem_4 dem_5 dem_6 dem_7 dem_8 dem_9 dem_10 dem_11 dem_12 dem_13 dem_14 dem_15 dem_16 dem_17 dem_18 thanks demographics_questio_v_0 
set more off
describe
