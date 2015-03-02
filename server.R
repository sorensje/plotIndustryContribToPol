
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library('ggplot2')
library("rsunlight")
source("helperFunctions.R")

# setup
sunlightKeyFromFile <- scan("SunlightapiKey.txt",what = 'character')
options(SunlightLabsKey = sunlightKeyFromFile)

shinyServer(function(input, output) {
  polToUse <- 1
  
  pol <- reactive({
    input$polSearchString
  })
  
  yr <- reactive({
    input$yearCycle
  })
  
  output$polGraph <- renderPlot({
    polSearchString <- gsub(" ","+",pol())
    returnVal <- ie_entities(polSearchString)
    yearRequested <- yr()
    
    topSecReturn <- ie_politicians(method = 'top_sec',entity_id = returnVal$id[polToUse],cycle = yearRequested )
    entityReturn <- ie_entities(entity_id = returnVal$id[polToUse])
    
    
    topSecReturn$Industry <- reNameSector(topSecReturn$sector)
    topSecReturn$Amount <- as.integer(topSecReturn$amount)
    topSecReturn$Amount <- topSecReturn$Amount/100000
    
    # plot it.
    # make title
    
    plotTitleString <- paste0("Contributions to ", entityReturn[[1]], "\n for the ", yearRequested, " campaign for ",entityReturn$metadata$seat)
    
    p <- ggplot(topSecReturn, aes(x = sector, y = Amount, fill = Industry)) + 
      geom_bar( stat = "identity") + scale_y_continuous("Amount Recieved in $100,000s") + 
      scale_x_discrete("Contributing Industry") + ggtitle(plotTitleString) + theme_bw()
    
    print(p)
    
  })
#   output$sectorText <- renderText({
#     polSearchString <- gsub(" ","+",pol())
#     returnVal <- ie_entities(polSearchString)
#     yearRequested <- yr()
#     
#     topSecReturn <- ie_politicians(method = 'top_sec',entity_id = returnVal$id[1],cycle = yearRequested )
#     
#     topSecReturn$sector[2]
#   })

})
