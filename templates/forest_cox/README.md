# Cox/effect forest plot

- Template ID: `forest_cox`
- Category: `forest_cox` (Forest / Cox model)
- med-autoscience mapping: `forest_effect_main / multivariable_forest`
- Data contract: `term`, `estimate`, `lower`, `upper`, `p_value`

## Purpose

Effect estimates with CI, reference line, and compact text labels.

## Source-project evidence

This template was distilled from: coxph, forestplot, ggforest scripts.

## Run

```bash
Rscript template.R ../../figures/png
```

The script writes `forest_cox.png` and `forest_cox.pdf` using the shared MAS theme.
