suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  lambda <- seq(-4, 1, length.out=80); vars <- paste0("Feature ", LETTERS[1:6])
  do.call(rbind, lapply(seq_along(vars), function(i) data.frame(log_lambda=lambda, coefficient=(sin(lambda+i/2) * (7-i)/10) * pmax(0, (lambda+4)/5), feature=vars[i])))
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(log_lambda, coefficient, colour=feature)) + geom_hline(yintercept=0, linewidth=.45, colour=mas_palette$muted) + geom_vline(xintercept=-1.2, linetype="dashed", linewidth=.5, colour=mas_palette$secondary) + geom_line(linewidth=.82) + scale_colour_manual(values=rep(mas_discrete, length.out=6)) + labs(title="Coefficient path panel", subtitle="Regularization path with selected lambda", x="log(lambda)", y="Coefficient") + mas_theme() + theme(aspect.ratio=1)
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "coefficient_path_panel", width = 4.8, height = 4.8)
