# MAS Clinical Research Graph Template Assets

Reusable graph-template assets distilled from two local medical research projects for future `med-autoscience` display-pack work.

## Contents

- `templates/`: executable R/ggplot2 templates using a shared MAS visual theme.
- `figures/reference/`: rendered PNG/PDF reference figures from synthetic data.
- `docs/MAS_graph_template_gallery_agent.md`: agent-readable gallery with image + code + source provenance.
- `audit/source_inventory.csv`: read-only index of source plotting code from both projects.
- `audit/image_inventory.csv`: read-only index of rendered figures/images from both projects.
- `audit/reference_contact_sheet.png`: visual-audit overview of all reference figures.
- `manifest.json`: machine-readable template registry.

## Visual style

The palette and base style follow the current med-autoscience display renderer defaults: primary `#245A6B`, neutral `#13293D`, audit/secondary `#8B3A3A`, light `#EEF4F7`, with consistent line widths and bottom legends. Non-exempt coordinate panels export square 1:1; heatmap/matrix/long-bar/table/image/composite panels keep readable free aspect.

## Templates

| ID | Category | med-autoscience mapping | Code | Reference |
| --- | --- | --- | --- | --- |
| `survival_km` | Survival / Kaplan-Meier | `kaplan_meier_grouped` | [`template.R`](templates/survival_km/template.R) | [`png`](figures/reference/survival_km.png) |
| `cumulative_incidence_grouped` | Survival / Kaplan-Meier | `cumulative_incidence_grouped` | [`template.R`](templates/cumulative_incidence_grouped/template.R) | [`png`](figures/reference/cumulative_incidence_grouped.png) |
| `roc_auc` | ROC / AUC | `roc_curve_binary / time_dependent_roc_horizon` | [`template.R`](templates/roc_auc/template.R) | [`png`](figures/reference/roc_auc.png) |
| `time_dependent_roc_horizon` | ROC / AUC | `time_dependent_roc_horizon` | [`template.R`](templates/time_dependent_roc_horizon/template.R) | [`png`](figures/reference/time_dependent_roc_horizon.png) |
| `calibration_curve_binary` | ROC / AUC | `calibration_curve_binary` | [`template.R`](templates/calibration_curve_binary/template.R) | [`png`](figures/reference/calibration_curve_binary.png) |
| `pr_curve_binary` | ROC / AUC | `pr_curve_binary` | [`template.R`](templates/pr_curve_binary/template.R) | [`png`](figures/reference/pr_curve_binary.png) |
| `decision_curve_binary` | ROC / AUC | `decision_curve_binary` | [`template.R`](templates/decision_curve_binary/template.R) | [`png`](figures/reference/decision_curve_binary.png) |
| `time_to_event_decision_curve` | ROC / AUC | `time_to_event_decision_curve` | [`template.R`](templates/time_to_event_decision_curve/template.R) | [`png`](figures/reference/time_to_event_decision_curve.png) |
| `time_to_event_multihorizon_calibration_panel` | ROC / AUC | `time_to_event_multihorizon_calibration_panel` | [`template.R`](templates/time_to_event_multihorizon_calibration_panel/template.R) | [`png`](figures/reference/time_to_event_multihorizon_calibration_panel.png) |
| `forest_cox` | Forest / Cox model | `forest_effect_main / multivariable_forest` | [`template.R`](templates/forest_cox/template.R) | [`png`](figures/reference/forest_cox.png) |
| `coefficient_path_panel` | Forest / Cox model | `coefficient_path_panel` | [`template.R`](templates/coefficient_path_panel/template.R) | [`png`](figures/reference/coefficient_path_panel.png) |
| `generalizability_subgroup_composite_panel` | Forest / Cox model | `generalizability_subgroup_composite_panel` | [`template.R`](templates/generalizability_subgroup_composite_panel/template.R) | [`png`](figures/reference/generalizability_subgroup_composite_panel.png) |
| `violin_box` | Violin / box comparison | `practical_factor_dot_figure` | [`template.R`](templates/violin_box/template.R) | [`png`](figures/reference/violin_box.png) |
| `bar_stacked` | Bar / stacked proportion | `risk_layering_monotonic_bars` | [`template.R`](templates/bar_stacked/template.R) | [`png`](figures/reference/bar_stacked.png) |
| `risk_layering_monotonic_bars` | Bar / stacked proportion | `risk_layering_monotonic_bars` | [`template.R`](templates/risk_layering_monotonic_bars/template.R) | [`png`](figures/reference/risk_layering_monotonic_bars.png) |
| `scatter_correlation` | Scatter / correlation | `feature_response_support_domain_panel` | [`template.R`](templates/scatter_correlation/template.R) | [`png`](figures/reference/scatter_correlation.png) |
| `embedding_umap_tsne` | UMAP / t-SNE embedding | `umap_scatter_grouped / tsne_scatter_grouped / pca_scatter_grouped` | [`template.R`](templates/embedding_umap_tsne/template.R) | [`png`](figures/reference/embedding_umap_tsne.png) |
| `heatmap` | Heatmap / matrix pattern | `heatmap_group_comparison / clustered_heatmap` | [`template.R`](templates/heatmap/template.R) | [`png`](figures/reference/heatmap.png) |
| `confusion_matrix_heatmap_binary` | Heatmap / matrix pattern | `confusion_matrix_heatmap_binary` | [`template.R`](templates/confusion_matrix_heatmap_binary/template.R) | [`png`](figures/reference/confusion_matrix_heatmap_binary.png) |
| `volcano_deg` | Volcano / differential expression | `omics_volcano_panel` | [`template.R`](templates/volcano_deg/template.R) | [`png`](figures/reference/volcano_deg.png) |
| `gsea_enrichment` | GSEA / enrichment | `pathway_enrichment_dotplot_panel / gsva_ssgsea_heatmap` | [`template.R`](templates/gsea_enrichment/template.R) | [`png`](figures/reference/gsea_enrichment.png) |
| `oncoplot_mutation` | Oncoplot / mutation landscape | `oncoplot_mutation_landscape_panel / genomic_alteration_landscape_panel` | [`template.R`](templates/oncoplot_mutation/template.R) | [`png`](figures/reference/oncoplot_mutation.png) |
| `genomic_alteration_consequence_panel` | Oncoplot / mutation landscape | `genomic_alteration_consequence_panel` | [`template.R`](templates/genomic_alteration_consequence_panel/template.R) | [`png`](figures/reference/genomic_alteration_consequence_panel.png) |
| `cnv_recurrence_summary_panel` | Oncoplot / mutation landscape | `cnv_recurrence_summary_panel` | [`template.R`](templates/cnv_recurrence_summary_panel/template.R) | [`png`](figures/reference/cnv_recurrence_summary_panel.png) |
| `waterfall` | Waterfall / ranked risk score | `risk_layering_monotonic_bars` | [`template.R`](templates/waterfall/template.R) | [`png`](figures/reference/waterfall.png) |
| `shap_dependence_panel` | Scatter / correlation | `shap_dependence_panel` | [`template.R`](templates/shap_dependence_panel/template.R) | [`png`](figures/reference/shap_dependence_panel.png) |
| `shap_summary_beeswarm` | Scatter / correlation | `shap_summary_beeswarm` | [`template.R`](templates/shap_summary_beeswarm/template.R) | [`png`](figures/reference/shap_summary_beeswarm.png) |
| `shap_waterfall_local_explanation_panel` | Waterfall / ranked risk score | `shap_waterfall_local_explanation_panel` | [`template.R`](templates/shap_waterfall_local_explanation_panel/template.R) | [`png`](figures/reference/shap_waterfall_local_explanation_panel.png) |
| `model_complexity_audit_panel` | Scatter / correlation | `model_complexity_audit_panel` | [`template.R`](templates/model_complexity_audit_panel/template.R) | [`png`](figures/reference/model_complexity_audit_panel.png) |
| `celltype_marker_dotplot_panel` | Heatmap / matrix pattern | `celltype_marker_dotplot_panel` | [`template.R`](templates/celltype_marker_dotplot_panel/template.R) | [`png`](figures/reference/celltype_marker_dotplot_panel.png) |
| `sankey_alluvial` | Sankey / alluvial flow | `atlas_spatial_trajectory_storyboard_panel` | [`template.R`](templates/sankey_alluvial/template.R) | [`png`](figures/reference/sankey_alluvial.png) |
| `radar` | Radar / radial profile | `practical_factor_dot_figure` | [`template.R`](templates/radar/template.R) | [`png`](figures/reference/radar.png) |
| `baseline_table` | Baseline / summary table | `table1_baseline_characteristics` | [`template.R`](templates/baseline_table/template.R) | [`png`](figures/reference/baseline_table.png) |

## Rebuild

From the parent workspace:

```bash
python3 tools/build_graph_template_assets.py
```

Source projects are read-only inputs; generated files are written under `outputs/med_autoscience_graph_templates/`.
