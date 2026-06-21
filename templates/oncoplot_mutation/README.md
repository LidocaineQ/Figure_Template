# Mutation landscape oncoplot

- Template ID: `oncoplot_mutation`
- Category: `oncoplot_mutation` (Oncoplot / mutation landscape)
- med-autoscience mapping: `oncoplot_mutation_landscape_panel / genomic_alteration_landscape_panel`
- Data contract: `maf`, `clinical_annotation`, `gene`, `sample`

## Purpose

Mutation landscape rendered through maftools::oncoplot, not a hand-built ggplot tile copy.

## Source-project evidence

This template was distilled from: maftools read.maf/oncoplot scripts from CTcluster and supplemental projects.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `oncoplot_mutation.png` and `oncoplot_mutation.pdf` using the shared MAS theme.
