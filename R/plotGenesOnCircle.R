#' @title Plot genes on the main circle
#' @name plotGenesOnCircle
#' @param y coordinate for the center of the circle
#' @param clustered default FALSE results in evenly spaced genes on the circle, functionality for TRUE unimplemented
#' @param geneCircleRadius radius for genes placed around the edge of the circle
#' @param plot default is to create a new plot
#' @return return the coordinates for the gene placement on the circumfrence of the main circle
#' @export
plotGenesOnCircle <- function(tree, radius, x = 0, y = 0, clustered = FALSE, geneCircleRadius, plot = plot.new()){
  draw.circle(x, y, radius)
  labels <- tree$tip.label
  listOfPoints <- matrix(, nrow = length(labels), ncol = 2)
  #TODO: Implement functionality for clustered == TRUE
  if(! clustered){
    #Separate genes evenly
    separation <- (2 * pi)/length(labels)
    index <- 1
    for(i in seq(from = 0, to = 2 * pi, by = separation)){
      if(0 < i && i <= pi / 6){
        #qudrant 1 (x,y)
        draw.circle(x + radius * sin(i), y + radius * cos(i), geneCircleRadius, col = "blue")
        listOfPoints[index, 1] <- (x + radius * sin(i))
        listOfPoints[index, 2] <- (y + radius * cos(i))
        index <- index + 1
      }
      else if(pi / 6 < i && i <= pi){
        #quadrant 2 (x, -y)
        draw.circle(x + radius * sin(pi - i), (y - radius * cos(pi - i)), geneCircleRadius, col = "blue")
        listOfPoints[index, 1] <- (x + radius * sin(pi - i))
        listOfPoints[index, 2] <- (y - radius * cos(pi - i))
        index <- index + 1
      }
      else if(pi < i  && i <= (3 * pi) / 2){
        #quadrant 3 (-x, -y)
        draw.circle((x - radius * cos((3 * pi) / 2 - i)), (y - radius * sin((3 * pi) / 2 - i)), geneCircleRadius, col = "blue")
        listOfPoints[index, 1] <- (x - radius * cos((3 * pi) / 2 - i))
        listOfPoints[index, 2] <- (y - radius * sin((3 * pi) / 2 - i))
        index <- index + 1
      }
      else if((3 * pi) / 2 < i && i <= 2 * pi){
        #quadrant 4 (-x, y)
        draw.circle((x - radius * sin(2 * pi - i)), (y + radius * cos(2 * pi - i)), geneCircleRadius, col = "blue")
        listOfPoints[index, 1] <- (x - radius * sin(2 * pi - i))
        listOfPoints[index, 2] <- (y + radius * cos(2 * pi - i))
        index <- index + 1
      }

    }
  }
  #Returning the points prevents the need for them to be calculated again
  return(listOfPoints)
}
# [END]
