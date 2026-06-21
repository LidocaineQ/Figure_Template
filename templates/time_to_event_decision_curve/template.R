suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  t <- seq(.05, .80, length.out = 80)
  rbind(
    data.frame(threshold = t, net_benefit = .18 - .13 * t + .025 * sin(t * 9), strategy = "MAS model"),
    data.frame(threshold = t, net_benefit = .12 - .11 * t, strategy = "Clinical model"),
    data.frame(threshold = t, net_benefit = .06 - .07 * t, strategy = "Treat all"),
    data.frame(threshold = t, net_benefit = 0, strategy = "Treat none")
  )
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(threshold, net_benefit, colour = strategy)) +
    geom_hline(yintercept = 0, linewidth = .45, colour = mas_palette$muted) +
    geom_line(linewidth = .9) +
    scale_colour_manual(values = c(mas_palette$primary, mas_palette$secondary, mas_palette$accent, mas_palette$muted)) +
    labs(title = "Decision curve", subtitle = "Net benefit across clinical thresholds", x = "Threshold probability", y = "Net benefit") +
    mas_theme() + theme(aspect.ratio = 1)
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "time_to_event_decision_curve", width = 4.8, height = 4.8)
