suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(4); x <- runif(180,0,1); data.frame(feature_value=x, shap=.75*(x-.45)^2 - .10 + rnorm(180,0,.045), subgroup=ifelse(x>.55,"High context","Low context")) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(feature_value, shap, colour=subgroup)) + geom_point(alpha=.75, size=1.5) + geom_smooth(method="loess", formula=y~x, se=FALSE, linewidth=.8) + scale_colour_manual(values=mas_discrete[1:2]) + labs(title="SHAP dependence panel", subtitle="Feature value vs model contribution", x="Feature value", y="SHAP value") + mas_theme() + theme(aspect.ratio=1) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "shap_dependence_panel", width = 4.8, height = 4.8)
