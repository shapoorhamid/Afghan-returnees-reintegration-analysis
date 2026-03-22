# ==================================================
# 2. Scale preparation and recoding
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

# Load initial prepared dataset
gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_initial.rds")
)

# --------------------------------------------------
# 2.1 Identify scale item groups
# --------------------------------------------------

hope_items <- colnames(gaps_df)[196:207]
resilience_items <- colnames(gaps_df)[208:217]
depression_items <- colnames(gaps_df)[219:228]

# Review selected item names
hope_items
resilience_items
depression_items

# --------------------------------------------------
# 2.2 Recode Hope scale
# --------------------------------------------------

table(gaps_df$HopeQ1a)

gaps_df[, hope_items] <- apply(
  gaps_df[, hope_items],
  2,
  function(x) car::recode(
    x,
    "'Strongly Agree' = 5;
     'Agree' = 4;
     'Neutral' = 3;
     'Disagree' = 2;
     'Strongly Disagree' = 1"
  )
)

head(gaps_df[, hope_items])

# --------------------------------------------------
# 2.3 Recode Resilience scale
# --------------------------------------------------

gaps_df[, resilience_items] <- apply(
  gaps_df[, resilience_items],
  2,
  function(x) car::recode(
    x,
    "'Strongly Agree' = 5;
     'Agree' = 4;
     'Neutral' = 3;
     'Disagree' = 2;
     'Strongly Disagree' = 1"
  )
)

head(gaps_df[, resilience_items])

# --------------------------------------------------
# 2.4 Clean and recode Depression scale
# --------------------------------------------------

table(gaps_df$DepressionQa)

# Remove surrounding whitespace
gaps_df[, depression_items] <- apply(
  gaps_df[, depression_items],
  2,
  function(x) stringr::str_trim(x)
)

# Remove problematic colon characters
gaps_df[, depression_items] <- apply(
  gaps_df[, depression_items],
  2,
  function(x) gsub(":", "", x)
)

table(gaps_df$DepressionQa)

# Recode depression response categories
gaps_df[, depression_items] <- apply(
  gaps_df[, depression_items],
  2,
  function(x) car::recode(
    x,
    "'Always or all the time Five to six times a day' = 4;
     'Most of the time or usually Three to four times a day' = 3;
     'Never or rarely Less than once a day' = 2;
     'Somewhat or occasionally One to two times a day' = 1"
  )
)

head(gaps_df[, depression_items])

# --------------------------------------------------
# 2.5 Check missingness across scale items
# --------------------------------------------------

scale_items <- c(hope_items, resilience_items, depression_items)

complete_cases_scale <- complete.cases(gaps_df[, scale_items])
table(complete_cases_scale)

# --------------------------------------------------
# 2.6 Reverse-code selected items
# --------------------------------------------------

# Hope reverse-coded items: c, e, g, k
hope_reverse_items <- colnames(gaps_df)[c(198, 200, 202, 206)]
hope_reverse_items

gaps_df[, hope_reverse_items] <- apply(
  gaps_df[, hope_reverse_items],
  2,
  function(x) car::recode(x, "1 = 5; 2 = 4; 3 = 3; 4 = 2; 5 = 1")
)

# Depression reverse-coded items: e and h
depression_reverse_items <- colnames(gaps_df)[c(223, 226)]
depression_reverse_items

gaps_df[, depression_reverse_items] <- apply(
  gaps_df[, depression_reverse_items],
  2,
  function(x) car::recode(x, "1 = 4; 2 = 3; 3 = 2; 4 = 1")
)

# --------------------------------------------------
# 2.7 Save recoded dataset
# --------------------------------------------------

saveRDS(
  gaps_df,
  here::here("outputs", "objects", "gaps_df_recoded.rds")
)
