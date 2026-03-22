# ==================================================
# 8. Structural Model (Wellbeing → Migration Outcomes)
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

gaps_df <- readRDS(
  here::here("outputs", "objects", "gaps_df_final_variables.rds")
)

# --------------------------------------------------
# 8.1 Define structural model
# --------------------------------------------------

model_structural <- '
# Measurement model
wellbeing =~ HopeQ1b + HopeQ1c + HopeQ1h + HopeQ1i + HopeQ1j + HopeQ1l +
             ResilQ1a + ResilQ1b + ResilQ1d + ResilQ1e + ResilQ1f +
             ResilQ1g + ResilQ1h + ResilQ1i + ResilQ1j +
             DepressionQ2e.R + DepressionQ2h.R

# Regressions (determinants of wellbeing)
wellbeing ~ OG.dest.West + OG.dest.Turkey + OG.dest.pakistan +
            forced_return + prison_time + female + DemoQ1.a

family_support ~ OG.dest.West + OG.dest.Turkey + OG.dest.pakistan +
                 forced_return + prison_time + female + DemoQ1.a

friends_total ~ OG.dest.West + OG.dest.Turkey + OG.dest.pakistan +
                forced_return + prison_time + female + DemoQ1.a

depth_contacts ~ OG.dest.West + OG.dest.Turkey + OG.dest.pakistan +
                 forced_return + prison_time + female + DemoQ1.a

social_activity ~ OG.dest.West + OG.dest.Turkey + OG.dest.pakistan +
                  forced_return + prison_time + female + DemoQ1.a

# Outcomes
legal_migration ~ wellbeing + family_support + friends_total +
                  depth_contacts + social_activity + financial_stability

illegal_migration ~ wellbeing + family_support + friends_total +
                    depth_contacts + social_activity + financial_stability
'

# --------------------------------------------------
# 8.2 Estimate model
# --------------------------------------------------

fit_structural <- lavaan::cfa(
  model_structural,
  data = gaps_df,
  std.lv = TRUE,
  estimator = "MLR"
)

summary(fit_structural, fit.measures = TRUE, standardized = TRUE)

# --------------------------------------------------
# 8.3 Extract results
# --------------------------------------------------

fitMeasures(fit_structural)

results <- parameterEstimates(fit_structural, standardized = TRUE)
print(results)

# --------------------------------------------------
# 8.4 Save model
# --------------------------------------------------

saveRDS(
  fit_structural,
  here::here("outputs", "objects", "structural_model.rds")
)
