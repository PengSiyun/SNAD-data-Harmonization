version 13
clear

import delimited record_id redcap_survey_identifier set_study_id_timestamp studyid date_snad date_iadc partnerid set_study_id_complete partner_response_timestamp survey_method name_ia1 name_ia2 name_ia3 name_ia4 name_ia5 name_ia6 name_ia7 name_ib1 name_ib2 name_ib3 name_ib4 name_ic1 name_ic2 name_ic3 name_ic4 name_ha1 name_ha2 name_ha3 name_ha4 name_ha5 name_ha6 name_ha7 name_hb1 name_hb2 name_hb3 name_hb4 name_hc1 name_hc2 name_hc3 name_hc4 gender_ia1 related_ia1___1 related_ia1___2 related_ia1___3 related_ia1___4 related_ia1___5 related_ia1___6 related_ia1___7 related_ia1___8 related_ia1___9 related_ia1___10 related_ia1___11 related_ia1___12 related_ia1___13 related_ia1___14 related_ia1___15 related_ia1___16 related_ia1___17 related_ia1___18 related_ia1___19 related_ia1___20 related_ia1___21 related_ia1___22 related_ia1___23 howclose_ia1 seetalk_ia1 knowabout_ia1 trustdoctors_ia1 helped_ia1___1 helped_ia1___2 helped_ia1___3 helped_ia1___4 helped_ia1___5 difficult_ia1 strong_ia1 gender_ia2 related_ia2___1 related_ia2___2 related_ia2___3 related_ia2___4 related_ia2___5 related_ia2___6 related_ia2___7 related_ia2___8 related_ia2___9 related_ia2___10 related_ia2___11 related_ia2___12 related_ia2___13 related_ia2___14 related_ia2___15 related_ia2___16 related_ia2___17 related_ia2___18 related_ia2___19 related_ia2___20 related_ia2___21 related_ia2___22 related_ia2___23 howclose_ia2 seetalk_ia2 knowabout_ia2 trustdoctors_ia2 helped_ia2___1 helped_ia2___2 helped_ia2___3 helped_ia2___4 helped_ia2___5 difficult_ia2 strong_ia2 gender_ia3 related_ia3___1 related_ia3___2 related_ia3___3 related_ia3___4 related_ia3___5 related_ia3___6 related_ia3___7 related_ia3___8 related_ia3___9 related_ia3___10 related_ia3___11 related_ia3___12 related_ia3___13 related_ia3___14 related_ia3___15 related_ia3___16 related_ia3___17 related_ia3___18 related_ia3___19 related_ia3___20 related_ia3___21 related_ia3___22 related_ia3___23 howclose_ia3 seetalk_ia3 knowabout_ia3 trustdoctors_ia3 helped_ia3___1 helped_ia3___2 helped_ia3___3 helped_ia3___4 helped_ia3___5 difficult_ia3 strong_ia3 gender_ia4 related_ia4___1 related_ia4___2 related_ia4___3 related_ia4___4 related_ia4___5 related_ia4___6 related_ia4___7 related_ia4___8 related_ia4___9 related_ia4___10 related_ia4___11 related_ia4___12 related_ia4___13 related_ia4___14 related_ia4___15 related_ia4___16 related_ia4___17 related_ia4___18 related_ia4___19 related_ia4___20 related_ia4___21 related_ia4___22 related_ia4___23 howclose_ia4 seetalk_ia4 knowabout_ia4 trustdoctors_ia4 helped_ia4___1 helped_ia4___2 helped_ia4___3 helped_ia4___4 helped_ia4___5 difficult_ia4 strong_ia4 gender_ia5 related_ia5___1 related_ia5___2 related_ia5___3 related_ia5___4 related_ia5___5 related_ia5___6 related_ia5___7 related_ia5___8 related_ia5___9 related_ia5___10 related_ia5___11 related_ia5___12 related_ia5___13 related_ia5___14 related_ia5___15 related_ia5___16 related_ia5___17 related_ia5___18 related_ia5___19 related_ia5___20 related_ia5___21 related_ia5___22 related_ia5___23 howclose_ia5 seetalk_ia5 knowabout_ia5 trustdoctors_ia5 helped_ia5___1 helped_ia5___2 helped_ia5___3 helped_ia5___4 helped_ia5___5 difficult_ia5 strong_ia5 gender_ia6 related_ia6___1 related_ia6___2 related_ia6___3 related_ia6___4 related_ia6___5 related_ia6___6 related_ia6___7 related_ia6___8 related_ia6___9 related_ia6___10 related_ia6___11 related_ia6___12 related_ia6___13 related_ia6___14 related_ia6___15 related_ia6___16 related_ia6___17 related_ia6___18 related_ia6___19 related_ia6___20 related_ia6___21 related_ia6___22 related_ia6___23 howclose_ia6 seetalk_ia6 knowabout_ia6 trustdoctors_ia6 helped_ia6___1 helped_ia6___2 helped_ia6___3 helped_ia6___4 helped_ia6___5 difficult_ia6 strong_ia6 gender_ia7 related_ia7___1 related_ia7___2 related_ia7___3 related_ia7___4 related_ia7___5 related_ia7___6 related_ia7___7 related_ia7___8 related_ia7___9 related_ia7___10 related_ia7___11 related_ia7___12 related_ia7___13 related_ia7___14 related_ia7___15 related_ia7___16 related_ia7___17 related_ia7___18 related_ia7___19 related_ia7___20 related_ia7___21 related_ia7___22 related_ia7___23 howclose_ia7 seetalk_ia7 knowabout_ia7 trustdoctors_ia7 helped_ia7___1 helped_ia7___2 helped_ia7___3 helped_ia7___4 helped_ia7___5 difficult_ia7 strong_ia7 gender_ib1 related_ib1___1 related_ib1___2 related_ib1___3 related_ib1___4 related_ib1___5 related_ib1___6 related_ib1___7 related_ib1___8 related_ib1___9 related_ib1___10 related_ib1___11 related_ib1___12 related_ib1___13 related_ib1___14 related_ib1___15 related_ib1___16 related_ib1___17 related_ib1___18 related_ib1___19 related_ib1___20 related_ib1___21 related_ib1___22 related_ib1___23 howclose_ib1 seetalk_ib1 knowabout_ib1 trustdoctors_ib1 helped_ib1___1 helped_ib1___2 helped_ib1___3 helped_ib1___4 helped_ib1___5 difficult_ib1 strong_ib1 gender_ib2 related_ib2___1 related_ib2___2 related_ib2___3 related_ib2___4 related_ib2___5 related_ib2___6 related_ib2___7 related_ib2___8 related_ib2___9 related_ib2___10 related_ib2___11 related_ib2___12 related_ib2___13 related_ib2___14 related_ib2___15 related_ib2___16 related_ib2___17 related_ib2___18 related_ib2___19 related_ib2___20 related_ib2___21 related_ib2___22 related_ib2___23 howclose_ib2 seetalk_ib2 knowabout_ib2 trustdoctors_ib2 helped_ib2___1 helped_ib2___2 helped_ib2___3 helped_ib2___4 helped_ib2___5 difficult_ib2 strong_ib2 gender_ib3 related_ib3___1 related_ib3___2 related_ib3___3 related_ib3___4 related_ib3___5 related_ib3___6 related_ib3___7 related_ib3___8 related_ib3___9 related_ib3___10 related_ib3___11 related_ib3___12 related_ib3___13 related_ib3___14 related_ib3___15 related_ib3___16 related_ib3___17 related_ib3___18 related_ib3___19 related_ib3___20 related_ib3___21 related_ib3___22 related_ib3___23 howclose_ib3 seetalk_ib3 knowabout_ib3 trustdoctors_ib3 helped_ib3___1 helped_ib3___2 helped_ib3___3 helped_ib3___4 helped_ib3___5 difficult_ib3 strong_ib3 gender_ib4 related_ib4___1 related_ib4___2 related_ib4___3 related_ib4___4 related_ib4___5 related_ib4___6 related_ib4___7 related_ib4___8 related_ib4___9 related_ib4___10 related_ib4___11 related_ib4___12 related_ib4___13 related_ib4___14 related_ib4___15 related_ib4___16 related_ib4___17 related_ib4___18 related_ib4___19 related_ib4___20 related_ib4___21 related_ib4___22 related_ib4___23 howclose_ib4 seetalk_ib4 knowabout_ib4 trustdoctors_ib4 helped_ib4___1 helped_ib4___2 helped_ib4___3 helped_ib4___4 helped_ib4___5 difficult_ib4 strong_ib4 gender_ic1 related_ic1___1 related_ic1___2 related_ic1___3 related_ic1___4 related_ic1___5 related_ic1___6 related_ic1___7 related_ic1___8 related_ic1___9 related_ic1___10 related_ic1___11 related_ic1___12 related_ic1___13 related_ic1___14 related_ic1___15 related_ic1___16 related_ic1___17 related_ic1___18 related_ic1___19 related_ic1___20 related_ic1___21 related_ic1___22 related_ic1___23 howclose_ic1 seetalk_ic1 knowabout_ic1 trustdoctors_ic1 helped_ic1___1 helped_ic1___2 helped_ic1___3 helped_ic1___4 helped_ic1___5 difficult_ic1 strong_ic1 gender_ic2 related_ic2___1 related_ic2___2 related_ic2___3 related_ic2___4 related_ic2___5 related_ic2___6 related_ic2___7 related_ic2___8 related_ic2___9 related_ic2___10 related_ic2___11 related_ic2___12 related_ic2___13 related_ic2___14 related_ic2___15 related_ic2___16 related_ic2___17 related_ic2___18 related_ic2___19 related_ic2___20 related_ic2___21 related_ic2___22 related_ic2___23 howclose_ic2 seetalk_ic2 knowabout_ic2 trustdoctors_ic2 helped_ic2___1 helped_ic2___2 helped_ic2___3 helped_ic2___4 helped_ic2___5 difficult_ic2 strong_ic2 gender_ic3 related_ic3___1 related_ic3___2 related_ic3___3 related_ic3___4 related_ic3___5 related_ic3___6 related_ic3___7 related_ic3___8 related_ic3___9 related_ic3___10 related_ic3___11 related_ic3___12 related_ic3___13 related_ic3___14 related_ic3___15 related_ic3___16 related_ic3___17 related_ic3___18 related_ic3___19 related_ic3___20 related_ic3___21 related_ic3___22 related_ic3___23 howclose_ic3 seetalk_ic3 knowabout_ic3 trustdoctors_ic3 helped_ic3___1 helped_ic3___2 helped_ic3___3 helped_ic3___4 helped_ic3___5 difficult_ic3 strong_ic3 gender_ic4 related_ic4___1 related_ic4___2 related_ic4___3 related_ic4___4 related_ic4___5 related_ic4___6 related_ic4___7 related_ic4___8 related_ic4___9 related_ic4___10 related_ic4___11 related_ic4___12 related_ic4___13 related_ic4___14 related_ic4___15 related_ic4___16 related_ic4___17 related_ic4___18 related_ic4___19 related_ic4___20 related_ic4___21 related_ic4___22 related_ic4___23 howclose_ic4 seetalk_ic4 knowabout_ic4 trustdoctors_ic4 helped_ic4___1 helped_ic4___2 helped_ic4___3 helped_ic4___4 helped_ic4___5 difficult_ic4 strong_ic4 gender_ha1 related_ha1___1 related_ha1___2 related_ha1___3 related_ha1___4 related_ha1___5 related_ha1___6 related_ha1___7 related_ha1___8 related_ha1___9 related_ha1___10 related_ha1___11 related_ha1___12 related_ha1___13 related_ha1___14 related_ha1___15 related_ha1___16 related_ha1___17 related_ha1___18 related_ha1___19 related_ha1___20 related_ha1___21 related_ha1___22 related_ha1___23 howclose_ha1 seetalk_ha1 knowabout_ha1 trustdoctors_ha1 helped_ha1___1 helped_ha1___2 helped_ha1___3 helped_ha1___4 helped_ha1___5 difficult_ha1 strong_ha1 gender_ha2 related_ha2___1 related_ha2___2 related_ha2___3 related_ha2___4 related_ha2___5 related_ha2___6 related_ha2___7 related_ha2___8 related_ha2___9 related_ha2___10 related_ha2___11 related_ha2___12 related_ha2___13 related_ha2___14 related_ha2___15 related_ha2___16 related_ha2___17 related_ha2___18 related_ha2___19 related_ha2___20 related_ha2___21 related_ha2___22 related_ha2___23 howclose_ha2 seetalk_ha2 knowabout_ha2 trustdoctors_ha2 helped_ha2___1 helped_ha2___2 helped_ha2___3 helped_ha2___4 helped_ha2___5 difficult_ha2 strong_ha2 gender_ha3 related_ha3___1 related_ha3___2 related_ha3___3 related_ha3___4 related_ha3___5 related_ha3___6 related_ha3___7 related_ha3___8 related_ha3___9 related_ha3___10 related_ha3___11 related_ha3___12 related_ha3___13 related_ha3___14 related_ha3___15 related_ha3___16 related_ha3___17 related_ha3___18 related_ha3___19 related_ha3___20 related_ha3___21 related_ha3___22 related_ha3___23 howclose_ha3 seetalk_ha3 knowabout_ha3 trustdoctors_ha3 helped_ha3___1 helped_ha3___2 helped_ha3___3 helped_ha3___4 helped_ha3___5 difficult_ha3 strong_ha3 gender_ha4 related_ha4___1 related_ha4___2 related_ha4___3 related_ha4___4 related_ha4___5 related_ha4___6 related_ha4___7 related_ha4___8 related_ha4___9 related_ha4___10 related_ha4___11 related_ha4___12 related_ha4___13 related_ha4___14 related_ha4___15 related_ha4___16 related_ha4___17 related_ha4___18 related_ha4___19 related_ha4___20 related_ha4___21 related_ha4___22 related_ha4___23 howclose_ha4 seetalk_ha4 knowabout_ha4 trustdoctors_ha4 helped_ha4___1 helped_ha4___2 helped_ha4___3 helped_ha4___4 helped_ha4___5 difficult_ha4 strong_ha4 gender_ha5 related_ha5___1 related_ha5___2 related_ha5___3 related_ha5___4 related_ha5___5 related_ha5___6 related_ha5___7 related_ha5___8 related_ha5___9 related_ha5___10 related_ha5___11 related_ha5___12 related_ha5___13 related_ha5___14 related_ha5___15 related_ha5___16 related_ha5___17 related_ha5___18 related_ha5___19 related_ha5___20 related_ha5___21 related_ha5___22 related_ha5___23 howclose_ha5 seetalk_ha5 knowabout_ha5 trustdoctors_ha5 helped_ha5___1 helped_ha5___2 helped_ha5___3 helped_ha5___4 helped_ha5___5 difficult_ha5 strong_ha5 gender_ha6 related_ha6___1 related_ha6___2 related_ha6___3 related_ha6___4 related_ha6___5 related_ha6___6 related_ha6___7 related_ha6___8 related_ha6___9 related_ha6___10 related_ha6___11 related_ha6___12 related_ha6___13 related_ha6___14 related_ha6___15 related_ha6___16 related_ha6___17 related_ha6___18 related_ha6___19 related_ha6___20 related_ha6___21 related_ha6___22 related_ha6___23 howclose_ha6 seetalk_ha6 knowabout_ha6 trustdoctors_ha6 helped_ha6___1 helped_ha6___2 helped_ha6___3 helped_ha6___4 helped_ha6___5 difficult_ha6 strong_ha6 gender_ha7 related_ha7___1 related_ha7___2 related_ha7___3 related_ha7___4 related_ha7___5 related_ha7___6 related_ha7___7 related_ha7___8 related_ha7___9 related_ha7___10 related_ha7___11 related_ha7___12 related_ha7___13 related_ha7___14 related_ha7___15 related_ha7___16 related_ha7___17 related_ha7___18 related_ha7___19 related_ha7___20 related_ha7___21 related_ha7___22 related_ha7___23 howclose_ha7 seetalk_ha7 knowabout_ha7 trustdoctors_ha7 helped_ha7___1 helped_ha7___2 helped_ha7___3 helped_ha7___4 helped_ha7___5 difficult_ha7 strong_ha7 gender_hb1 related_hb1___1 related_hb1___2 related_hb1___3 related_hb1___4 related_hb1___5 related_hb1___6 related_hb1___7 related_hb1___8 related_hb1___9 related_hb1___10 related_hb1___11 related_hb1___12 related_hb1___13 related_hb1___14 related_hb1___15 related_hb1___16 related_hb1___17 related_hb1___18 related_hb1___19 related_hb1___20 related_hb1___21 related_hb1___22 related_hb1___23 howclose_hb1 seetalk_hb1 knowabout_hb1 trustdoctors_hb1 helped_hb1___1 helped_hb1___2 helped_hb1___3 helped_hb1___4 helped_hb1___5 difficult_hb1 strong_hb1 gender_hb2 related_hb2___1 related_hb2___2 related_hb2___3 related_hb2___4 related_hb2___5 related_hb2___6 related_hb2___7 related_hb2___8 related_hb2___9 related_hb2___10 related_hb2___11 related_hb2___12 related_hb2___13 related_hb2___14 related_hb2___15 related_hb2___16 related_hb2___17 related_hb2___18 related_hb2___19 related_hb2___20 related_hb2___21 related_hb2___22 related_hb2___23 howclose_hb2 seetalk_hb2 knowabout_hb2 trustdoctors_hb2 helped_hb2___1 helped_hb2___2 helped_hb2___3 helped_hb2___4 helped_hb2___5 difficult_hb2 strong_hb2 gender_hb3 related_hb3___1 related_hb3___2 related_hb3___3 related_hb3___4 related_hb3___5 related_hb3___6 related_hb3___7 related_hb3___8 related_hb3___9 related_hb3___10 related_hb3___11 related_hb3___12 related_hb3___13 related_hb3___14 related_hb3___15 related_hb3___16 related_hb3___17 related_hb3___18 related_hb3___19 related_hb3___20 related_hb3___21 related_hb3___22 related_hb3___23 howclose_hb3 seetalk_hb3 knowabout_hb3 trustdoctors_hb3 helped_hb3___1 helped_hb3___2 helped_hb3___3 helped_hb3___4 helped_hb3___5 difficult_hb3 strong_hb3 gender_hb4 related_hb4___1 related_hb4___2 related_hb4___3 related_hb4___4 related_hb4___5 related_hb4___6 related_hb4___7 related_hb4___8 related_hb4___9 related_hb4___10 related_hb4___11 related_hb4___12 related_hb4___13 related_hb4___14 related_hb4___15 related_hb4___16 related_hb4___17 related_hb4___18 related_hb4___19 related_hb4___20 related_hb4___21 related_hb4___22 related_hb4___23 howclose_hb4 seetalk_hb4 knowabout_hb4 trustdoctors_hb4 helped_hb4___1 helped_hb4___2 helped_hb4___3 helped_hb4___4 helped_hb4___5 difficult_hb4 strong_hb4 gender_hc1 related_hc1___1 related_hc1___2 related_hc1___3 related_hc1___4 related_hc1___5 related_hc1___6 related_hc1___7 related_hc1___8 related_hc1___9 related_hc1___10 related_hc1___11 related_hc1___12 related_hc1___13 related_hc1___14 related_hc1___15 related_hc1___16 related_hc1___17 related_hc1___18 related_hc1___19 related_hc1___20 related_hc1___21 related_hc1___22 related_hc1___23 howclose_hc1 seetalk_hc1 knowabout_hc1 trustdoctors_hc1 helped_hc1___1 helped_hc1___2 helped_hc1___3 helped_hc1___4 helped_hc1___5 difficult_hc1 strong_hc1 gender_hc2 related_hc2___1 related_hc2___2 related_hc2___3 related_hc2___4 related_hc2___5 related_hc2___6 related_hc2___7 related_hc2___8 related_hc2___9 related_hc2___10 related_hc2___11 related_hc2___12 related_hc2___13 related_hc2___14 related_hc2___15 related_hc2___16 related_hc2___17 related_hc2___18 related_hc2___19 related_hc2___20 related_hc2___21 related_hc2___22 related_hc2___23 howclose_hc2 seetalk_hc2 knowabout_hc2 trustdoctors_hc2 helped_hc2___1 helped_hc2___2 helped_hc2___3 helped_hc2___4 helped_hc2___5 difficult_hc2 strong_hc2 gender_hc3 related_hc3___1 related_hc3___2 related_hc3___3 related_hc3___4 related_hc3___5 related_hc3___6 related_hc3___7 related_hc3___8 related_hc3___9 related_hc3___10 related_hc3___11 related_hc3___12 related_hc3___13 related_hc3___14 related_hc3___15 related_hc3___16 related_hc3___17 related_hc3___18 related_hc3___19 related_hc3___20 related_hc3___21 related_hc3___22 related_hc3___23 howclose_hc3 seetalk_hc3 knowabout_hc3 trustdoctors_hc3 helped_hc3___1 helped_hc3___2 helped_hc3___3 helped_hc3___4 helped_hc3___5 difficult_hc3 strong_hc3 gender_hc4 related_hc4___1 related_hc4___2 related_hc4___3 related_hc4___4 related_hc4___5 related_hc4___6 related_hc4___7 related_hc4___8 related_hc4___9 related_hc4___10 related_hc4___11 related_hc4___12 related_hc4___13 related_hc4___14 related_hc4___15 related_hc4___16 related_hc4___17 related_hc4___18 related_hc4___19 related_hc4___20 related_hc4___21 related_hc4___22 related_hc4___23 howclose_hc4 seetalk_hc4 knowabout_hc4 trustdoctors_hc4 helped_hc4___1 helped_hc4___2 helped_hc4___3 helped_hc4___4 helped_hc4___5 difficult_hc4 strong_hc4 matrix_ia1_ia2 matrix_ia1_ia3 matrix_ia1_ia4 matrix_ia1_ia5 matrix_ia1_ia6 matrix_ia1_ia7 matrix_ia1_ib1 matrix_ia1_ib2 matrix_ia1_ib3 matrix_ia1_ib4 matrix_ia1_ic1 matrix_ia1_ic2 matrix_ia1_ic3 matrix_ia1_ic4 matrix_ia1_ha1 matrix_ia1_ha2 matrix_ia1_ha3 matrix_ia1_ha4 matrix_ia1_ha5 matrix_ia1_ha6 matrix_ia1_ha7 matrix_ia1_hb1 matrix_ia1_hb2 matrix_ia1_hb3 matrix_ia1_hb4 matrix_ia1_hc1 matrix_ia1_hc2 matrix_ia1_hc3 matrix_ia1_hc4 matrix_ia2_ia3 matrix_ia2_ia4 matrix_ia2_ia5 matrix_ia2_ia6 matrix_ia2_ia7 matrix_ia2_ib1 matrix_ia2_ib2 matrix_ia2_ib3 matrix_ia2_ib4 matrix_ia2_ic1 matrix_ia2_ic2 matrix_ia2_ic3 matrix_ia2_ic4 matrix_ia2_ha1 matrix_ia2_ha2 matrix_ia2_ha3 matrix_ia2_ha4 matrix_ia2_ha5 matrix_ia2_ha6 matrix_ia2_ha7 matrix_ia2_hb1 matrix_ia2_hb2 matrix_ia2_hb3 matrix_ia2_hb4 matrix_ia2_hc1 matrix_ia2_hc2 matrix_ia2_hc3 matrix_ia2_hc4 matrix_ia3_ia4 matrix_ia3_ia5 matrix_ia3_ia6 matrix_ia3_ia7 matrix_ia3_ib1 matrix_ia3_ib2 matrix_ia3_ib3 matrix_ia3_ib4 matrix_ia3_ic1 matrix_ia3_ic2 matrix_ia3_ic3 matrix_ia3_ic4 matrix_ia3_ha1 matrix_ia3_ha2 matrix_ia3_ha3 matrix_ia3_ha4 matrix_ia3_ha5 matrix_ia3_ha6 matrix_ia3_ha7 matrix_ia3_hb1 matrix_ia3_hb2 matrix_ia3_hb3 matrix_ia3_hb4 matrix_ia3_hc1 matrix_ia3_hc2 matrix_ia3_hc3 matrix_ia3_hc4 matrix_ia4_ia5 matrix_ia4_ia6 matrix_ia4_ia7 matrix_ia4_ib1 matrix_ia4_ib2 matrix_ia4_ib3 matrix_ia4_ib4 matrix_ia4_ic1 matrix_ia4_ic2 matrix_ia4_ic3 matrix_ia4_ic4 matrix_ia4_ha1 matrix_ia4_ha2 matrix_ia4_ha3 matrix_ia4_ha4 matrix_ia4_ha5 matrix_ia4_ha6 matrix_ia4_ha7 matrix_ia4_hb1 matrix_ia4_hb2 matrix_ia4_hb3 matrix_ia4_hb4 matrix_ia4_hc1 matrix_ia4_hc2 matrix_ia4_hc3 matrix_ia4_hc4 matrix_ia5_ia6 matrix_ia5_ia7 matrix_ia5_ib1 matrix_ia5_ib2 matrix_ia5_ib3 matrix_ia5_ib4 matrix_ia5_ic1 matrix_ia5_ic2 matrix_ia5_ic3 matrix_ia5_ic4 matrix_ia5_ha1 matrix_ia5_ha2 matrix_ia5_ha3 matrix_ia5_ha4 matrix_ia5_ha5 matrix_ia5_ha6 matrix_ia5_ha7 matrix_ia5_hb1 matrix_ia5_hb2 matrix_ia5_hb3 matrix_ia5_hb4 matrix_ia5_hc1 matrix_ia5_hc2 matrix_ia5_hc3 matrix_ia5_hc4 matrix_ia6_ia7 matrix_ia6_ib1 matrix_ia6_ib2 matrix_ia6_ib3 matrix_ia6_ib4 matrix_ia6_ic1 matrix_ia6_ic2 matrix_ia6_ic3 matrix_ia6_ic4 matrix_ia6_ha1 matrix_ia6_ha2 matrix_ia6_ha3 matrix_ia6_ha4 matrix_ia6_ha5 matrix_ia6_ha6 matrix_ia6_ha7 matrix_ia6_hb1 matrix_ia6_hb2 matrix_ia6_hb3 matrix_ia6_hb4 matrix_ia6_hc1 matrix_ia6_hc2 matrix_ia6_hc3 matrix_ia6_hc4 matrix_ia7_ib1 matrix_ia7_ib2 matrix_ia7_ib3 matrix_ia7_ib4 matrix_ia7_ic1 matrix_ia7_ic2 matrix_ia7_ic3 matrix_ia7_ic4 matrix_ia7_ha1 matrix_ia7_ha2 matrix_ia7_ha3 matrix_ia7_ha4 matrix_ia7_ha5 matrix_ia7_ha6 matrix_ia7_ha7 matrix_ia7_hb1 matrix_ia7_hb2 matrix_ia7_hb3 matrix_ia7_hb4 matrix_ia7_hc1 matrix_ia7_hc2 matrix_ia7_hc3 matrix_ia7_hc4 matrix_ib1_ib2 matrix_ib1_ib3 matrix_ib1_ib4 matrix_ib1_ic1 matrix_ib1_ic2 matrix_ib1_ic3 matrix_ib1_ic4 matrix_ib1_ha1 matrix_ib1_ha2 matrix_ib1_ha3 matrix_ib1_ha4 matrix_ib1_ha5 matrix_ib1_ha6 matrix_ib1_ha7 matrix_ib1_hb1 matrix_ib1_hb2 matrix_ib1_hb3 matrix_ib1_hb4 matrix_ib1_hc1 matrix_ib1_hc2 matrix_ib1_hc3 matrix_ib1_hc4 matrix_ib2_ib3 matrix_ib2_ib4 matrix_ib2_ic1 matrix_ib2_ic2 matrix_ib2_ic3 matrix_ib2_ic4 matrix_ib2_ha1 matrix_ib2_ha2 matrix_ib2_ha3 matrix_ib2_ha4 matrix_ib2_ha5 matrix_ib2_ha6 matrix_ib2_ha7 matrix_ib2_hb1 matrix_ib2_hb2 matrix_ib2_hb3 matrix_ib2_hb4 matrix_ib2_hc1 matrix_ib2_hc2 matrix_ib2_hc3 matrix_ib2_hc4 matrix_ib3_ib4 matrix_ib3_ic1 matrix_ib3_ic2 matrix_ib3_ic3 matrix_ib3_ic4 matrix_ib3_ha1 matrix_ib3_ha2 matrix_ib3_ha3 matrix_ib3_ha4 matrix_ib3_ha5 matrix_ib3_ha6 matrix_ib3_ha7 matrix_ib3_hb1 matrix_ib3_hb2 matrix_ib3_hb3 matrix_ib3_hb4 matrix_ib3_hc1 matrix_ib3_hc2 matrix_ib3_hc3 matrix_ib3_hc4 matrix_ib4_ic1 matrix_ib4_ic2 matrix_ib4_ic3 matrix_ib4_ic4 matrix_ib4_ha1 matrix_ib4_ha2 matrix_ib4_ha3 matrix_ib4_ha4 matrix_ib4_ha5 matrix_ib4_ha6 matrix_ib4_ha7 matrix_ib4_hb1 matrix_ib4_hb2 matrix_ib4_hb3 matrix_ib4_hb4 matrix_ib4_hc1 matrix_ib4_hc2 matrix_ib4_hc3 matrix_ib4_hc4 matrix_ic1_ic2 matrix_ic1_ic3 matrix_ic1_ic4 matrix_ic1_ha1 matrix_ic1_ha2 matrix_ic1_ha3 matrix_ic1_ha4 matrix_ic1_ha5 matrix_ic1_ha6 matrix_ic1_ha7 matrix_ic1_hb1 matrix_ic1_hb2 matrix_ic1_hb3 matrix_ic1_hb4 matrix_ic1_hc1 matrix_ic1_hc2 matrix_ic1_hc3 matrix_ic1_hc4 matrix_ic2_ic3 matrix_ic2_ic4 matrix_ic2_ha1 matrix_ic2_ha2 matrix_ic2_ha3 matrix_ic2_ha4 matrix_ic2_ha5 matrix_ic2_ha6 matrix_ic2_ha7 matrix_ic2_hb1 matrix_ic2_hb2 matrix_ic2_hb3 matrix_ic2_hb4 matrix_ic2_hc1 matrix_ic2_hc2 matrix_ic2_hc3 matrix_ic2_hc4 matrix_ic3_ic4 matrix_ic3_ha1 matrix_ic3_ha2 matrix_ic3_ha3 matrix_ic3_ha4 matrix_ic3_ha5 matrix_ic3_ha6 matrix_ic3_ha7 matrix_ic3_hb1 matrix_ic3_hb2 matrix_ic3_hb3 matrix_ic3_hb4 matrix_ic3_hc1 matrix_ic3_hc2 matrix_ic3_hc3 matrix_ic3_hc4 matrix_ic4_ha1 matrix_ic4_ha2 matrix_ic4_ha3 matrix_ic4_ha4 matrix_ic4_ha5 matrix_ic4_ha6 matrix_ic4_ha7 matrix_ic4_hb1 matrix_ic4_hb2 matrix_ic4_hb3 matrix_ic4_hb4 matrix_ic4_hc1 matrix_ic4_hc2 matrix_ic4_hc3 matrix_ic4_hc4 matrix_ha1_ha2 matrix_ha1_ha3 matrix_ha1_ha4 matrix_ha1_ha5 matrix_ha1_ha6 matrix_ha1_ha7 matrix_ha1_hb1 matrix_ha1_hb2 matrix_ha1_hb3 matrix_ha1_hb4 matrix_ha1_hc1 matrix_ha1_hc2 matrix_ha1_hc3 matrix_ha1_hc4 matrix_ha2_ha3 matrix_ha2_ha4 matrix_ha2_ha5 matrix_ha2_ha6 matrix_ha2_ha7 matrix_ha2_hb1 matrix_ha2_hb2 matrix_ha2_hb3 matrix_ha2_hb4 matrix_ha2_hc1 matrix_ha2_hc2 matrix_ha2_hc3 matrix_ha2_hc4 matrix_ha3_ha4 matrix_ha3_ha5 matrix_ha3_ha6 matrix_ha3_ha7 matrix_ha3_hb1 matrix_ha3_hb2 matrix_ha3_hb3 matrix_ha3_hb4 matrix_ha3_hc1 matrix_ha3_hc2 matrix_ha3_hc3 matrix_ha3_hc4 matrix_ha4_ha5 matrix_ha4_ha6 matrix_ha4_ha7 matrix_ha4_hb1 matrix_ha4_hb2 matrix_ha4_hb3 matrix_ha4_hb4 matrix_ha4_hc1 matrix_ha4_hc2 matrix_ha4_hc3 matrix_ha4_hc4 matrix_ha5_ha6 matrix_ha5_ha7 matrix_ha5_hb1 matrix_ha5_hb2 matrix_ha5_hb3 matrix_ha5_hb4 matrix_ha5_hc1 matrix_ha5_hc2 matrix_ha5_hc3 matrix_ha5_hc4 matrix_ha6_ha7 matrix_ha6_hb1 matrix_ha6_hb2 matrix_ha6_hb3 matrix_ha6_hb4 matrix_ha6_hc1 matrix_ha6_hc2 matrix_ha6_hc3 matrix_ha6_hc4 matrix_ha7_hb1 matrix_ha7_hb2 matrix_ha7_hb3 matrix_ha7_hb4 matrix_ha7_hc1 matrix_ha7_hc2 matrix_ha7_hc3 matrix_ha7_hc4 matrix_hb1_hb2 matrix_hb1_hb3 matrix_hb1_hb4 matrix_hb1_hc1 matrix_hb1_hc2 matrix_hb1_hc3 matrix_hb1_hc4 matrix_hb2_hb3 matrix_hb2_hb4 matrix_hb2_hc1 matrix_hb2_hc2 matrix_hb2_hc3 matrix_hb2_hc4 matrix_hb3_hb4 matrix_hb3_hc1 matrix_hb3_hc2 matrix_hb3_hc3 matrix_hb3_hc4 matrix_hb4_hc1 matrix_hb4_hc2 matrix_hb4_hc3 matrix_hb4_hc4 matrix_hc1_hc2 matrix_hc1_hc3 matrix_hc1_hc4 matrix_hc2_hc3 matrix_hc2_hc4 matrix_hc3_hc4 health energy spirits living_situation memory family marriage friends self do_chores do_fun money whole comments partner_response_complete using "SNADPartner_DATA_NOHDRS_2020-07-30_1526.csv", varnames(nonames)

