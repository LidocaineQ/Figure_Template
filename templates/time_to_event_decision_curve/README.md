# Decision curve (time-to-event horizon)

- Template ID: `time_to_event_decision_curve`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `time_to_event_decision_curve`
- Data contract: `threshold`, `net_benefit`, `strategy`, `horizon`

## Purpose

Net benefit for time-window prognosis decisions.

## Source-project evidence

This template was distilled from: Reference PDF clinical utility entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `time_to_event_decision_curve.png` and `time_to_event_decision_curve.pdf` using the shared MAS theme.
