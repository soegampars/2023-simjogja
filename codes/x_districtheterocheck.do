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

// Testing whether labour characteristics are different between districts

**********
** 2020 **
**********

use $clean/target_diy_2020_2, clear

foreach x in target_workhours target_earnings target_informal target_underemp {
	
	quietly: reg `x' ib3471.kabkot cons_age_15_19 cons_age_20_24 cons_age_25_29 cons_age_30_34 cons_age_35_39 cons_age_40_44 cons_age_45_49 cons_age_50_54 cons_age_55_59 cons_age_60_64 cons_age_65_69 cons_age_70_74 cons_age_75_79 cons_age_80plus cons_gender_male cons_gender_female cons_educ_sd cons_educ_smp cons_educ_sma cons_educ_dipl cons_educ_s1up cons_educ_nonsd cons_occ_nonlf cons_occ_unemployed cons_occ_tnipolri cons_occ_public cons_occ_agri cons_occ_entre cons_occ_formal cons_occ_others, robust 

	eststo
	
}

esttab using $clean/report_disthet.rtf, drop(cons_*)

eststo clear

foreach x in target_wfh target_internet target_prakerja target_earnings_decr {
	
	quietly: reg `x' ib3471.kabkot cons_age_15_19 cons_age_20_24 cons_age_25_29 cons_age_30_34 cons_age_35_39 cons_age_40_44 cons_age_45_49 cons_age_50_54 cons_age_55_59 cons_age_60_64 cons_age_65_69 cons_age_70_74 cons_age_75_79 cons_age_80plus cons_gender_male cons_gender_female cons_educ_sd cons_educ_smp cons_educ_sma cons_educ_dipl cons_educ_s1up cons_educ_nonsd cons_occ_nonlf cons_occ_unemployed cons_occ_tnipolri cons_occ_public cons_occ_agri cons_occ_entre cons_occ_formal cons_occ_others, robust 

	eststo
	
}

esttab using $clean/report_disthet.rtf, drop(cons_*) append

eststo clear


foreach x in cons_occ_formal cons_occ_nonlf cons_occ_unemployed{
	
	quietly: reg `x' ib3471.kabkot, robust 

	eststo
	
}

esttab using $clean/report_disthet.rtf, title("District Heterogeneity in Job Categories") append

eststo clear
