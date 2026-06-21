# Radial immune/pathology profile

- Template ID: `radar`
- Category: `radar` (Radar / radial profile)
- med-autoscience mapping: `practical_factor_dot_figure`
- Data contract: `group`, `axis_scores`

## Purpose

Radar-style profile using ggradar package semantics with no forced panel frame.

## Source-project evidence

This template was distilled from: ggradar HE cell-count radar files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `radar.png` and `radar.pdf` using the shared MAS theme.
