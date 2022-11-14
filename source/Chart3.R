install.packages("areaplot")
library(areaplot)


library(ggplot2)
library(dplyr)

#Stacked Area Chart
chart_3_data_set_complete <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/female-labor-force-by-age-chart-3-v2.csv")
View(chart_3_data_set_complete)

chart3 <- ggplot(chart_3_data_set_complete, aes(x = Year, y = Number, fill = Age)) +
  geom_area(colour = "black", size = .2, alpha = .4) +
  scale_fill_brewer(palette = "Reds") +
  geom_line(position = "stack", size = .3) +
  labs(title = "Female Labor Force by Age",
     x = "Year",
     y = "Number of Females (In Millions)") +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.background = element_blank()) 

# Summary Paragraph
# We chose to incorporate this graph into our research as we believe it does 
# a great job of showing the changes in the number of females in the labor
# force, over the course of 1990 through 2030 (projected). Through the stacked
# area chart, it very clearly shows the changes in the labor force numbers
# by age group, with the legend/color scale directly to the right of the chart.
# One immediate observation from the chart is that groups, particularly ages
# 15-24, 25-34, and 35-44 have experienced the highest growth rates over the 
# period.
