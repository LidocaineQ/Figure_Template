suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  pred <- seq(.05, .95, length.out = 10)
  data.frame(predicted = pred, observed = pmin(pmax(pred + c(-.02,.01,.03,-.01,.02,.00,.04,-.02,.01,.03), 0), 1), lower = pmax(pred - .08, 0), upper = pmin(pred + .08, 1))
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(predicted, observed)) +
    geom_abline(slope = 1, intercept = 0, linetype = "dashed", linewidth = .55, colour = mas_palette$muted) +
    geom_ribbon(aes(ymin = lower, ymax = upper), fill = mas_palette$primary, alpha = .12) +
    geom_line(linewidth = .9, colour = mas_palette$primary) +
    geom_point(size = 2.1, colour = mas_palette$secondary) +
    coord_equal(xlim = c(0, 1), ylim = c(0, 1), expand = FALSE) +
    labs(title = "Calibration curve", subtitle = "Predicted probability vs observed risk", x = "Predicted risk", y = "Observed risk") +
    mas_theme()
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "calibration_curve_binary", width = 4.8, height = 4.8)
