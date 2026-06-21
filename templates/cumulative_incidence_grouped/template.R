suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  t <- seq(0, 60, by = 5)
  rbind(
    data.frame(time = t, incidence = 1 - exp(-t/62), group = "High Risk"),
    data.frame(time = t, incidence = 1 - exp(-t/110), group = "Low Risk")
  )
}
make_plot <- function(data = make_example_data()) {
  ggplot(data, aes(time, incidence, colour = group)) +
    geom_step(linewidth = .9, direction = "hv") +
    scale_colour_manual(values = c("Low Risk" = mas_palette$primary, "High Risk" = mas_palette$secondary)) +
    scale_x_continuous(breaks = seq(0, 60, 10), limits = c(0,60), expand = c(0,0)) +
    scale_y_continuous(limits = c(0,.65), labels = function(x) paste0(round(x*100), "%"), expand = c(0,0)) +
    labs(title = "Cumulative incidence curve", subtitle = "Grouped time-to-event incidence", x = "Time, months", y = "Cumulative incidence") +
    mas_theme() + theme(aspect.ratio = 1)
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "cumulative_incidence_grouped", width = 4.8, height = 4.8)
