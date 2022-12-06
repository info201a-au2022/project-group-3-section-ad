library(plotly)
library(dplyr)
library(tidyverse)
library(stringr)
library(shiny)
library(ggthemes)
library(ggplot2)
library(shiny)

# Loading Data

  # Graph 1
    #Data and data cleansing
men_v_women_unemployment_rate <- read.csv <- read.csv("unemployment-rate-men-vs-women.csv", stringsAsFactors = FALSE)

names(men_v_women_unemployment_rate) [4] = "women_unemployment_rate"

names(men_v_women_unemployment_rate) [5] = "men_unemployment_rate"

men_v_women_unemployment_rate <- men_v_women_unemployment_rate %>% 
  group_by(Year)

    #Theme
blank_theme <- theme_bw() +
  theme(
    axis.ticks = element_blank(),
    plot.background = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  )

year_range <- range(men_v_women_unemployment_rate$Year)

country_pick <- selectInput(inputId= "country_pick",
                            label = "Select Country", 
                            choices = men_v_women_unemployment_rate$Entity,
                            selected = "United States",
                            multiple = TRUE)

year_slider <- sliderInput(inputId = "Year",
                           label = "Year Range", sep="",
                           min = 1991,
                           max = 2017,
                           value = c(2000, 2017))

  # Graph 2 
long_run_perspective <- read.csv("Long run perspective on female labor force participation rates.csv")
names(long_run_perspective) [4] = "long_run_perspective_female_labor_force_participation_rate"

long_run_perspective <- long_run_perspective %>% 
  mutate(numbers = round(long_run_perspective$long_run_perspective_female_labor_force_participation_rate, digits = 2))

numbers <- round(long_run_perspective$long_run_perspective_female_labor_force_participation_rate, digits = 2)

country_unique <- unique(long_run_perspective$Entity)

country_pick2 <- selectInput(inputId = "country_pick2",
                            label = "Select Country",
                            choices = long_run_perspective$Entity,
                            selected = country_unique[1],
                            multiple = TRUE)

  # Graph 3
chart_3_data_set_complete <- read.csv("female-labor-force-by-age-chart-3-v2.csv")

year_range3 <- range(chart_3_data_set_complete$Year)

year_slider3 <- sliderInput(inputId = "year_slider3",
                           label = "Year Range", sep = "",
                           min = 1991,
                           max = max(chart_3_data_set_complete$Year),
                           value = c(2030))

  # Report Page
table_data <- read.csv("data_for_table.csv", stringsAsFactors = FALSE)

# Define Server Logic
  server <- function(input, output) {
    
  # Introduction Page Image
    output$home_img <- renderImage({
      list(src = "Hero Empowering Women_0.png",
           width = "100%",
           height = 400)
    }, deleteFile = F)
     
  # Summary Takeaways Image
    output$summary_img <- renderImage({
      list(src = "feminist-images.jpg",
           width = "100%",
           height = 250)
    }, deleteFile = F)
    
    
  # First Visualization (Scatter Plot)
    output$chart1 <- renderPlotly({
      plot_data <- men_v_women_unemployment_rate %>% 
        filter(Entity %in% input$country_pick,
               Year <= input$Year)
      
      chart1 <- plot_ly(plot_data,
                        x= ~men_unemployment_rate,
                        y= ~women_unemployment_rate,
                        type= "scatter",
                        mode= "markers",
                        color= ~Entity,
                        market= list(size=20),
                        text=~paste("<b>Country:</b>", plot_data$Entity,
                                    "<br>",
                                    plot_data$Year, "<br>"), hoverinfo = "text") %>% 
        layout(title = "Unemployment Rate, Women vs. Men", 
               xaxis= list(title= "Unemployment Rate, Men (%)"), 
               yaxis= list(title= "Unemployment Rate, Women (%)"))
      
      return(chart1)
    })      
    
  # Second Visualization (Line Chart)
    output$chart2 <- renderPlotly ({
      plot_data2 <- long_run_perspective %>% 
        filter(Entity %in% input$country_pick2)
      
      
      visualization2 <- plot_ly(plot_data2,
                                x = ~Year,
                                y = ~numbers,
                                type = "scatter",
                                mode = "lines",
                                color = ~Entity,
                                marker = list(size = 5),
                                text = ~paste(plot_data2$Year,"<b>,<b>",plot_data2$numbers,
                                              "<b>%<b>","<br>"),
                                hoverinfo = "text") %>% 
        
        layout(title = "Long Run Perspective on Female Labor Force Participation Rates",
               xaxis = list(title = "Year"),
               yaxis = list(title = "Female Labor Force Participation Rates (%)"))
      
      return(visualization2)
    })
    
  # Third Visualization (Stacked Area Chart)    
    output$chart3 <- renderPlotly ({
      plot_data3 <- chart_3_data_set_complete %>% 
        filter(Year <= input$year_slider3)
      
      stacked_area_chart_graph <- ggplotly(
        ggplot(plot_data3, aes(x = Year, y = Number, fill = Age)) +
          geom_area(colour = "black", size = .2, alpha = .4) +
          scale_fill_brewer(palette = "RdPu") +
          geom_line(position = "stack", size = .3) +
          theme(plot.title = element_text(hjust=0.5, size = 12)) +
          labs(title = "Female Labor Force by Age",
               x = "Years",
               y = "Number of Females (In Millions)") +
          ylim(0,2000)) %>% 
        
        return(stacked_area_chart_graph)
    })
    
  # Report Page Table
    output$mytable= renderDataTable({table_data})
  }
  
  