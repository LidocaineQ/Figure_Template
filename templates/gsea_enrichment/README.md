# Pathway enrichment dotplot

- Template ID: `gsea_enrichment`
- Category: `gsea_enrichment` (GSEA / enrichment)
- med-autoscience mapping: `pathway_enrichment_dotplot_panel / gsva_ssgsea_heatmap`
- Data contract: `pathway`, `gene_ratio`, `nes`, `fdr`

## Purpose

Pathway dotplot using effect direction, FDR size, and gene ratio axis.

## Source-project evidence

This template was distilled from: clusterProfiler/GSEA/GseaVis files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `gsea_enrichment.png` and `gsea_enrichment.pdf` using the shared MAS theme.