label data "SNADPartner_DATA_NOHDRS_2020-07-30_1526.csv"

label define set_study_id_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 
label define survey_method_ 1 "By myself on a laptop or tablet," 2 "An interviewer is asking me questions in person" 3 "An interviewer is asking me questions over the phone" 
label define gender_ia1_ 1 "Male" 2 "Female" 
label define related_ia1___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia1___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia1_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia1_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia1_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia1___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia1___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia1___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia1___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia1___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia1_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia1_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ia2_ 1 "Male" 2 "Female" 
label define related_ia2___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia2___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia2_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia2_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia2_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia2___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia2___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia2___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia2___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia2___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia2_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia2_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ia3_ 1 "Male" 2 "Female" 
label define related_ia3___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia3___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia3_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia3_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia3_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia3___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia3___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia3___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia3___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia3___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia3_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia3_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ia4_ 1 "Male" 2 "Female" 
label define related_ia4___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia4___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia4_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia4_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia4_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia4___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia4___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia4___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia4___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia4___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia4_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia4_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ia5_ 1 "Male" 2 "Female" 
label define related_ia5___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia5___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia5_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia5_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia5_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia5___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia5___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia5___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia5___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia5___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia5_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia5_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ia6_ 1 "Male" 2 "Female" 
label define related_ia6___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia6___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia6_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia6_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia6_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia6___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia6___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia6___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia6___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia6___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia6_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia6_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ia7_ 1 "Male" 2 "Female" 
label define related_ia7___1_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___2_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___3_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___4_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___5_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___6_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___7_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___8_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___9_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___10_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___11_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___12_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___13_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___14_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___15_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___16_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___17_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___18_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___19_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___20_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___21_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___22_ 0 "Unchecked" 1 "Checked" 
label define related_ia7___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ia7_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ia7_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ia7_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ia7___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ia7___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ia7___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ia7___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ia7___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ia7_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ia7_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ib1_ 1 "Male" 2 "Female" 
label define related_ib1___1_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___2_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___3_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___4_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___5_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___6_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___7_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___8_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___9_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___10_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___11_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___12_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___13_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___14_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___15_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___16_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___17_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___18_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___19_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___20_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___21_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___22_ 0 "Unchecked" 1 "Checked" 
label define related_ib1___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ib1_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ib1_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ib1_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ib1___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ib1___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ib1___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ib1___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ib1___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ib1_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ib1_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ib2_ 1 "Male" 2 "Female" 
label define related_ib2___1_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___2_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___3_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___4_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___5_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___6_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___7_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___8_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___9_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___10_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___11_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___12_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___13_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___14_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___15_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___16_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___17_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___18_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___19_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___20_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___21_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___22_ 0 "Unchecked" 1 "Checked" 
label define related_ib2___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ib2_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ib2_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ib2_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ib2___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ib2___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ib2___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ib2___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ib2___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ib2_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ib2_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ib3_ 1 "Male" 2 "Female" 
label define related_ib3___1_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___2_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___3_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___4_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___5_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___6_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___7_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___8_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___9_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___10_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___11_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___12_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___13_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___14_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___15_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___16_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___17_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___18_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___19_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___20_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___21_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___22_ 0 "Unchecked" 1 "Checked" 
label define related_ib3___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ib3_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ib3_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ib3_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ib3___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ib3___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ib3___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ib3___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ib3___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ib3_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ib3_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ib4_ 1 "Male" 2 "Female" 
label define related_ib4___1_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___2_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___3_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___4_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___5_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___6_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___7_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___8_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___9_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___10_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___11_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___12_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___13_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___14_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___15_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___16_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___17_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___18_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___19_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___20_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___21_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___22_ 0 "Unchecked" 1 "Checked" 
label define related_ib4___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ib4_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ib4_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ib4_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ib4___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ib4___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ib4___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ib4___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ib4___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ib4_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ib4_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ic1_ 1 "Male" 2 "Female" 
label define related_ic1___1_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___2_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___3_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___4_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___5_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___6_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___7_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___8_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___9_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___10_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___11_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___12_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___13_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___14_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___15_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___16_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___17_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___18_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___19_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___20_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___21_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___22_ 0 "Unchecked" 1 "Checked" 
label define related_ic1___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ic1_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ic1_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ic1_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ic1___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ic1___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ic1___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ic1___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ic1___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ic1_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ic1_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ic2_ 1 "Male" 2 "Female" 
label define related_ic2___1_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___2_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___3_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___4_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___5_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___6_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___7_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___8_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___9_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___10_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___11_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___12_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___13_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___14_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___15_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___16_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___17_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___18_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___19_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___20_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___21_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___22_ 0 "Unchecked" 1 "Checked" 
label define related_ic2___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ic2_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ic2_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ic2_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ic2___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ic2___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ic2___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ic2___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ic2___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ic2_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ic2_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ic3_ 1 "Male" 2 "Female" 
label define related_ic3___1_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___2_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___3_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___4_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___5_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___6_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___7_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___8_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___9_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___10_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___11_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___12_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___13_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___14_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___15_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___16_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___17_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___18_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___19_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___20_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___21_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___22_ 0 "Unchecked" 1 "Checked" 
label define related_ic3___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ic3_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ic3_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ic3_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ic3___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ic3___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ic3___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ic3___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ic3___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ic3_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ic3_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ic4_ 1 "Male" 2 "Female" 
label define related_ic4___1_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___2_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___3_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___4_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___5_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___6_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___7_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___8_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___9_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___10_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___11_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___12_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___13_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___14_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___15_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___16_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___17_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___18_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___19_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___20_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___21_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___22_ 0 "Unchecked" 1 "Checked" 
label define related_ic4___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ic4_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ic4_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ic4_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ic4___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ic4___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ic4___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ic4___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ic4___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ic4_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ic4_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha1_ 1 "Male" 2 "Female" 
label define related_ha1___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha1___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha1_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha1_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha1_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha1___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha1___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha1___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha1___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha1___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha1_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha1_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha2_ 1 "Male" 2 "Female" 
label define related_ha2___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha2___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha2_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha2_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha2_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha2___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha2___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha2___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha2___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha2___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha2_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha2_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha3_ 1 "Male" 2 "Female" 
label define related_ha3___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha3___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha3_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha3_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha3_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha3___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha3___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha3___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha3___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha3___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha3_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha3_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha4_ 1 "Male" 2 "Female" 
label define related_ha4___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha4___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha4_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha4_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha4_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha4___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha4___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha4___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha4___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha4___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha4_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha4_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha5_ 1 "Male" 2 "Female" 
label define related_ha5___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha5___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha5_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha5_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha5_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha5___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha5___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha5___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha5___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha5___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha5_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha5_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha6_ 1 "Male" 2 "Female" 
label define related_ha6___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha6___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha6_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha6_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha6_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha6___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha6___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha6___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha6___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha6___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha6_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha6_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_ha7_ 1 "Male" 2 "Female" 
label define related_ha7___1_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___2_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___3_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___4_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___5_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___6_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___7_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___8_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___9_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___10_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___11_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___12_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___13_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___14_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___15_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___16_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___17_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___18_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___19_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___20_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___21_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___22_ 0 "Unchecked" 1 "Checked" 
label define related_ha7___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_ha7_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_ha7_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_ha7_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_ha7___1_ 0 "Unchecked" 1 "Checked" 
label define helped_ha7___2_ 0 "Unchecked" 1 "Checked" 
label define helped_ha7___3_ 0 "Unchecked" 1 "Checked" 
label define helped_ha7___4_ 0 "Unchecked" 1 "Checked" 
label define helped_ha7___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_ha7_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_ha7_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hb1_ 1 "Male" 2 "Female" 
label define related_hb1___1_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___2_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___3_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___4_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___5_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___6_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___7_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___8_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___9_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___10_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___11_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___12_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___13_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___14_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___15_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___16_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___17_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___18_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___19_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___20_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___21_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___22_ 0 "Unchecked" 1 "Checked" 
label define related_hb1___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hb1_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hb1_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hb1_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hb1___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hb1___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hb1___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hb1___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hb1___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hb1_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hb1_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hb2_ 1 "Male" 2 "Female" 
label define related_hb2___1_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___2_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___3_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___4_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___5_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___6_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___7_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___8_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___9_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___10_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___11_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___12_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___13_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___14_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___15_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___16_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___17_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___18_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___19_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___20_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___21_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___22_ 0 "Unchecked" 1 "Checked" 
label define related_hb2___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hb2_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hb2_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hb2_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hb2___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hb2___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hb2___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hb2___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hb2___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hb2_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hb2_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hb3_ 1 "Male" 2 "Female" 
label define related_hb3___1_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___2_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___3_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___4_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___5_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___6_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___7_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___8_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___9_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___10_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___11_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___12_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___13_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___14_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___15_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___16_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___17_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___18_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___19_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___20_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___21_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___22_ 0 "Unchecked" 1 "Checked" 
label define related_hb3___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hb3_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hb3_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hb3_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hb3___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hb3___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hb3___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hb3___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hb3___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hb3_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hb3_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hb4_ 1 "Male" 2 "Female" 
label define related_hb4___1_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___2_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___3_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___4_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___5_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___6_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___7_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___8_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___9_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___10_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___11_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___12_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___13_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___14_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___15_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___16_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___17_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___18_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___19_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___20_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___21_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___22_ 0 "Unchecked" 1 "Checked" 
label define related_hb4___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hb4_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hb4_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hb4_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hb4___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hb4___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hb4___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hb4___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hb4___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hb4_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hb4_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hc1_ 1 "Male" 2 "Female" 
label define related_hc1___1_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___2_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___3_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___4_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___5_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___6_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___7_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___8_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___9_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___10_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___11_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___12_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___13_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___14_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___15_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___16_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___17_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___18_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___19_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___20_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___21_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___22_ 0 "Unchecked" 1 "Checked" 
label define related_hc1___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hc1_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hc1_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hc1_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hc1___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hc1___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hc1___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hc1___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hc1___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hc1_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hc1_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hc2_ 1 "Male" 2 "Female" 
label define related_hc2___1_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___2_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___3_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___4_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___5_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___6_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___7_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___8_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___9_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___10_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___11_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___12_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___13_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___14_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___15_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___16_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___17_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___18_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___19_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___20_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___21_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___22_ 0 "Unchecked" 1 "Checked" 
label define related_hc2___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hc2_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hc2_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hc2_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hc2___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hc2___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hc2___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hc2___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hc2___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hc2_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hc2_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hc3_ 1 "Male" 2 "Female" 
label define related_hc3___1_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___2_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___3_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___4_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___5_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___6_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___7_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___8_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___9_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___10_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___11_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___12_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___13_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___14_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___15_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___16_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___17_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___18_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___19_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___20_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___21_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___22_ 0 "Unchecked" 1 "Checked" 
label define related_hc3___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hc3_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hc3_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hc3_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hc3___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hc3___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hc3___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hc3___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hc3___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hc3_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hc3_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define gender_hc4_ 1 "Male" 2 "Female" 
label define related_hc4___1_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___2_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___3_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___4_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___5_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___6_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___7_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___8_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___9_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___10_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___11_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___12_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___13_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___14_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___15_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___16_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___17_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___18_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___19_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___20_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___21_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___22_ 0 "Unchecked" 1 "Checked" 
label define related_hc4___23_ 0 "Unchecked" 1 "Checked" 
label define howclose_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 
label define seetalk_hc4_ 1 "Often" 2 "Occasionally" 3 "Hardly ever" 
label define knowabout_hc4_ 1 "A lot" 2 "Some" 3 "Not very much" 
label define trustdoctors_hc4_ 1 "A lot" 2 "Most of the time" 3 "Not very much" 8 "Dont know/unsure" 
label define helped_hc4___1_ 0 "Unchecked" 1 "Checked" 
label define helped_hc4___2_ 0 "Unchecked" 1 "Checked" 
label define helped_hc4___3_ 0 "Unchecked" 1 "Checked" 
label define helped_hc4___4_ 0 "Unchecked" 1 "Checked" 
label define helped_hc4___5_ 0 "Unchecked" 1 "Checked" 
label define difficult_hc4_ 1 "A lot" 2 "Sometimes" 3 "Not really" 
label define strong_hc4_ 1 "1" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6" 7 "7" 8 "8" 9 "9" 10 "10" 
label define matrix_ia1_ia2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ia3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ia4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ia5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ia6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia1_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ia3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ia4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ia5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ia6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia2_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ia4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ia5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ia6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia3_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ia5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ia6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia4_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ia6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia5_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ia7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia6_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ib1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ia7_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ib2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib1_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ib3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib2_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ib4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib3_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ic1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ib4_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ic2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic1_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ic3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic2_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ic4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic3_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ic4_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_ha2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha1_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_ha3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha2_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_ha4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha3_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_ha5_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha4_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_ha6_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha5_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_ha7_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha6_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hb1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_ha7_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hb2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb1_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb2_hb3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb2_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb2_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb2_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb2_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb2_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb3_hb4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb3_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb3_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb3_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb3_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb4_hc1_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb4_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb4_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hb4_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hc1_hc2_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hc1_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hc1_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hc2_hc3_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hc2_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define matrix_hc3_hc4_ 1 "Very close" 2 "Sort of close" 3 "Not very close" 4 "Dont know each other" 
label define health_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define energy_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define spirits_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define living_situation_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define memory_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define family_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define marriage_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define friends_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define self_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define do_chores_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define do_fun_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define money_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define whole_ 1 "Poor" 2 "Fair" 3 "Good" 4 "Excellent" 
label define partner_response_complete_ 0 "Incomplete" 1 "Unverified" 2 "Complete" 

