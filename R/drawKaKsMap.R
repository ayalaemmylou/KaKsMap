# drawKaKsMap.R

#' @title Draw KaKs Map
#'
#' @description Take in the data and plot a KaKsMap
#'
#' @name drawKaKsMap
#'
#' @param tree phylo object created by calling read.tree on a newick tree file
#' @param table table contianing output from kaks_calculator
#' @param radiusMainCircle desired radius for the main circle
#' @param radiusGeneDots desired radius for the plotted genes
#'
#' @examples
#' data <- readInData("inst/extdata/tree.nwk", "dataTable.csv")
#' drawKaKsMap(data$tree, data$table)
#'
#' @export
drawKaKsMap <- function(tree,
                        table){
  plot.new()
  par(pty = "s")
  p <- plot(0, 0, asp = 1, type = "n", xaxt = "n", yaxt = "n", ann = FALSE)
  points <- plotGenesOnCircle(tree, plot = p)
  plotLinesOfKaKsValues(tree, table, points, plot = p)
  return(p)
}
# [END]
