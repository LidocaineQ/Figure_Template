# Cell-type marker dotplot

- Template ID: `celltype_marker_dotplot_panel`
- Category: `heatmap` (Heatmap / matrix pattern)
- med-autoscience mapping: `celltype_marker_dotplot_panel`
- Data contract: `cell_type`, `marker`, `pct_expression`, `avg_expression`

## Purpose

Marker percent/average-expression dotplot for cell annotation.

## Source-project evidence

This template was distilled from: single-cell marker plots from source projects and reference PDF.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `celltype_marker_dotplot_panel.png` and `celltype_marker_dotplot_panel.pdf` using the shared MAS theme.