label values set_study_id_complete set_study_id_complete_
label values survey_method survey_method_
label values gender_ia1 gender_ia1_
label values related_ia1___1 related_ia1___1_
label values related_ia1___2 related_ia1___2_
label values related_ia1___3 related_ia1___3_
label values related_ia1___4 related_ia1___4_
label values related_ia1___5 related_ia1___5_
label values related_ia1___6 related_ia1___6_
label values related_ia1___7 related_ia1___7_
label values related_ia1___8 related_ia1___8_
label values related_ia1___9 related_ia1___9_
label values related_ia1___10 related_ia1___10_
label values related_ia1___11 related_ia1___11_
label values related_ia1___12 related_ia1___12_
label values related_ia1___13 related_ia1___13_
label values related_ia1___14 related_ia1___14_
label values related_ia1___15 related_ia1___15_
label values related_ia1___16 related_ia1___16_
label values related_ia1___17 related_ia1___17_
label values related_ia1___18 related_ia1___18_
label values related_ia1___19 related_ia1___19_
label values related_ia1___20 related_ia1___20_
label values related_ia1___21 related_ia1___21_
label values related_ia1___22 related_ia1___22_
label values related_ia1___23 related_ia1___23_
label values howclose_ia1 howclose_ia1_
label values seetalk_ia1 seetalk_ia1_
label values knowabout_ia1 knowabout_ia1_
label values trustdoctors_ia1 trustdoctors_ia1_
label values helped_ia1___1 helped_ia1___1_
label values helped_ia1___2 helped_ia1___2_
label values helped_ia1___3 helped_ia1___3_
label values helped_ia1___4 helped_ia1___4_
label values helped_ia1___5 helped_ia1___5_
label values difficult_ia1 difficult_ia1_
label values strong_ia1 strong_ia1_
label values gender_ia2 gender_ia2_
label values related_ia2___1 related_ia2___1_
label values related_ia2___2 related_ia2___2_
label values related_ia2___3 related_ia2___3_
label values related_ia2___4 related_ia2___4_
label values related_ia2___5 related_ia2___5_
label values related_ia2___6 related_ia2___6_
label values related_ia2___7 related_ia2___7_
label values related_ia2___8 related_ia2___8_
label values related_ia2___9 related_ia2___9_
label values related_ia2___10 related_ia2___10_
label values related_ia2___11 related_ia2___11_
label values related_ia2___12 related_ia2___12_
label values related_ia2___13 related_ia2___13_
label values related_ia2___14 related_ia2___14_
label values related_ia2___15 related_ia2___15_
label values related_ia2___16 related_ia2___16_
label values related_ia2___17 related_ia2___17_
label values related_ia2___18 related_ia2___18_
label values related_ia2___19 related_ia2___19_
label values related_ia2___20 related_ia2___20_
label values related_ia2___21 related_ia2___21_
label values related_ia2___22 related_ia2___22_
label values related_ia2___23 related_ia2___23_
label values howclose_ia2 howclose_ia2_
label values seetalk_ia2 seetalk_ia2_
label values knowabout_ia2 knowabout_ia2_
label values trustdoctors_ia2 trustdoctors_ia2_
label values helped_ia2___1 helped_ia2___1_
label values helped_ia2___2 helped_ia2___2_
label values helped_ia2___3 helped_ia2___3_
label values helped_ia2___4 helped_ia2___4_
label values helped_ia2___5 helped_ia2___5_
label values difficult_ia2 difficult_ia2_
label values strong_ia2 strong_ia2_
label values gender_ia3 gender_ia3_
label values related_ia3___1 related_ia3___1_
label values related_ia3___2 related_ia3___2_
label values related_ia3___3 related_ia3___3_
label values related_ia3___4 related_ia3___4_
label values related_ia3___5 related_ia3___5_
label values related_ia3___6 related_ia3___6_
label values related_ia3___7 related_ia3___7_
label values related_ia3___8 related_ia3___8_
label values related_ia3___9 related_ia3___9_
label values related_ia3___10 related_ia3___10_
label values related_ia3___11 related_ia3___11_
label values related_ia3___12 related_ia3___12_
label values related_ia3___13 related_ia3___13_
label values related_ia3___14 related_ia3___14_
label values related_ia3___15 related_ia3___15_
label values related_ia3___16 related_ia3___16_
label values related_ia3___17 related_ia3___17_
label values related_ia3___18 related_ia3___18_
label values related_ia3___19 related_ia3___19_
label values related_ia3___20 related_ia3___20_
label values related_ia3___21 related_ia3___21_
label values related_ia3___22 related_ia3___22_
label values related_ia3___23 related_ia3___23_
label values howclose_ia3 howclose_ia3_
label values seetalk_ia3 seetalk_ia3_
label values knowabout_ia3 knowabout_ia3_
label values trustdoctors_ia3 trustdoctors_ia3_
label values helped_ia3___1 helped_ia3___1_
label values helped_ia3___2 helped_ia3___2_
label values helped_ia3___3 helped_ia3___3_
label values helped_ia3___4 helped_ia3___4_
label values helped_ia3___5 helped_ia3___5_
label values difficult_ia3 difficult_ia3_
label values strong_ia3 strong_ia3_
label values gender_ia4 gender_ia4_
label values related_ia4___1 related_ia4___1_
label values related_ia4___2 related_ia4___2_
label values related_ia4___3 related_ia4___3_
label values related_ia4___4 related_ia4___4_
label values related_ia4___5 related_ia4___5_
label values related_ia4___6 related_ia4___6_
label values related_ia4___7 related_ia4___7_
label values related_ia4___8 related_ia4___8_
label values related_ia4___9 related_ia4___9_
label values related_ia4___10 related_ia4___10_
label values related_ia4___11 related_ia4___11_
label values related_ia4___12 related_ia4___12_
label values related_ia4___13 related_ia4___13_
label values related_ia4___14 related_ia4___14_
label values related_ia4___15 related_ia4___15_
label values related_ia4___16 related_ia4___16_
label values related_ia4___17 related_ia4___17_
label values related_ia4___18 related_ia4___18_
label values related_ia4___19 related_ia4___19_
label values related_ia4___20 related_ia4___20_
label values related_ia4___21 related_ia4___21_
label values related_ia4___22 related_ia4___22_
label values related_ia4___23 related_ia4___23_
label values howclose_ia4 howclose_ia4_
label values seetalk_ia4 seetalk_ia4_
label values knowabout_ia4 knowabout_ia4_
label values trustdoctors_ia4 trustdoctors_ia4_
label values helped_ia4___1 helped_ia4___1_
label values helped_ia4___2 helped_ia4___2_
label values helped_ia4___3 helped_ia4___3_
label values helped_ia4___4 helped_ia4___4_
label values helped_ia4___5 helped_ia4___5_
label values difficult_ia4 difficult_ia4_
label values strong_ia4 strong_ia4_
label values gender_ia5 gender_ia5_
label values related_ia5___1 related_ia5___1_
label values related_ia5___2 related_ia5___2_
label values related_ia5___3 related_ia5___3_
label values related_ia5___4 related_ia5___4_
label values related_ia5___5 related_ia5___5_
label values related_ia5___6 related_ia5___6_
label values related_ia5___7 related_ia5___7_
label values related_ia5___8 related_ia5___8_
label values related_ia5___9 related_ia5___9_
label values related_ia5___10 related_ia5___10_
label values related_ia5___11 related_ia5___11_
label values related_ia5___12 related_ia5___12_
label values related_ia5___13 related_ia5___13_
label values related_ia5___14 related_ia5___14_
label values related_ia5___15 related_ia5___15_
label values related_ia5___16 related_ia5___16_
label values related_ia5___17 related_ia5___17_
label values related_ia5___18 related_ia5___18_
label values related_ia5___19 related_ia5___19_
label values related_ia5___20 related_ia5___20_
label values related_ia5___21 related_ia5___21_
label values related_ia5___22 related_ia5___22_
label values related_ia5___23 related_ia5___23_
label values howclose_ia5 howclose_ia5_
label values seetalk_ia5 seetalk_ia5_
label values knowabout_ia5 knowabout_ia5_
label values trustdoctors_ia5 trustdoctors_ia5_
label values helped_ia5___1 helped_ia5___1_
label values helped_ia5___2 helped_ia5___2_
label values helped_ia5___3 helped_ia5___3_
label values helped_ia5___4 helped_ia5___4_
label values helped_ia5___5 helped_ia5___5_
label values difficult_ia5 difficult_ia5_
label values strong_ia5 strong_ia5_
label values gender_ia6 gender_ia6_
label values related_ia6___1 related_ia6___1_
label values related_ia6___2 related_ia6___2_
label values related_ia6___3 related_ia6___3_
label values related_ia6___4 related_ia6___4_
label values related_ia6___5 related_ia6___5_
label values related_ia6___6 related_ia6___6_
label values related_ia6___7 related_ia6___7_
label values related_ia6___8 related_ia6___8_
label values related_ia6___9 related_ia6___9_
label values related_ia6___10 related_ia6___10_
label values related_ia6___11 related_ia6___11_
label values related_ia6___12 related_ia6___12_
label values related_ia6___13 related_ia6___13_
label values related_ia6___14 related_ia6___14_
label values related_ia6___15 related_ia6___15_
label values related_ia6___16 related_ia6___16_
label values related_ia6___17 related_ia6___17_
label values related_ia6___18 related_ia6___18_
label values related_ia6___19 related_ia6___19_
label values related_ia6___20 related_ia6___20_
label values related_ia6___21 related_ia6___21_
label values related_ia6___22 related_ia6___22_
label values related_ia6___23 related_ia6___23_
label values howclose_ia6 howclose_ia6_
label values seetalk_ia6 seetalk_ia6_
label values knowabout_ia6 knowabout_ia6_
label values trustdoctors_ia6 trustdoctors_ia6_
label values helped_ia6___1 helped_ia6___1_
label values helped_ia6___2 helped_ia6___2_
label values helped_ia6___3 helped_ia6___3_
label values helped_ia6___4 helped_ia6___4_
label values helped_ia6___5 helped_ia6___5_
label values difficult_ia6 difficult_ia6_
label values strong_ia6 strong_ia6_
label values gender_ia7 gender_ia7_
label values related_ia7___1 related_ia7___1_
label values related_ia7___2 related_ia7___2_
label values related_ia7___3 related_ia7___3_
label values related_ia7___4 related_ia7___4_
label values related_ia7___5 related_ia7___5_
label values related_ia7___6 related_ia7___6_
label values related_ia7___7 related_ia7___7_
label values related_ia7___8 related_ia7___8_
label values related_ia7___9 related_ia7___9_
label values related_ia7___10 related_ia7___10_
label values related_ia7___11 related_ia7___11_
label values related_ia7___12 related_ia7___12_
label values related_ia7___13 related_ia7___13_
label values related_ia7___14 related_ia7___14_
label values related_ia7___15 related_ia7___15_
label values related_ia7___16 related_ia7___16_
label values related_ia7___17 related_ia7___17_
label values related_ia7___18 related_ia7___18_
label values related_ia7___19 related_ia7___19_
label values related_ia7___20 related_ia7___20_
label values related_ia7___21 related_ia7___21_
label values related_ia7___22 related_ia7___22_
label values related_ia7___23 related_ia7___23_
label values howclose_ia7 howclose_ia7_
label values seetalk_ia7 seetalk_ia7_
label values knowabout_ia7 knowabout_ia7_
label values trustdoctors_ia7 trustdoctors_ia7_
label values helped_ia7___1 helped_ia7___1_
label values helped_ia7___2 helped_ia7___2_
label values helped_ia7___3 helped_ia7___3_
label values helped_ia7___4 helped_ia7___4_
label values helped_ia7___5 helped_ia7___5_
label values difficult_ia7 difficult_ia7_
label values strong_ia7 strong_ia7_
label values gender_ib1 gender_ib1_
label values related_ib1___1 related_ib1___1_
label values related_ib1___2 related_ib1___2_
label values related_ib1___3 related_ib1___3_
label values related_ib1___4 related_ib1___4_
label values related_ib1___5 related_ib1___5_
label values related_ib1___6 related_ib1___6_
label values related_ib1___7 related_ib1___7_
label values related_ib1___8 related_ib1___8_
label values related_ib1___9 related_ib1___9_
label values related_ib1___10 related_ib1___10_
label values related_ib1___11 related_ib1___11_
label values related_ib1___12 related_ib1___12_
label values related_ib1___13 related_ib1___13_
label values related_ib1___14 related_ib1___14_
label values related_ib1___15 related_ib1___15_
label values related_ib1___16 related_ib1___16_
label values related_ib1___17 related_ib1___17_
label values related_ib1___18 related_ib1___18_
label values related_ib1___19 related_ib1___19_
label values related_ib1___20 related_ib1___20_
label values related_ib1___21 related_ib1___21_
label values related_ib1___22 related_ib1___22_
label values related_ib1___23 related_ib1___23_
label values howclose_ib1 howclose_ib1_
label values seetalk_ib1 seetalk_ib1_
label values knowabout_ib1 knowabout_ib1_
label values trustdoctors_ib1 trustdoctors_ib1_
label values helped_ib1___1 helped_ib1___1_
label values helped_ib1___2 helped_ib1___2_
label values helped_ib1___3 helped_ib1___3_
label values helped_ib1___4 helped_ib1___4_
label values helped_ib1___5 helped_ib1___5_
label values difficult_ib1 difficult_ib1_
label values strong_ib1 strong_ib1_
label values gender_ib2 gender_ib2_
label values related_ib2___1 related_ib2___1_
label values related_ib2___2 related_ib2___2_
label values related_ib2___3 related_ib2___3_
label values related_ib2___4 related_ib2___4_
label values related_ib2___5 related_ib2___5_
label values related_ib2___6 related_ib2___6_
label values related_ib2___7 related_ib2___7_
label values related_ib2___8 related_ib2___8_
label values related_ib2___9 related_ib2___9_
label values related_ib2___10 related_ib2___10_
label values related_ib2___11 related_ib2___11_
label values related_ib2___12 related_ib2___12_
label values related_ib2___13 related_ib2___13_
label values related_ib2___14 related_ib2___14_
label values related_ib2___15 related_ib2___15_
label values related_ib2___16 related_ib2___16_
label values related_ib2___17 related_ib2___17_
label values related_ib2___18 related_ib2___18_
label values related_ib2___19 related_ib2___19_
label values related_ib2___20 related_ib2___20_
label values related_ib2___21 related_ib2___21_
label values related_ib2___22 related_ib2___22_
label values related_ib2___23 related_ib2___23_
label values howclose_ib2 howclose_ib2_
label values seetalk_ib2 seetalk_ib2_
label values knowabout_ib2 knowabout_ib2_
label values trustdoctors_ib2 trustdoctors_ib2_
label values helped_ib2___1 helped_ib2___1_
label values helped_ib2___2 helped_ib2___2_
label values helped_ib2___3 helped_ib2___3_
label values helped_ib2___4 helped_ib2___4_
label values helped_ib2___5 helped_ib2___5_
label values difficult_ib2 difficult_ib2_
label values strong_ib2 strong_ib2_
label values gender_ib3 gender_ib3_
label values related_ib3___1 related_ib3___1_
label values related_ib3___2 related_ib3___2_
label values related_ib3___3 related_ib3___3_
label values related_ib3___4 related_ib3___4_
label values related_ib3___5 related_ib3___5_
label values related_ib3___6 related_ib3___6_
label values related_ib3___7 related_ib3___7_
label values related_ib3___8 related_ib3___8_
label values related_ib3___9 related_ib3___9_
label values related_ib3___10 related_ib3___10_
label values related_ib3___11 related_ib3___11_
label values related_ib3___12 related_ib3___12_
label values related_ib3___13 related_ib3___13_
label values related_ib3___14 related_ib3___14_
label values related_ib3___15 related_ib3___15_
label values related_ib3___16 related_ib3___16_
label values related_ib3___17 related_ib3___17_
label values related_ib3___18 related_ib3___18_
label values related_ib3___19 related_ib3___19_
label values related_ib3___20 related_ib3___20_
label values related_ib3___21 related_ib3___21_
label values related_ib3___22 related_ib3___22_
label values related_ib3___23 related_ib3___23_
label values howclose_ib3 howclose_ib3_
label values seetalk_ib3 seetalk_ib3_
label values knowabout_ib3 knowabout_ib3_
label values trustdoctors_ib3 trustdoctors_ib3_
label values helped_ib3___1 helped_ib3___1_
label values helped_ib3___2 helped_ib3___2_
label values helped_ib3___3 helped_ib3___3_
label values helped_ib3___4 helped_ib3___4_
label values helped_ib3___5 helped_ib3___5_
label values difficult_ib3 difficult_ib3_
label values strong_ib3 strong_ib3_
label values gender_ib4 gender_ib4_
label values related_ib4___1 related_ib4___1_
label values related_ib4___2 related_ib4___2_
label values related_ib4___3 related_ib4___3_
label values related_ib4___4 related_ib4___4_
label values related_ib4___5 related_ib4___5_
label values related_ib4___6 related_ib4___6_
label values related_ib4___7 related_ib4___7_
label values related_ib4___8 related_ib4___8_
label values related_ib4___9 related_ib4___9_
label values related_ib4___10 related_ib4___10_
label values related_ib4___11 related_ib4___11_
label values related_ib4___12 related_ib4___12_
label values related_ib4___13 related_ib4___13_
label values related_ib4___14 related_ib4___14_
label values related_ib4___15 related_ib4___15_
label values related_ib4___16 related_ib4___16_
label values related_ib4___17 related_ib4___17_
label values related_ib4___18 related_ib4___18_
label values related_ib4___19 related_ib4___19_
label values related_ib4___20 related_ib4___20_
label values related_ib4___21 related_ib4___21_
label values related_ib4___22 related_ib4___22_
label values related_ib4___23 related_ib4___23_
label values howclose_ib4 howclose_ib4_
label values seetalk_ib4 seetalk_ib4_
label values knowabout_ib4 knowabout_ib4_
label values trustdoctors_ib4 trustdoctors_ib4_
label values helped_ib4___1 helped_ib4___1_
label values helped_ib4___2 helped_ib4___2_
label values helped_ib4___3 helped_ib4___3_
label values helped_ib4___4 helped_ib4___4_
label values helped_ib4___5 helped_ib4___5_
label values difficult_ib4 difficult_ib4_
label values strong_ib4 strong_ib4_
label values gender_ic1 gender_ic1_
label values related_ic1___1 related_ic1___1_
label values related_ic1___2 related_ic1___2_
label values related_ic1___3 related_ic1___3_
label values related_ic1___4 related_ic1___4_
label values related_ic1___5 related_ic1___5_
label values related_ic1___6 related_ic1___6_
label values related_ic1___7 related_ic1___7_
label values related_ic1___8 related_ic1___8_
label values related_ic1___9 related_ic1___9_
label values related_ic1___10 related_ic1___10_
label values related_ic1___11 related_ic1___11_
label values related_ic1___12 related_ic1___12_
label values related_ic1___13 related_ic1___13_
label values related_ic1___14 related_ic1___14_
label values related_ic1___15 related_ic1___15_
label values related_ic1___16 related_ic1___16_
label values related_ic1___17 related_ic1___17_
label values related_ic1___18 related_ic1___18_
label values related_ic1___19 related_ic1___19_
label values related_ic1___20 related_ic1___20_
label values related_ic1___21 related_ic1___21_
label values related_ic1___22 related_ic1___22_
label values related_ic1___23 related_ic1___23_
label values howclose_ic1 howclose_ic1_
label values seetalk_ic1 seetalk_ic1_
label values knowabout_ic1 knowabout_ic1_
label values trustdoctors_ic1 trustdoctors_ic1_
label values helped_ic1___1 helped_ic1___1_
label values helped_ic1___2 helped_ic1___2_
label values helped_ic1___3 helped_ic1___3_
label values helped_ic1___4 helped_ic1___4_
label values helped_ic1___5 helped_ic1___5_
label values difficult_ic1 difficult_ic1_
label values strong_ic1 strong_ic1_
label values gender_ic2 gender_ic2_
label values related_ic2___1 related_ic2___1_
label values related_ic2___2 related_ic2___2_
label values related_ic2___3 related_ic2___3_
label values related_ic2___4 related_ic2___4_
label values related_ic2___5 related_ic2___5_
label values related_ic2___6 related_ic2___6_
label values related_ic2___7 related_ic2___7_
label values related_ic2___8 related_ic2___8_
label values related_ic2___9 related_ic2___9_
label values related_ic2___10 related_ic2___10_
label values related_ic2___11 related_ic2___11_
label values related_ic2___12 related_ic2___12_
label values related_ic2___13 related_ic2___13_
label values related_ic2___14 related_ic2___14_
label values related_ic2___15 related_ic2___15_
label values related_ic2___16 related_ic2___16_
label values related_ic2___17 related_ic2___17_
label values related_ic2___18 related_ic2___18_
label values related_ic2___19 related_ic2___19_
label values related_ic2___20 related_ic2___20_
label values related_ic2___21 related_ic2___21_
label values related_ic2___22 related_ic2___22_
label values related_ic2___23 related_ic2___23_
label values howclose_ic2 howclose_ic2_
label values seetalk_ic2 seetalk_ic2_
label values knowabout_ic2 knowabout_ic2_
label values trustdoctors_ic2 trustdoctors_ic2_
label values helped_ic2___1 helped_ic2___1_
label values helped_ic2___2 helped_ic2___2_
label values helped_ic2___3 helped_ic2___3_
label values helped_ic2___4 helped_ic2___4_
label values helped_ic2___5 helped_ic2___5_
label values difficult_ic2 difficult_ic2_
label values strong_ic2 strong_ic2_
label values gender_ic3 gender_ic3_
label values related_ic3___1 related_ic3___1_
label values related_ic3___2 related_ic3___2_
label values related_ic3___3 related_ic3___3_
label values related_ic3___4 related_ic3___4_
label values related_ic3___5 related_ic3___5_
label values related_ic3___6 related_ic3___6_
label values related_ic3___7 related_ic3___7_
label values related_ic3___8 related_ic3___8_
label values related_ic3___9 related_ic3___9_
label values related_ic3___10 related_ic3___10_
label values related_ic3___11 related_ic3___11_
label values related_ic3___12 related_ic3___12_
label values related_ic3___13 related_ic3___13_
label values related_ic3___14 related_ic3___14_
label values related_ic3___15 related_ic3___15_
label values related_ic3___16 related_ic3___16_
label values related_ic3___17 related_ic3___17_
label values related_ic3___18 related_ic3___18_
label values related_ic3___19 related_ic3___19_
label values related_ic3___20 related_ic3___20_
label values related_ic3___21 related_ic3___21_
label values related_ic3___22 related_ic3___22_
label values related_ic3___23 related_ic3___23_
label values howclose_ic3 howclose_ic3_
label values seetalk_ic3 seetalk_ic3_
label values knowabout_ic3 knowabout_ic3_
label values trustdoctors_ic3 trustdoctors_ic3_
label values helped_ic3___1 helped_ic3___1_
label values helped_ic3___2 helped_ic3___2_
label values helped_ic3___3 helped_ic3___3_
label values helped_ic3___4 helped_ic3___4_
label values helped_ic3___5 helped_ic3___5_
label values difficult_ic3 difficult_ic3_
label values strong_ic3 strong_ic3_
label values gender_ic4 gender_ic4_
label values related_ic4___1 related_ic4___1_
label values related_ic4___2 related_ic4___2_
label values related_ic4___3 related_ic4___3_
label values related_ic4___4 related_ic4___4_
label values related_ic4___5 related_ic4___5_
label values related_ic4___6 related_ic4___6_
label values related_ic4___7 related_ic4___7_
label values related_ic4___8 related_ic4___8_
label values related_ic4___9 related_ic4___9_
label values related_ic4___10 related_ic4___10_
label values related_ic4___11 related_ic4___11_
label values related_ic4___12 related_ic4___12_
label values related_ic4___13 related_ic4___13_
label values related_ic4___14 related_ic4___14_
label values related_ic4___15 related_ic4___15_
label values related_ic4___16 related_ic4___16_
label values related_ic4___17 related_ic4___17_
label values related_ic4___18 related_ic4___18_
label values related_ic4___19 related_ic4___19_
label values related_ic4___20 related_ic4___20_
label values related_ic4___21 related_ic4___21_
label values related_ic4___22 related_ic4___22_
label values related_ic4___23 related_ic4___23_
label values howclose_ic4 howclose_ic4_
label values seetalk_ic4 seetalk_ic4_
label values knowabout_ic4 knowabout_ic4_
label values trustdoctors_ic4 trustdoctors_ic4_
label values helped_ic4___1 helped_ic4___1_
label values helped_ic4___2 helped_ic4___2_
label values helped_ic4___3 helped_ic4___3_
label values helped_ic4___4 helped_ic4___4_
label values helped_ic4___5 helped_ic4___5_
label values difficult_ic4 difficult_ic4_
label values strong_ic4 strong_ic4_
label values gender_ha1 gender_ha1_
label values related_ha1___1 related_ha1___1_
label values related_ha1___2 related_ha1___2_
label values related_ha1___3 related_ha1___3_
label values related_ha1___4 related_ha1___4_
label values related_ha1___5 related_ha1___5_
label values related_ha1___6 related_ha1___6_
label values related_ha1___7 related_ha1___7_
label values related_ha1___8 related_ha1___8_
label values related_ha1___9 related_ha1___9_
label values related_ha1___10 related_ha1___10_
label values related_ha1___11 related_ha1___11_
label values related_ha1___12 related_ha1___12_
label values related_ha1___13 related_ha1___13_
label values related_ha1___14 related_ha1___14_
label values related_ha1___15 related_ha1___15_
label values related_ha1___16 related_ha1___16_
label values related_ha1___17 related_ha1___17_
label values related_ha1___18 related_ha1___18_
label values related_ha1___19 related_ha1___19_
label values related_ha1___20 related_ha1___20_
label values related_ha1___21 related_ha1___21_
label values related_ha1___22 related_ha1___22_
label values related_ha1___23 related_ha1___23_
label values howclose_ha1 howclose_ha1_
label values seetalk_ha1 seetalk_ha1_
label values knowabout_ha1 knowabout_ha1_
label values trustdoctors_ha1 trustdoctors_ha1_
label values helped_ha1___1 helped_ha1___1_
label values helped_ha1___2 helped_ha1___2_
label values helped_ha1___3 helped_ha1___3_
label values helped_ha1___4 helped_ha1___4_
label values helped_ha1___5 helped_ha1___5_
label values difficult_ha1 difficult_ha1_
label values strong_ha1 strong_ha1_
label values gender_ha2 gender_ha2_
label values related_ha2___1 related_ha2___1_
label values related_ha2___2 related_ha2___2_
label values related_ha2___3 related_ha2___3_
label values related_ha2___4 related_ha2___4_
label values related_ha2___5 related_ha2___5_
label values related_ha2___6 related_ha2___6_
label values related_ha2___7 related_ha2___7_
label values related_ha2___8 related_ha2___8_
label values related_ha2___9 related_ha2___9_
label values related_ha2___10 related_ha2___10_
label values related_ha2___11 related_ha2___11_
label values related_ha2___12 related_ha2___12_
label values related_ha2___13 related_ha2___13_
label values related_ha2___14 related_ha2___14_
label values related_ha2___15 related_ha2___15_
label values related_ha2___16 related_ha2___16_
label values related_ha2___17 related_ha2___17_
label values related_ha2___18 related_ha2___18_
label values related_ha2___19 related_ha2___19_
label values related_ha2___20 related_ha2___20_
label values related_ha2___21 related_ha2___21_
label values related_ha2___22 related_ha2___22_
label values related_ha2___23 related_ha2___23_
label values howclose_ha2 howclose_ha2_
label values seetalk_ha2 seetalk_ha2_
label values knowabout_ha2 knowabout_ha2_
label values trustdoctors_ha2 trustdoctors_ha2_
label values helped_ha2___1 helped_ha2___1_
label values helped_ha2___2 helped_ha2___2_
label values helped_ha2___3 helped_ha2___3_
label values helped_ha2___4 helped_ha2___4_
label values helped_ha2___5 helped_ha2___5_
label values difficult_ha2 difficult_ha2_
label values strong_ha2 strong_ha2_
label values gender_ha3 gender_ha3_
label values related_ha3___1 related_ha3___1_
label values related_ha3___2 related_ha3___2_
label values related_ha3___3 related_ha3___3_
label values related_ha3___4 related_ha3___4_
label values related_ha3___5 related_ha3___5_
label values related_ha3___6 related_ha3___6_
label values related_ha3___7 related_ha3___7_
label values related_ha3___8 related_ha3___8_
label values related_ha3___9 related_ha3___9_
label values related_ha3___10 related_ha3___10_
label values related_ha3___11 related_ha3___11_
label values related_ha3___12 related_ha3___12_
label values related_ha3___13 related_ha3___13_
label values related_ha3___14 related_ha3___14_
label values related_ha3___15 related_ha3___15_
label values related_ha3___16 related_ha3___16_
label values related_ha3___17 related_ha3___17_
label values related_ha3___18 related_ha3___18_
label values related_ha3___19 related_ha3___19_
label values related_ha3___20 related_ha3___20_
label values related_ha3___21 related_ha3___21_
label values related_ha3___22 related_ha3___22_
label values related_ha3___23 related_ha3___23_
label values howclose_ha3 howclose_ha3_
label values seetalk_ha3 seetalk_ha3_
label values knowabout_ha3 knowabout_ha3_
label values trustdoctors_ha3 trustdoctors_ha3_
label values helped_ha3___1 helped_ha3___1_
label values helped_ha3___2 helped_ha3___2_
label values helped_ha3___3 helped_ha3___3_
label values helped_ha3___4 helped_ha3___4_
label values helped_ha3___5 helped_ha3___5_
label values difficult_ha3 difficult_ha3_
label values strong_ha3 strong_ha3_
label values gender_ha4 gender_ha4_
label values related_ha4___1 related_ha4___1_
label values related_ha4___2 related_ha4___2_
label values related_ha4___3 related_ha4___3_
label values related_ha4___4 related_ha4___4_
label values related_ha4___5 related_ha4___5_
label values related_ha4___6 related_ha4___6_
label values related_ha4___7 related_ha4___7_
label values related_ha4___8 related_ha4___8_
label values related_ha4___9 related_ha4___9_
label values related_ha4___10 related_ha4___10_
label values related_ha4___11 related_ha4___11_
label values related_ha4___12 related_ha4___12_
label values related_ha4___13 related_ha4___13_
label values related_ha4___14 related_ha4___14_
label values related_ha4___15 related_ha4___15_
label values related_ha4___16 related_ha4___16_
label values related_ha4___17 related_ha4___17_
label values related_ha4___18 related_ha4___18_
label values related_ha4___19 related_ha4___19_
label values related_ha4___20 related_ha4___20_
label values related_ha4___21 related_ha4___21_
label values related_ha4___22 related_ha4___22_
label values related_ha4___23 related_ha4___23_
label values howclose_ha4 howclose_ha4_
label values seetalk_ha4 seetalk_ha4_
label values knowabout_ha4 knowabout_ha4_
label values trustdoctors_ha4 trustdoctors_ha4_
label values helped_ha4___1 helped_ha4___1_
label values helped_ha4___2 helped_ha4___2_
label values helped_ha4___3 helped_ha4___3_
label values helped_ha4___4 helped_ha4___4_
label values helped_ha4___5 helped_ha4___5_
label values difficult_ha4 difficult_ha4_
label values strong_ha4 strong_ha4_
label values gender_ha5 gender_ha5_
label values related_ha5___1 related_ha5___1_
label values related_ha5___2 related_ha5___2_
label values related_ha5___3 related_ha5___3_
label values related_ha5___4 related_ha5___4_
label values related_ha5___5 related_ha5___5_
label values related_ha5___6 related_ha5___6_
label values related_ha5___7 related_ha5___7_
label values related_ha5___8 related_ha5___8_
label values related_ha5___9 related_ha5___9_
label values related_ha5___10 related_ha5___10_
label values related_ha5___11 related_ha5___11_
label values related_ha5___12 related_ha5___12_
label values related_ha5___13 related_ha5___13_
label values related_ha5___14 related_ha5___14_
label values related_ha5___15 related_ha5___15_
label values related_ha5___16 related_ha5___16_
label values related_ha5___17 related_ha5___17_
label values related_ha5___18 related_ha5___18_
label values related_ha5___19 related_ha5___19_
label values related_ha5___20 related_ha5___20_
label values related_ha5___21 related_ha5___21_
label values related_ha5___22 related_ha5___22_
label values related_ha5___23 related_ha5___23_
label values howclose_ha5 howclose_ha5_
label values seetalk_ha5 seetalk_ha5_
label values knowabout_ha5 knowabout_ha5_
label values trustdoctors_ha5 trustdoctors_ha5_
label values helped_ha5___1 helped_ha5___1_
label values helped_ha5___2 helped_ha5___2_
label values helped_ha5___3 helped_ha5___3_
label values helped_ha5___4 helped_ha5___4_
label values helped_ha5___5 helped_ha5___5_
label values difficult_ha5 difficult_ha5_
label values strong_ha5 strong_ha5_
label values gender_ha6 gender_ha6_
label values related_ha6___1 related_ha6___1_
label values related_ha6___2 related_ha6___2_
label values related_ha6___3 related_ha6___3_
label values related_ha6___4 related_ha6___4_
label values related_ha6___5 related_ha6___5_
label values related_ha6___6 related_ha6___6_
label values related_ha6___7 related_ha6___7_
label values related_ha6___8 related_ha6___8_
label values related_ha6___9 related_ha6___9_
label values related_ha6___10 related_ha6___10_
label values related_ha6___11 related_ha6___11_
label values related_ha6___12 related_ha6___12_
label values related_ha6___13 related_ha6___13_
label values related_ha6___14 related_ha6___14_
label values related_ha6___15 related_ha6___15_
label values related_ha6___16 related_ha6___16_
label values related_ha6___17 related_ha6___17_
label values related_ha6___18 related_ha6___18_
label values related_ha6___19 related_ha6___19_
label values related_ha6___20 related_ha6___20_
label values related_ha6___21 related_ha6___21_
label values related_ha6___22 related_ha6___22_
label values related_ha6___23 related_ha6___23_
label values howclose_ha6 howclose_ha6_
label values seetalk_ha6 seetalk_ha6_
label values knowabout_ha6 knowabout_ha6_
label values trustdoctors_ha6 trustdoctors_ha6_
label values helped_ha6___1 helped_ha6___1_
label values helped_ha6___2 helped_ha6___2_
label values helped_ha6___3 helped_ha6___3_
label values helped_ha6___4 helped_ha6___4_
label values helped_ha6___5 helped_ha6___5_
label values difficult_ha6 difficult_ha6_
label values strong_ha6 strong_ha6_
label values gender_ha7 gender_ha7_
label values related_ha7___1 related_ha7___1_
label values related_ha7___2 related_ha7___2_
label values related_ha7___3 related_ha7___3_
label values related_ha7___4 related_ha7___4_
label values related_ha7___5 related_ha7___5_
label values related_ha7___6 related_ha7___6_
label values related_ha7___7 related_ha7___7_
label values related_ha7___8 related_ha7___8_
label values related_ha7___9 related_ha7___9_
label values related_ha7___10 related_ha7___10_
label values related_ha7___11 related_ha7___11_
label values related_ha7___12 related_ha7___12_
label values related_ha7___13 related_ha7___13_
label values related_ha7___14 related_ha7___14_
label values related_ha7___15 related_ha7___15_
label values related_ha7___16 related_ha7___16_
label values related_ha7___17 related_ha7___17_
label values related_ha7___18 related_ha7___18_
label values related_ha7___19 related_ha7___19_
label values related_ha7___20 related_ha7___20_
label values related_ha7___21 related_ha7___21_
label values related_ha7___22 related_ha7___22_
label values related_ha7___23 related_ha7___23_
label values howclose_ha7 howclose_ha7_
label values seetalk_ha7 seetalk_ha7_
label values knowabout_ha7 knowabout_ha7_
label values trustdoctors_ha7 trustdoctors_ha7_
label values helped_ha7___1 helped_ha7___1_
label values helped_ha7___2 helped_ha7___2_
label values helped_ha7___3 helped_ha7___3_
label values helped_ha7___4 helped_ha7___4_
label values helped_ha7___5 helped_ha7___5_
label values difficult_ha7 difficult_ha7_
label values strong_ha7 strong_ha7_
label values gender_hb1 gender_hb1_
label values related_hb1___1 related_hb1___1_
label values related_hb1___2 related_hb1___2_
label values related_hb1___3 related_hb1___3_
label values related_hb1___4 related_hb1___4_
label values related_hb1___5 related_hb1___5_
label values related_hb1___6 related_hb1___6_
label values related_hb1___7 related_hb1___7_
label values related_hb1___8 related_hb1___8_
label values related_hb1___9 related_hb1___9_
label values related_hb1___10 related_hb1___10_
label values related_hb1___11 related_hb1___11_
label values related_hb1___12 related_hb1___12_
label values related_hb1___13 related_hb1___13_
label values related_hb1___14 related_hb1___14_
label values related_hb1___15 related_hb1___15_
label values related_hb1___16 related_hb1___16_
label values related_hb1___17 related_hb1___17_
label values related_hb1___18 related_hb1___18_
label values related_hb1___19 related_hb1___19_
label values related_hb1___20 related_hb1___20_
label values related_hb1___21 related_hb1___21_
label values related_hb1___22 related_hb1___22_
label values related_hb1___23 related_hb1___23_
label values howclose_hb1 howclose_hb1_
label values seetalk_hb1 seetalk_hb1_
label values knowabout_hb1 knowabout_hb1_
label values trustdoctors_hb1 trustdoctors_hb1_
label values helped_hb1___1 helped_hb1___1_
label values helped_hb1___2 helped_hb1___2_
label values helped_hb1___3 helped_hb1___3_
label values helped_hb1___4 helped_hb1___4_
label values helped_hb1___5 helped_hb1___5_
label values difficult_hb1 difficult_hb1_
label values strong_hb1 strong_hb1_
label values gender_hb2 gender_hb2_
label values related_hb2___1 related_hb2___1_
label values related_hb2___2 related_hb2___2_
label values related_hb2___3 related_hb2___3_
label values related_hb2___4 related_hb2___4_
label values related_hb2___5 related_hb2___5_
label values related_hb2___6 related_hb2___6_
label values related_hb2___7 related_hb2___7_
label values related_hb2___8 related_hb2___8_
label values related_hb2___9 related_hb2___9_
label values related_hb2___10 related_hb2___10_
label values related_hb2___11 related_hb2___11_
label values related_hb2___12 related_hb2___12_
label values related_hb2___13 related_hb2___13_
label values related_hb2___14 related_hb2___14_
label values related_hb2___15 related_hb2___15_
label values related_hb2___16 related_hb2___16_
label values related_hb2___17 related_hb2___17_
label values related_hb2___18 related_hb2___18_
label values related_hb2___19 related_hb2___19_
label values related_hb2___20 related_hb2___20_
label values related_hb2___21 related_hb2___21_
label values related_hb2___22 related_hb2___22_
label values related_hb2___23 related_hb2___23_
label values howclose_hb2 howclose_hb2_
label values seetalk_hb2 seetalk_hb2_
label values knowabout_hb2 knowabout_hb2_
label values trustdoctors_hb2 trustdoctors_hb2_
label values helped_hb2___1 helped_hb2___1_
label values helped_hb2___2 helped_hb2___2_
label values helped_hb2___3 helped_hb2___3_
label values helped_hb2___4 helped_hb2___4_
label values helped_hb2___5 helped_hb2___5_
label values difficult_hb2 difficult_hb2_
label values strong_hb2 strong_hb2_
label values gender_hb3 gender_hb3_
label values related_hb3___1 related_hb3___1_
label values related_hb3___2 related_hb3___2_
label values related_hb3___3 related_hb3___3_
label values related_hb3___4 related_hb3___4_
label values related_hb3___5 related_hb3___5_
label values related_hb3___6 related_hb3___6_
label values related_hb3___7 related_hb3___7_
label values related_hb3___8 related_hb3___8_
label values related_hb3___9 related_hb3___9_
label values related_hb3___10 related_hb3___10_
label values related_hb3___11 related_hb3___11_
label values related_hb3___12 related_hb3___12_
label values related_hb3___13 related_hb3___13_
label values related_hb3___14 related_hb3___14_
label values related_hb3___15 related_hb3___15_
label values related_hb3___16 related_hb3___16_
label values related_hb3___17 related_hb3___17_
label values related_hb3___18 related_hb3___18_
label values related_hb3___19 related_hb3___19_
label values related_hb3___20 related_hb3___20_
label values related_hb3___21 related_hb3___21_
label values related_hb3___22 related_hb3___22_
label values related_hb3___23 related_hb3___23_
label values howclose_hb3 howclose_hb3_
label values seetalk_hb3 seetalk_hb3_
label values knowabout_hb3 knowabout_hb3_
label values trustdoctors_hb3 trustdoctors_hb3_
label values helped_hb3___1 helped_hb3___1_
label values helped_hb3___2 helped_hb3___2_
label values helped_hb3___3 helped_hb3___3_
label values helped_hb3___4 helped_hb3___4_
label values helped_hb3___5 helped_hb3___5_
label values difficult_hb3 difficult_hb3_
label values strong_hb3 strong_hb3_
label values gender_hb4 gender_hb4_
label values related_hb4___1 related_hb4___1_
label values related_hb4___2 related_hb4___2_
label values related_hb4___3 related_hb4___3_
label values related_hb4___4 related_hb4___4_
label values related_hb4___5 related_hb4___5_
label values related_hb4___6 related_hb4___6_
label values related_hb4___7 related_hb4___7_
label values related_hb4___8 related_hb4___8_
label values related_hb4___9 related_hb4___9_
label values related_hb4___10 related_hb4___10_
label values related_hb4___11 related_hb4___11_
label values related_hb4___12 related_hb4___12_
label values related_hb4___13 related_hb4___13_
label values related_hb4___14 related_hb4___14_
label values related_hb4___15 related_hb4___15_
label values related_hb4___16 related_hb4___16_
label values related_hb4___17 related_hb4___17_
label values related_hb4___18 related_hb4___18_
label values related_hb4___19 related_hb4___19_
label values related_hb4___20 related_hb4___20_
label values related_hb4___21 related_hb4___21_
label values related_hb4___22 related_hb4___22_
label values related_hb4___23 related_hb4___23_
label values howclose_hb4 howclose_hb4_
label values seetalk_hb4 seetalk_hb4_
label values knowabout_hb4 knowabout_hb4_
label values trustdoctors_hb4 trustdoctors_hb4_
label values helped_hb4___1 helped_hb4___1_
label values helped_hb4___2 helped_hb4___2_
label values helped_hb4___3 helped_hb4___3_
label values helped_hb4___4 helped_hb4___4_
label values helped_hb4___5 helped_hb4___5_
label values difficult_hb4 difficult_hb4_
label values strong_hb4 strong_hb4_
label values gender_hc1 gender_hc1_
label values related_hc1___1 related_hc1___1_
label values related_hc1___2 related_hc1___2_
label values related_hc1___3 related_hc1___3_
label values related_hc1___4 related_hc1___4_
label values related_hc1___5 related_hc1___5_
label values related_hc1___6 related_hc1___6_
label values related_hc1___7 related_hc1___7_
label values related_hc1___8 related_hc1___8_
label values related_hc1___9 related_hc1___9_
label values related_hc1___10 related_hc1___10_
label values related_hc1___11 related_hc1___11_
label values related_hc1___12 related_hc1___12_
label values related_hc1___13 related_hc1___13_
label values related_hc1___14 related_hc1___14_
label values related_hc1___15 related_hc1___15_
label values related_hc1___16 related_hc1___16_
label values related_hc1___17 related_hc1___17_
label values related_hc1___18 related_hc1___18_
label values related_hc1___19 related_hc1___19_
label values related_hc1___20 related_hc1___20_
label values related_hc1___21 related_hc1___21_
label values related_hc1___22 related_hc1___22_
label values related_hc1___23 related_hc1___23_
label values howclose_hc1 howclose_hc1_
label values seetalk_hc1 seetalk_hc1_
label values knowabout_hc1 knowabout_hc1_
label values trustdoctors_hc1 trustdoctors_hc1_
label values helped_hc1___1 helped_hc1___1_
label values helped_hc1___2 helped_hc1___2_
label values helped_hc1___3 helped_hc1___3_
label values helped_hc1___4 helped_hc1___4_
label values helped_hc1___5 helped_hc1___5_
label values difficult_hc1 difficult_hc1_
label values strong_hc1 strong_hc1_
label values gender_hc2 gender_hc2_
label values related_hc2___1 related_hc2___1_
label values related_hc2___2 related_hc2___2_
label values related_hc2___3 related_hc2___3_
label values related_hc2___4 related_hc2___4_
label values related_hc2___5 related_hc2___5_
label values related_hc2___6 related_hc2___6_
label values related_hc2___7 related_hc2___7_
label values related_hc2___8 related_hc2___8_
label values related_hc2___9 related_hc2___9_
label values related_hc2___10 related_hc2___10_
label values related_hc2___11 related_hc2___11_
label values related_hc2___12 related_hc2___12_
label values related_hc2___13 related_hc2___13_
label values related_hc2___14 related_hc2___14_
label values related_hc2___15 related_hc2___15_
label values related_hc2___16 related_hc2___16_
label values related_hc2___17 related_hc2___17_
label values related_hc2___18 related_hc2___18_
label values related_hc2___19 related_hc2___19_
label values related_hc2___20 related_hc2___20_
label values related_hc2___21 related_hc2___21_
label values related_hc2___22 related_hc2___22_
label values related_hc2___23 related_hc2___23_
label values howclose_hc2 howclose_hc2_
label values seetalk_hc2 seetalk_hc2_
label values knowabout_hc2 knowabout_hc2_
label values trustdoctors_hc2 trustdoctors_hc2_
label values helped_hc2___1 helped_hc2___1_
label values helped_hc2___2 helped_hc2___2_
label values helped_hc2___3 helped_hc2___3_
label values helped_hc2___4 helped_hc2___4_
label values helped_hc2___5 helped_hc2___5_
label values difficult_hc2 difficult_hc2_
label values strong_hc2 strong_hc2_
label values gender_hc3 gender_hc3_
label values related_hc3___1 related_hc3___1_
label values related_hc3___2 related_hc3___2_
label values related_hc3___3 related_hc3___3_
label values related_hc3___4 related_hc3___4_
label values related_hc3___5 related_hc3___5_
label values related_hc3___6 related_hc3___6_
label values related_hc3___7 related_hc3___7_
label values related_hc3___8 related_hc3___8_
label values related_hc3___9 related_hc3___9_
label values related_hc3___10 related_hc3___10_
label values related_hc3___11 related_hc3___11_
label values related_hc3___12 related_hc3___12_
label values related_hc3___13 related_hc3___13_
label values related_hc3___14 related_hc3___14_
label values related_hc3___15 related_hc3___15_
label values related_hc3___16 related_hc3___16_
label values related_hc3___17 related_hc3___17_
label values related_hc3___18 related_hc3___18_
label values related_hc3___19 related_hc3___19_
label values related_hc3___20 related_hc3___20_
label values related_hc3___21 related_hc3___21_
label values related_hc3___22 related_hc3___22_
label values related_hc3___23 related_hc3___23_
label values howclose_hc3 howclose_hc3_
label values seetalk_hc3 seetalk_hc3_
label values knowabout_hc3 knowabout_hc3_
label values trustdoctors_hc3 trustdoctors_hc3_
label values helped_hc3___1 helped_hc3___1_
label values helped_hc3___2 helped_hc3___2_
label values helped_hc3___3 helped_hc3___3_
label values helped_hc3___4 helped_hc3___4_
label values helped_hc3___5 helped_hc3___5_
label values difficult_hc3 difficult_hc3_
label values strong_hc3 strong_hc3_
label values gender_hc4 gender_hc4_
label values related_hc4___1 related_hc4___1_
label values related_hc4___2 related_hc4___2_
label values related_hc4___3 related_hc4___3_
label values related_hc4___4 related_hc4___4_
label values related_hc4___5 related_hc4___5_
label values related_hc4___6 related_hc4___6_
label values related_hc4___7 related_hc4___7_
label values related_hc4___8 related_hc4___8_
label values related_hc4___9 related_hc4___9_
label values related_hc4___10 related_hc4___10_
label values related_hc4___11 related_hc4___11_
label values related_hc4___12 related_hc4___12_
label values related_hc4___13 related_hc4___13_
label values related_hc4___14 related_hc4___14_
label values related_hc4___15 related_hc4___15_
label values related_hc4___16 related_hc4___16_
label values related_hc4___17 related_hc4___17_
label values related_hc4___18 related_hc4___18_
label values related_hc4___19 related_hc4___19_
label values related_hc4___20 related_hc4___20_
label values related_hc4___21 related_hc4___21_
label values related_hc4___22 related_hc4___22_
label values related_hc4___23 related_hc4___23_
label values howclose_hc4 howclose_hc4_
label values seetalk_hc4 seetalk_hc4_
label values knowabout_hc4 knowabout_hc4_
label values trustdoctors_hc4 trustdoctors_hc4_
label values helped_hc4___1 helped_hc4___1_
label values helped_hc4___2 helped_hc4___2_
label values helped_hc4___3 helped_hc4___3_
label values helped_hc4___4 helped_hc4___4_
label values helped_hc4___5 helped_hc4___5_
label values difficult_hc4 difficult_hc4_
label values strong_hc4 strong_hc4_
label values matrix_ia1_ia2 matrix_ia1_ia2_
label values matrix_ia1_ia3 matrix_ia1_ia3_
label values matrix_ia1_ia4 matrix_ia1_ia4_
label values matrix_ia1_ia5 matrix_ia1_ia5_
label values matrix_ia1_ia6 matrix_ia1_ia6_
label values matrix_ia1_ia7 matrix_ia1_ia7_
label values matrix_ia1_ib1 matrix_ia1_ib1_
label values matrix_ia1_ib2 matrix_ia1_ib2_
label values matrix_ia1_ib3 matrix_ia1_ib3_
label values matrix_ia1_ib4 matrix_ia1_ib4_
label values matrix_ia1_ic1 matrix_ia1_ic1_
label values matrix_ia1_ic2 matrix_ia1_ic2_
label values matrix_ia1_ic3 matrix_ia1_ic3_
label values matrix_ia1_ic4 matrix_ia1_ic4_
label values matrix_ia1_ha1 matrix_ia1_ha1_
label values matrix_ia1_ha2 matrix_ia1_ha2_
label values matrix_ia1_ha3 matrix_ia1_ha3_
label values matrix_ia1_ha4 matrix_ia1_ha4_
label values matrix_ia1_ha5 matrix_ia1_ha5_
label values matrix_ia1_ha6 matrix_ia1_ha6_
label values matrix_ia1_ha7 matrix_ia1_ha7_
label values matrix_ia1_hb1 matrix_ia1_hb1_
label values matrix_ia1_hb2 matrix_ia1_hb2_
label values matrix_ia1_hb3 matrix_ia1_hb3_
label values matrix_ia1_hb4 matrix_ia1_hb4_
label values matrix_ia1_hc1 matrix_ia1_hc1_
label values matrix_ia1_hc2 matrix_ia1_hc2_
label values matrix_ia1_hc3 matrix_ia1_hc3_
label values matrix_ia1_hc4 matrix_ia1_hc4_
label values matrix_ia2_ia3 matrix_ia2_ia3_
label values matrix_ia2_ia4 matrix_ia2_ia4_
label values matrix_ia2_ia5 matrix_ia2_ia5_
label values matrix_ia2_ia6 matrix_ia2_ia6_
label values matrix_ia2_ia7 matrix_ia2_ia7_
label values matrix_ia2_ib1 matrix_ia2_ib1_
label values matrix_ia2_ib2 matrix_ia2_ib2_
label values matrix_ia2_ib3 matrix_ia2_ib3_
label values matrix_ia2_ib4 matrix_ia2_ib4_
label values matrix_ia2_ic1 matrix_ia2_ic1_
label values matrix_ia2_ic2 matrix_ia2_ic2_
label values matrix_ia2_ic3 matrix_ia2_ic3_
label values matrix_ia2_ic4 matrix_ia2_ic4_
label values matrix_ia2_ha1 matrix_ia2_ha1_
label values matrix_ia2_ha2 matrix_ia2_ha2_
label values matrix_ia2_ha3 matrix_ia2_ha3_
label values matrix_ia2_ha4 matrix_ia2_ha4_
label values matrix_ia2_ha5 matrix_ia2_ha5_
label values matrix_ia2_ha6 matrix_ia2_ha6_
label values matrix_ia2_ha7 matrix_ia2_ha7_
label values matrix_ia2_hb1 matrix_ia2_hb1_
label values matrix_ia2_hb2 matrix_ia2_hb2_
label values matrix_ia2_hb3 matrix_ia2_hb3_
label values matrix_ia2_hb4 matrix_ia2_hb4_
label values matrix_ia2_hc1 matrix_ia2_hc1_
label values matrix_ia2_hc2 matrix_ia2_hc2_
label values matrix_ia2_hc3 matrix_ia2_hc3_
label values matrix_ia2_hc4 matrix_ia2_hc4_
label values matrix_ia3_ia4 matrix_ia3_ia4_
label values matrix_ia3_ia5 matrix_ia3_ia5_
label values matrix_ia3_ia6 matrix_ia3_ia6_
label values matrix_ia3_ia7 matrix_ia3_ia7_
label values matrix_ia3_ib1 matrix_ia3_ib1_
label values matrix_ia3_ib2 matrix_ia3_ib2_
label values matrix_ia3_ib3 matrix_ia3_ib3_
label values matrix_ia3_ib4 matrix_ia3_ib4_
label values matrix_ia3_ic1 matrix_ia3_ic1_
label values matrix_ia3_ic2 matrix_ia3_ic2_
label values matrix_ia3_ic3 matrix_ia3_ic3_
label values matrix_ia3_ic4 matrix_ia3_ic4_
label values matrix_ia3_ha1 matrix_ia3_ha1_
label values matrix_ia3_ha2 matrix_ia3_ha2_
label values matrix_ia3_ha3 matrix_ia3_ha3_
label values matrix_ia3_ha4 matrix_ia3_ha4_
label values matrix_ia3_ha5 matrix_ia3_ha5_
label values matrix_ia3_ha6 matrix_ia3_ha6_
label values matrix_ia3_ha7 matrix_ia3_ha7_
label values matrix_ia3_hb1 matrix_ia3_hb1_
label values matrix_ia3_hb2 matrix_ia3_hb2_
label values matrix_ia3_hb3 matrix_ia3_hb3_
label values matrix_ia3_hb4 matrix_ia3_hb4_
label values matrix_ia3_hc1 matrix_ia3_hc1_
label values matrix_ia3_hc2 matrix_ia3_hc2_
label values matrix_ia3_hc3 matrix_ia3_hc3_
label values matrix_ia3_hc4 matrix_ia3_hc4_
label values matrix_ia4_ia5 matrix_ia4_ia5_
label values matrix_ia4_ia6 matrix_ia4_ia6_
label values matrix_ia4_ia7 matrix_ia4_ia7_
label values matrix_ia4_ib1 matrix_ia4_ib1_
label values matrix_ia4_ib2 matrix_ia4_ib2_
label values matrix_ia4_ib3 matrix_ia4_ib3_
label values matrix_ia4_ib4 matrix_ia4_ib4_
label values matrix_ia4_ic1 matrix_ia4_ic1_
label values matrix_ia4_ic2 matrix_ia4_ic2_
label values matrix_ia4_ic3 matrix_ia4_ic3_
label values matrix_ia4_ic4 matrix_ia4_ic4_
label values matrix_ia4_ha1 matrix_ia4_ha1_
label values matrix_ia4_ha2 matrix_ia4_ha2_
label values matrix_ia4_ha3 matrix_ia4_ha3_
label values matrix_ia4_ha4 matrix_ia4_ha4_
label values matrix_ia4_ha5 matrix_ia4_ha5_
label values matrix_ia4_ha6 matrix_ia4_ha6_
label values matrix_ia4_ha7 matrix_ia4_ha7_
label values matrix_ia4_hb1 matrix_ia4_hb1_
label values matrix_ia4_hb2 matrix_ia4_hb2_
label values matrix_ia4_hb3 matrix_ia4_hb3_
label values matrix_ia4_hb4 matrix_ia4_hb4_
label values matrix_ia4_hc1 matrix_ia4_hc1_
label values matrix_ia4_hc2 matrix_ia4_hc2_
label values matrix_ia4_hc3 matrix_ia4_hc3_
label values matrix_ia4_hc4 matrix_ia4_hc4_
label values matrix_ia5_ia6 matrix_ia5_ia6_
label values matrix_ia5_ia7 matrix_ia5_ia7_
label values matrix_ia5_ib1 matrix_ia5_ib1_
label values matrix_ia5_ib2 matrix_ia5_ib2_
label values matrix_ia5_ib3 matrix_ia5_ib3_
label values matrix_ia5_ib4 matrix_ia5_ib4_
label values matrix_ia5_ic1 matrix_ia5_ic1_
label values matrix_ia5_ic2 matrix_ia5_ic2_
label values matrix_ia5_ic3 matrix_ia5_ic3_
label values matrix_ia5_ic4 matrix_ia5_ic4_
label values matrix_ia5_ha1 matrix_ia5_ha1_
label values matrix_ia5_ha2 matrix_ia5_ha2_
label values matrix_ia5_ha3 matrix_ia5_ha3_
label values matrix_ia5_ha4 matrix_ia5_ha4_
label values matrix_ia5_ha5 matrix_ia5_ha5_
label values matrix_ia5_ha6 matrix_ia5_ha6_
label values matrix_ia5_ha7 matrix_ia5_ha7_
label values matrix_ia5_hb1 matrix_ia5_hb1_
label values matrix_ia5_hb2 matrix_ia5_hb2_
label values matrix_ia5_hb3 matrix_ia5_hb3_
label values matrix_ia5_hb4 matrix_ia5_hb4_
label values matrix_ia5_hc1 matrix_ia5_hc1_
label values matrix_ia5_hc2 matrix_ia5_hc2_
label values matrix_ia5_hc3 matrix_ia5_hc3_
label values matrix_ia5_hc4 matrix_ia5_hc4_
label values matrix_ia6_ia7 matrix_ia6_ia7_
label values matrix_ia6_ib1 matrix_ia6_ib1_
label values matrix_ia6_ib2 matrix_ia6_ib2_
label values matrix_ia6_ib3 matrix_ia6_ib3_
label values matrix_ia6_ib4 matrix_ia6_ib4_
label values matrix_ia6_ic1 matrix_ia6_ic1_
label values matrix_ia6_ic2 matrix_ia6_ic2_
label values matrix_ia6_ic3 matrix_ia6_ic3_
label values matrix_ia6_ic4 matrix_ia6_ic4_
label values matrix_ia6_ha1 matrix_ia6_ha1_
label values matrix_ia6_ha2 matrix_ia6_ha2_
label values matrix_ia6_ha3 matrix_ia6_ha3_
label values matrix_ia6_ha4 matrix_ia6_ha4_
label values matrix_ia6_ha5 matrix_ia6_ha5_
label values matrix_ia6_ha6 matrix_ia6_ha6_
label values matrix_ia6_ha7 matrix_ia6_ha7_
label values matrix_ia6_hb1 matrix_ia6_hb1_
label values matrix_ia6_hb2 matrix_ia6_hb2_
label values matrix_ia6_hb3 matrix_ia6_hb3_
label values matrix_ia6_hb4 matrix_ia6_hb4_
label values matrix_ia6_hc1 matrix_ia6_hc1_
label values matrix_ia6_hc2 matrix_ia6_hc2_
label values matrix_ia6_hc3 matrix_ia6_hc3_
label values matrix_ia6_hc4 matrix_ia6_hc4_
label values matrix_ia7_ib1 matrix_ia7_ib1_
label values matrix_ia7_ib2 matrix_ia7_ib2_
label values matrix_ia7_ib3 matrix_ia7_ib3_
label values matrix_ia7_ib4 matrix_ia7_ib4_
label values matrix_ia7_ic1 matrix_ia7_ic1_
label values matrix_ia7_ic2 matrix_ia7_ic2_
label values matrix_ia7_ic3 matrix_ia7_ic3_
label values matrix_ia7_ic4 matrix_ia7_ic4_
label values matrix_ia7_ha1 matrix_ia7_ha1_
label values matrix_ia7_ha2 matrix_ia7_ha2_
label values matrix_ia7_ha3 matrix_ia7_ha3_
label values matrix_ia7_ha4 matrix_ia7_ha4_
label values matrix_ia7_ha5 matrix_ia7_ha5_
label values matrix_ia7_ha6 matrix_ia7_ha6_
label values matrix_ia7_ha7 matrix_ia7_ha7_
label values matrix_ia7_hb1 matrix_ia7_hb1_
label values matrix_ia7_hb2 matrix_ia7_hb2_
label values matrix_ia7_hb3 matrix_ia7_hb3_
label values matrix_ia7_hb4 matrix_ia7_hb4_
label values matrix_ia7_hc1 matrix_ia7_hc1_
label values matrix_ia7_hc2 matrix_ia7_hc2_
label values matrix_ia7_hc3 matrix_ia7_hc3_
label values matrix_ia7_hc4 matrix_ia7_hc4_
label values matrix_ib1_ib2 matrix_ib1_ib2_
label values matrix_ib1_ib3 matrix_ib1_ib3_
label values matrix_ib1_ib4 matrix_ib1_ib4_
label values matrix_ib1_ic1 matrix_ib1_ic1_
label values matrix_ib1_ic2 matrix_ib1_ic2_
label values matrix_ib1_ic3 matrix_ib1_ic3_
label values matrix_ib1_ic4 matrix_ib1_ic4_
label values matrix_ib1_ha1 matrix_ib1_ha1_
label values matrix_ib1_ha2 matrix_ib1_ha2_
label values matrix_ib1_ha3 matrix_ib1_ha3_
label values matrix_ib1_ha4 matrix_ib1_ha4_
label values matrix_ib1_ha5 matrix_ib1_ha5_
label values matrix_ib1_ha6 matrix_ib1_ha6_
label values matrix_ib1_ha7 matrix_ib1_ha7_
label values matrix_ib1_hb1 matrix_ib1_hb1_
label values matrix_ib1_hb2 matrix_ib1_hb2_
label values matrix_ib1_hb3 matrix_ib1_hb3_
label values matrix_ib1_hb4 matrix_ib1_hb4_
label values matrix_ib1_hc1 matrix_ib1_hc1_
label values matrix_ib1_hc2 matrix_ib1_hc2_
label values matrix_ib1_hc3 matrix_ib1_hc3_
label values matrix_ib1_hc4 matrix_ib1_hc4_
label values matrix_ib2_ib3 matrix_ib2_ib3_
label values matrix_ib2_ib4 matrix_ib2_ib4_
label values matrix_ib2_ic1 matrix_ib2_ic1_
label values matrix_ib2_ic2 matrix_ib2_ic2_
label values matrix_ib2_ic3 matrix_ib2_ic3_
label values matrix_ib2_ic4 matrix_ib2_ic4_
label values matrix_ib2_ha1 matrix_ib2_ha1_
label values matrix_ib2_ha2 matrix_ib2_ha2_
label values matrix_ib2_ha3 matrix_ib2_ha3_
label values matrix_ib2_ha4 matrix_ib2_ha4_
label values matrix_ib2_ha5 matrix_ib2_ha5_
label values matrix_ib2_ha6 matrix_ib2_ha6_
label values matrix_ib2_ha7 matrix_ib2_ha7_
label values matrix_ib2_hb1 matrix_ib2_hb1_
label values matrix_ib2_hb2 matrix_ib2_hb2_
label values matrix_ib2_hb3 matrix_ib2_hb3_
label values matrix_ib2_hb4 matrix_ib2_hb4_
label values matrix_ib2_hc1 matrix_ib2_hc1_
label values matrix_ib2_hc2 matrix_ib2_hc2_
label values matrix_ib2_hc3 matrix_ib2_hc3_
label values matrix_ib2_hc4 matrix_ib2_hc4_
label values matrix_ib3_ib4 matrix_ib3_ib4_
label values matrix_ib3_ic1 matrix_ib3_ic1_
label values matrix_ib3_ic2 matrix_ib3_ic2_
label values matrix_ib3_ic3 matrix_ib3_ic3_
label values matrix_ib3_ic4 matrix_ib3_ic4_
label values matrix_ib3_ha1 matrix_ib3_ha1_
label values matrix_ib3_ha2 matrix_ib3_ha2_
label values matrix_ib3_ha3 matrix_ib3_ha3_
label values matrix_ib3_ha4 matrix_ib3_ha4_
label values matrix_ib3_ha5 matrix_ib3_ha5_
label values matrix_ib3_ha6 matrix_ib3_ha6_
label values matrix_ib3_ha7 matrix_ib3_ha7_
label values matrix_ib3_hb1 matrix_ib3_hb1_
label values matrix_ib3_hb2 matrix_ib3_hb2_
label values matrix_ib3_hb3 matrix_ib3_hb3_
label values matrix_ib3_hb4 matrix_ib3_hb4_
label values matrix_ib3_hc1 matrix_ib3_hc1_
label values matrix_ib3_hc2 matrix_ib3_hc2_
label values matrix_ib3_hc3 matrix_ib3_hc3_
label values matrix_ib3_hc4 matrix_ib3_hc4_
label values matrix_ib4_ic1 matrix_ib4_ic1_
label values matrix_ib4_ic2 matrix_ib4_ic2_
label values matrix_ib4_ic3 matrix_ib4_ic3_
label values matrix_ib4_ic4 matrix_ib4_ic4_
label values matrix_ib4_ha1 matrix_ib4_ha1_
label values matrix_ib4_ha2 matrix_ib4_ha2_
label values matrix_ib4_ha3 matrix_ib4_ha3_
label values matrix_ib4_ha4 matrix_ib4_ha4_
label values matrix_ib4_ha5 matrix_ib4_ha5_
label values matrix_ib4_ha6 matrix_ib4_ha6_
label values matrix_ib4_ha7 matrix_ib4_ha7_
label values matrix_ib4_hb1 matrix_ib4_hb1_
label values matrix_ib4_hb2 matrix_ib4_hb2_
label values matrix_ib4_hb3 matrix_ib4_hb3_
label values matrix_ib4_hb4 matrix_ib4_hb4_
label values matrix_ib4_hc1 matrix_ib4_hc1_
label values matrix_ib4_hc2 matrix_ib4_hc2_
label values matrix_ib4_hc3 matrix_ib4_hc3_
label values matrix_ib4_hc4 matrix_ib4_hc4_
label values matrix_ic1_ic2 matrix_ic1_ic2_
label values matrix_ic1_ic3 matrix_ic1_ic3_
label values matrix_ic1_ic4 matrix_ic1_ic4_
label values matrix_ic1_ha1 matrix_ic1_ha1_
label values matrix_ic1_ha2 matrix_ic1_ha2_
label values matrix_ic1_ha3 matrix_ic1_ha3_
label values matrix_ic1_ha4 matrix_ic1_ha4_
label values matrix_ic1_ha5 matrix_ic1_ha5_
label values matrix_ic1_ha6 matrix_ic1_ha6_
label values matrix_ic1_ha7 matrix_ic1_ha7_
label values matrix_ic1_hb1 matrix_ic1_hb1_
label values matrix_ic1_hb2 matrix_ic1_hb2_
label values matrix_ic1_hb3 matrix_ic1_hb3_
label values matrix_ic1_hb4 matrix_ic1_hb4_
label values matrix_ic1_hc1 matrix_ic1_hc1_
label values matrix_ic1_hc2 matrix_ic1_hc2_
label values matrix_ic1_hc3 matrix_ic1_hc3_
label values matrix_ic1_hc4 matrix_ic1_hc4_
label values matrix_ic2_ic3 matrix_ic2_ic3_
label values matrix_ic2_ic4 matrix_ic2_ic4_
label values matrix_ic2_ha1 matrix_ic2_ha1_
label values matrix_ic2_ha2 matrix_ic2_ha2_
label values matrix_ic2_ha3 matrix_ic2_ha3_
label values matrix_ic2_ha4 matrix_ic2_ha4_
label values matrix_ic2_ha5 matrix_ic2_ha5_
label values matrix_ic2_ha6 matrix_ic2_ha6_
label values matrix_ic2_ha7 matrix_ic2_ha7_
label values matrix_ic2_hb1 matrix_ic2_hb1_
label values matrix_ic2_hb2 matrix_ic2_hb2_
label values matrix_ic2_hb3 matrix_ic2_hb3_
label values matrix_ic2_hb4 matrix_ic2_hb4_
label values matrix_ic2_hc1 matrix_ic2_hc1_
label values matrix_ic2_hc2 matrix_ic2_hc2_
label values matrix_ic2_hc3 matrix_ic2_hc3_
label values matrix_ic2_hc4 matrix_ic2_hc4_
label values matrix_ic3_ic4 matrix_ic3_ic4_
label values matrix_ic3_ha1 matrix_ic3_ha1_
label values matrix_ic3_ha2 matrix_ic3_ha2_
label values matrix_ic3_ha3 matrix_ic3_ha3_
label values matrix_ic3_ha4 matrix_ic3_ha4_
label values matrix_ic3_ha5 matrix_ic3_ha5_
label values matrix_ic3_ha6 matrix_ic3_ha6_
label values matrix_ic3_ha7 matrix_ic3_ha7_
label values matrix_ic3_hb1 matrix_ic3_hb1_
label values matrix_ic3_hb2 matrix_ic3_hb2_
label values matrix_ic3_hb3 matrix_ic3_hb3_
label values matrix_ic3_hb4 matrix_ic3_hb4_
label values matrix_ic3_hc1 matrix_ic3_hc1_
label values matrix_ic3_hc2 matrix_ic3_hc2_
label values matrix_ic3_hc3 matrix_ic3_hc3_
label values matrix_ic3_hc4 matrix_ic3_hc4_
label values matrix_ic4_ha1 matrix_ic4_ha1_
label values matrix_ic4_ha2 matrix_ic4_ha2_
label values matrix_ic4_ha3 matrix_ic4_ha3_
label values matrix_ic4_ha4 matrix_ic4_ha4_
label values matrix_ic4_ha5 matrix_ic4_ha5_
label values matrix_ic4_ha6 matrix_ic4_ha6_
label values matrix_ic4_ha7 matrix_ic4_ha7_
label values matrix_ic4_hb1 matrix_ic4_hb1_
label values matrix_ic4_hb2 matrix_ic4_hb2_
label values matrix_ic4_hb3 matrix_ic4_hb3_
label values matrix_ic4_hb4 matrix_ic4_hb4_
label values matrix_ic4_hc1 matrix_ic4_hc1_
label values matrix_ic4_hc2 matrix_ic4_hc2_
label values matrix_ic4_hc3 matrix_ic4_hc3_
label values matrix_ic4_hc4 matrix_ic4_hc4_
label values matrix_ha1_ha2 matrix_ha1_ha2_
label values matrix_ha1_ha3 matrix_ha1_ha3_
label values matrix_ha1_ha4 matrix_ha1_ha4_
label values matrix_ha1_ha5 matrix_ha1_ha5_
label values matrix_ha1_ha6 matrix_ha1_ha6_
label values matrix_ha1_ha7 matrix_ha1_ha7_
label values matrix_ha1_hb1 matrix_ha1_hb1_
label values matrix_ha1_hb2 matrix_ha1_hb2_
label values matrix_ha1_hb3 matrix_ha1_hb3_
label values matrix_ha1_hb4 matrix_ha1_hb4_
label values matrix_ha1_hc1 matrix_ha1_hc1_
label values matrix_ha1_hc2 matrix_ha1_hc2_
label values matrix_ha1_hc3 matrix_ha1_hc3_
label values matrix_ha1_hc4 matrix_ha1_hc4_
label values matrix_ha2_ha3 matrix_ha2_ha3_
label values matrix_ha2_ha4 matrix_ha2_ha4_
label values matrix_ha2_ha5 matrix_ha2_ha5_
label values matrix_ha2_ha6 matrix_ha2_ha6_
label values matrix_ha2_ha7 matrix_ha2_ha7_
label values matrix_ha2_hb1 matrix_ha2_hb1_
label values matrix_ha2_hb2 matrix_ha2_hb2_
label values matrix_ha2_hb3 matrix_ha2_hb3_
label values matrix_ha2_hb4 matrix_ha2_hb4_
label values matrix_ha2_hc1 matrix_ha2_hc1_
label values matrix_ha2_hc2 matrix_ha2_hc2_
label values matrix_ha2_hc3 matrix_ha2_hc3_
label values matrix_ha2_hc4 matrix_ha2_hc4_
label values matrix_ha3_ha4 matrix_ha3_ha4_
label values matrix_ha3_ha5 matrix_ha3_ha5_
label values matrix_ha3_ha6 matrix_ha3_ha6_
label values matrix_ha3_ha7 matrix_ha3_ha7_
label values matrix_ha3_hb1 matrix_ha3_hb1_
label values matrix_ha3_hb2 matrix_ha3_hb2_
label values matrix_ha3_hb3 matrix_ha3_hb3_
label values matrix_ha3_hb4 matrix_ha3_hb4_
label values matrix_ha3_hc1 matrix_ha3_hc1_
label values matrix_ha3_hc2 matrix_ha3_hc2_
label values matrix_ha3_hc3 matrix_ha3_hc3_
label values matrix_ha3_hc4 matrix_ha3_hc4_
label values matrix_ha4_ha5 matrix_ha4_ha5_
label values matrix_ha4_ha6 matrix_ha4_ha6_
label values matrix_ha4_ha7 matrix_ha4_ha7_
label values matrix_ha4_hb1 matrix_ha4_hb1_
label values matrix_ha4_hb2 matrix_ha4_hb2_
label values matrix_ha4_hb3 matrix_ha4_hb3_
label values matrix_ha4_hb4 matrix_ha4_hb4_
label values matrix_ha4_hc1 matrix_ha4_hc1_
label values matrix_ha4_hc2 matrix_ha4_hc2_
label values matrix_ha4_hc3 matrix_ha4_hc3_
label values matrix_ha4_hc4 matrix_ha4_hc4_
label values matrix_ha5_ha6 matrix_ha5_ha6_
label values matrix_ha5_ha7 matrix_ha5_ha7_
label values matrix_ha5_hb1 matrix_ha5_hb1_
label values matrix_ha5_hb2 matrix_ha5_hb2_
label values matrix_ha5_hb3 matrix_ha5_hb3_
label values matrix_ha5_hb4 matrix_ha5_hb4_
label values matrix_ha5_hc1 matrix_ha5_hc1_
label values matrix_ha5_hc2 matrix_ha5_hc2_
label values matrix_ha5_hc3 matrix_ha5_hc3_
label values matrix_ha5_hc4 matrix_ha5_hc4_
label values matrix_ha6_ha7 matrix_ha6_ha7_
label values matrix_ha6_hb1 matrix_ha6_hb1_
label values matrix_ha6_hb2 matrix_ha6_hb2_
label values matrix_ha6_hb3 matrix_ha6_hb3_
label values matrix_ha6_hb4 matrix_ha6_hb4_
label values matrix_ha6_hc1 matrix_ha6_hc1_
label values matrix_ha6_hc2 matrix_ha6_hc2_
label values matrix_ha6_hc3 matrix_ha6_hc3_
label values matrix_ha6_hc4 matrix_ha6_hc4_
label values matrix_ha7_hb1 matrix_ha7_hb1_
label values matrix_ha7_hb2 matrix_ha7_hb2_
label values matrix_ha7_hb3 matrix_ha7_hb3_
label values matrix_ha7_hb4 matrix_ha7_hb4_
label values matrix_ha7_hc1 matrix_ha7_hc1_
label values matrix_ha7_hc2 matrix_ha7_hc2_
label values matrix_ha7_hc3 matrix_ha7_hc3_
label values matrix_ha7_hc4 matrix_ha7_hc4_
label values matrix_hb1_hb2 matrix_hb1_hb2_
label values matrix_hb1_hb3 matrix_hb1_hb3_
label values matrix_hb1_hb4 matrix_hb1_hb4_
label values matrix_hb1_hc1 matrix_hb1_hc1_
label values matrix_hb1_hc2 matrix_hb1_hc2_
label values matrix_hb1_hc3 matrix_hb1_hc3_
label values matrix_hb1_hc4 matrix_hb1_hc4_
label values matrix_hb2_hb3 matrix_hb2_hb3_
label values matrix_hb2_hb4 matrix_hb2_hb4_
label values matrix_hb2_hc1 matrix_hb2_hc1_
label values matrix_hb2_hc2 matrix_hb2_hc2_
label values matrix_hb2_hc3 matrix_hb2_hc3_
label values matrix_hb2_hc4 matrix_hb2_hc4_
label values matrix_hb3_hb4 matrix_hb3_hb4_
label values matrix_hb3_hc1 matrix_hb3_hc1_
label values matrix_hb3_hc2 matrix_hb3_hc2_
label values matrix_hb3_hc3 matrix_hb3_hc3_
label values matrix_hb3_hc4 matrix_hb3_hc4_
label values matrix_hb4_hc1 matrix_hb4_hc1_
label values matrix_hb4_hc2 matrix_hb4_hc2_
label values matrix_hb4_hc3 matrix_hb4_hc3_
label values matrix_hb4_hc4 matrix_hb4_hc4_
label values matrix_hc1_hc2 matrix_hc1_hc2_
label values matrix_hc1_hc3 matrix_hc1_hc3_
label values matrix_hc1_hc4 matrix_hc1_hc4_
label values matrix_hc2_hc3 matrix_hc2_hc3_
label values matrix_hc2_hc4 matrix_hc2_hc4_
label values matrix_hc3_hc4 matrix_hc3_hc4_
label values health health_
label values energy energy_
label values spirits spirits_
label values living_situation living_situation_
label values memory memory_
label values family family_
label values marriage marriage_
label values friends friends_
label values self self_
label values do_chores do_chores_
label values do_fun do_fun_
label values money money_
label values whole whole_
label values partner_response_complete partner_response_complete_



