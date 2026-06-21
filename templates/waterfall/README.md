# Ranked risk-score waterfall

- Template ID: `waterfall`
- Category: `waterfall` (Waterfall / ranked risk score)
- med-autoscience mapping: `risk_layering_monotonic_bars`
- Data contract: `sample`, `score`, `response`

## Purpose

Ranked patient score bars with response annotation strip.

## Source-project evidence

This template was distilled from: risk-score waterfall files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `waterfall.png` and `waterfall.pdf` using the shared MAS theme.
