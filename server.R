library(shiny)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  output$mainPlot <- renderPlot({
    ggplot(data = data, aes(Week, HighQ)) +
      stat_summary(fun.y = mean, geom = "line") +
      scale_x_date(breaks = date_breaks("8 week"), labels = date_format("%m-%Y")) +
      labs(y = "Marijuana Ave Price")
    #monthplot = monthplot + geom_smooth(colour = "red")
  })
  
})



#References
#RStudio Shiny Tutorial
##http://shiny.rstudio.com/gallery/widget-gallery.html