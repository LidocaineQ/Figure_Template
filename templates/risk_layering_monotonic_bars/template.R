suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  data.frame(layer = factor(c("Q1 lowest", "Q2", "Q3", "Q4 highest"), levels = c("Q1 lowest", "Q2", "Q3", "Q4 highest")), event_rate = c(.09,.16,.28,.43), lower = c(.05,.10,.20,.33), upper = c(.15,.24,.37,.54))
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(layer, event_rate)) +
    geom_col(fill = mas_palette$primary, width = .68, alpha = .88) +
    geom_errorbar(aes(ymin = lower, ymax = upper), width = .14, linewidth = .55, colour = mas_palette$neutral) +
    geom_line(aes(group = 1), linewidth = .55, colour = mas_palette$secondary) + geom_point(size = 2, colour = mas_palette$secondary) +
    scale_y_continuous(labels = function(x) paste0(round(x*100), "%"), limits = c(0,.60), expand = c(0,0)) +
    labs(title = "Monotonic risk layering", subtitle = "Risk strata show a clinical gradient", x = NULL, y = "Event rate") + mas_theme()
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "risk_layering_monotonic_bars", width = 5.2, height = 3.4)
