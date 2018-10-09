#' @export
drawKaKsMap <- function(tree, table, radiusMainCircle, radiusGeneDots){
  plot.new()
  par(pty = "s")
  p <- plot(0, 0, asp = 1, type = "n", xaxt = "n", yaxt = "n", ann = FALSE)
  points <- plotGenesOnCircle(tree, radiusMainCircle, x = 0, y = 0, plot = p, geneCircleRadius = radiusGeneDots)
  plotLinesOfKaKsValues(tree, table, points, plot = p)
}
