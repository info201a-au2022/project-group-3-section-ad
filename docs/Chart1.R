
chart1 <- ggplot() +
  geom_line(aes(y=long_run_perspective_female_labor_force_participation_rate, x=Year,group=Entity, color=Entity), data = long_run_perspective) +
  ggtitle("Long-run Perspective on Female Labor Force Participation Rates", subtitle= "Proportion of the Female Population Ages 15 and Over that is Economically Active") +
  xlab("Year") +
  ylab("Female Labor Force Participation Rates (%)")

chart1

# Summary Paragraph
# We chose to incorporate this graph into our research as we believe it accurately
# depicts the long-run perspective on female labor force participation rates
# over the course of the past 100 years. We chose to include many countries
# in this visualizaiton as we believe it encompasses broader trends across
# the world. One observation from the graph is that a majority of the data
# was compiled beginning in the 1960-70s, with very few countries having data
# that dates back prior to the 1920s. Another observation is that nearly every
# country has experienced rapid growth in the percentage of the female population,
# 15+, that is economically active compared to the growth rates in the earlier
# periods, such as 1920-1960.



