suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  data.frame(cohort = factor(c("Internal", "External A", "External B", "Age <65", "Age >=65", "Stage II", "Stage III"), levels=rev(c("Internal", "External A", "External B", "Age <65", "Age >=65", "Stage II", "Stage III"))), metric = c(.86,.82,.79,.85,.81,.83,.84), lower=c(.82,.76,.71,.79,.75,.77,.78), upper=c(.90,.88,.86,.91,.87,.89,.90), family=c("Cohort","Cohort","Cohort","Subgroup","Subgroup","Subgroup","Subgroup"))
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(metric, cohort, colour=family)) + geom_vline(xintercept=.80, linetype="dashed", linewidth=.5, colour=mas_palette$muted) + geom_errorbar(aes(xmin=lower, xmax=upper), orientation="y", width=.18, linewidth=.65) + geom_point(size=2.4) + scale_colour_manual(values=mas_discrete[1:2]) + scale_x_continuous(limits=c(.65,.95)) + labs(title="Generalizability composite", subtitle="Performance stability across cohorts and subgroups", x="AUC / C-index", y=NULL) + mas_theme() + theme(aspect.ratio=1)
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "generalizability_subgroup_composite_panel", width = 4.8, height = 4.8)
