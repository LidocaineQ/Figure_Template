suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(7); features <- paste0("Feature ", LETTERS[1:8]); do.call(rbind, lapply(seq_along(features), function(i) data.frame(feature=features[i], shap=rnorm(55, mean=(9-i)/28, sd=.08+.02*i), value=runif(55)))) }
make_plot <- function(data = make_example_data()) { data$feature <- factor(data$feature, levels=rev(unique(data$feature))); ggplot(data, aes(shap, feature, colour=value)) + geom_point(position=position_jitter(height=.18, width=0), alpha=.78, size=1.15) + geom_vline(xintercept=0, linewidth=.45, colour=mas_palette$muted) + scale_colour_gradient(low=mas_palette$primary, high=mas_palette$secondary) + labs(title="SHAP summary beeswarm", subtitle="Global feature contribution distribution", x="SHAP value", y=NULL, colour="Feature value") + mas_theme() + theme(aspect.ratio=1) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "shap_summary_beeswarm", width = 4.8, height = 4.8)
