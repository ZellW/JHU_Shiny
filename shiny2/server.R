library(shiny)
library(datasets)
library(dplyr)

#need to consider http://shiny.rstudio.com/articles/datatables.html

cen_reg_2000 <- read.csv("../shiny2/CensusRegions2000.csv", header = TRUE)
cen_reg_2010 <- read.csv("../shiny2/CensusRegions2010.csv", header = TRUE)
cen_div_2000 <- read.csv("../shiny2/CensusDivisions2000.csv", header = TRUE)
cen_div_2010 <- read.csv("../shiny2/CensusDivisions2010.csv", header = TRUE)

cen_reg_2000 <- select(cen_reg_2000, -c(MTFCC:REGION), -LSADC, -FUNCSTAT, -HU100, -c(CENTLAT:INTPTLON))
cen_reg_2010 <- select(cen_reg_2010, -c(MTFCC:REGION), -LSADC, -FUNCSTAT, -HU100, -c(CENTLAT:INTPTLON))
cen_div_2000 <- select(cen_div_2000, -c(MTFCC:DIVISION), -LSADC, -FUNCSTAT, -HU100, -c(CENTLAT:INTPTLON))
cen_div_2010 <- select(cen_div_2010, -c(MTFCC:DIVISION), -LSADC, -FUNCSTAT, -HU100, -c(CENTLAT:INTPTLON))

# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  
  datasetInput <- reactive({
    if(input$censusyear==2000){
      switch(input$dataset,
             "Census Regions" = cen_reg_2000,
             "Census Divisions" = cen_div_2000)        
    } else{
      switch(input$dataset,
             "Census Regions" = cen_reg_2010,
             "Census Divisions" = cen_div_2010) 
    }
    
  })
  
  output$summary <- renderText({
    paste(input$dataset, input$censusyear)
  })
  
  output$view <- DT::renderDataTable({
    DT::datatable(datasetInput())
    
  })
})
