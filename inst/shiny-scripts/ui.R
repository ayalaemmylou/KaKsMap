library(shiny)
library(shinyDirectoryInput)

shinyUI(fluidPage(

  titlePanel("KaKsMap"),
  sidebarLayout( position = "left",
                 sidebarPanel(fileInput(inputId = "tree", label = "Choose tree file", accept = c(".nwk")),
                              directoryInput('directory', label = 'selected directory', value = '~'),
                              textInput(inputId = "outTableName", label = "What would you like to name the data table"),
                              textInput(inputId = "extension", label = "What extension within the directory would you like to be taken (reccomended \"kaks\"), not required"),
                              actionButton("button", "Go")),
                              mainPanel(h3(
                                plotOutput(outputId = "map"))
                                )
                              )
                 )
)
