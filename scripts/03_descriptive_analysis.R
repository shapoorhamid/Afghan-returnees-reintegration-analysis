# ==================================================
# 3. Descriptive analysis of scale items
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_recoded.rds")
)

# Define scale items
hope_items <- colnames(gaps_df)[196:207]
resilience_items <- colnames(gaps_df)[208:217]
depression_items <- colnames(gaps_df)[219:228]

scale_items <- c(hope_items, resilience_items, depression_items)

# Descriptive statistics
descriptive_df <- as.data.frame(
  psych::describe(gaps_df[, scale_items])
)

# Quick check of skew
summary(descriptive_df$skew)

# Save results
saveRDS(
  descriptive_df,
  here::here("outputs", "objects", "descriptive_scale_items.rds")
)

write.csv(
  descriptive_df,
  here::here("outputs", "tables", "descriptive_scale_items.csv"),
  row.names = TRUE
)
