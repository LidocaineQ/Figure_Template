suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(cohort = rep(c("Training", "Internal", "External"), each = 3), class = rep(c("Class 1", "Class 2", "Class 3"), times = 3), fraction = c(.35,.40,.25,.31,.43,.26,.28,.36,.36)) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(cohort, fraction, fill = class)) + geom_col(width = .68, colour = "white", linewidth = .4) + scale_fill_manual(values = mas_discrete[1:3]) + scale_y_continuous(labels = function(x) paste0(round(x * 100), "%"), expand = expansion(mult = c(0, .04))) + labs(title = "Stacked cohort composition", subtitle = "Stable legend and percent scale", x = NULL, y = "Patients") + mas_theme() }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "bar_stacked", width = 5.2, height = 3.4)
