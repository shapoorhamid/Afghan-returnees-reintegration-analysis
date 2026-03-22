# ==================================================
# 5. CFA Model Development (Initial + Refined)
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_recoded.rds")
)

# --------------------------------------------------
# 5.1 Define initial three-factor model
# --------------------------------------------------

model_01_initial <- '
Hope =~ HopeQ1a + HopeQ1b + HopeQ1c + HopeQ1d + HopeQ1e + HopeQ1f +
        HopeQ1g + HopeQ1h + HopeQ1i + HopeQ1j + HopeQ1k + HopeQ1l

Resilience =~ ResilQ1a + ResilQ1b + ResilQ1c + ResilQ1d + ResilQ1e +
              ResilQ1f + ResilQ1g + ResilQ1h + ResilQ1i + ResilQ1j

Depression =~ DepressionQ2a + DepressionQ2b + DepressionQ2c +
              DepressionQ2d + DepressionQ2e + DepressionQ2f +
              DepressionQ2g + DepressionQ2h + DepressionQ2i + DepressionQ2j
'

fit_01 <- lavaan::cfa(model_01_initial, data = gaps_df)

summary(fit_01, fit.measures = TRUE, standardized = TRUE)

# --------------------------------------------------
# 5.2 Refined model (example: remove weak items)
# --------------------------------------------------

model_02_refined <- '
Hope =~ HopeQ1b + HopeQ1c + HopeQ1h + HopeQ1i + HopeQ1j + HopeQ1l

Resilience =~ ResilQ1a + ResilQ1b + ResilQ1d + ResilQ1e +
              ResilQ1f + ResilQ1g + ResilQ1h + ResilQ1i + ResilQ1j

Depression =~ DepressionQ2c + DepressionQ2e + DepressionQ2h + DepressionQ2i
'

fit_02 <- lavaan::cfa(
  model_02_refined,
  data = gaps_df,
  estimator = "WLSMV",
  ordered = colnames(gaps_df)
)

summary(fit_02, fit.measures = TRUE, standardized = TRUE)

# --------------------------------------------------
# 5.3 Save models
# --------------------------------------------------

saveRDS(fit_01, here::here("outputs", "objects", "cfa_initial.rds"))
saveRDS(fit_02, here::here("outputs", "objects", "cfa_refined.rds"))
