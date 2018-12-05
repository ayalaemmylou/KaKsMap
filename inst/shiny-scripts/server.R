library(shiny)
library(shinyDirectoryInput)

shinyServer(function(input, output, session) {

  observeEvent(
    ignoreNULL = TRUE,
    eventExpr = {
      input$directory
    },
    handlerExpr = {
      if (input$directory > 0) {
        # condition prevents handler execution on initial app launch
        path = choose.dir(default = readDirectoryInput(session, 'directory'),
                          caption="Choose a directory...")
        updateDirectoryInput(session, 'directory', value = path)
      }
    }
  )

  output$directory = renderText({
    readDirectoryInput(session, 'directory')
  })
  observeEvent(input$button, {
    output$map <- renderPlot({
      createOutputTableFromKaKsCalc(readDirectoryInput(session, 'directory'), input$outTableName, input$extension)
      data <- readInData(input$tree$datapath, input$outTableName)
      drawKaKsMap(data$tree, data$table)
    })
  })


})
