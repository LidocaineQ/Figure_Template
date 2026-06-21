suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(features=c(5,10,20,35,55,80), cv_auc=c(.72,.79,.84,.86,.855,.845), external_auc=c(.70,.77,.82,.84,.825,.80)) }
make_plot <- function(data = make_example_data()) { long <- rbind(data.frame(features=data$features, auc=data$cv_auc, metric="Cross-validation"), data.frame(features=data$features, auc=data$external_auc, metric="External validation")); ggplot(long, aes(features, auc, colour=metric)) + geom_line(linewidth=.85) + geom_point(size=2.1) + geom_vline(xintercept=35, linetype="dashed", colour=mas_palette$secondary, linewidth=.5) + scale_colour_manual(values=mas_discrete[1:2]) + scale_y_continuous(limits=c(.65,.90)) + labs(title="Model complexity audit", subtitle="Performance vs feature count", x="Number of retained features", y="AUC") + mas_theme() + theme(aspect.ratio=1) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "model_complexity_audit_panel", width = 4.8, height = 4.8)
