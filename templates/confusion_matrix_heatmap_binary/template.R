suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(predicted=rep(c("Negative","Positive"), 2), truth=rep(c("Negative","Positive"), each=2), n=c(132,18,24,96)) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(predicted, truth, fill=n)) + geom_tile(colour="white", linewidth=.8) + geom_text(aes(label=n), size=6, fontface="bold", colour=mas_palette$neutral) + scale_fill_gradient(low=mas_palette$light, high=mas_palette$primary) + coord_equal() + labs(title="Binary confusion matrix", subtitle="Fixed-threshold classification errors", x="Predicted label", y="True label", fill="N") + mas_theme() }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "confusion_matrix_heatmap_binary", width = 4.8, height = 4.8)
