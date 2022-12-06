library(plotly)
library(dplyr)
library(tidyverse)
library(stringr)
library(shiny)
library(ggthemes)
library(ggplot2)
library(shiny)

# Sources

source("app_server.R")
source("app_ui.R")

# Run the Application

shinyApp(ui = ui, server = server)

