#' @title Plot lines of KaKsValues
#' @param tree phylo object created by using read.tree on a newick tree format
#' @param table containing output from KaKs_Calculator
#' @param points points where the genes were placed around the circumfrence of
#' the main circle in plotGenesOnCircle
#' @param plot default is to create a new plot
#'
#' @note meant for internal use
plotLinesOfKaKsValues <- function(tree,
                                  table,
                                  points,
                                  plot = plot.new()){
  labels <- tree$tip.label
  pairs <- table$Sequence
  kaks <- table$Ka.Ks
  pairIndex <- 1
  for(pair in pairs){

    splitPair <- strsplit(pair, "-")
    index <- 1
    point1 <- NULL
    point2 <- NULL
    for(label in labels){
      if(pracma::strcmp(label, splitPair[[1]][1])){
        point1 <- points[index,]
      }
      if(pracma::strcmp(label, splitPair[[1]][2])){
        point2 <- points[index,]
      }
      index <- index + 1
    }

    if(!is.null(point1) && !is.null(point2)){
      if(is.na(kaks[pairIndex])){
        #No KaKs value has a black line, ex. error in running KaKs_Calculator
        diagram::curvedarrow(point1, point2, arr.length = 0.1, lcol = "black", curve = 0.5)
      }
      else if(kaks[pairIndex] > 1){
        #Positive selection is green
        diagram::curvedarrow(point1, point2, arr.length = 0.1, lcol = "green", curve = 0.5)
      }
      else if(kaks[pairIndex] < 1){
        #Negative selection is red
        diagram::curvedarrow(point1, point2, arr.length = 0.1, lcol = "red", curve = 0.5)
      }
      else if(kaks[pairIndex] == 1){
        #Neutral selection is yellow
        diagram::curvedarrow(point1, point2, arr.length = 0.1, lcol = "yellow", curve = 0.5)
      }
    }
    pairIndex <- pairIndex + 1
  }
}
# [END]
