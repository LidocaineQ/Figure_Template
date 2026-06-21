suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(21); d <- data.frame(sample = paste0("P", 1:46), score = sort(rnorm(46, 0, 1.1))); d$response <- ifelse(d$score < -0.4, "Response", ifelse(d$score > .55, "Progression", "Stable")); d }
make_plot <- function(data = make_example_data()) { data$sample <- factor(data$sample, levels = data$sample); ggplot(data, aes(sample, score, fill = response)) + geom_col(width = .82, colour = "white", linewidth = .18) + geom_hline(yintercept = 0, linewidth = .45, colour = mas_palette$neutral) + scale_fill_manual(values = c(Response = mas_palette$primary, Stable = mas_palette$accent, Progression = mas_palette$secondary)) + labs(title = "Risk-score waterfall", subtitle = "Ranked individual predictions", x = "Patients ordered by score", y = "Risk score") + mas_theme() + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank()) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "waterfall", width = 5.3, height = 3.4)
