# Scatter correlation panel

- Template ID: `scatter_correlation`
- Category: `scatter_correlation` (Scatter / correlation)
- med-autoscience mapping: `feature_response_support_domain_panel`
- Data contract: `x`, `y`, `group`

## Purpose

Correlation scatter with regression line, cohort color, and embedded statistic label.

## Source-project evidence

This template was distilled from: ggscatter/stat_cor and feature-correlation files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `scatter_correlation.png` and `scatter_correlation.pdf` using the shared MAS theme.
