# SHAP dependence panel

- Template ID: `shap_dependence_panel`
- Category: `scatter_correlation` (Scatter / correlation)
- med-autoscience mapping: `shap_dependence_panel`
- Data contract: `feature_value`, `shap_value`, `subgroup`

## Purpose

Single-feature SHAP dependence view with smooth trend.

## Source-project evidence

This template was distilled from: Reference PDF model explanation entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `shap_dependence_panel.png` and `shap_dependence_panel.pdf` using the shared MAS theme.
