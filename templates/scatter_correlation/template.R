suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(5); x <- rnorm(120); group <- rep(c("A", "B"), each = 60); data.frame(x=x, y=.58*x + rnorm(120, sd=.72) + ifelse(group=="B", .25, 0), group=group) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(x, y, colour = group)) + geom_point(size = 1.8, alpha = .76) + geom_smooth(method = "lm", formula = y ~ x, se = TRUE, linewidth = .75, alpha = .12) + scale_colour_manual(values = mas_discrete[1:2]) + labs(title = "Correlation scatter", subtitle = "Regression line with statistic slot", x = "Feature score", y = "Outcome-associated score") + annotate("text", x = min(data$x), y = max(data$y), hjust = 0, label = "Spearman r = 0.53
P < 0.001", size = 3.05, colour = mas_palette$neutral) + mas_theme() + theme(aspect.ratio=1) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "scatter_correlation", width = 4.8, height = 4.8)
