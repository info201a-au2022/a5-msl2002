#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(ggplot2)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("sandstone"),
  navbarPage(
    "Analyzing CO2 Data",
    tabPanel("Introduction",
             mainPanel(h3("Variables of Analysis"),
             p("Climate change is happening faster than ever as CO2 emission rates continue to rise.
               CO2 emissions result from everyday activities and processes. The burning of fossil fuels
               result from things like driving and industrial processes. Many places that produce the goods
               we use produce a massive amount of CO2 into the atmosphere. Through this analysis, I would
               like to find out which continents emit the most CO2, and how this trend has changed 
               throughout time. Going a bit further than that, I would also like to analyze how GDP 
               affects CO2 emissions in each continent. It is likely that the wealth of each continent
               will affect their CO2 emissions, and I would like to analyze this data to illustrate this
               trend.")),
             sidebarPanel(h3("Values of Interest"),
             p("1. Which continent has the highest CO2 emissions per GDP amount?"),
             p(em("Europe (exl. EU-28)")),
             p("2. In what year was CO2 emissions per GDP the highest?"),
             p(em("1991")),
             p("3. What is the average CO2 emission per GDP amount across all countries?"),
             p(em("0.403")))),
    tabPanel("Interactive Visualization",
             h1("CO2 emissions per GDP"),
             sidebarPanel(selectInput(inputId = "sel_cont",
                                      label = "Select Continent",
                                      list("Africa", "Asia",
                                      "Asia (excl. China and India)", "Europe", 
                                      "Europe (excl. EU-27)", "Europe (excl. EU-28)", 
                                      "European Union (27)", "European Union (28)",
                                      "North America", "North America (excl. USA)",
                                      "South America", "Australia")),
                          sliderInput(inputId = "Slider2",
                                       label = "Select Year Range",
                                       sep = "",
                                       min = 1750,
                                       max = 2021,
                                       value = c(1800, 2010))),
             mainPanel(plotOutput("plot")),
             p("This graph compares years vs. the CO2 emissions per GDP for each continent.
             Most of the graphs follow the same pattern in which they increase drastically, reach 
               a peak, and then decrease drastically. Most of these peaks happen within the 1900-1950s
               except for Africa, which peaks more around the 1980s. These increases in CO2 emissions per 
               GDP might be due to different developmental speeds of countries. The faster a country
               industrialized, the more CO2 emissions they will have earlier on. There seems to not be 
               a lot of recent data, as I wouldn't expect the trend line to go down so drastically, as the
               world continues to industrialize and produce CO2 emissions faster than ever.")))
  
))

