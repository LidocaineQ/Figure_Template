suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(pathway = factor(c("EMT", "G2M checkpoint", "Angiogenesis", "IFN-gamma", "Oxidative phosphorylation", "T cell activation"), levels = rev(c("EMT", "G2M checkpoint", "Angiogenesis", "IFN-gamma", "Oxidative phosphorylation", "T cell activation"))), gene_ratio = c(.21,.18,.14,.12,.10,.08), nes = c(2.1,1.7,1.35,-1.4,-1.65,-2.0), fdr = c(.001,.006,.018,.030,.014,.004)) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(gene_ratio, pathway, size = -log10(fdr), colour = nes)) + geom_point(alpha = .9) + scale_colour_gradient2(low = mas_palette$blue, mid = "white", high = mas_palette$red, midpoint = 0) + scale_size(range = c(2.6, 7.5)) + labs(title = "Pathway enrichment dotplot", subtitle = "NES colour, FDR size", x = "Gene ratio", y = NULL, colour = "NES", size = "-log10 FDR") + mas_theme() }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "gsea_enrichment", width = 5.3, height = 3.7)
