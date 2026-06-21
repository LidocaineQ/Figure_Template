# Coefficient path panel

- Template ID: `coefficient_path_panel`
- Category: `forest_cox` (Forest / Cox model)
- med-autoscience mapping: `coefficient_path_panel`
- Data contract: `lambda`, `feature`, `coefficient`

## Purpose

Regularization/feature-selection coefficient paths with selected lambda marker.

## Source-project evidence

This template was distilled from: Reference PDF model-building entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `coefficient_path_panel.png` and `coefficient_path_panel.pdf` using the shared MAS theme.
