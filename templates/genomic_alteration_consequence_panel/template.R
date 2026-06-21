suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() { data.frame(alteration=factor(c("KRAS mut", "BRAF mut", "SMAD4 loss", "PIK3CA mut"), levels=rev(c("KRAS mut", "BRAF mut", "SMAD4 loss", "PIK3CA mut"))), estimate=c(1.32,1.78,1.55,.82), lower=c(1.05,1.18,1.10,.58), upper=c(1.72,2.65,2.30,1.16), q=c(.030,.008,.018,.24)) }
make_plot <- function(data = make_example_data()) { ggplot(data, aes(estimate, alteration)) + geom_vline(xintercept=1, linetype="dashed", colour=mas_palette$muted, linewidth=.5) + geom_errorbar(aes(xmin=lower, xmax=upper), orientation="y", width=.16, colour=mas_palette$primary, linewidth=.7) + geom_point(size=2.4, colour=mas_palette$secondary) + geom_text(aes(x=2.85, label=paste0("FDR=", q)), hjust=0, size=3, colour=mas_palette$neutral) + scale_x_log10(limits=c(.45,3.6), breaks=c(.5,1,2,3)) + labs(title="Genomic alteration consequence", subtitle="Functional or clinical effect summary", x="Effect estimate", y=NULL) + mas_theme() }
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "genomic_alteration_consequence_panel", width = 5.3, height = 3.5)