tostring date_snad, replace
gen _date_ = date(date_snad,"YMD")
drop date_snad
rename _date_ date_snad
format date_snad %dM_d,_CY

tostring date_iadc, replace
gen _date_ = date(date_iadc,"YMD")
drop date_iadc
rename _date_ date_iadc
format date_iadc %dM_d,_CY

label variable record_id "Record ID"
label variable redcap_survey_identifier "Survey Identifier"
label variable set_study_id_timestamp "Survey Timestamp"
label variable studyid "Study ID"
label variable date_snad "SNAD DATE. Record the date of this SNAD interview (if interview spanned multiple days, record the date that name generators were completed)."
label variable date_iadc "IADC DATE. Record the date of the IADC interview that corresponds to this SNAD interview (if visit spanned multiple days, record the date that testing was completed). "
label variable partnerid "(Study coordinator) Record first name and last initial of study partner."
label variable set_study_id_complete "Complete?"
label variable partner_response_timestamp "Survey Timestamp"
label variable survey_method "First, please tell me which of the following best describes how you are completing this questionnaire today?"
label variable name_ia1 "Name 1"
label variable name_ia2 "Name 2"
label variable name_ia3 "Name 3"
label variable name_ia4 "Name 4"
label variable name_ia5 "Name 5"
label variable name_ia6 "Name 6"
label variable name_ia7 "Name 7"
label variable name_ib1 "Name 1"
label variable name_ib2 "Name 2"
label variable name_ib3 "Name 3"
label variable name_ib4 "Name 4"
label variable name_ic1 "Name 1"
label variable name_ic2 "Name 2"
label variable name_ic3 "Name 3"
label variable name_ic4 "Name 4"
label variable name_ha1 "Name 1"
label variable name_ha2 "Name 2"
label variable name_ha3 "Name 3"
label variable name_ha4 "Name 4"
label variable name_ha5 "Name 5"
label variable name_ha6 "Name 6"
label variable name_ha7 "Name 7"
label variable name_hb1 "Name 1"
label variable name_hb2 "Name 2"
label variable name_hb3 "Name 3"
label variable name_hb4 "Name 4"
label variable name_hc1 "Name 1"
label variable name_hc2 "Name 2"
label variable name_hc3 "Name 3"
label variable name_hc4 "Name 4"
label variable gender_ia1 "What is [name_ia1]s gender?"
label variable related_ia1___1 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Spouse/partner)"
label variable related_ia1___2 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Parent)"
label variable related_ia1___3 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia1___4 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Child)"
label variable related_ia1___5 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Grandparent)"
label variable related_ia1___6 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Grandchild)"
label variable related_ia1___7 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Aunt or uncle)"
label variable related_ia1___8 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=In-law)"
label variable related_ia1___9 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Other relative)"
label variable related_ia1___10 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Coworker or colleague)"
label variable related_ia1___11 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Neighbor)"
label variable related_ia1___12 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Friend)"
label variable related_ia1___13 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia1___14 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Employee)"
label variable related_ia1___15 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia1___16 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Lawyer)"
label variable related_ia1___17 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Doctor)"
label variable related_ia1___18 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Other medical professional)"
label variable related_ia1___19 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia1___20 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia1___21 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Fellow church member)"
label variable related_ia1___22 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia1___23 "How is [name_ia1] connected to the participant? In other words, what relation is [name_ia1] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia1 "How close is the participant to [name_ia1]?"
label variable seetalk_ia1 "How often does the participant see or talk to [name_ia1]?"
label variable knowabout_ia1 "How much does [name_ia1] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia1 "Does [name_ia1] trust doctors to take care of peoples problems?"
label variable helped_ia1___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia1___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia1___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia1___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia1___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia1 "Does [name_ia1] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia1 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia1]?"
label variable gender_ia2 "What is [name_ia2]s gender?"
label variable related_ia2___1 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Spouse/partner)"
label variable related_ia2___2 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Parent)"
label variable related_ia2___3 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia2___4 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Child)"
label variable related_ia2___5 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Grandparent)"
label variable related_ia2___6 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Grandchild)"
label variable related_ia2___7 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Aunt or uncle)"
label variable related_ia2___8 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=In-law)"
label variable related_ia2___9 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Other relative)"
label variable related_ia2___10 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Coworker or colleague)"
label variable related_ia2___11 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Neighbor)"
label variable related_ia2___12 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Friend)"
label variable related_ia2___13 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia2___14 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Employee)"
label variable related_ia2___15 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia2___16 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Lawyer)"
label variable related_ia2___17 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Doctor)"
label variable related_ia2___18 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Other medical professional)"
label variable related_ia2___19 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia2___20 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia2___21 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Fellow church member)"
label variable related_ia2___22 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia2___23 "How is [name_ia2] connected to the participant? In other words, what relation is [name_ia2] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia2 "How close is the participant to [name_ia2]?"
label variable seetalk_ia2 "How often does the participant see or talk to [name_ia2]?"
label variable knowabout_ia2 "How much does [name_ia2] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia2 "Does [name_ia2] trust doctors to take care of peoples problems?"
label variable helped_ia2___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia2___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia2___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia2___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia2___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia2 "Does [name_ia2] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia2 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia2]?"
label variable gender_ia3 "What is [name_ia3]s gender?"
label variable related_ia3___1 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Spouse/partner)"
label variable related_ia3___2 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Parent)"
label variable related_ia3___3 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia3___4 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Child)"
label variable related_ia3___5 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Grandparent)"
label variable related_ia3___6 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Grandchild)"
label variable related_ia3___7 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Aunt or uncle)"
label variable related_ia3___8 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=In-law)"
label variable related_ia3___9 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Other relative)"
label variable related_ia3___10 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Coworker or colleague)"
label variable related_ia3___11 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Neighbor)"
label variable related_ia3___12 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Friend)"
label variable related_ia3___13 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia3___14 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Employee)"
label variable related_ia3___15 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia3___16 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Lawyer)"
label variable related_ia3___17 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Doctor)"
label variable related_ia3___18 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Other medical professional)"
label variable related_ia3___19 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia3___20 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia3___21 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Fellow church member)"
label variable related_ia3___22 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia3___23 "How is [name_ia3] connected to the participant? In other words, what relation is [name_ia3] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia3 "How close is the participant to [name_ia3]?"
label variable seetalk_ia3 "How often does the participant see or talk to [name_ia3]?"
label variable knowabout_ia3 "How much does [name_ia3] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia3 "Does [name_ia3] trust doctors to take care of peoples problems?"
label variable helped_ia3___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia3___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia3___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia3___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia3___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia3 "Does [name_ia3] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia3 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia3]?"
label variable gender_ia4 "What is [name_ia4]s gender?"
label variable related_ia4___1 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Spouse/partner)"
label variable related_ia4___2 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Parent)"
label variable related_ia4___3 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia4___4 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Child)"
label variable related_ia4___5 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Grandparent)"
label variable related_ia4___6 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Grandchild)"
label variable related_ia4___7 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Aunt or uncle)"
label variable related_ia4___8 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=In-law)"
label variable related_ia4___9 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Other relative)"
label variable related_ia4___10 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Coworker or colleague)"
label variable related_ia4___11 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Neighbor)"
label variable related_ia4___12 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Friend)"
label variable related_ia4___13 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia4___14 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Employee)"
label variable related_ia4___15 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia4___16 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Lawyer)"
label variable related_ia4___17 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Doctor)"
label variable related_ia4___18 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Other medical professional)"
label variable related_ia4___19 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia4___20 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia4___21 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Fellow church member)"
label variable related_ia4___22 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia4___23 "How is [name_ia4] connected to the participant? In other words, what relation is [name_ia4] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia4 "How close is the participant to [name_ia4]?"
label variable seetalk_ia4 "How often does the participant see or talk to [name_ia4]?"
label variable knowabout_ia4 "How much does [name_ia4] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia4 "Does [name_ia4] trust doctors to take care of peoples problems?"
label variable helped_ia4___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia4___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia4___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia4___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia4___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia4 "Does [name_ia4] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia4 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia4]?"
label variable gender_ia5 "What is [name_ia5]s gender?"
label variable related_ia5___1 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Spouse/partner)"
label variable related_ia5___2 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Parent)"
label variable related_ia5___3 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia5___4 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Child)"
label variable related_ia5___5 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Grandparent)"
label variable related_ia5___6 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Grandchild)"
label variable related_ia5___7 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Aunt or uncle)"
label variable related_ia5___8 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=In-law)"
label variable related_ia5___9 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Other relative)"
label variable related_ia5___10 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Coworker or colleague)"
label variable related_ia5___11 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Neighbor)"
label variable related_ia5___12 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Friend)"
label variable related_ia5___13 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia5___14 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Employee)"
label variable related_ia5___15 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia5___16 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Lawyer)"
label variable related_ia5___17 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Doctor)"
label variable related_ia5___18 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Other medical professional)"
label variable related_ia5___19 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia5___20 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia5___21 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Fellow church member)"
label variable related_ia5___22 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia5___23 "How is [name_ia5] connected to the participant? In other words, what relation is [name_ia5] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia5 "How close is the participant to [name_ia5]?"
label variable seetalk_ia5 "How often does the participant see or talk to [name_ia5]?"
label variable knowabout_ia5 "How much does [name_ia5] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia5 "Does [name_ia5] trust doctors to take care of peoples problems?"
label variable helped_ia5___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia5___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia5___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia5___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia5___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia5 "Does [name_ia5] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia5 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia5]?"
label variable gender_ia6 "What is [name_ia6]s gender?"
label variable related_ia6___1 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Spouse/partner)"
label variable related_ia6___2 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Parent)"
label variable related_ia6___3 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia6___4 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Child)"
label variable related_ia6___5 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Grandparent)"
label variable related_ia6___6 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Grandchild)"
label variable related_ia6___7 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Aunt or uncle)"
label variable related_ia6___8 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=In-law)"
label variable related_ia6___9 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Other relative)"
label variable related_ia6___10 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Coworker or colleague)"
label variable related_ia6___11 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Neighbor)"
label variable related_ia6___12 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Friend)"
label variable related_ia6___13 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia6___14 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Employee)"
label variable related_ia6___15 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia6___16 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Lawyer)"
label variable related_ia6___17 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Doctor)"
label variable related_ia6___18 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Other medical professional)"
label variable related_ia6___19 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia6___20 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia6___21 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Fellow church member)"
label variable related_ia6___22 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia6___23 "How is [name_ia6] connected to the participant? In other words, what relation is [name_ia6] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia6 "How close is the participant to [name_ia6]?"
label variable seetalk_ia6 "How often does the participant see or talk to [name_ia6]?"
label variable knowabout_ia6 "How much does [name_ia6] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia6 "Does [name_ia6] trust doctors to take care of peoples problems?"
label variable helped_ia6___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia6___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia6___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia6___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia6___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia6 "Does [name_ia6] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia6 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia6]?"
label variable gender_ia7 "What is [name_ia7]s gender?"
label variable related_ia7___1 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Spouse/partner)"
label variable related_ia7___2 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Parent)"
label variable related_ia7___3 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ia7___4 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Child)"
label variable related_ia7___5 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Grandparent)"
label variable related_ia7___6 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Grandchild)"
label variable related_ia7___7 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Aunt or uncle)"
label variable related_ia7___8 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=In-law)"
label variable related_ia7___9 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Other relative)"
label variable related_ia7___10 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Coworker or colleague)"
label variable related_ia7___11 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Neighbor)"
label variable related_ia7___12 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Friend)"
label variable related_ia7___13 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Boss, employer, teacher)"
label variable related_ia7___14 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Employee)"
label variable related_ia7___15 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Fellow student (went to school together))"
label variable related_ia7___16 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Lawyer)"
label variable related_ia7___17 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Doctor)"
label variable related_ia7___18 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Other medical professional)"
label variable related_ia7___19 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ia7___20 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ia7___21 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Fellow church member)"
label variable related_ia7___22 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Belongs to same club or social group)"
label variable related_ia7___23 "How is [name_ia7] connected to the participant? In other words, what relation is [name_ia7] to the participant? (choice=Do leisure activities with)"
label variable howclose_ia7 "How close is the participant to [name_ia7]?"
label variable seetalk_ia7 "How often does the participant see or talk to [name_ia7]?"
label variable knowabout_ia7 "How much does [name_ia7] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ia7 "Does [name_ia7] trust doctors to take care of peoples problems?"
label variable helped_ia7___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ia7___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ia7___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ia7___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ia7___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ia7 "Does [name_ia7] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ia7 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ia7]?"
label variable gender_ib1 "What is [name_ib1]s gender?"
label variable related_ib1___1 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Spouse/partner)"
label variable related_ib1___2 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Parent)"
label variable related_ib1___3 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ib1___4 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Child)"
label variable related_ib1___5 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Grandparent)"
label variable related_ib1___6 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Grandchild)"
label variable related_ib1___7 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Aunt or uncle)"
label variable related_ib1___8 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=In-law)"
label variable related_ib1___9 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Other relative)"
label variable related_ib1___10 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Coworker or colleague)"
label variable related_ib1___11 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Neighbor)"
label variable related_ib1___12 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Friend)"
label variable related_ib1___13 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Boss, employer, teacher)"
label variable related_ib1___14 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Employee)"
label variable related_ib1___15 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Fellow student (went to school together))"
label variable related_ib1___16 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Lawyer)"
label variable related_ib1___17 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Doctor)"
label variable related_ib1___18 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Other medical professional)"
label variable related_ib1___19 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ib1___20 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ib1___21 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Fellow church member)"
label variable related_ib1___22 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Belongs to same club or social group)"
label variable related_ib1___23 "How is [name_ib1] connected to the participant? In other words, what relation is [name_ib1] to the participant? (choice=Do leisure activities with)"
label variable howclose_ib1 "How close is the participant to [name_ib1]?"
label variable seetalk_ib1 "How often does the participant see or talk to [name_ib1]?"
label variable knowabout_ib1 "How much does [name_ib1] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ib1 "Does [name_ib1] trust doctors to take care of peoples problems?"
label variable helped_ib1___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ib1___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ib1___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ib1___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ib1___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ib1 "Does [name_ib1] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ib1 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ib1]?"
label variable gender_ib2 "What is [name_ib2]s gender?"
label variable related_ib2___1 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Spouse/partner)"
label variable related_ib2___2 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Parent)"
label variable related_ib2___3 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ib2___4 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Child)"
label variable related_ib2___5 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Grandparent)"
label variable related_ib2___6 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Grandchild)"
label variable related_ib2___7 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Aunt or uncle)"
label variable related_ib2___8 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=In-law)"
label variable related_ib2___9 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Other relative)"
label variable related_ib2___10 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Coworker or colleague)"
label variable related_ib2___11 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Neighbor)"
label variable related_ib2___12 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Friend)"
label variable related_ib2___13 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Boss, employer, teacher)"
label variable related_ib2___14 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Employee)"
label variable related_ib2___15 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Fellow student (went to school together))"
label variable related_ib2___16 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Lawyer)"
label variable related_ib2___17 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Doctor)"
label variable related_ib2___18 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Other medical professional)"
label variable related_ib2___19 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ib2___20 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ib2___21 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Fellow church member)"
label variable related_ib2___22 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Belongs to same club or social group)"
label variable related_ib2___23 "How is [name_ib2] connected to the participant? In other words, what relation is [name_ib2] to the participant? (choice=Do leisure activities with)"
label variable howclose_ib2 "How close is the participant to [name_ib2]?"
label variable seetalk_ib2 "How often does the participant see or talk to [name_ib2]?"
label variable knowabout_ib2 "How much does [name_ib2] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ib2 "Does [name_ib2] trust doctors to take care of peoples problems?"
label variable helped_ib2___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ib2___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ib2___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ib2___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ib2___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ib2 "Does [name_ib2] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ib2 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ib2]?"
label variable gender_ib3 "What is [name_ib3]s gender?"
label variable related_ib3___1 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Spouse/partner)"
label variable related_ib3___2 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Parent)"
label variable related_ib3___3 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ib3___4 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Child)"
label variable related_ib3___5 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Grandparent)"
label variable related_ib3___6 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Grandchild)"
label variable related_ib3___7 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Aunt or uncle)"
label variable related_ib3___8 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=In-law)"
label variable related_ib3___9 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Other relative)"
label variable related_ib3___10 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Coworker or colleague)"
label variable related_ib3___11 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Neighbor)"
label variable related_ib3___12 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Friend)"
label variable related_ib3___13 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Boss, employer, teacher)"
label variable related_ib3___14 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Employee)"
label variable related_ib3___15 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Fellow student (went to school together))"
label variable related_ib3___16 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Lawyer)"
label variable related_ib3___17 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Doctor)"
label variable related_ib3___18 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Other medical professional)"
label variable related_ib3___19 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ib3___20 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ib3___21 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Fellow church member)"
label variable related_ib3___22 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Belongs to same club or social group)"
label variable related_ib3___23 "How is [name_ib3] connected to the participant? In other words, what relation is [name_ib3] to the participant? (choice=Do leisure activities with)"
label variable howclose_ib3 "How close is the participant to [name_ib3]?"
label variable seetalk_ib3 "How often does the participant see or talk to [name_ib3]?"
label variable knowabout_ib3 "How much does [name_ib3] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ib3 "Does [name_ib3] trust doctors to take care of peoples problems?"
label variable helped_ib3___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ib3___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ib3___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ib3___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ib3___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ib3 "Does [name_ib3] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ib3 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ib3]?"
label variable gender_ib4 "What is [name_ib4]s gender?"
label variable related_ib4___1 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Spouse/partner)"
label variable related_ib4___2 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Parent)"
label variable related_ib4___3 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ib4___4 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Child)"
label variable related_ib4___5 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Grandparent)"
label variable related_ib4___6 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Grandchild)"
label variable related_ib4___7 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Aunt or uncle)"
label variable related_ib4___8 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=In-law)"
label variable related_ib4___9 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Other relative)"
label variable related_ib4___10 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Coworker or colleague)"
label variable related_ib4___11 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Neighbor)"
label variable related_ib4___12 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Friend)"
label variable related_ib4___13 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Boss, employer, teacher)"
label variable related_ib4___14 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Employee)"
label variable related_ib4___15 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Fellow student (went to school together))"
label variable related_ib4___16 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Lawyer)"
label variable related_ib4___17 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Doctor)"
label variable related_ib4___18 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Other medical professional)"
label variable related_ib4___19 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ib4___20 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ib4___21 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Fellow church member)"
label variable related_ib4___22 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Belongs to same club or social group)"
label variable related_ib4___23 "How is [name_ib4] connected to the participant? In other words, what relation is [name_ib4] to the participant? (choice=Do leisure activities with)"
label variable howclose_ib4 "How close is the participant to [name_ib4]?"
label variable seetalk_ib4 "How often does the participant see or talk to [name_ib4]?"
label variable knowabout_ib4 "How much does [name_ib4] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ib4 "Does [name_ib4] trust doctors to take care of peoples problems?"
label variable helped_ib4___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ib4___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ib4___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ib4___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ib4___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ib4 "Does [name_ib4] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ib4 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ib4]?"
label variable gender_ic1 "What is [name_ic1]s gender?"
label variable related_ic1___1 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Spouse/partner)"
label variable related_ic1___2 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Parent)"
label variable related_ic1___3 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ic1___4 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Child)"
label variable related_ic1___5 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Grandparent)"
label variable related_ic1___6 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Grandchild)"
label variable related_ic1___7 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Aunt or uncle)"
label variable related_ic1___8 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=In-law)"
label variable related_ic1___9 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Other relative)"
label variable related_ic1___10 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Coworker or colleague)"
label variable related_ic1___11 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Neighbor)"
label variable related_ic1___12 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Friend)"
label variable related_ic1___13 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Boss, employer, teacher)"
label variable related_ic1___14 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Employee)"
label variable related_ic1___15 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Fellow student (went to school together))"
label variable related_ic1___16 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Lawyer)"
label variable related_ic1___17 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Doctor)"
label variable related_ic1___18 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Other medical professional)"
label variable related_ic1___19 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ic1___20 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ic1___21 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Fellow church member)"
label variable related_ic1___22 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Belongs to same club or social group)"
label variable related_ic1___23 "How is [name_ic1] connected to the participant? In other words, what relation is [name_ic1] to the participant? (choice=Do leisure activities with)"
label variable howclose_ic1 "How close is the participant to [name_ic1]?"
label variable seetalk_ic1 "How often does the participant see or talk to [name_ic1]?"
label variable knowabout_ic1 "How much does [name_ic1] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ic1 "Does [name_ic1] trust doctors to take care of peoples problems?"
label variable helped_ic1___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ic1___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ic1___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ic1___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ic1___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ic1 "Does [name_ic1] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ic1 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ic1]?"
label variable gender_ic2 "What is [name_ic2]s gender?"
label variable related_ic2___1 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Spouse/partner)"
label variable related_ic2___2 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Parent)"
label variable related_ic2___3 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ic2___4 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Child)"
label variable related_ic2___5 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Grandparent)"
label variable related_ic2___6 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Grandchild)"
label variable related_ic2___7 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Aunt or uncle)"
label variable related_ic2___8 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=In-law)"
label variable related_ic2___9 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Other relative)"
label variable related_ic2___10 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Coworker or colleague)"
label variable related_ic2___11 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Neighbor)"
label variable related_ic2___12 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Friend)"
label variable related_ic2___13 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Boss, employer, teacher)"
label variable related_ic2___14 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Employee)"
label variable related_ic2___15 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Fellow student (went to school together))"
label variable related_ic2___16 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Lawyer)"
label variable related_ic2___17 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Doctor)"
label variable related_ic2___18 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Other medical professional)"
label variable related_ic2___19 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ic2___20 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ic2___21 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Fellow church member)"
label variable related_ic2___22 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Belongs to same club or social group)"
label variable related_ic2___23 "How is [name_ic2] connected to the participant? In other words, what relation is [name_ic2] to the participant? (choice=Do leisure activities with)"
label variable howclose_ic2 "How close is the participant to [name_ic2]?"
label variable seetalk_ic2 "How often does the participant see or talk to [name_ic2]?"
label variable knowabout_ic2 "How much does [name_ic2] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ic2 "Does [name_ic2] trust doctors to take care of peoples problems?"
label variable helped_ic2___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ic2___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ic2___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ic2___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ic2___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ic2 "Does [name_ic2] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ic2 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ic2]?"
label variable gender_ic3 "What is [name_ic3]s gender?"
label variable related_ic3___1 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Spouse/partner)"
label variable related_ic3___2 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Parent)"
label variable related_ic3___3 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ic3___4 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Child)"
label variable related_ic3___5 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Grandparent)"
label variable related_ic3___6 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Grandchild)"
label variable related_ic3___7 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Aunt or uncle)"
label variable related_ic3___8 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=In-law)"
label variable related_ic3___9 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Other relative)"
label variable related_ic3___10 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Coworker or colleague)"
label variable related_ic3___11 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Neighbor)"
label variable related_ic3___12 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Friend)"
label variable related_ic3___13 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Boss, employer, teacher)"
label variable related_ic3___14 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Employee)"
label variable related_ic3___15 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Fellow student (went to school together))"
label variable related_ic3___16 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Lawyer)"
label variable related_ic3___17 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Doctor)"
label variable related_ic3___18 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Other medical professional)"
label variable related_ic3___19 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ic3___20 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ic3___21 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Fellow church member)"
label variable related_ic3___22 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Belongs to same club or social group)"
label variable related_ic3___23 "How is [name_ic3] connected to the participant? In other words, what relation is [name_ic3] to the participant? (choice=Do leisure activities with)"
label variable howclose_ic3 "How close is the participant to [name_ic3]?"
label variable seetalk_ic3 "How often does the participant see or talk to [name_ic3]?"
label variable knowabout_ic3 "How much does [name_ic3] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ic3 "Does [name_ic3] trust doctors to take care of peoples problems?"
label variable helped_ic3___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ic3___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ic3___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ic3___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ic3___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ic3 "Does [name_ic3] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ic3 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ic3]?"
label variable gender_ic4 "What is [name_ic4]s gender?"
label variable related_ic4___1 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Spouse/partner)"
label variable related_ic4___2 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Parent)"
label variable related_ic4___3 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ic4___4 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Child)"
label variable related_ic4___5 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Grandparent)"
label variable related_ic4___6 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Grandchild)"
label variable related_ic4___7 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Aunt or uncle)"
label variable related_ic4___8 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=In-law)"
label variable related_ic4___9 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Other relative)"
label variable related_ic4___10 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Coworker or colleague)"
label variable related_ic4___11 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Neighbor)"
label variable related_ic4___12 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Friend)"
label variable related_ic4___13 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Boss, employer, teacher)"
label variable related_ic4___14 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Employee)"
label variable related_ic4___15 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Fellow student (went to school together))"
label variable related_ic4___16 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Lawyer)"
label variable related_ic4___17 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Doctor)"
label variable related_ic4___18 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Other medical professional)"
label variable related_ic4___19 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ic4___20 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ic4___21 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Fellow church member)"
label variable related_ic4___22 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Belongs to same club or social group)"
label variable related_ic4___23 "How is [name_ic4] connected to the participant? In other words, what relation is [name_ic4] to the participant? (choice=Do leisure activities with)"
label variable howclose_ic4 "How close is the participant to [name_ic4]?"
label variable seetalk_ic4 "How often does the participant see or talk to [name_ic4]?"
label variable knowabout_ic4 "How much does [name_ic4] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ic4 "Does [name_ic4] trust doctors to take care of peoples problems?"
label variable helped_ic4___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ic4___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ic4___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ic4___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ic4___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ic4 "Does [name_ic4] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ic4 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ic4]?"
label variable gender_ha1 "What is [name_ha1]s gender?"
label variable related_ha1___1 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Spouse/partner)"
label variable related_ha1___2 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Parent)"
label variable related_ha1___3 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha1___4 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Child)"
label variable related_ha1___5 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Grandparent)"
label variable related_ha1___6 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Grandchild)"
label variable related_ha1___7 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Aunt or uncle)"
label variable related_ha1___8 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=In-law)"
label variable related_ha1___9 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Other relative)"
label variable related_ha1___10 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Coworker or colleague)"
label variable related_ha1___11 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Neighbor)"
label variable related_ha1___12 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Friend)"
label variable related_ha1___13 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha1___14 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Employee)"
label variable related_ha1___15 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha1___16 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Lawyer)"
label variable related_ha1___17 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Doctor)"
label variable related_ha1___18 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Other medical professional)"
label variable related_ha1___19 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha1___20 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha1___21 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Fellow church member)"
label variable related_ha1___22 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha1___23 "How is [name_ha1] connected to the participant? In other words, what relation is [name_ha1] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha1 "How close is the participant to [name_ha1]?"
label variable seetalk_ha1 "How often does the participant see or talk to [name_ha1]?"
label variable knowabout_ha1 "How much does [name_ha1] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha1 "Does [name_ha1] trust doctors to take care of peoples problems?"
label variable helped_ha1___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha1___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha1___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha1___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha1___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha1 "Does [name_ha1] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha1 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha1]?"
label variable gender_ha2 "What is [name_ha2]s gender?"
label variable related_ha2___1 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Spouse/partner)"
label variable related_ha2___2 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Parent)"
label variable related_ha2___3 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha2___4 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Child)"
label variable related_ha2___5 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Grandparent)"
label variable related_ha2___6 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Grandchild)"
label variable related_ha2___7 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Aunt or uncle)"
label variable related_ha2___8 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=In-law)"
label variable related_ha2___9 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Other relative)"
label variable related_ha2___10 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Coworker or colleague)"
label variable related_ha2___11 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Neighbor)"
label variable related_ha2___12 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Friend)"
label variable related_ha2___13 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha2___14 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Employee)"
label variable related_ha2___15 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha2___16 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Lawyer)"
label variable related_ha2___17 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Doctor)"
label variable related_ha2___18 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Other medical professional)"
label variable related_ha2___19 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha2___20 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha2___21 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Fellow church member)"
label variable related_ha2___22 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha2___23 "How is [name_ha2] connected to the participant? In other words, what relation is [name_ha2] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha2 "How close is the participant to [name_ha2]?"
label variable seetalk_ha2 "How often does the participant see or talk to [name_ha2]?"
label variable knowabout_ha2 "How much does [name_ha2] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha2 "Does [name_ha2] trust doctors to take care of peoples problems?"
label variable helped_ha2___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha2___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha2___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha2___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha2___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha2 "Does [name_ha2] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha2 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha2]?"
label variable gender_ha3 "What is [name_ha3]s gender?"
label variable related_ha3___1 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Spouse/partner)"
label variable related_ha3___2 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Parent)"
label variable related_ha3___3 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha3___4 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Child)"
label variable related_ha3___5 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Grandparent)"
label variable related_ha3___6 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Grandchild)"
label variable related_ha3___7 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Aunt or uncle)"
label variable related_ha3___8 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=In-law)"
label variable related_ha3___9 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Other relative)"
label variable related_ha3___10 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Coworker or colleague)"
label variable related_ha3___11 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Neighbor)"
label variable related_ha3___12 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Friend)"
label variable related_ha3___13 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha3___14 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Employee)"
label variable related_ha3___15 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha3___16 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Lawyer)"
label variable related_ha3___17 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Doctor)"
label variable related_ha3___18 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Other medical professional)"
label variable related_ha3___19 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha3___20 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha3___21 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Fellow church member)"
label variable related_ha3___22 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha3___23 "How is [name_ha3] connected to the participant? In other words, what relation is [name_ha3] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha3 "How close is the participant to [name_ha3]?"
label variable seetalk_ha3 "How often does the participant see or talk to [name_ha3]?"
label variable knowabout_ha3 "How much does [name_ha3] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha3 "Does [name_ha3] trust doctors to take care of peoples problems?"
label variable helped_ha3___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha3___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha3___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha3___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha3___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha3 "Does [name_ha3] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha3 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha3]?"
label variable gender_ha4 "What is [name_ha4]s gender?"
label variable related_ha4___1 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Spouse/partner)"
label variable related_ha4___2 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Parent)"
label variable related_ha4___3 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha4___4 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Child)"
label variable related_ha4___5 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Grandparent)"
label variable related_ha4___6 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Grandchild)"
label variable related_ha4___7 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Aunt or uncle)"
label variable related_ha4___8 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=In-law)"
label variable related_ha4___9 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Other relative)"
label variable related_ha4___10 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Coworker or colleague)"
label variable related_ha4___11 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Neighbor)"
label variable related_ha4___12 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Friend)"
label variable related_ha4___13 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha4___14 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Employee)"
label variable related_ha4___15 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha4___16 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Lawyer)"
label variable related_ha4___17 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Doctor)"
label variable related_ha4___18 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Other medical professional)"
label variable related_ha4___19 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha4___20 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha4___21 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Fellow church member)"
label variable related_ha4___22 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha4___23 "How is [name_ha4] connected to the participant? In other words, what relation is [name_ha4] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha4 "How close is the participant to [name_ha4]?"
label variable seetalk_ha4 "How often does the participant see or talk to [name_ha4]?"
label variable knowabout_ha4 "How much does [name_ha4] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha4 "Does [name_ha4] trust doctors to take care of peoples problems?"
label variable helped_ha4___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha4___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha4___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha4___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha4___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha4 "Does [name_ha4] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha4 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha4]?"
label variable gender_ha5 "What is [name_ha5]s gender?"
label variable related_ha5___1 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Spouse/partner)"
label variable related_ha5___2 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Parent)"
label variable related_ha5___3 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha5___4 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Child)"
label variable related_ha5___5 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Grandparent)"
label variable related_ha5___6 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Grandchild)"
label variable related_ha5___7 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Aunt or uncle)"
label variable related_ha5___8 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=In-law)"
label variable related_ha5___9 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Other relative)"
label variable related_ha5___10 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Coworker or colleague)"
label variable related_ha5___11 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Neighbor)"
label variable related_ha5___12 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Friend)"
label variable related_ha5___13 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha5___14 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Employee)"
label variable related_ha5___15 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha5___16 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Lawyer)"
label variable related_ha5___17 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Doctor)"
label variable related_ha5___18 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Other medical professional)"
label variable related_ha5___19 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha5___20 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha5___21 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Fellow church member)"
label variable related_ha5___22 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha5___23 "How is [name_ha5] connected to the participant? In other words, what relation is [name_ha5] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha5 "How close is the participant to [name_ha5]?"
label variable seetalk_ha5 "How often does the participant see or talk to [name_ha5]?"
label variable knowabout_ha5 "How much does [name_ha5] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha5 "Does [name_ha5] trust doctors to take care of peoples problems?"
label variable helped_ha5___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha5___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha5___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha5___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha5___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha5 "Does [name_ha5] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha5 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha5]?"
label variable gender_ha6 "What is [name_ha6]s gender?"
label variable related_ha6___1 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Spouse/partner)"
label variable related_ha6___2 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Parent)"
label variable related_ha6___3 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha6___4 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Child)"
label variable related_ha6___5 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Grandparent)"
label variable related_ha6___6 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Grandchild)"
label variable related_ha6___7 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Aunt or uncle)"
label variable related_ha6___8 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=In-law)"
label variable related_ha6___9 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Other relative)"
label variable related_ha6___10 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Coworker or colleague)"
label variable related_ha6___11 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Neighbor)"
label variable related_ha6___12 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Friend)"
label variable related_ha6___13 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha6___14 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Employee)"
label variable related_ha6___15 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha6___16 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Lawyer)"
label variable related_ha6___17 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Doctor)"
label variable related_ha6___18 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Other medical professional)"
label variable related_ha6___19 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha6___20 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha6___21 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Fellow church member)"
label variable related_ha6___22 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha6___23 "How is [name_ha6] connected to the participant? In other words, what relation is [name_ha6] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha6 "How close is the participant to [name_ha6]?"
label variable seetalk_ha6 "How often does the participant see or talk to [name_ha6]?"
label variable knowabout_ha6 "How much does [name_ha6] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha6 "Does [name_ha6] trust doctors to take care of peoples problems?"
label variable helped_ha6___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha6___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha6___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha6___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha6___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha6 "Does [name_ha6] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha6 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha6]?"
label variable gender_ha7 "What is [name_ha7]s gender?"
label variable related_ha7___1 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Spouse/partner)"
label variable related_ha7___2 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Parent)"
label variable related_ha7___3 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_ha7___4 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Child)"
label variable related_ha7___5 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Grandparent)"
label variable related_ha7___6 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Grandchild)"
label variable related_ha7___7 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Aunt or uncle)"
label variable related_ha7___8 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=In-law)"
label variable related_ha7___9 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Other relative)"
label variable related_ha7___10 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Coworker or colleague)"
label variable related_ha7___11 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Neighbor)"
label variable related_ha7___12 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Friend)"
label variable related_ha7___13 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Boss, employer, teacher)"
label variable related_ha7___14 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Employee)"
label variable related_ha7___15 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Fellow student (went to school together))"
label variable related_ha7___16 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Lawyer)"
label variable related_ha7___17 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Doctor)"
label variable related_ha7___18 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Other medical professional)"
label variable related_ha7___19 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Counselor or mental health therapist)"
label variable related_ha7___20 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Priest, minister, rabbi)"
label variable related_ha7___21 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Fellow church member)"
label variable related_ha7___22 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Belongs to same club or social group)"
label variable related_ha7___23 "How is [name_ha7] connected to the participant? In other words, what relation is [name_ha7] to the participant? (choice=Do leisure activities with)"
label variable howclose_ha7 "How close is the participant to [name_ha7]?"
label variable seetalk_ha7 "How often does the participant see or talk to [name_ha7]?"
label variable knowabout_ha7 "How much does [name_ha7] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_ha7 "Does [name_ha7] trust doctors to take care of peoples problems?"
label variable helped_ha7___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_ha7___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_ha7___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_ha7___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_ha7___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_ha7 "Does [name_ha7] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_ha7 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_ha7]?"
label variable gender_hb1 "What is [name_hb1]s gender?"
label variable related_hb1___1 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Spouse/partner)"
label variable related_hb1___2 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Parent)"
label variable related_hb1___3 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hb1___4 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Child)"
label variable related_hb1___5 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Grandparent)"
label variable related_hb1___6 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Grandchild)"
label variable related_hb1___7 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Aunt or uncle)"
label variable related_hb1___8 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=In-law)"
label variable related_hb1___9 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Other relative)"
label variable related_hb1___10 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Coworker or colleague)"
label variable related_hb1___11 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Neighbor)"
label variable related_hb1___12 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Friend)"
label variable related_hb1___13 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Boss, employer, teacher)"
label variable related_hb1___14 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Employee)"
label variable related_hb1___15 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Fellow student (went to school together))"
label variable related_hb1___16 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Lawyer)"
label variable related_hb1___17 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Doctor)"
label variable related_hb1___18 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Other medical professional)"
label variable related_hb1___19 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hb1___20 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hb1___21 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Fellow church member)"
label variable related_hb1___22 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Belongs to same club or social group)"
label variable related_hb1___23 "How is [name_hb1] connected to the participant? In other words, what relation is [name_hb1] to the participant? (choice=Do leisure activities with)"
label variable howclose_hb1 "How close is the participant to [name_hb1]?"
label variable seetalk_hb1 "How often does the participant see or talk to [name_hb1]?"
label variable knowabout_hb1 "How much does [name_hb1] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hb1 "Does [name_hb1] trust doctors to take care of peoples problems?"
label variable helped_hb1___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hb1___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hb1___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hb1___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hb1___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hb1 "Does [name_hb1] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hb1 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hb1]?"
label variable gender_hb2 "What is [name_hb2]s gender?"
label variable related_hb2___1 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Spouse/partner)"
label variable related_hb2___2 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Parent)"
label variable related_hb2___3 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hb2___4 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Child)"
label variable related_hb2___5 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Grandparent)"
label variable related_hb2___6 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Grandchild)"
label variable related_hb2___7 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Aunt or uncle)"
label variable related_hb2___8 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=In-law)"
label variable related_hb2___9 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Other relative)"
label variable related_hb2___10 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Coworker or colleague)"
label variable related_hb2___11 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Neighbor)"
label variable related_hb2___12 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Friend)"
label variable related_hb2___13 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Boss, employer, teacher)"
label variable related_hb2___14 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Employee)"
label variable related_hb2___15 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Fellow student (went to school together))"
label variable related_hb2___16 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Lawyer)"
label variable related_hb2___17 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Doctor)"
label variable related_hb2___18 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Other medical professional)"
label variable related_hb2___19 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hb2___20 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hb2___21 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Fellow church member)"
label variable related_hb2___22 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Belongs to same club or social group)"
label variable related_hb2___23 "How is [name_hb2] connected to the participant? In other words, what relation is [name_hb2] to the participant? (choice=Do leisure activities with)"
label variable howclose_hb2 "How close is the participant to [name_hb2]?"
label variable seetalk_hb2 "How often does the participant see or talk to [name_hb2]?"
label variable knowabout_hb2 "How much does [name_hb2] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hb2 "Does [name_hb2] trust doctors to take care of peoples problems?"
label variable helped_hb2___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hb2___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hb2___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hb2___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hb2___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hb2 "Does [name_hb2] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hb2 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hb2]?"
label variable gender_hb3 "What is [name_hb3]s gender?"
label variable related_hb3___1 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Spouse/partner)"
label variable related_hb3___2 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Parent)"
label variable related_hb3___3 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hb3___4 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Child)"
label variable related_hb3___5 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Grandparent)"
label variable related_hb3___6 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Grandchild)"
label variable related_hb3___7 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Aunt or uncle)"
label variable related_hb3___8 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=In-law)"
label variable related_hb3___9 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Other relative)"
label variable related_hb3___10 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Coworker or colleague)"
label variable related_hb3___11 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Neighbor)"
label variable related_hb3___12 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Friend)"
label variable related_hb3___13 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Boss, employer, teacher)"
label variable related_hb3___14 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Employee)"
label variable related_hb3___15 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Fellow student (went to school together))"
label variable related_hb3___16 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Lawyer)"
label variable related_hb3___17 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Doctor)"
label variable related_hb3___18 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Other medical professional)"
label variable related_hb3___19 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hb3___20 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hb3___21 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Fellow church member)"
label variable related_hb3___22 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Belongs to same club or social group)"
label variable related_hb3___23 "How is [name_hb3] connected to the participant? In other words, what relation is [name_hb3] to the participant? (choice=Do leisure activities with)"
label variable howclose_hb3 "How close is the participant to [name_hb3]?"
label variable seetalk_hb3 "How often does the participant see or talk to [name_hb3]?"
label variable knowabout_hb3 "How much does [name_hb3] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hb3 "Does [name_hb3] trust doctors to take care of peoples problems?"
label variable helped_hb3___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hb3___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hb3___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hb3___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hb3___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hb3 "Does [name_hb3] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hb3 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hb3]?"
label variable gender_hb4 "What is [name_hb4]s gender?"
label variable related_hb4___1 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Spouse/partner)"
label variable related_hb4___2 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Parent)"
label variable related_hb4___3 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hb4___4 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Child)"
label variable related_hb4___5 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Grandparent)"
label variable related_hb4___6 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Grandchild)"
label variable related_hb4___7 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Aunt or uncle)"
label variable related_hb4___8 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=In-law)"
label variable related_hb4___9 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Other relative)"
label variable related_hb4___10 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Coworker or colleague)"
label variable related_hb4___11 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Neighbor)"
label variable related_hb4___12 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Friend)"
label variable related_hb4___13 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Boss, employer, teacher)"
label variable related_hb4___14 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Employee)"
label variable related_hb4___15 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Fellow student (went to school together))"
label variable related_hb4___16 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Lawyer)"
label variable related_hb4___17 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Doctor)"
label variable related_hb4___18 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Other medical professional)"
label variable related_hb4___19 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hb4___20 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hb4___21 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Fellow church member)"
label variable related_hb4___22 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Belongs to same club or social group)"
label variable related_hb4___23 "How is [name_hb4] connected to the participant? In other words, what relation is [name_hb4] to the participant? (choice=Do leisure activities with)"
label variable howclose_hb4 "How close is the participant to [name_hb4]?"
label variable seetalk_hb4 "How often does the participant see or talk to [name_hb4]?"
label variable knowabout_hb4 "How much does [name_hb4] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hb4 "Does [name_hb4] trust doctors to take care of peoples problems?"
label variable helped_hb4___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hb4___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hb4___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hb4___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hb4___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hb4 "Does [name_hb4] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hb4 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hb4]?"
label variable gender_hc1 "What is [name_hc1]s gender?"
label variable related_hc1___1 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Spouse/partner)"
label variable related_hc1___2 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Parent)"
label variable related_hc1___3 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hc1___4 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Child)"
label variable related_hc1___5 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Grandparent)"
label variable related_hc1___6 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Grandchild)"
label variable related_hc1___7 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Aunt or uncle)"
label variable related_hc1___8 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=In-law)"
label variable related_hc1___9 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Other relative)"
label variable related_hc1___10 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Coworker or colleague)"
label variable related_hc1___11 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Neighbor)"
label variable related_hc1___12 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Friend)"
label variable related_hc1___13 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Boss, employer, teacher)"
label variable related_hc1___14 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Employee)"
label variable related_hc1___15 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Fellow student (went to school together))"
label variable related_hc1___16 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Lawyer)"
label variable related_hc1___17 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Doctor)"
label variable related_hc1___18 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Other medical professional)"
label variable related_hc1___19 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hc1___20 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hc1___21 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Fellow church member)"
label variable related_hc1___22 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Belongs to same club or social group)"
label variable related_hc1___23 "How is [name_hc1] connected to the participant? In other words, what relation is [name_hc1] to the participant? (choice=Do leisure activities with)"
label variable howclose_hc1 "How close is the participant to [name_hc1]?"
label variable seetalk_hc1 "How often does the participant see or talk to [name_hc1]?"
label variable knowabout_hc1 "How much does [name_hc1] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hc1 "Does [name_hc1] trust doctors to take care of peoples problems?"
label variable helped_hc1___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hc1___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hc1___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hc1___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hc1___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hc1 "Does [name_hc1] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hc1 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hc1]?"
label variable gender_hc2 "What is [name_hc2]s gender?"
label variable related_hc2___1 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Spouse/partner)"
label variable related_hc2___2 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Parent)"
label variable related_hc2___3 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hc2___4 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Child)"
label variable related_hc2___5 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Grandparent)"
label variable related_hc2___6 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Grandchild)"
label variable related_hc2___7 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Aunt or uncle)"
label variable related_hc2___8 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=In-law)"
label variable related_hc2___9 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Other relative)"
label variable related_hc2___10 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Coworker or colleague)"
label variable related_hc2___11 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Neighbor)"
label variable related_hc2___12 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Friend)"
label variable related_hc2___13 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Boss, employer, teacher)"
label variable related_hc2___14 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Employee)"
label variable related_hc2___15 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Fellow student (went to school together))"
label variable related_hc2___16 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Lawyer)"
label variable related_hc2___17 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Doctor)"
label variable related_hc2___18 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Other medical professional)"
label variable related_hc2___19 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hc2___20 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hc2___21 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Fellow church member)"
label variable related_hc2___22 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Belongs to same club or social group)"
label variable related_hc2___23 "How is [name_hc2] connected to the participant? In other words, what relation is [name_hc2] to the participant? (choice=Do leisure activities with)"
label variable howclose_hc2 "How close is the participant to [name_hc2]?"
label variable seetalk_hc2 "How often does the participant see or talk to [name_hc2]?"
label variable knowabout_hc2 "How much does [name_hc2] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hc2 "Does [name_hc2] trust doctors to take care of peoples problems?"
label variable helped_hc2___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hc2___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hc2___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hc2___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hc2___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hc2 "Does [name_hc2] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hc2 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hc2]?"
label variable gender_hc3 "What is [name_hc3]s gender?"
label variable related_hc3___1 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Spouse/partner)"
label variable related_hc3___2 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Parent)"
label variable related_hc3___3 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hc3___4 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Child)"
label variable related_hc3___5 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Grandparent)"
label variable related_hc3___6 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Grandchild)"
label variable related_hc3___7 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Aunt or uncle)"
label variable related_hc3___8 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=In-law)"
label variable related_hc3___9 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Other relative)"
label variable related_hc3___10 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Coworker or colleague)"
label variable related_hc3___11 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Neighbor)"
label variable related_hc3___12 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Friend)"
label variable related_hc3___13 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Boss, employer, teacher)"
label variable related_hc3___14 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Employee)"
label variable related_hc3___15 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Fellow student (went to school together))"
label variable related_hc3___16 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Lawyer)"
label variable related_hc3___17 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Doctor)"
label variable related_hc3___18 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Other medical professional)"
label variable related_hc3___19 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hc3___20 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hc3___21 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Fellow church member)"
label variable related_hc3___22 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Belongs to same club or social group)"
label variable related_hc3___23 "How is [name_hc3] connected to the participant? In other words, what relation is [name_hc3] to the participant? (choice=Do leisure activities with)"
label variable howclose_hc3 "How close is the participant to [name_hc3]?"
label variable seetalk_hc3 "How often does the participant see or talk to [name_hc3]?"
label variable knowabout_hc3 "How much does [name_hc3] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hc3 "Does [name_hc3] trust doctors to take care of peoples problems?"
label variable helped_hc3___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hc3___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hc3___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hc3___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hc3___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hc3 "Does [name_hc3] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hc3 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hc3]?"
label variable gender_hc4 "What is [name_hc4]s gender?"
label variable related_hc4___1 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Spouse/partner)"
label variable related_hc4___2 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Parent)"
label variable related_hc4___3 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Brother/sister (including stepbrothers and sisters))"
label variable related_hc4___4 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Child)"
label variable related_hc4___5 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Grandparent)"
label variable related_hc4___6 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Grandchild)"
label variable related_hc4___7 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Aunt or uncle)"
label variable related_hc4___8 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=In-law)"
label variable related_hc4___9 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Other relative)"
label variable related_hc4___10 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Coworker or colleague)"
label variable related_hc4___11 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Neighbor)"
label variable related_hc4___12 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Friend)"
label variable related_hc4___13 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Boss, employer, teacher)"
label variable related_hc4___14 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Employee)"
label variable related_hc4___15 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Fellow student (went to school together))"
label variable related_hc4___16 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Lawyer)"
label variable related_hc4___17 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Doctor)"
label variable related_hc4___18 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Other medical professional)"
label variable related_hc4___19 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Counselor or mental health therapist)"
label variable related_hc4___20 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Priest, minister, rabbi)"
label variable related_hc4___21 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Fellow church member)"
label variable related_hc4___22 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Belongs to same club or social group)"
label variable related_hc4___23 "How is [name_hc4] connected to the participant? In other words, what relation is [name_hc4] to the participant? (choice=Do leisure activities with)"
label variable howclose_hc4 "How close is the participant to [name_hc4]?"
label variable seetalk_hc4 "How often does the participant see or talk to [name_hc4]?"
label variable knowabout_hc4 "How much does [name_hc4] know about any memory loss, confusion, or other similar problems that the participant might be experiencing as he or she ages?"
label variable trustdoctors_hc4 "Does [name_hc4] trust doctors to take care of peoples problems?"
label variable helped_hc4___1 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Listen to the participant when he or she was feeling down or upset?)"
label variable helped_hc4___2 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Tell the participant they care about what happens to him or her?)"
label variable helped_hc4___3 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Give the participant suggestions when he or she has a problem about what to do, where to go, or whom to talk to?)"
label variable helped_hc4___4 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Try to help the participant with daily chores, like shopping for food, cooking, fixing things, cleaning the apartment/house, or taking him or her places?)"
label variable helped_hc4___5 "Has this person done any of the following for the participant or helped him or her out? (check all that apply) (choice=Help out when the participant is short of money by giving or loaning him or her money?)"
label variable difficult_hc4 "Does [name_hc4] hassle the participant, cause him or her problems, or make life difficult?"
label variable strong_hc4 "On a scale from 1-10, with 10 being the most, how strong is the participants relationship with [name_hc4]?"
label variable matrix_ia1_ia2 "[name_ia1] and [name_ia2]"
label variable matrix_ia1_ia3 "[name_ia1] and [name_ia3]"
label variable matrix_ia1_ia4 "[name_ia1] and [name_ia4]"
label variable matrix_ia1_ia5 "[name_ia1] and [name_ia5]"
label variable matrix_ia1_ia6 "[name_ia1] and [name_ia6]"
label variable matrix_ia1_ia7 "[name_ia1] and [name_ia7]"
label variable matrix_ia1_ib1 "[name_ia1] and [name_ib1]"
label variable matrix_ia1_ib2 "[name_ia1] and [name_ib2]"
label variable matrix_ia1_ib3 "[name_ia1] and [name_ib3]"
label variable matrix_ia1_ib4 "[name_ia1] and [name_ib4]"
label variable matrix_ia1_ic1 "[name_ia1] and [name_ic1]"
label variable matrix_ia1_ic2 "[name_ia1] and [name_ic2]"
label variable matrix_ia1_ic3 "[name_ia1] and [name_ic3]"
label variable matrix_ia1_ic4 "[name_ia1] and [name_ic4]"
label variable matrix_ia1_ha1 "[name_ia1] and [name_ha1]"
label variable matrix_ia1_ha2 "[name_ia1] and [name_ha2]"
label variable matrix_ia1_ha3 "[name_ia1] and [name_ha3]"
label variable matrix_ia1_ha4 "[name_ia1] and [name_ha4]"
label variable matrix_ia1_ha5 "[name_ia1] and [name_ha5]"
label variable matrix_ia1_ha6 "[name_ia1] and [name_ha6]"
label variable matrix_ia1_ha7 "[name_ia1] and [name_ha7]"
label variable matrix_ia1_hb1 "[name_ia1] and [name_hb1]"
label variable matrix_ia1_hb2 "[name_ia1] and [name_hb2]"
label variable matrix_ia1_hb3 "[name_ia1] and [name_hb3]"
label variable matrix_ia1_hb4 "[name_ia1] and [name_hb4]"
label variable matrix_ia1_hc1 "[name_ia1] and [name_hc1]"
label variable matrix_ia1_hc2 "[name_ia1] and [name_hc2]"
label variable matrix_ia1_hc3 "[name_ia1] and [name_hc3]"
label variable matrix_ia1_hc4 "[name_ia1] and [name_hc4]"
label variable matrix_ia2_ia3 "[name_ia2] and [name_ia3]"
label variable matrix_ia2_ia4 "[name_ia2] and [name_ia4]"
label variable matrix_ia2_ia5 "[name_ia2] and [name_ia5]"
label variable matrix_ia2_ia6 "[name_ia2] and [name_ia6]"
label variable matrix_ia2_ia7 "[name_ia2] and [name_ia7]"
label variable matrix_ia2_ib1 "[name_ia2] and [name_ib1]"
label variable matrix_ia2_ib2 "[name_ia2] and [name_ib2]"
label variable matrix_ia2_ib3 "[name_ia2] and [name_ib3]"
label variable matrix_ia2_ib4 "[name_ia2] and [name_ib4]"
label variable matrix_ia2_ic1 "[name_ia2] and [name_ic1]"
label variable matrix_ia2_ic2 "[name_ia2] and [name_ic2]"
label variable matrix_ia2_ic3 "[name_ia2] and [name_ic3]"
label variable matrix_ia2_ic4 "[name_ia2] and [name_ic4]"
label variable matrix_ia2_ha1 "[name_ia2] and [name_ha1]"
label variable matrix_ia2_ha2 "[name_ia2] and [name_ha2]"
label variable matrix_ia2_ha3 "[name_ia2] and [name_ha3]"
label variable matrix_ia2_ha4 "[name_ia2] and [name_ha4]"
label variable matrix_ia2_ha5 "[name_ia2] and [name_ha5]"
label variable matrix_ia2_ha6 "[name_ia2] and [name_ha6]"
label variable matrix_ia2_ha7 "[name_ia2] and [name_ha7]"
label variable matrix_ia2_hb1 "[name_ia2] and [name_hb1]"
label variable matrix_ia2_hb2 "[name_ia2] and [name_hb2]"
label variable matrix_ia2_hb3 "[name_ia2] and [name_hb3]"
label variable matrix_ia2_hb4 "[name_ia2] and [name_hb4]"
label variable matrix_ia2_hc1 "[name_ia2] and [name_hc1]"
label variable matrix_ia2_hc2 "[name_ia2] and [name_hc2]"
label variable matrix_ia2_hc3 "[name_ia2] and [name_hc3]"
label variable matrix_ia2_hc4 "[name_ia2] and [name_hc4]"
label variable matrix_ia3_ia4 "[name_ia3] and [name_ia4]"
label variable matrix_ia3_ia5 "[name_ia3] and [name_ia5]"
label variable matrix_ia3_ia6 "[name_ia3] and [name_ia6]"
label variable matrix_ia3_ia7 "[name_ia3] and [name_ia7]"
label variable matrix_ia3_ib1 "[name_ia3] and [name_ib1]"
label variable matrix_ia3_ib2 "[name_ia3] and [name_ib2]"
label variable matrix_ia3_ib3 "[name_ia3] and [name_ib3]"
label variable matrix_ia3_ib4 "[name_ia3] and [name_ib4]"
label variable matrix_ia3_ic1 "[name_ia3] and [name_ic1]"
label variable matrix_ia3_ic2 "[name_ia3] and [name_ic2]"
label variable matrix_ia3_ic3 "[name_ia3] and [name_ic3]"
label variable matrix_ia3_ic4 "[name_ia3] and [name_ic4]"
label variable matrix_ia3_ha1 "[name_ia3] and [name_ha1]"
label variable matrix_ia3_ha2 "[name_ia3] and [name_ha2]"
label variable matrix_ia3_ha3 "[name_ia3] and [name_ha3]"
label variable matrix_ia3_ha4 "[name_ia3] and [name_ha4]"
label variable matrix_ia3_ha5 "[name_ia3] and [name_ha5]"
label variable matrix_ia3_ha6 "[name_ia3] and [name_ha6]"
label variable matrix_ia3_ha7 "[name_ia3] and [name_ha7]"
label variable matrix_ia3_hb1 "[name_ia3] and [name_hb1]"
label variable matrix_ia3_hb2 "[name_ia3] and [name_hb2]"
label variable matrix_ia3_hb3 "[name_ia3] and [name_hb3]"
label variable matrix_ia3_hb4 "[name_ia3] and [name_hb4]"
label variable matrix_ia3_hc1 "[name_ia3] and [name_hc1]"
label variable matrix_ia3_hc2 "[name_ia3] and [name_hc2]"
label variable matrix_ia3_hc3 "[name_ia3] and [name_hc3]"
label variable matrix_ia3_hc4 "[name_ia3] and [name_hc4]"
label variable matrix_ia4_ia5 "[name_ia4] and [name_ia5]"
label variable matrix_ia4_ia6 "[name_ia4] and [name_ia6]"
label variable matrix_ia4_ia7 "[name_ia4] and [name_ia7]"
label variable matrix_ia4_ib1 "[name_ia4] and [name_ib1]"
label variable matrix_ia4_ib2 "[name_ia4] and [name_ib2]"
label variable matrix_ia4_ib3 "[name_ia4] and [name_ib3]"
label variable matrix_ia4_ib4 "[name_ia4] and [name_ib4]"
label variable matrix_ia4_ic1 "[name_ia4] and [name_ic1]"
label variable matrix_ia4_ic2 "[name_ia4] and [name_ic2]"
label variable matrix_ia4_ic3 "[name_ia4] and [name_ic3]"
label variable matrix_ia4_ic4 "[name_ia4] and [name_ic4]"
label variable matrix_ia4_ha1 "[name_ia4] and [name_ha1]"
label variable matrix_ia4_ha2 "[name_ia4] and [name_ha2]"
label variable matrix_ia4_ha3 "[name_ia4] and [name_ha3]"
label variable matrix_ia4_ha4 "[name_ia4] and [name_ha4]"
label variable matrix_ia4_ha5 "[name_ia4] and [name_ha5]"
label variable matrix_ia4_ha6 "[name_ia4] and [name_ha6]"
label variable matrix_ia4_ha7 "[name_ia4] and [name_ha7]"
label variable matrix_ia4_hb1 "[name_ia4] and [name_hb1]"
label variable matrix_ia4_hb2 "[name_ia4] and [name_hb2]"
label variable matrix_ia4_hb3 "[name_ia4] and [name_hb3]"
label variable matrix_ia4_hb4 "[name_ia4] and [name_hb4]"
label variable matrix_ia4_hc1 "[name_ia4] and [name_hc1]"
label variable matrix_ia4_hc2 "[name_ia4] and [name_hc2]"
label variable matrix_ia4_hc3 "[name_ia4] and [name_hc3]"
label variable matrix_ia4_hc4 "[name_ia4] and [name_hc4]"
label variable matrix_ia5_ia6 "[name_ia5] and [name_ia6]"
label variable matrix_ia5_ia7 "[name_ia5] and [name_ia7]"
label variable matrix_ia5_ib1 "[name_ia5] and [name_ib1]"
label variable matrix_ia5_ib2 "[name_ia5] and [name_ib2]"
label variable matrix_ia5_ib3 "[name_ia5] and [name_ib3]"
label variable matrix_ia5_ib4 "[name_ia5] and [name_ib4]"
label variable matrix_ia5_ic1 "[name_ia5] and [name_ic1]"
label variable matrix_ia5_ic2 "[name_ia5] and [name_ic2]"
label variable matrix_ia5_ic3 "[name_ia5] and [name_ic3]"
label variable matrix_ia5_ic4 "[name_ia5] and [name_ic4]"
label variable matrix_ia5_ha1 "[name_ia5] and [name_ha1]"
label variable matrix_ia5_ha2 "[name_ia5] and [name_ha2]"
label variable matrix_ia5_ha3 "[name_ia5] and [name_ha3]"
label variable matrix_ia5_ha4 "[name_ia5] and [name_ha4]"
label variable matrix_ia5_ha5 "[name_ia5] and [name_ha5]"
label variable matrix_ia5_ha6 "[name_ia5] and [name_ha6]"
label variable matrix_ia5_ha7 "[name_ia5] and [name_ha7]"
label variable matrix_ia5_hb1 "[name_ia5] and [name_hb1]"
label variable matrix_ia5_hb2 "[name_ia5] and [name_hb2]"
label variable matrix_ia5_hb3 "[name_ia5] and [name_hb3]"
label variable matrix_ia5_hb4 "[name_ia5] and [name_hb4]"
label variable matrix_ia5_hc1 "[name_ia5] and [name_hc1]"
label variable matrix_ia5_hc2 "[name_ia5] and [name_hc2]"
label variable matrix_ia5_hc3 "[name_ia5] and [name_hc3]"
label variable matrix_ia5_hc4 "[name_ia5] and [name_hc4]"
label variable matrix_ia6_ia7 "[name_ia6] and [name_ia7]"
label variable matrix_ia6_ib1 "[name_ia6] and [name_ib1]"
label variable matrix_ia6_ib2 "[name_ia6] and [name_ib2]"
label variable matrix_ia6_ib3 "[name_ia6] and [name_ib3]"
label variable matrix_ia6_ib4 "[name_ia6] and [name_ib4]"
label variable matrix_ia6_ic1 "[name_ia6] and [name_ic1]"
label variable matrix_ia6_ic2 "[name_ia6] and [name_ic2]"
label variable matrix_ia6_ic3 "[name_ia6] and [name_ic3]"
label variable matrix_ia6_ic4 "[name_ia6] and [name_ic4]"
label variable matrix_ia6_ha1 "[name_ia6] and [name_ha1]"
label variable matrix_ia6_ha2 "[name_ia6] and [name_ha2]"
label variable matrix_ia6_ha3 "[name_ia6] and [name_ha3]"
label variable matrix_ia6_ha4 "[name_ia6] and [name_ha4]"
label variable matrix_ia6_ha5 "[name_ia6] and [name_ha5]"
label variable matrix_ia6_ha6 "[name_ia6] and [name_ha6]"
label variable matrix_ia6_ha7 "[name_ia6] and [name_ha7]"
label variable matrix_ia6_hb1 "[name_ia6] and [name_hb1]"
label variable matrix_ia6_hb2 "[name_ia6] and [name_hb2]"
label variable matrix_ia6_hb3 "[name_ia6] and [name_hb3]"
label variable matrix_ia6_hb4 "[name_ia6] and [name_hb4]"
label variable matrix_ia6_hc1 "[name_ia6] and [name_hc1]"
label variable matrix_ia6_hc2 "[name_ia6] and [name_hc2]"
label variable matrix_ia6_hc3 "[name_ia6] and [name_hc3]"
label variable matrix_ia6_hc4 "[name_ia6] and [name_hc4]"
label variable matrix_ia7_ib1 "[name_ia7] and [name_ib1]"
label variable matrix_ia7_ib2 "[name_ia7] and [name_ib2]"
label variable matrix_ia7_ib3 "[name_ia7] and [name_ib3]"
label variable matrix_ia7_ib4 "[name_ia7] and [name_ib4]"
label variable matrix_ia7_ic1 "[name_ia7] and [name_ic1]"
label variable matrix_ia7_ic2 "[name_ia7] and [name_ic2]"
label variable matrix_ia7_ic3 "[name_ia7] and [name_ic3]"
label variable matrix_ia7_ic4 "[name_ia7] and [name_ic4]"
label variable matrix_ia7_ha1 "[name_ia7] and [name_ha1]"
label variable matrix_ia7_ha2 "[name_ia7] and [name_ha2]"
label variable matrix_ia7_ha3 "[name_ia7] and [name_ha3]"
label variable matrix_ia7_ha4 "[name_ia7] and [name_ha4]"
label variable matrix_ia7_ha5 "[name_ia7] and [name_ha5]"
label variable matrix_ia7_ha6 "[name_ia7] and [name_ha6]"
label variable matrix_ia7_ha7 "[name_ia7] and [name_ha7]"
label variable matrix_ia7_hb1 "[name_ia7] and [name_hb1]"
label variable matrix_ia7_hb2 "[name_ia7] and [name_hb2]"
label variable matrix_ia7_hb3 "[name_ia7] and [name_hb3]"
label variable matrix_ia7_hb4 "[name_ia7] and [name_hb4]"
label variable matrix_ia7_hc1 "[name_ia7] and [name_hc1]"
label variable matrix_ia7_hc2 "[name_ia7] and [name_hc2]"
label variable matrix_ia7_hc3 "[name_ia7] and [name_hc3]"
label variable matrix_ia7_hc4 "[name_ia7] and [name_hc4]"
label variable matrix_ib1_ib2 "[name_ib1] and [name_ib2]"
label variable matrix_ib1_ib3 "[name_ib1] and [name_ib3]"
label variable matrix_ib1_ib4 "[name_ib1] and [name_ib4]"
label variable matrix_ib1_ic1 "[name_ib1] and [name_ic1]"
label variable matrix_ib1_ic2 "[name_ib1] and [name_ic2]"
label variable matrix_ib1_ic3 "[name_ib1] and [name_ic3]"
label variable matrix_ib1_ic4 "[name_ib1] and [name_ic4]"
label variable matrix_ib1_ha1 "[name_ib1] and [name_ha1]"
label variable matrix_ib1_ha2 "[name_ib1] and [name_ha2]"
label variable matrix_ib1_ha3 "[name_ib1] and [name_ha3]"
label variable matrix_ib1_ha4 "[name_ib1] and [name_ha4]"
label variable matrix_ib1_ha5 "[name_ib1] and [name_ha5]"
label variable matrix_ib1_ha6 "[name_ib1] and [name_ha6]"
label variable matrix_ib1_ha7 "[name_ib1] and [name_ha7]"
label variable matrix_ib1_hb1 "[name_ib1] and [name_hb1]"
label variable matrix_ib1_hb2 "[name_ib1] and [name_hb2]"
label variable matrix_ib1_hb3 "[name_ib1] and [name_hb3]"
label variable matrix_ib1_hb4 "[name_ib1] and [name_hb4]"
label variable matrix_ib1_hc1 "[name_ib1] and [name_hc1]"
label variable matrix_ib1_hc2 "[name_ib1] and [name_hc2]"
label variable matrix_ib1_hc3 "[name_ib1] and [name_hc3]"
label variable matrix_ib1_hc4 "[name_ib1] and [name_hc4]"
label variable matrix_ib2_ib3 "[name_ib2] and [name_ib3]"
label variable matrix_ib2_ib4 "[name_ib2] and [name_ib4]"
label variable matrix_ib2_ic1 "[name_ib2] and [name_ic1]"
label variable matrix_ib2_ic2 "[name_ib2] and [name_ic2]"
label variable matrix_ib2_ic3 "[name_ib2] and [name_ic3]"
label variable matrix_ib2_ic4 "[name_ib2] and [name_ic4]"
label variable matrix_ib2_ha1 "[name_ib2] and [name_ha1]"
label variable matrix_ib2_ha2 "[name_ib2] and [name_ha2]"
label variable matrix_ib2_ha3 "[name_ib2] and [name_ha3]"
label variable matrix_ib2_ha4 "[name_ib2] and [name_ha4]"
label variable matrix_ib2_ha5 "[name_ib2] and [name_ha5]"
label variable matrix_ib2_ha6 "[name_ib2] and [name_ha6]"
label variable matrix_ib2_ha7 "[name_ib2] and [name_ha7]"
label variable matrix_ib2_hb1 "[name_ib2] and [name_hb1]"
label variable matrix_ib2_hb2 "[name_ib2] and [name_hb2]"
label variable matrix_ib2_hb3 "[name_ib2] and [name_hb3]"
label variable matrix_ib2_hb4 "[name_ib2] and [name_hb4]"
label variable matrix_ib2_hc1 "[name_ib2] and [name_hc1]"
label variable matrix_ib2_hc2 "[name_ib2] and [name_hc2]"
label variable matrix_ib2_hc3 "[name_ib2] and [name_hc3]"
label variable matrix_ib2_hc4 "[name_ib2] and [name_hc4]"
label variable matrix_ib3_ib4 "[name_ib3] and [name_ib4]"
label variable matrix_ib3_ic1 "[name_ib3] and [name_ic1]"
label variable matrix_ib3_ic2 "[name_ib3] and [name_ic2]"
label variable matrix_ib3_ic3 "[name_ib3] and [name_ic3]"
label variable matrix_ib3_ic4 "[name_ib3] and [name_ic4]"
label variable matrix_ib3_ha1 "[name_ib3] and [name_ha1]"
label variable matrix_ib3_ha2 "[name_ib3] and [name_ha2]"
label variable matrix_ib3_ha3 "[name_ib3] and [name_ha3]"
label variable matrix_ib3_ha4 "[name_ib3] and [name_ha4]"
label variable matrix_ib3_ha5 "[name_ib3] and [name_ha5]"
label variable matrix_ib3_ha6 "[name_ib3] and [name_ha6]"
label variable matrix_ib3_ha7 "[name_ib3] and [name_ha7]"
label variable matrix_ib3_hb1 "[name_ib3] and [name_hb1]"
label variable matrix_ib3_hb2 "[name_ib3] and [name_hb2]"
label variable matrix_ib3_hb3 "[name_ib3] and [name_hb3]"
label variable matrix_ib3_hb4 "[name_ib3] and [name_hb4]"
label variable matrix_ib3_hc1 "[name_ib3] and [name_hc1]"
label variable matrix_ib3_hc2 "[name_ib3] and [name_hc2]"
label variable matrix_ib3_hc3 "[name_ib3] and [name_hc3]"
label variable matrix_ib3_hc4 "[name_ib3] and [name_hc4]"
label variable matrix_ib4_ic1 "[name_ib4] and [name_ic1]"
label variable matrix_ib4_ic2 "[name_ib4] and [name_ic2]"
label variable matrix_ib4_ic3 "[name_ib4] and [name_ic3]"
label variable matrix_ib4_ic4 "[name_ib4] and [name_ic4]"
label variable matrix_ib4_ha1 "[name_ib4] and [name_ha1]"
label variable matrix_ib4_ha2 "[name_ib4] and [name_ha2]"
label variable matrix_ib4_ha3 "[name_ib4] and [name_ha3]"
label variable matrix_ib4_ha4 "[name_ib4] and [name_ha4]"
label variable matrix_ib4_ha5 "[name_ib4] and [name_ha5]"
label variable matrix_ib4_ha6 "[name_ib4] and [name_ha6]"
label variable matrix_ib4_ha7 "[name_ib4] and [name_ha7]"
label variable matrix_ib4_hb1 "[name_ib4] and [name_hb1]"
label variable matrix_ib4_hb2 "[name_ib4] and [name_hb2]"
label variable matrix_ib4_hb3 "[name_ib4] and [name_hb3]"
label variable matrix_ib4_hb4 "[name_ib4] and [name_hb4]"
label variable matrix_ib4_hc1 "[name_ib4] and [name_hc1]"
label variable matrix_ib4_hc2 "[name_ib4] and [name_hc2]"
label variable matrix_ib4_hc3 "[name_ib4] and [name_hc3]"
label variable matrix_ib4_hc4 "[name_ib4] and [name_hc4]"
label variable matrix_ic1_ic2 "[name_ic1] and [name_ic2]"
label variable matrix_ic1_ic3 "[name_ic1] and [name_ic3]"
label variable matrix_ic1_ic4 "[name_ic1] and [name_ic4]"
label variable matrix_ic1_ha1 "[name_ic1] and [name_ha1]"
label variable matrix_ic1_ha2 "[name_ic1] and [name_ha2]"
label variable matrix_ic1_ha3 "[name_ic1] and [name_ha3]"
label variable matrix_ic1_ha4 "[name_ic1] and [name_ha4]"
label variable matrix_ic1_ha5 "[name_ic1] and [name_ha5]"
label variable matrix_ic1_ha6 "[name_ic1] and [name_ha6]"
label variable matrix_ic1_ha7 "[name_ic1] and [name_ha7]"
label variable matrix_ic1_hb1 "[name_ic1] and [name_hb1]"
label variable matrix_ic1_hb2 "[name_ic1] and [name_hb2]"
label variable matrix_ic1_hb3 "[name_ic1] and [name_hb3]"
label variable matrix_ic1_hb4 "[name_ic1] and [name_hb4]"
label variable matrix_ic1_hc1 "[name_ic1] and [name_hc1]"
label variable matrix_ic1_hc2 "[name_ic1] and [name_hc2]"
label variable matrix_ic1_hc3 "[name_ic1] and [name_hc3]"
label variable matrix_ic1_hc4 "[name_ic1] and [name_hc4]"
label variable matrix_ic2_ic3 "[name_ic2] and [name_ic3]"
label variable matrix_ic2_ic4 "[name_ic2] and [name_ic4]"
label variable matrix_ic2_ha1 "[name_ic2] and [name_ha1]"
label variable matrix_ic2_ha2 "[name_ic2] and [name_ha2]"
label variable matrix_ic2_ha3 "[name_ic2] and [name_ha3]"
label variable matrix_ic2_ha4 "[name_ic2] and [name_ha4]"
label variable matrix_ic2_ha5 "[name_ic2] and [name_ha5]"
label variable matrix_ic2_ha6 "[name_ic2] and [name_ha6]"
label variable matrix_ic2_ha7 "[name_ic2] and [name_ha7]"
label variable matrix_ic2_hb1 "[name_ic2] and [name_hb1]"
label variable matrix_ic2_hb2 "[name_ic2] and [name_hb2]"
label variable matrix_ic2_hb3 "[name_ic2] and [name_hb3]"
label variable matrix_ic2_hb4 "[name_ic2] and [name_hb4]"
label variable matrix_ic2_hc1 "[name_ic2] and [name_hc1]"
label variable matrix_ic2_hc2 "[name_ic2] and [name_hc2]"
label variable matrix_ic2_hc3 "[name_ic2] and [name_hc3]"
label variable matrix_ic2_hc4 "[name_ic2] and [name_hc4]"
label variable matrix_ic3_ic4 "[name_ic3] and [name_ic4]"
label variable matrix_ic3_ha1 "[name_ic3] and [name_ha1]"
label variable matrix_ic3_ha2 "[name_ic3] and [name_ha2]"
label variable matrix_ic3_ha3 "[name_ic3] and [name_ha3]"
label variable matrix_ic3_ha4 "[name_ic3] and [name_ha4]"
label variable matrix_ic3_ha5 "[name_ic3] and [name_ha5]"
label variable matrix_ic3_ha6 "[name_ic3] and [name_ha6]"
label variable matrix_ic3_ha7 "[name_ic3] and [name_ha7]"
label variable matrix_ic3_hb1 "[name_ic3] and [name_hb1]"
label variable matrix_ic3_hb2 "[name_ic3] and [name_hb2]"
label variable matrix_ic3_hb3 "[name_ic3] and [name_hb3]"
label variable matrix_ic3_hb4 "[name_ic3] and [name_hb4]"
label variable matrix_ic3_hc1 "[name_ic3] and [name_hc1]"
label variable matrix_ic3_hc2 "[name_ic3] and [name_hc2]"
label variable matrix_ic3_hc3 "[name_ic3] and [name_hc3]"
label variable matrix_ic3_hc4 "[name_ic3] and [name_hc4]"
label variable matrix_ic4_ha1 "[name_ic4] and [name_ha1]"
label variable matrix_ic4_ha2 "[name_ic4] and [name_ha2]"
label variable matrix_ic4_ha3 "[name_ic4] and [name_ha3]"
label variable matrix_ic4_ha4 "[name_ic4] and [name_ha4]"
label variable matrix_ic4_ha5 "[name_ic4] and [name_ha5]"
label variable matrix_ic4_ha6 "[name_ic4] and [name_ha6]"
label variable matrix_ic4_ha7 "[name_ic4] and [name_ha7]"
label variable matrix_ic4_hb1 "[name_ic4] and [name_hb1]"
label variable matrix_ic4_hb2 "[name_ic4] and [name_hb2]"
label variable matrix_ic4_hb3 "[name_ic4] and [name_hb3]"
label variable matrix_ic4_hb4 "[name_ic4] and [name_hb4]"
label variable matrix_ic4_hc1 "[name_ic4] and [name_hc1]"
label variable matrix_ic4_hc2 "[name_ic4] and [name_hc2]"
label variable matrix_ic4_hc3 "[name_ic4] and [name_hc3]"
label variable matrix_ic4_hc4 "[name_ic4] and [name_hc4]"
label variable matrix_ha1_ha2 "[name_ha1] and [name_ha2]"
label variable matrix_ha1_ha3 "[name_ha1] and [name_ha3]"
label variable matrix_ha1_ha4 "[name_ha1] and [name_ha4]"
label variable matrix_ha1_ha5 "[name_ha1] and [name_ha5]"
label variable matrix_ha1_ha6 "[name_ha1] and [name_ha6]"
label variable matrix_ha1_ha7 "[name_ha1] and [name_ha7]"
label variable matrix_ha1_hb1 "[name_ha1] and [name_hb1]"
label variable matrix_ha1_hb2 "[name_ha1] and [name_hb2]"
label variable matrix_ha1_hb3 "[name_ha1] and [name_hb3]"
label variable matrix_ha1_hb4 "[name_ha1] and [name_hb4]"
label variable matrix_ha1_hc1 "[name_ha1] and [name_hc1]"
label variable matrix_ha1_hc2 "[name_ha1] and [name_hc2]"
label variable matrix_ha1_hc3 "[name_ha1] and [name_hc3]"
label variable matrix_ha1_hc4 "[name_ha1] and [name_hc4]"
label variable matrix_ha2_ha3 "[name_ha2] and [name_ha3]"
label variable matrix_ha2_ha4 "[name_ha2] and [name_ha4]"
label variable matrix_ha2_ha5 "[name_ha2] and [name_ha5]"
label variable matrix_ha2_ha6 "[name_ha2] and [name_ha6]"
label variable matrix_ha2_ha7 "[name_ha2] and [name_ha7]"
label variable matrix_ha2_hb1 "[name_ha2] and [name_hb1]"
label variable matrix_ha2_hb2 "[name_ha2] and [name_hb2]"
label variable matrix_ha2_hb3 "[name_ha2] and [name_hb3]"
label variable matrix_ha2_hb4 "[name_ha2] and [name_hb4]"
label variable matrix_ha2_hc1 "[name_ha2] and [name_hc1]"
label variable matrix_ha2_hc2 "[name_ha2] and [name_hc2]"
label variable matrix_ha2_hc3 "[name_ha2] and [name_hc3]"
label variable matrix_ha2_hc4 "[name_ha2] and [name_hc4]"
label variable matrix_ha3_ha4 "[name_ha3] and [name_ha4]"
label variable matrix_ha3_ha5 "[name_ha3] and [name_ha5]"
label variable matrix_ha3_ha6 "[name_ha3] and [name_ha6]"
label variable matrix_ha3_ha7 "[name_ha3] and [name_ha7]"
label variable matrix_ha3_hb1 "[name_ha3] and [name_hb1]"
label variable matrix_ha3_hb2 "[name_ha3] and [name_hb2]"
label variable matrix_ha3_hb3 "[name_ha3] and [name_hb3]"
label variable matrix_ha3_hb4 "[name_ha3] and [name_hb4]"
label variable matrix_ha3_hc1 "[name_ha3] and [name_hc1]"
label variable matrix_ha3_hc2 "[name_ha3] and [name_hc2]"
label variable matrix_ha3_hc3 "[name_ha3] and [name_hc3]"
label variable matrix_ha3_hc4 "[name_ha3] and [name_hc4]"
label variable matrix_ha4_ha5 "[name_ha4] and [name_ha5]"
label variable matrix_ha4_ha6 "[name_ha4] and [name_ha6]"
label variable matrix_ha4_ha7 "[name_ha4] and [name_ha7]"
label variable matrix_ha4_hb1 "[name_ha4] and [name_hb1]"
label variable matrix_ha4_hb2 "[name_ha4] and [name_hb2]"
label variable matrix_ha4_hb3 "[name_ha4] and [name_hb3]"
label variable matrix_ha4_hb4 "[name_ha4] and [name_hb4]"
label variable matrix_ha4_hc1 "[name_ha4] and [name_hc1]"
label variable matrix_ha4_hc2 "[name_ha4] and [name_hc2]"
label variable matrix_ha4_hc3 "[name_ha4] and [name_hc3]"
label variable matrix_ha4_hc4 "[name_ha4] and [name_hc4]"
label variable matrix_ha5_ha6 "[name_ha5] and [name_ha6]"
label variable matrix_ha5_ha7 "[name_ha5] and [name_ha7]"
label variable matrix_ha5_hb1 "[name_ha5] and [name_hb1]"
label variable matrix_ha5_hb2 "[name_ha5] and [name_hb2]"
label variable matrix_ha5_hb3 "[name_ha5] and [name_hb3]"
label variable matrix_ha5_hb4 "[name_ha5] and [name_hb4]"
label variable matrix_ha5_hc1 "[name_ha5] and [name_hc1]"
label variable matrix_ha5_hc2 "[name_ha5] and [name_hc2]"
label variable matrix_ha5_hc3 "[name_ha5] and [name_hc3]"
label variable matrix_ha5_hc4 "[name_ha5] and [name_hc4]"
label variable matrix_ha6_ha7 "[name_ha6] and [name_ha7]"
label variable matrix_ha6_hb1 "[name_ha6] and [name_hb1]"
label variable matrix_ha6_hb2 "[name_ha6] and [name_hb2]"
label variable matrix_ha6_hb3 "[name_ha6] and [name_hb3]"
label variable matrix_ha6_hb4 "[name_ha6] and [name_hb4]"
label variable matrix_ha6_hc1 "[name_ha6] and [name_hc1]"
label variable matrix_ha6_hc2 "[name_ha6] and [name_hc2]"
label variable matrix_ha6_hc3 "[name_ha6] and [name_hc3]"
label variable matrix_ha6_hc4 "[name_ha6] and [name_hc4]"
label variable matrix_ha7_hb1 "[name_ha7] and [name_hb1]"
label variable matrix_ha7_hb2 "[name_ha7] and [name_hb2]"
label variable matrix_ha7_hb3 "[name_ha7] and [name_hb3]"
label variable matrix_ha7_hb4 "[name_ha7] and [name_hb4]"
label variable matrix_ha7_hc1 "[name_ha7] and [name_hc1]"
label variable matrix_ha7_hc2 "[name_ha7] and [name_hc2]"
label variable matrix_ha7_hc3 "[name_ha7] and [name_hc3]"
label variable matrix_ha7_hc4 "[name_ha7] and [name_hc4]"
label variable matrix_hb1_hb2 "[name_hb1] and [name_hb2]"
label variable matrix_hb1_hb3 "[name_hb1] and [name_hb3]"
label variable matrix_hb1_hb4 "[name_hb1] and [name_hb4]"
label variable matrix_hb1_hc1 "[name_hb1] and [name_hc1]"
label variable matrix_hb1_hc2 "[name_hb1] and [name_hc2]"
label variable matrix_hb1_hc3 "[name_hb1] and [name_hc3]"
label variable matrix_hb1_hc4 "[name_hb1] and [name_hc4]"
label variable matrix_hb2_hb3 "[name_hb2] and [name_hb3]"
label variable matrix_hb2_hb4 "[name_hb2] and [name_hb4]"
label variable matrix_hb2_hc1 "[name_hb2] and [name_hc1]"
label variable matrix_hb2_hc2 "[name_hb2] and [name_hc2]"
label variable matrix_hb2_hc3 "[name_hb2] and [name_hc3]"
label variable matrix_hb2_hc4 "[name_hb2] and [name_hc4]"
label variable matrix_hb3_hb4 "[name_hb3] and [name_hb4]"
label variable matrix_hb3_hc1 "[name_hb3] and [name_hc1]"
label variable matrix_hb3_hc2 "[name_hb3] and [name_hc2]"
label variable matrix_hb3_hc3 "[name_hb3] and [name_hc3]"
label variable matrix_hb3_hc4 "[name_hb3] and [name_hc4]"
label variable matrix_hb4_hc1 "[name_hb4] and [name_hc1]"
label variable matrix_hb4_hc2 "[name_hb4] and [name_hc2]"
label variable matrix_hb4_hc3 "[name_hb4] and [name_hc3]"
label variable matrix_hb4_hc4 "[name_hb4] and [name_hc4]"
label variable matrix_hc1_hc2 "[name_hc1] and [name_hc2]"
label variable matrix_hc1_hc3 "[name_hc1] and [name_hc3]"
label variable matrix_hc1_hc4 "[name_hc1] and [name_hc4]"
label variable matrix_hc2_hc3 "[name_hc2] and [name_hc3]"
label variable matrix_hc2_hc4 "[name_hc2] and [name_hc4]"
label variable matrix_hc3_hc4 "[name_hc3] and [name_hc4]"
label variable health "First of all, how do you feel about the participants physical health?"
label variable energy "How do you feel about the participants energy level?"
label variable spirits "How has the participants mood been lately? Have his or her spirits been good, or has he or she been feeling down?"
label variable living_situation "How about the participants living situation? How do you feel about the place he or she lives now?"
label variable memory "How about the participants memory? "
label variable family "How about the participants family and his or her relationships with family members? "
label variable marriage "How do you feel about the participants marriage? How is the participants relationship with his or her spouse? If the participant is not married, please think about the person with whom they have the closest relationship, whether it is a family member or friend. "
label variable friends "How would you describe the participants current relationship with his or her friends? "
label variable self "When you think of the participants whole self, and all the different things about him or her, how would you rate this?"
label variable do_chores "How do you feel about the participants ability to do things like chores around the house or other things that need to be done? "
label variable do_fun "How about the participants ability to do things for fun, that he or she enjoys? "
label variable money "How do you feel about the participants current situation with money, their financial situation? "
label variable whole "How would you describe the participants life as a whole. When you think about the participants life as a whole, everything together, how do you feel about his or her life?"
label variable comments "Comments"
label variable partner_response_complete "Complete?"

