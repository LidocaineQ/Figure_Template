# SHAP waterfall local explanation

- Template ID: `shap_waterfall_local_explanation_panel`
- Category: `waterfall` (Waterfall / ranked risk score)
- med-autoscience mapping: `shap_waterfall_local_explanation_panel`
- Data contract: `feature`, `contribution`, `baseline`, `prediction`

## Purpose

Local case-level contribution waterfall.

## Source-project evidence

This template was distilled from: Reference PDF model explanation entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `shap_waterfall_local_explanation_panel.png` and `shap_waterfall_local_explanation_panel.pdf` using the shared MAS theme.
