# ==================================================
# 4. Classical Test Theory (CTT) Item Analysis
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_recoded.rds")
)

# Define scale items
hope_items <- colnames(gaps_df)[196:207]
resilience_items <- colnames(gaps_df)[208:217]
depression_items <- colnames(gaps_df)[219:228]

# --------------------------------------------------
# Hope scale
# --------------------------------------------------

hope_ctt <- CTT::itemAnalysis(gaps_df[, hope_items])

hope_ctt$alpha
hope_ctt$itemReport

# --------------------------------------------------
# Resilience scale
# --------------------------------------------------

resilience_ctt <- CTT::itemAnalysis(gaps_df[, resilience_items])

resilience_ctt$alpha
resilience_ctt$itemReport

# --------------------------------------------------
# Depression scale
# --------------------------------------------------

depression_ctt <- CTT::itemAnalysis(gaps_df[, depression_items])

depression_ctt$alpha
depression_ctt$itemReport

# --------------------------------------------------
# Save outputs
# --------------------------------------------------

saveRDS(hope_ctt, here::here("outputs", "objects", "hope_ctt.rds"))
saveRDS(resilience_ctt, here::here("outputs", "objects", "resilience_ctt.rds"))
saveRDS(depression_ctt, here::here("outputs", "objects", "depression_ctt.rds"))
