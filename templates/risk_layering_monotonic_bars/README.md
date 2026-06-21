# Monotonic risk layering bars

- Template ID: `risk_layering_monotonic_bars`
- Category: `bar_stacked` (Bar / stacked proportion)
- med-autoscience mapping: `risk_layering_monotonic_bars`
- Data contract: `risk_layer`, `event_rate`, `lower`, `upper`

## Purpose

Risk strata event-rate bars with monotonic trend and uncertainty.

## Source-project evidence

This template was distilled from: Reference PDF survival/risk-layering entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `risk_layering_monotonic_bars.png` and `risk_layering_monotonic_bars.pdf` using the shared MAS theme.
