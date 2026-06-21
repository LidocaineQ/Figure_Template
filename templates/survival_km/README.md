# Kaplan-Meier survival with risk table

- Template ID: `survival_km`
- Category: `survival_km` (Survival / Kaplan-Meier)
- med-autoscience mapping: `kaplan_meier_grouped`
- Data contract: `time`, `survival`, `group`, `n_risk`

## Purpose

Grouped survival curve plus No. at risk table with shared bottom time axis and square overall panel geometry.

## Source-project evidence

This template was distilled from: CTcluster v4 manual KM + risk-table panel; older ggsurvplot code used only as secondary reference.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `survival_km.png` and `survival_km.pdf` using the shared MAS theme.
