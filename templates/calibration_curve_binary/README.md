# Calibration curve (binary outcome)

- Template ID: `calibration_curve_binary`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `calibration_curve_binary`
- Data contract: `predicted`, `observed`, `lower`, `upper`

## Purpose

Predicted risk against observed risk with ideal line and uncertainty band.

## Source-project evidence

This template was distilled from: Reference PDF clinical prediction model page.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `calibration_curve_binary.png` and `calibration_curve_binary.pdf` using the shared MAS theme.
