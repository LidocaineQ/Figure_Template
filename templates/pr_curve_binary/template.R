suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  recall <- seq(0, 1, length.out = 90)
  rbind(
    data.frame(recall = recall, precision = .35 + .62 * (1 - recall)^.65, model = "MAS model"),
    data.frame(recall = recall, precision = .25 + .52 * (1 - recall)^.90, model = "Clinical model")
  )
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(recall, precision, colour = model)) +
    geom_hline(yintercept = .22, linetype = "dashed", linewidth = .5, colour = mas_palette$muted) +
    geom_line(linewidth = .95) +
    scale_colour_manual(values = mas_discrete[1:2]) +
    coord_equal(xlim = c(0,1), ylim = c(0,1), expand = FALSE) +
    labs(title = "Precision-recall curve", subtitle = "For imbalanced binary outcomes", x = "Recall", y = "Precision") +
    mas_theme()
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "pr_curve_binary", width = 4.8, height = 4.8)
