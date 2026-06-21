# MAS graph-template shared style helpers.
# Palette follows med-autoscience display-pack defaults observed in renderer code:
# primary #245A6B, neutral #13293D, audit/secondary #8B3A3A, light #EEF4F7.
suppressPackageStartupMessages({
  library(ggplot2)
})

mas_palette <- jsonlite::fromJSON('{"primary": "#245A6B", "secondary": "#8B3A3A", "accent": "#D8A24A", "neutral": "#13293D", "muted": "#64748B", "light": "#EEF4F7", "soft_grid": "#E6EDF2", "teal": "#2A9D8F", "purple": "#6D5BD0", "blue": "#2166AC", "red": "#B2182B"}')
mas_discrete <- c(mas_palette$primary, mas_palette$secondary, mas_palette$accent, mas_palette$teal, mas_palette$purple, mas_palette$muted)

mas_theme <- function(base_size = 11) {
  theme_bw(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", colour = mas_palette$neutral, size = 12.5, margin = margin(b = 6)),
      plot.subtitle = element_text(colour = mas_palette$muted, size = 9.5, margin = margin(b = 8)),
      axis.title = element_text(face = "bold", colour = mas_palette$neutral, size = 10.5),
      axis.text = element_text(colour = mas_palette$neutral, size = 9.2),
      legend.position = "bottom",
      legend.title = element_blank(),
      legend.text = element_text(colour = mas_palette$neutral, size = 9),
      panel.grid.minor = element_blank(),
      panel.grid.major = element_line(colour = mas_palette$soft_grid, linewidth = 0.25),
      panel.border = element_rect(colour = mas_palette$neutral, linewidth = 0.45),
      strip.background = element_rect(fill = mas_palette$light, colour = mas_palette$soft_grid, linewidth = 0.4),
      strip.text = element_text(face = "bold", colour = mas_palette$neutral),
      plot.margin = margin(9, 10, 8, 10)
    )
}

save_mas_plot <- function(plot, output_dir, template_id, width = 4.8, height = 4.8, dpi = 320) {
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  png_path <- file.path(output_dir, paste0(template_id, ".png"))
  pdf_path <- file.path(output_dir, paste0(template_id, ".pdf"))
  ggsave(png_path, plot = plot, width = width, height = height, dpi = dpi, bg = "white")
  ggsave(pdf_path, plot = plot, width = width, height = height, bg = "white")
  invisible(c(png = png_path, pdf = pdf_path))
}
