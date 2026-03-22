# ==================================================
# 6. Final Measurement Model (Wellbeing Construct)
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_recoded.rds")
)

# --------------------------------------------------
# 6.1 Final one-factor wellbeing model
# --------------------------------------------------

model_final <- '
Wellbeing =~ 
  HopeQ1b + HopeQ1c + HopeQ1h + HopeQ1i + HopeQ1j + HopeQ1l +
  ResilQ1a + ResilQ1b + ResilQ1d + ResilQ1e + ResilQ1f +
  ResilQ1g + ResilQ1h + ResilQ1i + ResilQ1j +
  DepressionQ2c + DepressionQ2e + DepressionQ2h + DepressionQ2i
'

fit_final <- lavaan::cfa(
  model_final,
  data = gaps_df,
  estimator = "WLSMV",
  ordered = colnames(gaps_df)
)

summary(fit_final, fit.measures = TRUE, standardized = TRUE)

# --------------------------------------------------
# 6.2 Extract key outputs
# --------------------------------------------------

fitMeasures(fit_final)

parameterEstimates(fit_final, standardized = TRUE)

# --------------------------------------------------
# 6.3 Save model
# --------------------------------------------------

saveRDS(
  fit_final,
  here::here("outputs", "objects", "cfa_final_model.rds")
)
