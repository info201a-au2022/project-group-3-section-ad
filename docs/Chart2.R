
install.packages("maps")
library(maps)
mapdata <- map_data("world")

View(mapdata)

View(unemployment_rate_women)

names(unemployment_rate_women) [1] = "region"

unemployment_rate_women <- subset(unemployment_rate_women, region!= "Americas: High income" & region!= "Americas: Low income" & region!= "Americas: Lower-middle income" & region!= "Americas: Upper-middle income" & region!= "Africa: Low income" & region!= "Africa: Lower-middle income"& region!= "Africa: Upper-middle income" & region!= "Americas") 

View(unemployment_rate_women)

unemployment_rate_women_chart <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/unemployment-rate-women-chart.csv") %>% 
  filter(Year==2017)

View(unemployment_rate_women_chart)

mapdata <- left_join(mapdata,unemployment_rate_women_chart, group_by= "region")
View(mapdata)

mapdata1 <- mapdata %>% 
  filter(!is.na(mapdata$Unemployment_rate_women))

View(mapdata1)

map1 <- ggplot(mapdata1, aes( x = long, y= lat, group=group)) +
  geom_polygon(aes(fill = Unemployment_rate_women), color = "black")

map1

map2 <- map1 + scale_fill_gradient(name = "Female Unemployment Rate (%)", low = "pink", high = "red", na.value = "grey50")

chart2 <- map1 + scale_fill_gradient(name = "Female Unemployment Rate (%)", low = "pink", high = "red", na.value = "grey50")+
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank (),
        axis.title.y = element_blank(),
        axis.title.x = element_blank (),
        rect = element_blank()) +
  ggtitle("Unemployment Rate, Women, 2017", subtitle= "The unemployment rate expresses the number of unemployed as a percent of the labor
force. Countries in white have no unemployment data recorded.")

chart2

library(dplyr)
library(tidyverse)


#Summary Paragraph
#We decided to include a chart of the unemployment rate with the most recent data (2017) to show the current (or most recent) 
#state of female unemployment. The other data sets displays trends over time so this data set summarizes that state that those 
#long-term trends have lead to. Unemployment data is a major indicator of job certainty and equality so we chose
#this feature as a key one to highlight. The observations include unemployment data from 2017 from most countries in
#the world. The countries that were not documented in the data set are displayed in white on the graph. This map is in the form
#of a heat map where the more red the countries are, the higher unemployment rate they have, and the more pink the 
#countries are, the lower unemployment rate they have.