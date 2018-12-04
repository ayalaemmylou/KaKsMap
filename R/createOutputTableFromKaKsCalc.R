# createOutputTableFromKaKsCalc.R

#' @title createOutputTableFromKaKsCalc
#'
#' @description Create a csv table from the output from KaKs Calculator
#'
#' @note The output from KaKs Calculator gives multiple files.  Those you want are the ones
#' with the .kaks extension.
#'
#' @param directoryPath, is the path to the directory containing output from KaKs_Calculator
#' @param outfileName the file to write the new compiled data to in csv format
#' @param extension, the extension of all the output files from KaKs_Calculator
#'
#' @example
#'
#'
#' @export
createOutputTableFromKaKsCalc <- function(directoryPath,
                                          outfileName,
                                          extension = NULL){

  if(! is.null(extension)){
    #Use regex to get files with the indicated extension
    files <- list.files(path = directoryPath, pattern = paste0("\\.", extension, "$"))
  }
  else{
    files <- list.files(path = directoryPath)
    print(files)
  }
  for (file in files){
    if (! exists("compiledResults")){
      #Create the dataframe to hold all the data
      compiledResults <- read.delim(paste0(directoryPath, "/", file), header = TRUE, sep = "\t")
    }
    else {
      #Compile all the data in the previously created dataframe
      oneResult <- read.delim(paste0(directoryPath, "/", file), header = TRUE, sep = "\t")
      compiledResults <- rbind(oneResult, compiledResults)
      rm(oneResult)
    }
  }
  write.csv(compiledResults, file = outfileName)
}
# [END]
