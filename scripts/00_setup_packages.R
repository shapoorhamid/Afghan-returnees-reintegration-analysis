# ==================================================
# 0. Project setup
# Afghan Returnees Reintegration Analysis
# ==================================================

# Load required packages
if (!requireNamespace("pacman", quietly = TRUE)) {
  install.packages("pacman", dependencies = TRUE)
}

pacman::p_load(
  openxlsx,
  stringr,
  car,
  CTT,
  lavaan,
  fastDummies,
  here,
  janitor,
  dplyr
)

# Global options
options(
  scipen = 999,
  dplyr.summarise.inform = FALSE
)

# Define project paths
data_dir    <- here::here("data")
output_dir  <- here::here("outputs")
visual_dir  <- here::here("visuals")
script_dir  <- here::here("scripts")
docs_dir    <- here::here("docs")
reports_dir <- here::here("reports")
