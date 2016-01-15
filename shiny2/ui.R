library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Census Data"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a dataset:", 
                  choices = c("Census Regions", "Census Division")),
      
      numericInput("censusyear", "Select the Census Year of interest:", 2010),
      
      helpText("Note: while the data view will show only the specified",
               "number of observations, the summary will still be based",
               "on the full dataset."),
      
      submitButton("Update View")
    ),
    
    # Show a summary of the dataset and an HTML table with the
    # requested number of observations. Note the use of the h4
    # function to provide an additional header above each output
    # section.
    mainPanel(
      h4("Summary"),
      verbatimTextOutput("summary"),
      
      h4("Observations"),
      tableOutput("view")
    )
  )
))