# Decision curve (binary outcome)

- Template ID: `decision_curve_binary`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `decision_curve_binary`
- Data contract: `threshold`, `net_benefit`, `strategy`

## Purpose

Net benefit across threshold probabilities for model-vs-treat-all/none decisions.

## Source-project evidence

This template was distilled from: Reference PDF clinical utility entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `decision_curve_binary.png` and `decision_curve_binary.pdf` using the shared MAS theme.
