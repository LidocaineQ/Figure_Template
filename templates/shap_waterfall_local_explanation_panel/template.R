suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(feature=factor(c("Baseline", "CEA", "N stage", "Texture", "KRAS", "Prediction"), levels=c("Baseline", "CEA", "N stage", "Texture", "KRAS", "Prediction")), contribution=c(.22,.09,.13,-.05,.07,.46), type=c("base","positive","positive","negative","positive","final")) }
make_plot <- function(data = make_example_data()) { data$x <- seq_len(nrow(data)); data$start <- c(0, head(cumsum(data$contribution), -1)); data$end <- cumsum(data$contribution); ggplot(data, aes(x=x)) + geom_segment(aes(xend=x, y=start, yend=end, colour=type), linewidth=7, lineend="butt") + geom_hline(yintercept=0, linewidth=.45, colour=mas_palette$muted) + scale_colour_manual(values=c(base=mas_palette$muted, positive=mas_palette$secondary, negative=mas_palette$primary, final=mas_palette$accent)) + scale_x_continuous(breaks=data$x, labels=data$feature) + labs(title="SHAP waterfall explanation", subtitle="Single-patient local contribution", x=NULL, y="Prediction contribution") + mas_theme() + theme(axis.text.x=element_text(angle=35, hjust=1)) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "shap_waterfall_local_explanation_panel", width = 5.3, height = 3.5)
