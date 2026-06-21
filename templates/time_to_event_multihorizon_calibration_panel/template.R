suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  pred <- rep(seq(.1,.9,length.out=6), 3)
  horizon <- rep(c("12 months", "36 months", "60 months"), each=6)
  observed <- pred + rep(c(-.03,.01,.04,-.02,.02,.03), 3) + rep(c(-.02,0,.02), each=6)
  data.frame(predicted=pred, observed=pmin(pmax(observed,0),1), horizon=horizon)
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(predicted, observed, colour=horizon)) + geom_abline(slope=1, intercept=0, linetype="dashed", colour=mas_palette$muted, linewidth=.5) + geom_line(linewidth=.82) + geom_point(size=1.8) + scale_colour_manual(values=mas_discrete[1:3]) + coord_equal(xlim=c(0,1), ylim=c(0,1), expand=FALSE) + labs(title="Multi-horizon calibration", subtitle="Time-to-event predicted risk reliability", x="Predicted risk", y="Observed risk") + mas_theme()
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "time_to_event_multihorizon_calibration_panel", width = 4.8, height = 4.8)
