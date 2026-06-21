# Baseline summary table

- Template ID: `baseline_table`
- Category: `baseline_table` (Baseline / summary table)
- med-autoscience mapping: `table1_baseline_characteristics`
- Data contract: `variable`, `level`, `overall`, `group_a`, `group_b`, `p_value`

## Purpose

Publication-style baseline table rendered as a figure for visual reference plus CSV-friendly layout.

## Source-project evidence

This template was distilled from: CreateTableOne/table Rmd files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `baseline_table.png` and `baseline_table.pdf` using the shared MAS theme.
