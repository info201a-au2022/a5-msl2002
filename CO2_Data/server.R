#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(shinythemes)

shinyServer(function(input, output) { 
  co2_data <- read.csv("owid-co2-data.csv")
  data <- reactive ({
    req(input$sel_cont) 
    df <- co2_data %>%
      group_by(country) %>% 
      summarize(co2_per_gdp = co2_per_gdp, year = year, na.rm = TRUE) %>% 
      filter(country %in% input$sel_cont)
  })
  output$plot <- renderPlot({
    ggplot(data()) +
      geom_line(mapping = aes(y = co2_per_gdp, x = year), color = "red") +
      xlim(input$Slider2) +
      labs(
        title = "CO2 per GDP in each Continent"
      )
  })
  
})
