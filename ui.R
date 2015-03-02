
# UI for Jim's app to plot politivcian contributions

library(shiny)

shinyUI(fluidPage(

  
  # Application title
  titlePanel("Political Contributions"),
  
  # some text
  
  
  
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("This is the basic App",
               "it will plot Pols eventually "),
      
      #text to search
      textInput("polSearchString", "Politician to Plot: ", "John Boehner"),
      # year to search
      selectInput("yearCycle", "Year:",
                  c("2014" = "2014",
                    "2012" = "2012",
                    "2010" = "2010",
                    "2008" = "2008",
                    "2006" = "2006"))

    ),

    # 
    mainPanel(
      plotOutput("polGraph"),
    )
  )
))
