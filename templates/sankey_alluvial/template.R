suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  data.frame(
    left_group = c("CMS1", "CMS1", "CMS2", "CMS2", "CMS3", "CMS4"),
    right_group = c("Immune", "Stromal", "Metabolic", "Stromal", "Metabolic", "Immune"),
    n = c(18, 9, 22, 13, 14, 20)
  )
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(axis1 = left_group, axis2 = right_group, y = n)) +
    ggalluvial::geom_alluvium(aes(fill = right_group), width = 0.18, alpha = 0.86, knot.pos = 0.42) +
    ggalluvial::geom_stratum(width = 0.18, fill = "white", colour = NA, linewidth = 0) +
    ggalluvial::stat_stratum(geom = "text", aes(label = after_stat(stratum)), size = 3.0, colour = mas_palette$neutral) +
    scale_fill_manual(values = mas_discrete[1:3]) +
    scale_x_discrete(limits = c("Baseline subtype", "Post-treatment state"), expand = c(0.08, 0.08)) +
    labs(title = "Subtype transition alluvial", subtitle = "ggalluvial template without outer frame", x = NULL, y = NULL) +
    mas_theme() +
    theme(
      legend.position = "top",
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border = element_blank(),
      axis.line = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks = element_blank(),
      axis.title.y = element_blank()
    )
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "sankey_alluvial", width = 5.3, height = 3.5)
