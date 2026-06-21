suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(9); n <- 420; d <- data.frame(feature = paste0("GENE", seq_len(n)), log2_fc = rnorm(n, 0, 1.15), neg_log10_p = rexp(n, rate = .8)); d$status <- ifelse(d$log2_fc > 1 & d$neg_log10_p > 1.3, "Up", ifelse(d$log2_fc < -1 & d$neg_log10_p > 1.3, "Down", "NS")); d }
make_plot <- function(data = make_example_data()) { labels <- head(subset(data, status != "NS")[order(-subset(data, status != "NS")$neg_log10_p), ], 8); ggplot(data, aes(log2_fc, neg_log10_p, colour = status)) + geom_point(size = 1.35, alpha = .78) + geom_vline(xintercept = c(-1, 1), linetype = "dashed", linewidth = .45, colour = mas_palette$muted) + geom_hline(yintercept = 1.3, linetype = "dashed", linewidth = .45, colour = mas_palette$muted) + geom_text(data = labels, aes(label = feature), size = 2.6, check_overlap = TRUE, colour = mas_palette$neutral, show.legend=FALSE) + scale_colour_manual(values = c(Down = mas_palette$primary, NS = "#CBD5E1", Up = mas_palette$secondary)) + labs(title = "Volcano plot", subtitle = "Differential-expression screening", x = "log2 fold-change", y = "-log10 adjusted P") + mas_theme() + theme(aspect.ratio=1) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "volcano_deg", width = 4.8, height = 4.8)
