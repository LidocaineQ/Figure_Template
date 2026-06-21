# Embedding scatter

- Template ID: `embedding_umap_tsne`
- Category: `embedding_umap_tsne` (UMAP / t-SNE embedding)
- med-autoscience mapping: `umap_scatter_grouped / tsne_scatter_grouped / pca_scatter_grouped`
- Data contract: `dim1`, `dim2`, `cell_type`, `cohort`

## Purpose

UMAP/t-SNE/PCA-like scatter with equal panel geometry and cluster labels.

## Source-project evidence

This template was distilled from: Seurat DimPlot and UMAP/tSNE Python files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `embedding_umap_tsne.png` and `embedding_umap_tsne.pdf` using the shared MAS theme.
