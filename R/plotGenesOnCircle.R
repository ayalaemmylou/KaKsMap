#plotGenesOnCircle.R

#' @title Plot genes on the main circle
#'
#' @description Plot circular genes on the circle in the order their found in the tree
#'
#' @name plotGenesOnCircle
#' @param tree phylo object obtained from calling read.tree on a newick tree file
#' @param radius desired radius of main circle
#' @param x coordinate for the center of the circle
#' @param y coordinate for the center of the circle
#' @param clustered default FALSE results in evenly spaced genes on the circle, functionality for TRUE unimplemented
#' @param geneCircleRadius radius for genes placed around the edge of the circle
#' @param plot default is to create a new plot
#' @return return the coordinates for the gene placement on the circumfrence of the main circle
#'
#' @note meant for internal use
plotGenesOnCircle <- function(tree,
                              plot = plot.new()){

  x <- 0
  y <- 0
  radius <- 0.7
  geneCircleRadius <- 0.03

  plotrix::draw.circle(x, y, radius)
  labels <- tree$tip.label
  listOfPoints <- matrix(, nrow = length(labels), ncol = 2)
  #Separate genes evenly
  separation <- (2 * pi)/length(labels)
  index <- 1
  for(i in seq(from = 0, to = 2 * pi, by = separation)){
    if(0 < i && i <= pi / 6){
      #qudrant 1 (x,y)
      plotrix::draw.circle(x + radius * sin(i), y + radius * cos(i), geneCircleRadius, col = "blue")
      listOfPoints[index, 1] <- (x + radius * sin(i))
      listOfPoints[index, 2] <- (y + radius * cos(i))
      index <- index + 1
    }
    else if(pi / 6 < i && i <= pi){
      #quadrant 2 (x, -y)
      plotrix::draw.circle(x + radius * sin(pi - i), (y - radius * cos(pi - i)), geneCircleRadius, col = "blue")
      listOfPoints[index, 1] <- (x + radius * sin(pi - i))
      listOfPoints[index, 2] <- (y - radius * cos(pi - i))
      index <- index + 1
    }
    else if(pi < i  && i <= (3 * pi) / 2){
      #quadrant 3 (-x, -y)
      plotrix::draw.circle((x - radius * cos((3 * pi) / 2 - i)), (y - radius * sin((3 * pi) / 2 - i)), geneCircleRadius, col = "blue")
      listOfPoints[index, 1] <- (x - radius * cos((3 * pi) / 2 - i))
      listOfPoints[index, 2] <- (y - radius * sin((3 * pi) / 2 - i))
      index <- index + 1
    }
    else if((3 * pi) / 2 < i && i <= 2 * pi){
      #quadrant 4 (-x, y)
      plotrix::draw.circle((x - radius * sin(2 * pi - i)), (y + radius * cos(2 * pi - i)), geneCircleRadius, col = "blue")
      listOfPoints[index, 1] <- (x - radius * sin(2 * pi - i))
      listOfPoints[index, 2] <- (y + radius * cos(2 * pi - i))
      index <- index + 1
    }
  }
  #Returning the points prevents the need for them to be calculated again
  return(listOfPoints)
}
# [END]
