#' @title Read in data
#' @param phylogeneticTreePath path to a tree in newick format
#' @param kaksCalcOutputTablePath path to a table containing a header and output from KaKs_Calculator for at least one calculation
#' @return a list containing a phylo object and a table
#' @export
readInData <- function(phylogeneticTreePath, kaksCalcOutputTablePath){
  phyloTree <- read.tree(file = phylogeneticTreePath)
  kaksCalcTable <- read.csv(file = kaksCalcOutputTablePath, header = TRUE, sep = ",")
  return(list(tree = phyloTree, table = kaksCalcTable))
}
#[END]