order record_id redcap_survey_identifier set_study_id_timestamp studyid date_snad date_iadc partnerid set_study_id_complete partner_response_timestamp survey_method name_ia1 name_ia2 name_ia3 name_ia4 name_ia5 name_ia6 name_ia7 name_ib1 name_ib2 name_ib3 name_ib4 name_ic1 name_ic2 name_ic3 name_ic4 name_ha1 name_ha2 name_ha3 name_ha4 name_ha5 name_ha6 name_ha7 name_hb1 name_hb2 name_hb3 name_hb4 name_hc1 name_hc2 name_hc3 name_hc4 gender_ia1 related_ia1___1 related_ia1___2 related_ia1___3 related_ia1___4 related_ia1___5 related_ia1___6 related_ia1___7 related_ia1___8 related_ia1___9 related_ia1___10 related_ia1___11 related_ia1___12 related_ia1___13 related_ia1___14 related_ia1___15 related_ia1___16 related_ia1___17 related_ia1___18 related_ia1___19 related_ia1___20 related_ia1___21 related_ia1___22 related_ia1___23 howclose_ia1 seetalk_ia1 knowabout_ia1 trustdoctors_ia1 helped_ia1___1 helped_ia1___2 helped_ia1___3 helped_ia1___4 helped_ia1___5 difficult_ia1 strong_ia1 gender_ia2 related_ia2___1 related_ia2___2 related_ia2___3 related_ia2___4 related_ia2___5 related_ia2___6 related_ia2___7 related_ia2___8 related_ia2___9 related_ia2___10 related_ia2___11 related_ia2___12 related_ia2___13 related_ia2___14 related_ia2___15 related_ia2___16 related_ia2___17 related_ia2___18 related_ia2___19 related_ia2___20 related_ia2___21 related_ia2___22 related_ia2___23 howclose_ia2 seetalk_ia2 knowabout_ia2 trustdoctors_ia2 helped_ia2___1 helped_ia2___2 helped_ia2___3 helped_ia2___4 helped_ia2___5 difficult_ia2 strong_ia2 gender_ia3 related_ia3___1 related_ia3___2 related_ia3___3 related_ia3___4 related_ia3___5 related_ia3___6 related_ia3___7 related_ia3___8 related_ia3___9 related_ia3___10 related_ia3___11 related_ia3___12 related_ia3___13 related_ia3___14 related_ia3___15 related_ia3___16 related_ia3___17 related_ia3___18 related_ia3___19 related_ia3___20 related_ia3___21 related_ia3___22 related_ia3___23 howclose_ia3 seetalk_ia3 knowabout_ia3 trustdoctors_ia3 helped_ia3___1 helped_ia3___2 helped_ia3___3 helped_ia3___4 helped_ia3___5 difficult_ia3 strong_ia3 gender_ia4 related_ia4___1 related_ia4___2 related_ia4___3 related_ia4___4 related_ia4___5 related_ia4___6 related_ia4___7 related_ia4___8 related_ia4___9 related_ia4___10 related_ia4___11 related_ia4___12 related_ia4___13 related_ia4___14 related_ia4___15 related_ia4___16 related_ia4___17 related_ia4___18 related_ia4___19 related_ia4___20 related_ia4___21 related_ia4___22 related_ia4___23 howclose_ia4 seetalk_ia4 knowabout_ia4 trustdoctors_ia4 helped_ia4___1 helped_ia4___2 helped_ia4___3 helped_ia4___4 helped_ia4___5 difficult_ia4 strong_ia4 gender_ia5 related_ia5___1 related_ia5___2 related_ia5___3 related_ia5___4 related_ia5___5 related_ia5___6 related_ia5___7 related_ia5___8 related_ia5___9 related_ia5___10 related_ia5___11 related_ia5___12 related_ia5___13 related_ia5___14 related_ia5___15 related_ia5___16 related_ia5___17 related_ia5___18 related_ia5___19 related_ia5___20 related_ia5___21 related_ia5___22 related_ia5___23 howclose_ia5 seetalk_ia5 knowabout_ia5 trustdoctors_ia5 helped_ia5___1 helped_ia5___2 helped_ia5___3 helped_ia5___4 helped_ia5___5 difficult_ia5 strong_ia5 gender_ia6 related_ia6___1 related_ia6___2 related_ia6___3 related_ia6___4 related_ia6___5 related_ia6___6 related_ia6___7 related_ia6___8 related_ia6___9 related_ia6___10 related_ia6___11 related_ia6___12 related_ia6___13 related_ia6___14 related_ia6___15 related_ia6___16 related_ia6___17 related_ia6___18 related_ia6___19 related_ia6___20 related_ia6___21 related_ia6___22 related_ia6___23 howclose_ia6 seetalk_ia6 knowabout_ia6 trustdoctors_ia6 helped_ia6___1 helped_ia6___2 helped_ia6___3 helped_ia6___4 helped_ia6___5 difficult_ia6 strong_ia6 gender_ia7 related_ia7___1 related_ia7___2 related_ia7___3 related_ia7___4 related_ia7___5 related_ia7___6 related_ia7___7 related_ia7___8 related_ia7___9 related_ia7___10 related_ia7___11 related_ia7___12 related_ia7___13 related_ia7___14 related_ia7___15 related_ia7___16 related_ia7___17 related_ia7___18 related_ia7___19 related_ia7___20 related_ia7___21 related_ia7___22 related_ia7___23 howclose_ia7 seetalk_ia7 knowabout_ia7 trustdoctors_ia7 helped_ia7___1 helped_ia7___2 helped_ia7___3 helped_ia7___4 helped_ia7___5 difficult_ia7 strong_ia7 gender_ib1 related_ib1___1 related_ib1___2 related_ib1___3 related_ib1___4 related_ib1___5 related_ib1___6 related_ib1___7 related_ib1___8 related_ib1___9 related_ib1___10 related_ib1___11 related_ib1___12 related_ib1___13 related_ib1___14 related_ib1___15 related_ib1___16 related_ib1___17 related_ib1___18 related_ib1___19 related_ib1___20 related_ib1___21 related_ib1___22 related_ib1___23 howclose_ib1 seetalk_ib1 knowabout_ib1 trustdoctors_ib1 helped_ib1___1 helped_ib1___2 helped_ib1___3 helped_ib1___4 helped_ib1___5 difficult_ib1 strong_ib1 gender_ib2 related_ib2___1 related_ib2___2 related_ib2___3 related_ib2___4 related_ib2___5 related_ib2___6 related_ib2___7 related_ib2___8 related_ib2___9 related_ib2___10 related_ib2___11 related_ib2___12 related_ib2___13 related_ib2___14 related_ib2___15 related_ib2___16 related_ib2___17 related_ib2___18 related_ib2___19 related_ib2___20 related_ib2___21 related_ib2___22 related_ib2___23 howclose_ib2 seetalk_ib2 knowabout_ib2 trustdoctors_ib2 helped_ib2___1 helped_ib2___2 helped_ib2___3 helped_ib2___4 helped_ib2___5 difficult_ib2 strong_ib2 gender_ib3 related_ib3___1 related_ib3___2 related_ib3___3 related_ib3___4 related_ib3___5 related_ib3___6 related_ib3___7 related_ib3___8 related_ib3___9 related_ib3___10 related_ib3___11 related_ib3___12 related_ib3___13 related_ib3___14 related_ib3___15 related_ib3___16 related_ib3___17 related_ib3___18 related_ib3___19 related_ib3___20 related_ib3___21 related_ib3___22 related_ib3___23 howclose_ib3 seetalk_ib3 knowabout_ib3 trustdoctors_ib3 helped_ib3___1 helped_ib3___2 helped_ib3___3 helped_ib3___4 helped_ib3___5 difficult_ib3 strong_ib3 gender_ib4 related_ib4___1 related_ib4___2 related_ib4___3 related_ib4___4 related_ib4___5 related_ib4___6 related_ib4___7 related_ib4___8 related_ib4___9 related_ib4___10 related_ib4___11 related_ib4___12 related_ib4___13 related_ib4___14 related_ib4___15 related_ib4___16 related_ib4___17 related_ib4___18 related_ib4___19 related_ib4___20 related_ib4___21 related_ib4___22 related_ib4___23 howclose_ib4 seetalk_ib4 knowabout_ib4 trustdoctors_ib4 helped_ib4___1 helped_ib4___2 helped_ib4___3 helped_ib4___4 helped_ib4___5 difficult_ib4 strong_ib4 gender_ic1 related_ic1___1 related_ic1___2 related_ic1___3 related_ic1___4 related_ic1___5 related_ic1___6 related_ic1___7 related_ic1___8 related_ic1___9 related_ic1___10 related_ic1___11 related_ic1___12 related_ic1___13 related_ic1___14 related_ic1___15 related_ic1___16 related_ic1___17 related_ic1___18 related_ic1___19 related_ic1___20 related_ic1___21 related_ic1___22 related_ic1___23 howclose_ic1 seetalk_ic1 knowabout_ic1 trustdoctors_ic1 helped_ic1___1 helped_ic1___2 helped_ic1___3 helped_ic1___4 helped_ic1___5 difficult_ic1 strong_ic1 gender_ic2 related_ic2___1 related_ic2___2 related_ic2___3 related_ic2___4 related_ic2___5 related_ic2___6 related_ic2___7 related_ic2___8 related_ic2___9 related_ic2___10 related_ic2___11 related_ic2___12 related_ic2___13 related_ic2___14 related_ic2___15 related_ic2___16 related_ic2___17 related_ic2___18 related_ic2___19 related_ic2___20 related_ic2___21 related_ic2___22 related_ic2___23 howclose_ic2 seetalk_ic2 knowabout_ic2 trustdoctors_ic2 helped_ic2___1 helped_ic2___2 helped_ic2___3 helped_ic2___4 helped_ic2___5 difficult_ic2 strong_ic2 gender_ic3 related_ic3___1 related_ic3___2 related_ic3___3 related_ic3___4 related_ic3___5 related_ic3___6 related_ic3___7 related_ic3___8 related_ic3___9 related_ic3___10 related_ic3___11 related_ic3___12 related_ic3___13 related_ic3___14 related_ic3___15 related_ic3___16 related_ic3___17 related_ic3___18 related_ic3___19 related_ic3___20 related_ic3___21 related_ic3___22 related_ic3___23 howclose_ic3 seetalk_ic3 knowabout_ic3 trustdoctors_ic3 helped_ic3___1 helped_ic3___2 helped_ic3___3 helped_ic3___4 helped_ic3___5 difficult_ic3 strong_ic3 gender_ic4 related_ic4___1 related_ic4___2 related_ic4___3 related_ic4___4 related_ic4___5 related_ic4___6 related_ic4___7 related_ic4___8 related_ic4___9 related_ic4___10 related_ic4___11 related_ic4___12 related_ic4___13 related_ic4___14 related_ic4___15 related_ic4___16 related_ic4___17 related_ic4___18 related_ic4___19 related_ic4___20 related_ic4___21 related_ic4___22 related_ic4___23 howclose_ic4 seetalk_ic4 knowabout_ic4 trustdoctors_ic4 helped_ic4___1 helped_ic4___2 helped_ic4___3 helped_ic4___4 helped_ic4___5 difficult_ic4 strong_ic4 gender_ha1 related_ha1___1 related_ha1___2 related_ha1___3 related_ha1___4 related_ha1___5 related_ha1___6 related_ha1___7 related_ha1___8 related_ha1___9 related_ha1___10 related_ha1___11 related_ha1___12 related_ha1___13 related_ha1___14 related_ha1___15 related_ha1___16 related_ha1___17 related_ha1___18 related_ha1___19 related_ha1___20 related_ha1___21 related_ha1___22 related_ha1___23 howclose_ha1 seetalk_ha1 knowabout_ha1 trustdoctors_ha1 helped_ha1___1 helped_ha1___2 helped_ha1___3 helped_ha1___4 helped_ha1___5 difficult_ha1 strong_ha1 gender_ha2 related_ha2___1 related_ha2___2 related_ha2___3 related_ha2___4 related_ha2___5 related_ha2___6 related_ha2___7 related_ha2___8 related_ha2___9 related_ha2___10 related_ha2___11 related_ha2___12 related_ha2___13 related_ha2___14 related_ha2___15 related_ha2___16 related_ha2___17 related_ha2___18 related_ha2___19 related_ha2___20 related_ha2___21 related_ha2___22 related_ha2___23 howclose_ha2 seetalk_ha2 knowabout_ha2 trustdoctors_ha2 helped_ha2___1 helped_ha2___2 helped_ha2___3 helped_ha2___4 helped_ha2___5 difficult_ha2 strong_ha2 gender_ha3 related_ha3___1 related_ha3___2 related_ha3___3 related_ha3___4 related_ha3___5 related_ha3___6 related_ha3___7 related_ha3___8 related_ha3___9 related_ha3___10 related_ha3___11 related_ha3___12 related_ha3___13 related_ha3___14 related_ha3___15 related_ha3___16 related_ha3___17 related_ha3___18 related_ha3___19 related_ha3___20 related_ha3___21 related_ha3___22 related_ha3___23 howclose_ha3 seetalk_ha3 knowabout_ha3 trustdoctors_ha3 helped_ha3___1 helped_ha3___2 helped_ha3___3 helped_ha3___4 helped_ha3___5 difficult_ha3 strong_ha3 gender_ha4 related_ha4___1 related_ha4___2 related_ha4___3 related_ha4___4 related_ha4___5 related_ha4___6 related_ha4___7 related_ha4___8 related_ha4___9 related_ha4___10 related_ha4___11 related_ha4___12 related_ha4___13 related_ha4___14 related_ha4___15 related_ha4___16 related_ha4___17 related_ha4___18 related_ha4___19 related_ha4___20 related_ha4___21 related_ha4___22 related_ha4___23 howclose_ha4 seetalk_ha4 knowabout_ha4 trustdoctors_ha4 helped_ha4___1 helped_ha4___2 helped_ha4___3 helped_ha4___4 helped_ha4___5 difficult_ha4 strong_ha4 gender_ha5 related_ha5___1 related_ha5___2 related_ha5___3 related_ha5___4 related_ha5___5 related_ha5___6 related_ha5___7 related_ha5___8 related_ha5___9 related_ha5___10 related_ha5___11 related_ha5___12 related_ha5___13 related_ha5___14 related_ha5___15 related_ha5___16 related_ha5___17 related_ha5___18 related_ha5___19 related_ha5___20 related_ha5___21 related_ha5___22 related_ha5___23 howclose_ha5 seetalk_ha5 knowabout_ha5 trustdoctors_ha5 helped_ha5___1 helped_ha5___2 helped_ha5___3 helped_ha5___4 helped_ha5___5 difficult_ha5 strong_ha5 gender_ha6 related_ha6___1 related_ha6___2 related_ha6___3 related_ha6___4 related_ha6___5 related_ha6___6 related_ha6___7 related_ha6___8 related_ha6___9 related_ha6___10 related_ha6___11 related_ha6___12 related_ha6___13 related_ha6___14 related_ha6___15 related_ha6___16 related_ha6___17 related_ha6___18 related_ha6___19 related_ha6___20 related_ha6___21 related_ha6___22 related_ha6___23 howclose_ha6 seetalk_ha6 knowabout_ha6 trustdoctors_ha6 helped_ha6___1 helped_ha6___2 helped_ha6___3 helped_ha6___4 helped_ha6___5 difficult_ha6 strong_ha6 gender_ha7 related_ha7___1 related_ha7___2 related_ha7___3 related_ha7___4 related_ha7___5 related_ha7___6 related_ha7___7 related_ha7___8 related_ha7___9 related_ha7___10 related_ha7___11 related_ha7___12 related_ha7___13 related_ha7___14 related_ha7___15 related_ha7___16 related_ha7___17 related_ha7___18 related_ha7___19 related_ha7___20 related_ha7___21 related_ha7___22 related_ha7___23 howclose_ha7 seetalk_ha7 knowabout_ha7 trustdoctors_ha7 helped_ha7___1 helped_ha7___2 helped_ha7___3 helped_ha7___4 helped_ha7___5 difficult_ha7 strong_ha7 gender_hb1 related_hb1___1 related_hb1___2 related_hb1___3 related_hb1___4 related_hb1___5 related_hb1___6 related_hb1___7 related_hb1___8 related_hb1___9 related_hb1___10 related_hb1___11 related_hb1___12 related_hb1___13 related_hb1___14 related_hb1___15 related_hb1___16 related_hb1___17 related_hb1___18 related_hb1___19 related_hb1___20 related_hb1___21 related_hb1___22 related_hb1___23 howclose_hb1 seetalk_hb1 knowabout_hb1 trustdoctors_hb1 helped_hb1___1 helped_hb1___2 helped_hb1___3 helped_hb1___4 helped_hb1___5 difficult_hb1 strong_hb1 gender_hb2 related_hb2___1 related_hb2___2 related_hb2___3 related_hb2___4 related_hb2___5 related_hb2___6 related_hb2___7 related_hb2___8 related_hb2___9 related_hb2___10 related_hb2___11 related_hb2___12 related_hb2___13 related_hb2___14 related_hb2___15 related_hb2___16 related_hb2___17 related_hb2___18 related_hb2___19 related_hb2___20 related_hb2___21 related_hb2___22 related_hb2___23 howclose_hb2 seetalk_hb2 knowabout_hb2 trustdoctors_hb2 helped_hb2___1 helped_hb2___2 helped_hb2___3 helped_hb2___4 helped_hb2___5 difficult_hb2 strong_hb2 gender_hb3 related_hb3___1 related_hb3___2 related_hb3___3 related_hb3___4 related_hb3___5 related_hb3___6 related_hb3___7 related_hb3___8 related_hb3___9 related_hb3___10 related_hb3___11 related_hb3___12 related_hb3___13 related_hb3___14 related_hb3___15 related_hb3___16 related_hb3___17 related_hb3___18 related_hb3___19 related_hb3___20 related_hb3___21 related_hb3___22 related_hb3___23 howclose_hb3 seetalk_hb3 knowabout_hb3 trustdoctors_hb3 helped_hb3___1 helped_hb3___2 helped_hb3___3 helped_hb3___4 helped_hb3___5 difficult_hb3 strong_hb3 gender_hb4 related_hb4___1 related_hb4___2 related_hb4___3 related_hb4___4 related_hb4___5 related_hb4___6 related_hb4___7 related_hb4___8 related_hb4___9 related_hb4___10 related_hb4___11 related_hb4___12 related_hb4___13 related_hb4___14 related_hb4___15 related_hb4___16 related_hb4___17 related_hb4___18 related_hb4___19 related_hb4___20 related_hb4___21 related_hb4___22 related_hb4___23 howclose_hb4 seetalk_hb4 knowabout_hb4 trustdoctors_hb4 helped_hb4___1 helped_hb4___2 helped_hb4___3 helped_hb4___4 helped_hb4___5 difficult_hb4 strong_hb4 gender_hc1 related_hc1___1 related_hc1___2 related_hc1___3 related_hc1___4 related_hc1___5 related_hc1___6 related_hc1___7 related_hc1___8 related_hc1___9 related_hc1___10 related_hc1___11 related_hc1___12 related_hc1___13 related_hc1___14 related_hc1___15 related_hc1___16 related_hc1___17 related_hc1___18 related_hc1___19 related_hc1___20 related_hc1___21 related_hc1___22 related_hc1___23 howclose_hc1 seetalk_hc1 knowabout_hc1 trustdoctors_hc1 helped_hc1___1 helped_hc1___2 helped_hc1___3 helped_hc1___4 helped_hc1___5 difficult_hc1 strong_hc1 gender_hc2 related_hc2___1 related_hc2___2 related_hc2___3 related_hc2___4 related_hc2___5 related_hc2___6 related_hc2___7 related_hc2___8 related_hc2___9 related_hc2___10 related_hc2___11 related_hc2___12 related_hc2___13 related_hc2___14 related_hc2___15 related_hc2___16 related_hc2___17 related_hc2___18 related_hc2___19 related_hc2___20 related_hc2___21 related_hc2___22 related_hc2___23 howclose_hc2 seetalk_hc2 knowabout_hc2 trustdoctors_hc2 helped_hc2___1 helped_hc2___2 helped_hc2___3 helped_hc2___4 helped_hc2___5 difficult_hc2 strong_hc2 gender_hc3 related_hc3___1 related_hc3___2 related_hc3___3 related_hc3___4 related_hc3___5 related_hc3___6 related_hc3___7 related_hc3___8 related_hc3___9 related_hc3___10 related_hc3___11 related_hc3___12 related_hc3___13 related_hc3___14 related_hc3___15 related_hc3___16 related_hc3___17 related_hc3___18 related_hc3___19 related_hc3___20 related_hc3___21 related_hc3___22 related_hc3___23 howclose_hc3 seetalk_hc3 knowabout_hc3 trustdoctors_hc3 helped_hc3___1 helped_hc3___2 helped_hc3___3 helped_hc3___4 helped_hc3___5 difficult_hc3 strong_hc3 gender_hc4 related_hc4___1 related_hc4___2 related_hc4___3 related_hc4___4 related_hc4___5 related_hc4___6 related_hc4___7 related_hc4___8 related_hc4___9 related_hc4___10 related_hc4___11 related_hc4___12 related_hc4___13 related_hc4___14 related_hc4___15 related_hc4___16 related_hc4___17 related_hc4___18 related_hc4___19 related_hc4___20 related_hc4___21 related_hc4___22 related_hc4___23 howclose_hc4 seetalk_hc4 knowabout_hc4 trustdoctors_hc4 helped_hc4___1 helped_hc4___2 helped_hc4___3 helped_hc4___4 helped_hc4___5 difficult_hc4 strong_hc4 matrix_ia1_ia2 matrix_ia1_ia3 matrix_ia1_ia4 matrix_ia1_ia5 matrix_ia1_ia6 matrix_ia1_ia7 matrix_ia1_ib1 matrix_ia1_ib2 matrix_ia1_ib3 matrix_ia1_ib4 matrix_ia1_ic1 matrix_ia1_ic2 matrix_ia1_ic3 matrix_ia1_ic4 matrix_ia1_ha1 matrix_ia1_ha2 matrix_ia1_ha3 matrix_ia1_ha4 matrix_ia1_ha5 matrix_ia1_ha6 matrix_ia1_ha7 matrix_ia1_hb1 matrix_ia1_hb2 matrix_ia1_hb3 matrix_ia1_hb4 matrix_ia1_hc1 matrix_ia1_hc2 matrix_ia1_hc3 matrix_ia1_hc4 matrix_ia2_ia3 matrix_ia2_ia4 matrix_ia2_ia5 matrix_ia2_ia6 matrix_ia2_ia7 matrix_ia2_ib1 matrix_ia2_ib2 matrix_ia2_ib3 matrix_ia2_ib4 matrix_ia2_ic1 matrix_ia2_ic2 matrix_ia2_ic3 matrix_ia2_ic4 matrix_ia2_ha1 matrix_ia2_ha2 matrix_ia2_ha3 matrix_ia2_ha4 matrix_ia2_ha5 matrix_ia2_ha6 matrix_ia2_ha7 matrix_ia2_hb1 matrix_ia2_hb2 matrix_ia2_hb3 matrix_ia2_hb4 matrix_ia2_hc1 matrix_ia2_hc2 matrix_ia2_hc3 matrix_ia2_hc4 matrix_ia3_ia4 matrix_ia3_ia5 matrix_ia3_ia6 matrix_ia3_ia7 matrix_ia3_ib1 matrix_ia3_ib2 matrix_ia3_ib3 matrix_ia3_ib4 matrix_ia3_ic1 matrix_ia3_ic2 matrix_ia3_ic3 matrix_ia3_ic4 matrix_ia3_ha1 matrix_ia3_ha2 matrix_ia3_ha3 matrix_ia3_ha4 matrix_ia3_ha5 matrix_ia3_ha6 matrix_ia3_ha7 matrix_ia3_hb1 matrix_ia3_hb2 matrix_ia3_hb3 matrix_ia3_hb4 matrix_ia3_hc1 matrix_ia3_hc2 matrix_ia3_hc3 matrix_ia3_hc4 matrix_ia4_ia5 matrix_ia4_ia6 matrix_ia4_ia7 matrix_ia4_ib1 matrix_ia4_ib2 matrix_ia4_ib3 matrix_ia4_ib4 matrix_ia4_ic1 matrix_ia4_ic2 matrix_ia4_ic3 matrix_ia4_ic4 matrix_ia4_ha1 matrix_ia4_ha2 matrix_ia4_ha3 matrix_ia4_ha4 matrix_ia4_ha5 matrix_ia4_ha6 matrix_ia4_ha7 matrix_ia4_hb1 matrix_ia4_hb2 matrix_ia4_hb3 matrix_ia4_hb4 matrix_ia4_hc1 matrix_ia4_hc2 matrix_ia4_hc3 matrix_ia4_hc4 matrix_ia5_ia6 matrix_ia5_ia7 matrix_ia5_ib1 matrix_ia5_ib2 matrix_ia5_ib3 matrix_ia5_ib4 matrix_ia5_ic1 matrix_ia5_ic2 matrix_ia5_ic3 matrix_ia5_ic4 matrix_ia5_ha1 matrix_ia5_ha2 matrix_ia5_ha3 matrix_ia5_ha4 matrix_ia5_ha5 matrix_ia5_ha6 matrix_ia5_ha7 matrix_ia5_hb1 matrix_ia5_hb2 matrix_ia5_hb3 matrix_ia5_hb4 matrix_ia5_hc1 matrix_ia5_hc2 matrix_ia5_hc3 matrix_ia5_hc4 matrix_ia6_ia7 matrix_ia6_ib1 matrix_ia6_ib2 matrix_ia6_ib3 matrix_ia6_ib4 matrix_ia6_ic1 matrix_ia6_ic2 matrix_ia6_ic3 matrix_ia6_ic4 matrix_ia6_ha1 matrix_ia6_ha2 matrix_ia6_ha3 matrix_ia6_ha4 matrix_ia6_ha5 matrix_ia6_ha6 matrix_ia6_ha7 matrix_ia6_hb1 matrix_ia6_hb2 matrix_ia6_hb3 matrix_ia6_hb4 matrix_ia6_hc1 matrix_ia6_hc2 matrix_ia6_hc3 matrix_ia6_hc4 matrix_ia7_ib1 matrix_ia7_ib2 matrix_ia7_ib3 matrix_ia7_ib4 matrix_ia7_ic1 matrix_ia7_ic2 matrix_ia7_ic3 matrix_ia7_ic4 matrix_ia7_ha1 matrix_ia7_ha2 matrix_ia7_ha3 matrix_ia7_ha4 matrix_ia7_ha5 matrix_ia7_ha6 matrix_ia7_ha7 matrix_ia7_hb1 matrix_ia7_hb2 matrix_ia7_hb3 matrix_ia7_hb4 matrix_ia7_hc1 matrix_ia7_hc2 matrix_ia7_hc3 matrix_ia7_hc4 matrix_ib1_ib2 matrix_ib1_ib3 matrix_ib1_ib4 matrix_ib1_ic1 matrix_ib1_ic2 matrix_ib1_ic3 matrix_ib1_ic4 matrix_ib1_ha1 matrix_ib1_ha2 matrix_ib1_ha3 matrix_ib1_ha4 matrix_ib1_ha5 matrix_ib1_ha6 matrix_ib1_ha7 matrix_ib1_hb1 matrix_ib1_hb2 matrix_ib1_hb3 matrix_ib1_hb4 matrix_ib1_hc1 matrix_ib1_hc2 matrix_ib1_hc3 matrix_ib1_hc4 matrix_ib2_ib3 matrix_ib2_ib4 matrix_ib2_ic1 matrix_ib2_ic2 matrix_ib2_ic3 matrix_ib2_ic4 matrix_ib2_ha1 matrix_ib2_ha2 matrix_ib2_ha3 matrix_ib2_ha4 matrix_ib2_ha5 matrix_ib2_ha6 matrix_ib2_ha7 matrix_ib2_hb1 matrix_ib2_hb2 matrix_ib2_hb3 matrix_ib2_hb4 matrix_ib2_hc1 matrix_ib2_hc2 matrix_ib2_hc3 matrix_ib2_hc4 matrix_ib3_ib4 matrix_ib3_ic1 matrix_ib3_ic2 matrix_ib3_ic3 matrix_ib3_ic4 matrix_ib3_ha1 matrix_ib3_ha2 matrix_ib3_ha3 matrix_ib3_ha4 matrix_ib3_ha5 matrix_ib3_ha6 matrix_ib3_ha7 matrix_ib3_hb1 matrix_ib3_hb2 matrix_ib3_hb3 matrix_ib3_hb4 matrix_ib3_hc1 matrix_ib3_hc2 matrix_ib3_hc3 matrix_ib3_hc4 matrix_ib4_ic1 matrix_ib4_ic2 matrix_ib4_ic3 matrix_ib4_ic4 matrix_ib4_ha1 matrix_ib4_ha2 matrix_ib4_ha3 matrix_ib4_ha4 matrix_ib4_ha5 matrix_ib4_ha6 matrix_ib4_ha7 matrix_ib4_hb1 matrix_ib4_hb2 matrix_ib4_hb3 matrix_ib4_hb4 matrix_ib4_hc1 matrix_ib4_hc2 matrix_ib4_hc3 matrix_ib4_hc4 matrix_ic1_ic2 matrix_ic1_ic3 matrix_ic1_ic4 matrix_ic1_ha1 matrix_ic1_ha2 matrix_ic1_ha3 matrix_ic1_ha4 matrix_ic1_ha5 matrix_ic1_ha6 matrix_ic1_ha7 matrix_ic1_hb1 matrix_ic1_hb2 matrix_ic1_hb3 matrix_ic1_hb4 matrix_ic1_hc1 matrix_ic1_hc2 matrix_ic1_hc3 matrix_ic1_hc4 matrix_ic2_ic3 matrix_ic2_ic4 matrix_ic2_ha1 matrix_ic2_ha2 matrix_ic2_ha3 matrix_ic2_ha4 matrix_ic2_ha5 matrix_ic2_ha6 matrix_ic2_ha7 matrix_ic2_hb1 matrix_ic2_hb2 matrix_ic2_hb3 matrix_ic2_hb4 matrix_ic2_hc1 matrix_ic2_hc2 matrix_ic2_hc3 matrix_ic2_hc4 matrix_ic3_ic4 matrix_ic3_ha1 matrix_ic3_ha2 matrix_ic3_ha3 matrix_ic3_ha4 matrix_ic3_ha5 matrix_ic3_ha6 matrix_ic3_ha7 matrix_ic3_hb1 matrix_ic3_hb2 matrix_ic3_hb3 matrix_ic3_hb4 matrix_ic3_hc1 matrix_ic3_hc2 matrix_ic3_hc3 matrix_ic3_hc4 matrix_ic4_ha1 matrix_ic4_ha2 matrix_ic4_ha3 matrix_ic4_ha4 matrix_ic4_ha5 matrix_ic4_ha6 matrix_ic4_ha7 matrix_ic4_hb1 matrix_ic4_hb2 matrix_ic4_hb3 matrix_ic4_hb4 matrix_ic4_hc1 matrix_ic4_hc2 matrix_ic4_hc3 matrix_ic4_hc4 matrix_ha1_ha2 matrix_ha1_ha3 matrix_ha1_ha4 matrix_ha1_ha5 matrix_ha1_ha6 matrix_ha1_ha7 matrix_ha1_hb1 matrix_ha1_hb2 matrix_ha1_hb3 matrix_ha1_hb4 matrix_ha1_hc1 matrix_ha1_hc2 matrix_ha1_hc3 matrix_ha1_hc4 matrix_ha2_ha3 matrix_ha2_ha4 matrix_ha2_ha5 matrix_ha2_ha6 matrix_ha2_ha7 matrix_ha2_hb1 matrix_ha2_hb2 matrix_ha2_hb3 matrix_ha2_hb4 matrix_ha2_hc1 matrix_ha2_hc2 matrix_ha2_hc3 matrix_ha2_hc4 matrix_ha3_ha4 matrix_ha3_ha5 matrix_ha3_ha6 matrix_ha3_ha7 matrix_ha3_hb1 matrix_ha3_hb2 matrix_ha3_hb3 matrix_ha3_hb4 matrix_ha3_hc1 matrix_ha3_hc2 matrix_ha3_hc3 matrix_ha3_hc4 matrix_ha4_ha5 matrix_ha4_ha6 matrix_ha4_ha7 matrix_ha4_hb1 matrix_ha4_hb2 matrix_ha4_hb3 matrix_ha4_hb4 matrix_ha4_hc1 matrix_ha4_hc2 matrix_ha4_hc3 matrix_ha4_hc4 matrix_ha5_ha6 matrix_ha5_ha7 matrix_ha5_hb1 matrix_ha5_hb2 matrix_ha5_hb3 matrix_ha5_hb4 matrix_ha5_hc1 matrix_ha5_hc2 matrix_ha5_hc3 matrix_ha5_hc4 matrix_ha6_ha7 matrix_ha6_hb1 matrix_ha6_hb2 matrix_ha6_hb3 matrix_ha6_hb4 matrix_ha6_hc1 matrix_ha6_hc2 matrix_ha6_hc3 matrix_ha6_hc4 matrix_ha7_hb1 matrix_ha7_hb2 matrix_ha7_hb3 matrix_ha7_hb4 matrix_ha7_hc1 matrix_ha7_hc2 matrix_ha7_hc3 matrix_ha7_hc4 matrix_hb1_hb2 matrix_hb1_hb3 matrix_hb1_hb4 matrix_hb1_hc1 matrix_hb1_hc2 matrix_hb1_hc3 matrix_hb1_hc4 matrix_hb2_hb3 matrix_hb2_hb4 matrix_hb2_hc1 matrix_hb2_hc2 matrix_hb2_hc3 matrix_hb2_hc4 matrix_hb3_hb4 matrix_hb3_hc1 matrix_hb3_hc2 matrix_hb3_hc3 matrix_hb3_hc4 matrix_hb4_hc1 matrix_hb4_hc2 matrix_hb4_hc3 matrix_hb4_hc4 matrix_hc1_hc2 matrix_hc1_hc3 matrix_hc1_hc4 matrix_hc2_hc3 matrix_hc2_hc4 matrix_hc3_hc4 health energy spirits living_situation memory family marriage friends self do_chores do_fun money whole comments partner_response_complete 
set more off
describe
