library(ipfp)
library(dplyr)


# Load data ---------------------------------------------------------------

sat <- read.csv("clean/cons_kotajogja_2020_2.csv")
ind <- read.csv("clean/ind_kotajogja_2020_2.csv")
data <- read.csv("clean/target_kotajogja_2020_2.csv")

# Reorder and cleaning variables ------------------------------------------

cons <- select(sat, -kelurahan) %>%
  relocate(cons_educ_sd, cons_educ_smp, cons_educ_sma, cons_educ_nonsd, 
           cons_educ_dipl, cons_educ_s1up, cons_gender_female, cons_gender_male, 
           cons_age_15_19, cons_age_20_24, cons_age_25_29, cons_age_30_34, 
           cons_age_35_39, cons_age_40_44, cons_age_45_49, cons_age_50_54, 
           cons_age_55_59, cons_age_60_64, cons_age_65_69, cons_age_70_74, 
           cons_age_75_79, cons_age_80plus, cons_occ_nonlf, cons_occ_unemployed, 
           cons_occ_entre, cons_occ_public, cons_occ_tnipolri, cons_occ_formal, 
           cons_occ_agri)

ind <-  relocate(ind, cons_educ_sd, cons_educ_smp, cons_educ_sma, cons_educ_nonsd, 
           cons_educ_dipl, cons_educ_s1up, cons_gender_female, cons_gender_male, 
           cons_age_15_19, cons_age_20_24, cons_age_25_29, cons_age_30_34, 
           cons_age_35_39, cons_age_40_44, cons_age_45_49, cons_age_50_54, 
           cons_age_55_59, cons_age_60_64, cons_age_65_69, cons_age_70_74, 
           cons_age_75_79, cons_age_80plus, cons_occ_nonlf, cons_occ_unemployed, 
           cons_occ_entre, cons_occ_public, cons_occ_tnipolri, cons_occ_formal, 
           cons_occ_agri)

cons <- apply(cons, 2, as.numeric) # convert to numeric data
ind <- apply(ind, 2, as.numeric)

weights <- apply(cons, 1, FUN = function(x) ipfp(x, t(ind), x0 = rep(1, nrow(ind))))

colnames(weights) <- sat[,1]

data_new <- bind_cols(data, weights)

write.csv(data_new, "clean/reweighted_kotajogja_2020_2.csv")
