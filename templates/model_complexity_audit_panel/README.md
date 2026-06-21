# Model complexity audit

- Template ID: `model_complexity_audit_panel`
- Category: `scatter_correlation` (Scatter / correlation)
- med-autoscience mapping: `model_complexity_audit_panel`
- Data contract: `model`, `feature_count`, `metric`, `validation`

## Purpose

Feature-count/performance trade-off for overfitting governance.

## Source-project evidence

This template was distilled from: Reference PDF model audit entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `model_complexity_audit_panel.png` and `model_complexity_audit_panel.pdf` using the shared MAS theme.
