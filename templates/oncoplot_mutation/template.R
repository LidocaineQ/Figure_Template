suppressPackageStartupMessages({library(ggplot2); library(jsonlite); library(grid); library(graphics)})
args_all <- commandArgs(FALSE)
file_arg <- args_all[grepl("^--file=", args_all)]
this_file <- if (length(file_arg)) sub("^--file=", "", file_arg[[1]]) else normalizePath(".")
template_dir <- dirname(normalizePath(this_file))
shared_theme <- file.path(dirname(template_dir), "_shared", "mas_theme.R")
source(shared_theme)
`%||%` <- function(x, y) if (is.null(x)) y else x
make_example_data <- function() {
  data.frame(
    Hugo_Symbol = c("APC", "TP53", "KRAS", "SMAD4", "PIK3CA", "BRAF", "APC", "KRAS", "TP53", "PIK3CA"),
    Chromosome = c("5", "17", "12", "18", "3", "7", "5", "12", "17", "3"),
    Start_Position = seq(1001, 1010),
    End_Position = seq(1001, 1010),
    Reference_Allele = "A",
    Tumor_Seq_Allele2 = "T",
    Variant_Classification = c("Missense_Mutation", "Nonsense_Mutation", "Missense_Mutation", "Frame_Shift_Del", "Missense_Mutation", "Missense_Mutation", "Splice_Site", "Missense_Mutation", "Missense_Mutation", "Frame_Shift_Ins"),
    Variant_Type = "SNP",
    Tumor_Sample_Barcode = c("S01", "S01", "S02", "S03", "S04", "S05", "S06", "S07", "S08", "S09")
  )
}
make_plot <- function(data = make_example_data()) {
  clinical_df <- data.frame(
    Tumor_Sample_Barcode = unique(data$Tumor_Sample_Barcode),
    RiskGroup = rep(c("Low", "High"), length.out = length(unique(data$Tumor_Sample_Barcode)))
  )
  maf_obj <- maftools::read.maf(maf = data, clinicalData = clinical_df, verbose = FALSE)
  op <- graphics::par(no.readonly = TRUE)
  on.exit(graphics::par(op), add = TRUE)
  graphics::par(mar = c(1.2, 1.2, 1.2, 1.2), xpd = NA)
  maftools::oncoplot(
    maf = maf_obj,
    top = 8,
    fontSize = 0.8,
    showTumorSampleBarcodes = FALSE,
    clinicalFeatures = "RiskGroup",
    sortByAnnotation = TRUE,
    annotationColor = list(RiskGroup = c(Low = mas_palette$primary, High = mas_palette$secondary)),
    colors = c(Missense_Mutation = mas_palette$primary, Nonsense_Mutation = mas_palette$secondary, Frame_Shift_Del = mas_palette$accent, Frame_Shift_Ins = mas_palette$accent, Splice_Site = mas_palette$purple),
    bgCol = "white",
    borderCol = NA
  )
}

if (sys.nframe() == 0) {
  output_dir <- commandArgs(TRUE)[1] %||% "figures"
  dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)
  png(file.path(output_dir, "oncoplot_mutation.png"), width = 7.0, height = 4.8, units = "in", res = 320, bg = "white")
  make_plot()
  dev.off()
  pdf(file.path(output_dir, "oncoplot_mutation.pdf"), width = 7.0, height = 4.8, bg = "white", useDingbats = FALSE)
  make_plot()
  dev.off()
}

