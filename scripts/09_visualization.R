# ==================================================
# 9. Visualization (SEM Path Diagram)
# ==================================================

source(here::here("scripts", "00_setup_packages.R"))

fit_structural <- readRDS(
  here::here("outputs", "objects", "structural_model.rds")
)

# Create SEM path diagram
semPlot::semPaths(
  fit_structural,
  what = "std",
  layout = "tree",
  style = "lisrel",
  edge.label.cex = 0.8,
  sizeMan = 6,
  sizeLat = 8,
  residuals = FALSE,
  intercepts = FALSE
)

# Save plot
png(here::here("visuals", "sem", "sem_path_diagram.png"), width = 1200, height = 800)

semPlot::semPaths(
  fit_structural,
  what = "std",
  layout = "tree",
  style = "lisrel",
  edge.label.cex = 0.8,
  sizeMan = 6,
  sizeLat = 8,
  residuals = FALSE,
  intercepts = FALSE
)

dev.off()
