suppressPackageStartupMessages({library(ggplot2); library(jsonlite); library(patchwork); library(scales); library(dplyr)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  times <- c(0, 12, 24, 36, 48, 60)
  curves <- rbind(
    data.frame(time = times, survival = c(1, .93, .84, .74, .65, .56), group = "High Risk"),
    data.frame(time = times, survival = c(1, .97, .92, .86, .80, .74), group = "Low Risk")
  )
  risk_table <- rbind(
    data.frame(time = times, n_risk = c(168, 132, 101, 78, 49, 29), group = "High Risk"),
    data.frame(time = times, n_risk = c(162, 145, 128, 96, 71, 55), group = "Low Risk")
  )
  list(curves = curves, risk_table = risk_table)
}
risk_table_df <- function(risk_table, times = seq(0, 60, 12)) {
  risk_table$time <- as.numeric(risk_table$time)
  risk_table$group <- factor(risk_table$group, levels = c("High Risk", "Low Risk"))
  risk_table |>
    filter(time %in% times) |>
    mutate(hjust = case_when(time <= min(times) ~ 0, time >= max(times) ~ 1, TRUE ~ 0.5))
}
make_plot <- function(data = make_example_data()) {
  times <- seq(0, 60, 12)
  curve_df <- data$curves
  curve_df$group <- factor(curve_df$group, levels = c("Low Risk", "High Risk"))
  risk_df <- risk_table_df(data$risk_table, times)
  p_curve <- ggplot(curve_df, aes(time, survival, colour = group)) +
    geom_step(linewidth = 0.75, direction = "hv") +
    geom_point(size = 1.25) +
    annotate("text", x = 60, y = .48, hjust = 1, label = "log-rank P = 0.012", colour = mas_palette$neutral, size = 2.8) +
    scale_colour_manual(values = c("Low Risk" = mas_palette$primary, "High Risk" = mas_palette$secondary)) +
    scale_x_continuous(breaks = times, limits = c(0, 60), expand = c(0, 0)) +
    scale_y_continuous(limits = c(.45, 1.01), breaks = seq(.5, 1, .1), expand = c(0, 0)) +
    labs(title = "Kaplan-Meier curve with risk table", subtitle = "ctcluster v4-style No. at risk", x = NULL, y = "Survival probability") +
    mas_theme(base_size = 9.5) +
    theme(
      aspect.ratio = .78,
      legend.position = c(.72, .88),
      legend.background = element_rect(fill = scales::alpha("white", .72), colour = NA),
      axis.text.x = element_blank(),
      axis.ticks.x = element_blank(),
      axis.title.x = element_blank(),
      plot.margin = margin(1, 2, 0, 2)
    )
  p_risk <- ggplot(risk_df, aes(time, group)) +
    geom_text(aes(label = n_risk, colour = group, hjust = hjust), size = 2.55, fontface = "bold") +
    scale_colour_manual(values = c("Low Risk" = mas_palette$primary, "High Risk" = mas_palette$secondary)) +
    scale_x_continuous(breaks = times, limits = c(0, 60), expand = expansion(mult = c(0, .02))) +
    labs(x = "Time (months)", y = "No. at risk") +
    mas_theme(base_size = 8.2) +
    theme(
      legend.position = "none",
      panel.grid.major.y = element_blank(),
      panel.grid.minor = element_blank(),
      axis.title.y = element_text(size = 8, angle = 0, vjust = .5, margin = margin(r = 14)),
      axis.text.y = element_text(face = "bold", colour = mas_palette$neutral, margin = margin(r = 8)),
      axis.ticks.y = element_blank(),
      plot.title = element_blank(),
      plot.subtitle = element_blank(),
      plot.margin = margin(0, 2, 1, 2)
    )
  p_curve / patchwork::plot_spacer() / p_risk + patchwork::plot_layout(heights = c(0.60, 0.10, 0.30))
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "survival_km", width = 4.8, height = 4.8)
