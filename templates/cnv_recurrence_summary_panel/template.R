suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(chrom=factor(rep(paste0("chr",1:6), each=2), levels=paste0("chr",1:6)), event=rep(c("Gain","Loss"),6), freq=c(.18,.05,.22,.09,.12,.16,.28,.07,.15,.11,.10,.20)) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(chrom, ifelse(event=="Loss", -freq, freq), fill=event)) + geom_col(width=.7, colour="white", linewidth=.25) + geom_hline(yintercept=0, colour=mas_palette$neutral, linewidth=.45) + scale_fill_manual(values=c(Gain=mas_palette$secondary, Loss=mas_palette$primary)) + scale_y_continuous(labels=function(x) paste0(abs(round(x*100)), "%")) + labs(title="CNV recurrence summary", subtitle="Recurrent gains and losses", x=NULL, y="Sample frequency") + mas_theme() }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "cnv_recurrence_summary_panel", width = 5.3, height = 3.4)
