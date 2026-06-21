suppressPackageStartupMessages({library(ggplot2); library(gridExtra); library(grid); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(Variable = c("Age, median (IQR)", "Male sex", "cT3-4", "N positive", "pCR"), Overall = c("61 (54-68)", "186 (58%)", "248 (77%)", "210 (65%)", "72 (22%)"), LowRisk = c("59 (52-67)", "78 (55%)", "101 (71%)", "84 (59%)", "45 (32%)"), HighRisk = c("63 (56-70)", "108 (60%)", "147 (82%)", "126 (70%)", "27 (15%)"), P = c("0.041", "0.42", "0.028", "0.037", "<0.001")) }
make_plot <- function(data = make_example_data()) { tg <- gridExtra::tableGrob(data, rows = NULL, theme = gridExtra::ttheme_minimal(base_size = 9, core = list(fg_params = list(col = mas_palette$neutral), bg_params = list(fill = c("white", mas_palette$light), col = "white")), colhead = list(fg_params = list(fontface = "bold", col = "white"), bg_params = list(fill = mas_palette$primary, col = "white")))); title <- grid::textGrob("Baseline characteristics table", x = 0, hjust = 0, gp = grid::gpar(fontface = "bold", fontsize = 13, col = mas_palette$neutral)); subtitle <- grid::textGrob("Table shell rendered as visual reference", x = 0, hjust = 0, gp = grid::gpar(fontsize = 9.5, col = mas_palette$muted)); gridExtra::arrangeGrob(title, subtitle, tg, heights = c(.12,.10,.78)) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "baseline_table", width = 5.7, height = 3.2)
