# CNV recurrence summary

- Template ID: `cnv_recurrence_summary_panel`
- Category: `oncoplot_mutation` (Oncoplot / mutation landscape)
- med-autoscience mapping: `cnv_recurrence_summary_panel`
- Data contract: `chromosome`, `event`, `frequency`

## Purpose

Recurrent CNV gain/loss frequencies by chromosome/region.

## Source-project evidence

This template was distilled from: Reference PDF CNV entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `cnv_recurrence_summary_panel.png` and `cnv_recurrence_summary_panel.pdf` using the shared MAS theme.
