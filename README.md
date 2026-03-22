# Afghan Returnees Reintegration Analysis

## Overview

This repository presents a data-driven analysis of reintegration outcomes, resilience, and migration dynamics among Afghan returnees. The project combines quantitative and qualitative approaches to examine how return experiences shape economic, social, and psychosocial outcomes, as well as future migration aspirations.

The analysis is based on data collected as part of a European Commission-funded research project, complemented by qualitative interviews and published academic work.

---

## Key Model Visualization

![SEM Model](visuals/sem/sem_path_diagram.png)

---

## Research Objectives

- To assess whether return leads to sustainable reintegration across economic, social, and psychosocial dimensions  
- To identify key factors influencing reintegration outcomes  
- To examine the relationship between post-return experiences and re-migration aspirations  
- To contribute to policy discussions on return and reintegration in fragile contexts  

---

## Data Description

The analysis draws on:

- Survey data (n ≈ 400 Afghan returnees)  
- Qualitative interviews (35+ participants)  
- Return contexts: Iran, Pakistan, Turkey, and Europe  

Due to ethical and confidentiality considerations related to vulnerable populations, the original dataset is not publicly shared. Where applicable, simulated or anonymized data may be provided to demonstrate the analytical workflow.

---

## Methodology

This project applies a mixed-methods approach, combining:

### 1. Exploratory Data Analysis (EDA)
- Descriptive statistics  
- Distribution analysis  
- Correlation structures  

### 2. Factor Analysis
- Construction of latent variables (e.g., resilience, wellbeing, reintegration dimensions)  
- Dimensionality reduction and validation  

### 3. Structural Equation Modeling (SEM)
- Modeling relationships between:
  - Reintegration outcomes  
  - Psychosocial variables  
  - Migration aspirations  
- Evaluation of direct and indirect effects  

### 4. Qualitative Analysis
- Thematic analysis of returnee experiences  
- Interpretation of statistical findings within lived realities  

---

## Analytical Pipeline

This project follows a structured analytical workflow:

1. Data preparation and cleaning  
2. Scale construction (Hope, Resilience, Depression)  
3. Descriptive analysis and distribution checks  
4. Classical Test Theory (CTT) item analysis  
5. Confirmatory Factor Analysis (CFA)  
6. Final measurement model (Wellbeing construct)  
7. Variable construction (social and economic embeddedness)  
8. Structural Equation Modeling (SEM)  
9. Visualization of results  

All steps are implemented in modular R scripts to ensure reproducibility.

---

## Key Insights

- Reintegration is often incomplete, particularly among forcibly returned individuals  
- Psychosocial wellbeing is a central determinant of post-return outcomes  
- Social embeddedness (family, friends, community activity) plays a critical role in shaping migration intentions  
- Financial stability significantly influences legal migration pathways  
- Re-migration aspirations emerge as a rational response to structural and economic constraints  

This analysis demonstrates that mobility is not necessarily a failure of reintegration, but can function as a form of adaptive resilience.

---

## Repository Structure
├── data/ # Processed or simulated datasets
├── scripts/ # R scripts for full analytical pipeline
├── notebooks/ # RMarkdown workflow
├── outputs/ # Model outputs and results
├── visuals/ # Graphs and SEM diagrams
├── docs/ # Methodology and documentation
└── reports/ # Publications and related outputs


---

## Reproducibility

The repository is structured to demonstrate a complete analytical workflow:

- Modular scripts for each stage of analysis  
- Saved intermediate datasets and model outputs  
- Clear separation between data preparation, modeling, and visualization  

This ensures transparency and replicability of results.

---

## Ethical Considerations

This project involves sensitive data related to vulnerable populations.

- No personally identifiable information is included  
- Raw data is not shared publicly  
- Analysis follows ethical standards for research on human subjects  

---

## Author

**Shapoor Hamid**  
Migration Researcher & Data Analyst  

### Specialization:
- Migration & Reintegration Analysis  
- Psychosocial Measurement (Resilience, Wellbeing)  
- Structural Equation Modeling (SEM)  
- Mixed-Methods Research  

### Technical Tools:
- R (lavaan, psych, CTT, tidyverse)  
- Python  
- Tableau  
- Atlas.ti  

### Publications:
- *Enduring Aspirations and Continuous Mobility* (International Migration, 2025)  
- *Beyond Borders: Afghanistan’s Migration Dynamics* (International Migration Review, 2024)  

---

## Related Work

- European Commission-funded GAPs project  
- Blog articles and reports on Afghan returnees  
- Ongoing research on resilience and migration dynamics  

---

## Why This Project Matters

This project demonstrates how advanced statistical modeling can be applied to real-world humanitarian and migration challenges.

It bridges:
- Data science and social science  
- Quantitative modeling and qualitative insight  
- Academic research and policy relevance  

The approach is directly applicable to:
- UN agencies  
- NGOs  
- Development organizations  
- Policy research institutions  

---

## Status

This repository is actively being developed and expanded with additional analyses and visualizations.
