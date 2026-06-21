# Binary confusion matrix heatmap

- Template ID: `confusion_matrix_heatmap_binary`
- Category: `heatmap` (Heatmap / matrix pattern)
- med-autoscience mapping: `confusion_matrix_heatmap_binary`
- Data contract: `truth`, `predicted`, `n`

## Purpose

2x2 heatmap for prediction error structure.

## Source-project evidence

This template was distilled from: Reference PDF fixed-threshold classification entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `confusion_matrix_heatmap_binary.png` and `confusion_matrix_heatmap_binary.pdf` using the shared MAS theme.
