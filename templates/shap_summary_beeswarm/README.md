# SHAP summary beeswarm

- Template ID: `shap_summary_beeswarm`
- Category: `scatter_correlation` (Scatter / correlation)
- med-autoscience mapping: `shap_summary_beeswarm`
- Data contract: `feature`, `shap_value`, `feature_value`

## Purpose

Global SHAP contribution distribution by feature.

## Source-project evidence

This template was distilled from: Reference PDF model explanation entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `shap_summary_beeswarm.png` and `shap_summary_beeswarm.pdf` using the shared MAS theme.
