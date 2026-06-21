suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  set.seed(3)
  mat <- matrix(rnorm(8 * 6), nrow = 8)
  rownames(mat) <- paste0("Hallmark ", LETTERS[1:8])
  colnames(mat) <- paste0("S", 1:6)
  annotation <- data.frame(RiskGroup = rep(c("Low", "High"), each = 3), row.names = colnames(mat))
  list(mat = mat, annotation = annotation)
}
make_plot <- function(data = make_example_data()) {
  col_fun <- circlize::colorRamp2(c(-2, 0, 2), c(mas_palette$blue, "white", mas_palette$red))
  ha <- ComplexHeatmap::HeatmapAnnotation(
    df = data$annotation,
    col = list(RiskGroup = c(Low = mas_palette$primary, High = mas_palette$secondary)),
    show_annotation_name = TRUE,
    annotation_name_gp = grid::gpar(col = mas_palette$neutral, fontsize = 8)
  )
  ht <- ComplexHeatmap::Heatmap(
    scale(data$mat),
    name = "Z-score",
    col = col_fun,
    top_annotation = ha,
    cluster_rows = TRUE,
    cluster_columns = FALSE,
    show_column_names = TRUE,
    row_names_gp = grid::gpar(fontsize = 8, col = mas_palette$neutral),
    column_names_gp = grid::gpar(fontsize = 8, col = mas_palette$neutral),
    border = FALSE,
    rect_gp = grid::gpar(col = NA),
    heatmap_legend_param = list(title_gp = grid::gpar(fontface = "bold"), labels_gp = grid::gpar(fontsize = 8))
  )
  grid::grid.grabExpr(ComplexHeatmap::draw(ht, heatmap_legend_side = "right", annotation_legend_side = "right"))
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "heatmap", width = 5.2, height = 3.7)
