suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  x <- seq(0, 1, length.out = 80)
  rbind(
    data.frame(fpr = x, tpr = 1 - (1 - x)^2.5, model = "MAS model", auc = "AUC 0.86"),
    data.frame(fpr = x, tpr = 1 - (1 - x)^1.55, model = "Clinical model", auc = "AUC 0.74")
  )
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(fpr, tpr, colour = model)) +
    geom_abline(slope = 1, intercept = 0, linetype = "dashed", linewidth = 0.55, colour = mas_palette$muted) +
    geom_line(linewidth = 0.95) +
    scale_colour_manual(values = mas_discrete[1:2]) +
    coord_equal(xlim = c(0, 1), ylim = c(0, 1), expand = FALSE) +
    labs(title = "ROC curve", subtitle = "Binary or horizon-specific discrimination", x = "1 - Specificity", y = "Sensitivity") +
    annotate("text", x = .98, y = .13, hjust = 1, label = "MAS model AUC 0.86
Clinical model AUC 0.74", size = 3.1, colour = mas_palette$neutral) +
    mas_theme()
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "roc_auc", width = 4.8, height = 4.8)
