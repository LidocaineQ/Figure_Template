suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  data.frame(term = factor(c("Risk score high", "cT stage III-IV", "N positive", "Age >= 65", "Left-sided"), levels = rev(c("Risk score high", "cT stage III-IV", "N positive", "Age >= 65", "Left-sided"))), estimate = c(2.10, 1.65, 1.48, 1.12, 0.82), lower = c(1.42, 1.10, 1.02, 0.82, 0.60), upper = c(3.12, 2.49, 2.15, 1.55, 1.14), p = c("0.001", "0.018", "0.040", "0.48", "0.24"))
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(estimate, term)) + geom_vline(xintercept = 1, linetype = "dashed", linewidth = 0.55, colour = mas_palette$muted) + geom_errorbar(aes(xmin = lower, xmax = upper), orientation = "y", width = 0.18, linewidth = 0.75, colour = mas_palette$primary) + geom_point(size = 2.4, colour = mas_palette$secondary) + geom_text(aes(label = paste0("P=", p), x = 3.25), hjust = 0, size = 3.0, colour = mas_palette$neutral) + scale_x_log10(limits = c(0.45, 4.2), breaks = c(.5, 1, 2, 4)) + labs(title = "Forest plot", subtitle = "Effect estimates with 95% CI", x = "Hazard ratio (log scale)", y = NULL) + mas_theme() + theme(aspect.ratio = 1)
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "forest_cox", width = 4.8, height = 4.8)
