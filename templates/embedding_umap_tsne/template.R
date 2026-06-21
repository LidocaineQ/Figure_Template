suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { set.seed(33); centers <- data.frame(cell_type = c("Tumor", "T cell", "Myeloid", "Stromal"), cx = c(-1.8, 1.6, .4, -0.4), cy = c(.9, .8, -1.4, -0.5)); do.call(rbind, lapply(seq_len(nrow(centers)), function(i) data.frame(dim1 = rnorm(90, centers$cx[i], .45), dim2 = rnorm(90, centers$cy[i], .38), cell_type = centers$cell_type[i]))) }
make_plot <- function(data = make_example_data()) { centers <- aggregate(cbind(dim1, dim2) ~ cell_type, data, mean); ggplot(data, aes(dim1, dim2, colour = cell_type)) + geom_point(size = 1.2, alpha = .72) + geom_text(data = centers, aes(label = cell_type), colour = mas_palette$neutral, fontface = "bold", size = 3.2, show.legend = FALSE) + scale_colour_manual(values = mas_discrete[1:4]) + coord_equal() + labs(title = "Embedding scatter", subtitle = "Grouped embedding view", x = "Dimension 1", y = "Dimension 2") + mas_theme() + theme(panel.grid = element_blank()) }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "embedding_umap_tsne", width = 4.8, height = 4.8)
