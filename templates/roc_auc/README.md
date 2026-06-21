# ROC curve with model comparison

- Template ID: `roc_auc`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `roc_curve_binary / time_dependent_roc_horizon`
- Data contract: `fpr`, `tpr`, `model`, `auc`

## Purpose

Binary or horizon-specific ROC curves with diagonal reference and AUC labels.

## Source-project evidence

This template was distilled from: timeROC, pROC and survivalROC scripts.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `roc_auc.png` and `roc_auc.pdf` using the shared MAS theme.
