# Time-dependent ROC horizon

- Template ID: `time_dependent_roc_horizon`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `time_dependent_roc_horizon`
- Data contract: `time`, `event`, `score`, `horizon`, `auc`

## Purpose

Time-dependent discrimination across pre-specified follow-up horizons.

## Source-project evidence

This template was distilled from: ctcluster survival AUC and reference PDF.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `time_dependent_roc_horizon.png` and `time_dependent_roc_horizon.pdf` using the shared MAS theme.
