# Cumulative incidence curve

- Template ID: `cumulative_incidence_grouped`
- Category: `survival_km` (Survival / Kaplan-Meier)
- med-autoscience mapping: `cumulative_incidence_grouped`
- Data contract: `time`, `incidence`, `group`

## Purpose

Grouped cumulative incidence for recurrence/death/adverse events.

## Source-project evidence

This template was distilled from: time-to-event outputs from CTcluster and reference PDF.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `cumulative_incidence_grouped.png` and `cumulative_incidence_grouped.pdf` using the shared MAS theme.
