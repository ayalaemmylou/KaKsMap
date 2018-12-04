# zzz.R
#
# Package startup and unload functions




.onLoad <- function(libname, pkgname) {

  # # Make list of package parameters and add to global options
  #
  # # filepath of logfile
  # optRpt <- list(rpt.logfile = logFileName() )
  #
  # # add more options ...
  # optRpt[["nameOfOption"]] <- value
  #
  # optionsToSet <- !(names(optRpt) %in% names(options()))
  #
  # if(any(optionsToSet)) {
  #     options(optShi[optionsToSet])
  # }
  if (! require(pracma, quietly=TRUE)) {
    install.packages("pracma")
    library(pracma)
  }
  if (! require(plotrix, quietly=TRUE)) {
    install.packages("plotrix")
    library("plotrix")
  }
  if (! require(ape, quietly=TRUE)) {
    install.packages("ape")
    library(ape)
  }
  if (! require(diagram, quietly=TRUE)) {
    install.packages("diagram")
    library(diagram)
  }
  if (! require(shiny, quietly=TRUE)) {
    install.packages("shiny")
    library(shiny)
  }
  invisible()
}


.onAttach <- function(libname, pkgname) {
  # Startup message
  m <- character()
  m[1] <- "\nWelcome to KaKs Map.\n"

  packageStartupMessage(paste(m, collapse=""))
}


# .onUnload <- function(libname, pkgname) {
#
# }



# [END]
