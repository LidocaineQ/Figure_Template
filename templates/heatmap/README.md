# ComplexHeatmap annotated matrix

- Template ID: `heatmap`
- Category: `heatmap` (Heatmap / matrix pattern)
- med-autoscience mapping: `heatmap_group_comparison / clustered_heatmap`
- Data contract: `matrix`, `row_annotation`, `column_annotation`, `value`

## Purpose

Annotated pathway/signature matrix using ComplexHeatmap rather than ggplot tile replication.

## Source-project evidence

This template was distilled from: ComplexHeatmap, circlize and pheatmap source files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `heatmap.png` and `heatmap.pdf` using the shared MAS theme.
