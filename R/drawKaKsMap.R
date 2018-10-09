#' @title Draw KaKs Map
#' @name drawKaKsMap
#' @param tree phylo object created by calling read.tree on a newick tree file
#' @param table table contianing output from kaks_calculator
#' @param radiusMainCircle desired radius for the main circle
#' @param radiusGeneDots desired radius for the plotted genes
#' @export
drawKaKsMap <- function(tree, table, radiusMainCircle, radiusGeneDots){
  plot.new()
  par(pty = "s")
  p <- plot(0, 0, asp = 1, type = "n", xaxt = "n", yaxt = "n", ann = FALSE)
  points <- plotGenesOnCircle(tree, radiusMainCircle, x = 0, y = 0, plot = p, geneCircleRadius = radiusGeneDots)
  plotLinesOfKaKsValues(tree, table, points, plot = p)
}
# [END]
