# Distribution comparison violin-box

- Template ID: `violin_box`
- Category: `violin_box` (Violin / box comparison)
- med-autoscience mapping: `practical_factor_dot_figure`
- Data contract: `group`, `value`, `cohort`

## Purpose

Violin + box + points for group comparisons with aligned statistical label slot.

## Source-project evidence

This template was distilled from: TNM score, VEGFA, IC50 and immune score Rmd files.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `violin_box.png` and `violin_box.pdf` using the shared MAS theme.
