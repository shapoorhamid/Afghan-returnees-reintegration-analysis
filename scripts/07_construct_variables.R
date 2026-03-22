# ==================================================
# 7. Construct variables (embeddedness & controls)
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_recoded.rds")
)

# --------------------------------------------------
# 7.1 Social embeddedness variables
# --------------------------------------------------

# Friends (normalized)
gaps_df$friends_total <- normalr::normalise(gaps_df$Emb.Q1, -0.38)

# Family support
gaps_df$family_support <- normalr::normalise(gaps_df$MigQ11Lm1, 13.21)

# Depth of reliable contacts
contact_logic <- cbind(
  gaps_df$Emb.Q2.Split.1 %in% c("Family","Friends","Relatives","Neighbor","Work colleagues"),
  gaps_df$Emb.Q2.Split.2 %in% c("Family","Friends","Relatives","Neighbor","Work colleagues"),
  gaps_df$Emb.Q2.Split.3 %in% c("Family","Friends","Relatives","Neighbor","Work colleagues"),
  gaps_df$Emb.Q2.Split.4 %in% c("Family","Friends","Relatives","Neighbor","Work colleagues")
)

gaps_df$depth_contacts <- apply(contact_logic, 1, sum)

# Social activity
activity_vars <- c("Emb.Q3_1","EmbQ3_2","EmbQ3_3","EmbQ3_4","EmbQ3_5","EmbQ3_6","EmbQ3_7")

gaps_df$social_activity <- apply(gaps_df[, activity_vars], 1, sum, na.rm = TRUE)
gaps_df$social_activity <- normalr::normalise(gaps_df$social_activity, -0.24)

# --------------------------------------------------
# 7.2 Economic variables
# --------------------------------------------------

gaps_df$financial_stability <- car::recode(
  gaps_df$Emb.Q11,
  "'Yes, totally' = 4; 'Somewhat' = 3; 'A little' = 2; 'Not really' = 1; 'No, not at all' = 0"
)

# --------------------------------------------------
# 7.3 Key independent variables
# --------------------------------------------------

# Forced return
gaps_df$forced_return <- car::recode(
  gaps_df$MigQ5.rtd18,
  "'Forced to leave the host country' = 1; 'Returned voluntarily' = 0"
)

# Gender
gaps_df$female <- car::recode(
  gaps_df$DemoQ3.g,
  "'Female' = 1; 'Male' = 0"
)

# Prison time
gaps_df$prison_time <- car::recode(
  gaps_df$MigQ9dt2,
  "'I have never been in prison.' = 0;
   'Less than 2 weeks' = 1;
   'From 2 weeks to 1 month' = 2;
   'More than 1 month less than 2 months' = 3;
   'More than 2 months less than 6 months' = 4;
   'More than 6 months' = 5;
   NA = 0"
)

# --------------------------------------------------
# 7.4 Migration outcomes
# --------------------------------------------------

gaps_df$legal_migration <- car::recode(
  gaps_df$MigQ2.lm,
  "'Very Likely' = 4; 'Somewhat likely' = 3; 'Neither likely nor unlikely (somewhere in the middle)' = 2;
   'Somewhat unlikely' = 1; 'Very unlikely' = 0"
)

gaps_df$illegal_migration <- car::recode(
  gaps_df$MigQ3.lm,
  "'Very Likely' = 4; 'Somewhat likely' = 3; 'Neither likely nor unlikely (somewhere in the middle)' = 2;
   'Somewhat unlikely' = 1; 'Very unlikely' = 0"
)

# --------------------------------------------------
# 7.5 Save dataset
# --------------------------------------------------

saveRDS(
  gaps_df,
  here::here("outputs", "objects", "gaps_df_final_variables.rds")
)
