suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { cells <- c("Tumor", "CD8 T", "Treg", "Myeloid", "Fibroblast"); markers <- c("EPCAM", "CD8A", "FOXP3", "LYZ", "COL1A1"); d <- expand.grid(cell_type=cells, marker=markers); d$pct <- c(80,8,2,5,1, 4,72,7,4,2, 1,8,62,10,3, 4,5,10,70,5, 6,2,5,8,76); d$avg <- as.numeric(scale(d$pct)); d }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(marker, cell_type, size=pct, colour=avg)) + geom_point(alpha=.9) + scale_colour_gradient2(low=mas_palette$blue, mid="white", high=mas_palette$red) + scale_size(range=c(1.5,8)) + labs(title="Cell-type marker dotplot", subtitle="Expression percent and average expression", x=NULL, y=NULL, size="Pct", colour="Avg exp") + mas_theme() + theme(axis.text.x=element_text(angle=35, hjust=1)) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "celltype_marker_dotplot_panel", width = 5.4, height = 3.7)
