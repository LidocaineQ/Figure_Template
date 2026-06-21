# Differential-expression volcano

- Template ID: `volcano_deg`
- Category: `volcano_deg` (Volcano / differential expression)
- med-autoscience mapping: `omics_volcano_panel`
- Data contract: `feature`, `log2_fc`, `neg_log10_p`, `status`

## Purpose

Volcano plot with significance colors, threshold guides, and top label positions.

## Source-project evidence

This template was distilled from: DEG and EnhancedVolcano files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `volcano_deg.png` and `volcano_deg.pdf` using the shared MAS theme.
