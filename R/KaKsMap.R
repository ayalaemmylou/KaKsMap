#' @title KaKs Map
#' @param treePath path to the newick format tree
#' @param pathToDirWithKaKsCalcData path to a directory containing output files from KaKs_Calculator
#' @param extensionForKaKsData if there are other files in the same dir provided in pathToDirWithKaKsCalcData indicate
#' the desired files using the extention
#' @param fileNameKaKsTable file name to write the compiled data to for future reference
#' @param mainCircleRadius desired radius for the main circle
#' @param radiusGeneDots desired radius for the genes which are plotted as dots around the circumfrence of the main circle
#' @export
KaKsMap <-function(treePath, pathToDirWithKaKsCalcData, extensionForKaKsData = NULL, fileNameKaKsTable, mainCircleRadius = 0.5, radiusGeneDots = 0.02){
  createOutputTableFromKaKsCalc(pathToDirWithKaKsCalcData, fileNameKaKsTable, extension = extensionForKaKsData)
  data <- readInData(treePath, fileNameKaKsTable)
  drawKaKsMap(data$tree, data$table, mainCircleRadius, radiusGeneDots)
  #TODO: Add the ability to not bother saving the data table fileNameKaKsTable
}
#[END]
