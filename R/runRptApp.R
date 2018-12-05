# runRPTApp.R

#' This code was written by Prof. Boris Steipe and taken from
#' https://github.com/hyginn/rptPlus
#'
#' \code{runRptApp} launch the shiny app distributed with this package framework
#' @export
runRptApp <- function() {
  appDir <- system.file("shiny-scripts", package = "KaKsMap")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}

# [END]
