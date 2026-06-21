suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(12); data.frame(group = rep(c("Responder", "Non-responder"), each = 80), value = c(rnorm(80, 0.25, .55), rnorm(80, .85, .58))) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(group, value, fill = group)) + geom_violin(width = .82, alpha = .72, colour = "white", linewidth = .35, trim = FALSE) + geom_boxplot(width = .22, outlier.shape = NA, alpha = .9, linewidth = .45) + geom_jitter(width = .08, size = .9, alpha = .45, colour = mas_palette$neutral) + scale_fill_manual(values = mas_discrete[1:2]) + labs(title = "Distribution comparison", subtitle = "Violin + box + jitter", x = NULL, y = "Signature score") + annotate("text", x = 1.5, y = max(data$value) + .25, label = "Wilcoxon P = 0.004", size = 3.1, colour = mas_palette$neutral) + mas_theme() + theme(aspect.ratio=1) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "violin_box", width = 4.8, height = 4.8)
