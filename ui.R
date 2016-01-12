#ui.R
shinyUI(fluidPage(
  titlePanel("Marijuana Street Prices by State"),
  sidebarLayout(
    sidebarPanel(
      h2("State Selection"),
      selectInput("var", 
            label = "Choose a variable to display",
            choices = list("North Carolina", "Maryland",
                                 "Arizona", "Pennsylvannia"),
            selected = "North Carolina"),
      
      sliderInput("range", label = "Date Range",
                  min = 2013, max = 2015, value = c(0, 100)),
      
      br(),
      br(),
      br(),
      br(),
      img(src = "pot.jpg", height = 72, width = 72)
    ),      
  mainPanel(
    h3("Graph by State")
))))