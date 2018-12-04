# KaKsMap

## KaKsMap

KaKsMap gives a circle plot with genes spread out around the circle, connected by coloured lines representing the KaKs value.

  [R Packages](http://r-pkgs.had.co.nz/) <http://r-pkgs.had.co.nz/>

-----------------------------------------------

Note: you can't push empty directories to your repository. Make sure youu keep
at least one file in every directory that you want to keep during development.
 
-----------------------------------------------

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

-----------------------------------------------


Load the package (outside of this project) with:
    `devtools::install_github("ayalaemmylou/KaKsMap")`
    
-----------------------------------------------

Example for use:

#Create a table using the output from kaks data
createOutputTableFromKaKsCalc("inst/extdata/sampleOutputAXTKaKs", "inst/extdata/sampleDataTable.csv", "kaks")
#Read in the data
data <- readInData("inst/extdata/tree.nwk", "inst/extdata/sampleDataTable.csv")
#Create the plot
drawKaKsMap(data$tree, data$table)


