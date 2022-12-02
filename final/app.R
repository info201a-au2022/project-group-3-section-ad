library(ggplot2)
library(plotly)
library(shiny)
library(dplyr)
library(tidyverse)
library(stringr)
library(shiny)
library(ggthemes)

# Dataset
chart_3_data_set_complete <- read.csv("C:/Users/jbkka/Documents/info201/assignments/project-group-3-section-ad/data/female-labor-force-by-age-chart-3-v2.csv")

year_range <- range(chart_3_data_set_complete$Year)

year_slider <- sliderInput(inputId = "Year",
                           label = "Year Range", sep = "",
                           min = min(chart_3_data_set_complete$Year),
                           max = max(chart_3_data_set_complete$Year),
                           value = c(1990,2030))

# Home Page
intro_tab <- tabPanel(
  # Title
  "Introduction",
  fluidPage(
    h4(strong(em("Background Information"))),
    p("Emissions have become increasingly top-of-mind for countries around the world as climate change
      and negative externalities of our actions have come to light. Using the data of over 207 country profiles
      provided by Our World in Data, it allows the user to explore climate-related statistics for every country 
      in the world spanning over a century. Within this comprehensive data set, I have chosen to focus on a few 
      variables in particular pertaining to CO2 emissions and their differing relationships to countries both large
      and small, developed and developing. With this in mind, we will be looking at the correlation of 'co2_per_capita'
      and 'share_global_co2' over the period in which the data was collected and reported."),
    p("Like previously mentioned, this data set was initially published in May of 2017 by Our World in Data with the 
      help of Hannah Ritchie, Max Roser, and Pablo Rosado."),
  )
)
# Ui
ui <- fluidPage(h1(strong("Female Labor Force (Group 7 Section AD)"),
                   style = "color : Red"),
                tabsetPanel(
                  tabPanel("Introduction", intro_tab),
                  tabPanel("Female Labor Force by Age",
                           fluidRow(
                             column(year_slider, width = 6)),
                           fluidRow(
                             column(plotlyOutput("chart3"), width = 12)),
                           p("This will be caption for the stacked area chart.")
                  )))

# Server
server <- function(input, output) {
  
  output$chart3 <- renderPlotly({
    ggplotly(
      ggplot(chart_3_data_set_complete, aes(x = Year, y = Number, fill = Age)) +
        geom_area(colour = "black", size = .2, alpha = .4) +
        scale_fill_brewer(palette = "Reds") +
        geom_line(position = "stack", size = .3) )})}


# Run App
shinyApp(ui = ui, server = server)

