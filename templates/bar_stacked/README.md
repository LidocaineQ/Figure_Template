# Stacked proportion bars

- Template ID: `bar_stacked`
- Category: `bar_stacked` (Bar / stacked proportion)
- med-autoscience mapping: `risk_layering_monotonic_bars`
- Data contract: `cohort`, `class`, `n`, `fraction`

## Purpose

Stacked proportions with stable group order and percent axis.

## Source-project evidence

This template was distilled from: clinical proportions, MSI, mutation/location bar files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `bar_stacked.png` and `bar_stacked.pdf` using the shared MAS theme.
