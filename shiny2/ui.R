library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Census Data"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("Census Regions", "Census Divisions")),
      
      radioButtons("censusyear", "Census Year", c(2000, 2010)),
      br(),
      br(),
      includeHTML("datanotes_reg.html")
      ),


    mainPanel(

      h4("Selected Census Data"),
      DT::dataTableOutput("view"),
      plotOutput("dataplot")

    )
  )
))