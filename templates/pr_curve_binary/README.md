# Precision-recall curve

- Template ID: `pr_curve_binary`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `pr_curve_binary`
- Data contract: `recall`, `precision`, `model`

## Purpose

Precision-recall performance for rare-positive clinical outcomes.

## Source-project evidence

This template was distilled from: Reference PDF imbalanced outcome performance entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `pr_curve_binary.png` and `pr_curve_binary.pdf` using the shared MAS theme.
