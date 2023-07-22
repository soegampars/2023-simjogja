clear
set more off

local datestamp : di %tdCYND daily("$S_DATE", "DMY")

global suser = c(username)

if (inlist("${suser}","satya")) {
	cd "C:\Users\satya\OneDrive\WORKBENCH\Personal Study\1B - Thesis\proposals\spatialmicrosim"
}

global output	"output"
global dofile	"dofile"
global raw		"raw"
global clean	"clean"

**************

// Testing the correlation between constraint and target variables

**********
** 2020 **
**********

use $clean/target_diy_2020_2, clear

foreach x in target_unemp target_working target_lf target_tafw {
	
	quietly: reg `x' cons_age_20_24 cons_age_25_29 cons_age_30_34 cons_age_35_39 cons_age_40_44 cons_age_45_49 cons_age_50_54 cons_age_55_59 cons_age_60_64 cons_age_65_69 cons_age_70_74 cons_age_75_79 cons_age_80plus cons_gender_female cons_educ_sd cons_educ_smp cons_educ_sma cons_educ_dipl cons_educ_s1up  cons_occ_tnipolri cons_occ_agri cons_occ_entre cons_occ_formal cons_occ_others, robust 

	eststo
	
}

esttab using $clean/report_targetconstraint.rtf, title("Results for 2020")

eststo clear

foreach x in target_workhours target_earnings target_informal target_underemp {
	
	quietly: reg `x' cons_age_20_24 cons_age_25_29 cons_age_30_34 cons_age_35_39 cons_age_40_44 cons_age_45_49 cons_age_50_54 cons_age_55_59 cons_age_60_64 cons_age_65_69 cons_age_70_74 cons_age_75_79 cons_age_80plus cons_gender_female cons_educ_sd cons_educ_smp cons_educ_sma cons_educ_dipl cons_educ_s1up  cons_occ_tnipolri cons_occ_agri cons_occ_entre cons_occ_formal cons_occ_others, robust 

	eststo
	
}

esttab using $clean/report_targetconstraint.rtf, title("Results for 2020 cont'd") append

eststo clear

**********
** 2019 **
**********

use $clean/target_diy_2019_2, clear

foreach x in target_unemp target_working target_lf target_tafw {
	
	quietly: reg `x' cons_age_20_24 cons_age_25_29 cons_age_30_34 cons_age_35_39 cons_age_40_44 cons_age_45_49 cons_age_50_54 cons_age_55_59 cons_age_60_64 cons_age_65_69 cons_age_70_74 cons_age_75_79 cons_age_80plus cons_gender_female cons_educ_sd cons_educ_smp cons_educ_sma cons_educ_dipl cons_educ_s1up  cons_occ_tnipolri cons_occ_agri cons_occ_entre cons_occ_formal cons_occ_others, robust 

	eststo
	
}

// Base category for job type is the `cons_occ_public', the rest are the bottom categories.

esttab using $clean/report_targetconstraint.rtf, title("Results for 2019") append

eststo clear

foreach x in target_workhours target_earnings target_informal target_underemp {
	
	quietly: reg `x' cons_age_20_24 cons_age_25_29 cons_age_30_34 cons_age_35_39 cons_age_40_44 cons_age_45_49 cons_age_50_54 cons_age_55_59 cons_age_60_64 cons_age_65_69 cons_age_70_74 cons_age_75_79 cons_age_80plus cons_gender_female cons_educ_sd cons_educ_smp cons_educ_sma cons_educ_dipl cons_educ_s1up  cons_occ_tnipolri cons_occ_agri cons_occ_entre cons_occ_formal cons_occ_others, robust 

	eststo
	
}

esttab using $clean/report_targetconstraint.rtf, title("Results for 2019 cont'd") append

eststo clear

