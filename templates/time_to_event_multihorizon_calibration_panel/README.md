# Multi-horizon calibration panel

- Template ID: `time_to_event_multihorizon_calibration_panel`
- Category: `roc_auc` (ROC / AUC)
- med-autoscience mapping: `time_to_event_multihorizon_calibration_panel`
- Data contract: `predicted`, `observed`, `horizon`

## Purpose

Calibration reliability across multiple prognosis horizons.

## Source-project evidence

This template was distilled from: Reference PDF time-event calibration entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `time_to_event_multihorizon_calibration_panel.png` and `time_to_event_multihorizon_calibration_panel.pdf` using the shared MAS theme.
