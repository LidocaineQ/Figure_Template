# Subtype transition alluvial

- Template ID: `sankey_alluvial`
- Category: `sankey_alluvial` (Sankey / alluvial flow)
- med-autoscience mapping: `atlas_spatial_trajectory_storyboard_panel`
- Data contract: `left_group`, `right_group`, `n`

## Purpose

Alluvial flow using ggalluvial::geom_alluvium/geom_stratum with no outer frame.

## Source-project evidence

This template was distilled from: ggalluvial source templates from CTcluster and supplemental projects.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `sankey_alluvial.png` and `sankey_alluvial.pdf` using the shared MAS theme.
