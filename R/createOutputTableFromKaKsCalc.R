#' @title Create output table from KaKs_caclculator data
#' @name createOutputTableFromKaKsCalc
#' @param directoryPath, is the path to the directory containing output from KaKs_Calculator
#' @param extension, the extension of all the output files from KaKs_Calculator
#' @export
createOutputTableFromKaKsCalc <- function(directoryPath, outfileName, extension = NULL){

  if(! is.null(extension)){
    #Use regex to get files with the indicated extension
    files <- list.files(path = directoryPath, pattern = paste0("\\.", extension, "$"))
  }
  else{
    files <- list.files(path = directoryPath)
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
  #TODO: add a keyword param in case kaks_output files cannot be separated from other files in the same dir using the extension
  write.csv(compiledResults, file = outfileName)
}
# [END]
