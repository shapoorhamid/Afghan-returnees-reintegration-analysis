# ==================================================
# 1. Data import and initial preparation
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

# Import study dataset
gaps_raw <- openxlsx::read.xlsx(
  here::here("data", "processed", "GAPS-Clean-Data-Feb-19.xlsx")
)

# Inspect structure
str(gaps_raw)
dim(gaps_raw)
names(gaps_raw)

# Create working copy
gaps_df <- gaps_raw

# Check dataset size
nrow(gaps_df)

# Identify columns that are entirely missing
all_na_cols <- which(
  apply(gaps_df, 2, function(x) sum(is.na(x))) == nrow(gaps_df)
)

# Display names of fully missing columns
colnames(gaps_df)[all_na_cols]

# Save initial working object
saveRDS(
  gaps_df,
  here::here("outputs", "objects", "gaps_df_initial.rds")
)
