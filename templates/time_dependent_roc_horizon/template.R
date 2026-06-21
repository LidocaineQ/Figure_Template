suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  fpr <- seq(0,1,length.out=70)
  rbind(
    data.frame(fpr=fpr, tpr=1-(1-fpr)^2.1, horizon="12 months"),
    data.frame(fpr=fpr, tpr=1-(1-fpr)^2.5, horizon="36 months"),
    data.frame(fpr=fpr, tpr=1-(1-fpr)^2.0, horizon="60 months")
  )
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(fpr, tpr, colour = horizon)) + geom_abline(slope=1, intercept=0, linetype="dashed", colour=mas_palette$muted, linewidth=.5) + geom_line(linewidth=.9) + scale_colour_manual(values=mas_discrete[1:3]) + coord_equal(xlim=c(0,1), ylim=c(0,1), expand=FALSE) + labs(title="Time-dependent ROC", subtitle="AUC by landmark horizon", x="1 - Specificity", y="Sensitivity") + mas_theme()
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "time_dependent_roc_horizon", width = 4.8, height = 4.8)
