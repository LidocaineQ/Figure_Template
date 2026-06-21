# Genomic alteration consequence

- Template ID: `genomic_alteration_consequence_panel`
- Category: `oncoplot_mutation` (Oncoplot / mutation landscape)
- med-autoscience mapping: `genomic_alteration_consequence_panel`
- Data contract: `alteration`, `estimate`, `lower`, `upper`, `q_value`

## Purpose

Effect summary linking molecular alterations to functional or clinical consequences.

## Source-project evidence

This template was distilled from: Reference PDF genomic consequence entry.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `genomic_alteration_consequence_panel.png` and `genomic_alteration_consequence_panel.pdf` using the shared MAS theme.
