# Generalizability subgroup composite

- Template ID: `generalizability_subgroup_composite_panel`
- Category: `forest_cox` (Forest / Cox model)
- med-autoscience mapping: `generalizability_subgroup_composite_panel`
- Data contract: `cohort`, `subgroup`, `metric`, `lower`, `upper`

## Purpose

Cross-cohort and subgroup stability summary with uncertainty intervals.

## Source-project evidence

This template was distilled from: Reference PDF validation/generalizability page.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `generalizability_subgroup_composite_panel.png` and `generalizability_subgroup_composite_panel.pdf` using the shared MAS theme.
