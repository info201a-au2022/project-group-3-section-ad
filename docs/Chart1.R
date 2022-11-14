library(ggplot2)


chart1 <- ggplot() +
  geom_line(aes(y= long_run_perspective_female_labor_force_participation_rate, x= Year, group=Country), data = summary_table_3)

chart1


chart1 <- ggplot() +
  geom_line(aes(y= long_run_perspective_female_labor_force_participation_rate, x= Year, group=Country), data = summary_table_3)

chart1.3 <- ggplot(data=summary_table_3, aes(x=factor(Year), y=long_run_perspective_female_labor_force_participation_rate)) + geom_line(aes(group=Country))
chart1.3

chart1.4 <- ggplot(data=summary_table_3,aes(x=Year, y=long_run_perspective_female_labor_force_participation_rate, color=Country)) +
  geom_point() +
  geom_line()

chart1.4

  
chart_1.5_prep <- summary_table_3 %>% 
  group_by(Country)

chart1.5 <- ggplot(summary_table_3, aes(x=Year, y= long_run_perspective_female_labor_force_participation_rate, group=Country)) +
  geom_line(aes(color=Country, size=2))

by_country <- summary_table_3 %>% 
  group_by(Country)

chart1.6 <- ggplot(data=by_country) +
  geom_line(aes(x=Year, y= long_run_perspective_female_labor_force_participation_rate, color=Country))

chart1.7 <- ggplot(summary_table_3) +
  geom_line(mapping = aes(x= Year, y= long_run_perspective_female_labor_force_participation_rate, color=Country))

chart1.8 <- summary_table_3 %>% 
  ggplot(aes(x=Year, y=long_run_perspective_female_labor_force_participation_rate, color=Country, group=Country)) +
  geom_line()

chart1.8

chart1.9 <- ggplot() +
  geom_line(aes(y=long_run_perspective_female_labor_force_participation_rate, x=Year, group=Entity, color=Entity), data = long_run_perspective)

