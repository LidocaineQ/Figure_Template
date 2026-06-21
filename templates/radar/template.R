suppressPackageStartupMessages({library(ggplot2); library(jsonlite)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  data.frame(
    group = c("Responder", "Non-responder"),
    CD8 = c(.68, .42), CD4 = c(.63, .51), M1 = c(.58, .30), M2 = c(.25, .65), TLS = c(.66, .38), Ki67 = c(.35, .69)
  )
}
make_plot <- function(data = make_example_data()) {
  if (requireNamespace("ggradar", quietly = TRUE)) {
    p <- ggradar::ggradar(
      data,
      centre.y = 0,
      grid.min = 0.1,
      grid.mid = 0.4,
      grid.max = 0.7,
      values.radar = c(0, 0.3, 0.6),
      background.circle.colour = "grey95",
      gridline.max.colour = mas_palette$muted,
      gridline.min.colour = mas_palette$soft_grid,
      gridline.mid.colour = mas_palette$soft_grid,
      grid.label.size = 4,
      grid.line.width = 0.55,
      axis.label.offset = 1.15,
      axis.label.size = 3.5,
      group.line.width = 0.7,
      group.point.size = 1.8,
      group.colours = c(mas_palette$primary, mas_palette$accent),
      legend.position = "bottom",
      plot.extent.x.sf = 1.35,
      plot.extent.y.sf = 1.15
    )
    p$labels$size <- NULL
    p +
      labs(title = "Radar immune profile", subtitle = "ggradar source-project template") +
      theme(
        panel.border = element_blank(),
        plot.title = element_text(size = 12.5, face = "bold", colour = mas_palette$neutral),
        plot.subtitle = element_text(size = 9.5, colour = mas_palette$muted)
      )
  } else {
    long <- tidyr::pivot_longer(data, -group, names_to = "axis", values_to = "score")
    long$axis <- factor(long$axis, levels = names(data)[-1])
    ggplot(long, aes(axis, score, group = group, colour = group, fill = group)) +
      geom_polygon(alpha = .10, linewidth = .65) +
      geom_point(size = 1.6) +
      # Fallback intentionally stays non-polar so the source-project ggradar path
      # remains the only radar implementation contract.
      coord_cartesian(ylim = c(0, 1), expand = FALSE) +
      scale_y_continuous(limits = c(0, 1), breaks = c(.25, .5, .75, 1)) +
      scale_colour_manual(values = mas_discrete[1:2]) +
      scale_fill_manual(values = mas_discrete[1:2]) +
      labs(title = "Radar immune profile", subtitle = "Install ggradar for source-project rendering", x = NULL, y = NULL) +
      mas_theme() +
      theme(panel.border = element_blank(), panel.grid.major = element_line(colour = mas_palette$soft_grid, linewidth = .35))
  }
}
if (sys.nframe() == 0) save_mas_plot(make_plot(), commandArgs(TRUE)[1] %||% "figures", "radar", width = 4.8, height = 4.8)
