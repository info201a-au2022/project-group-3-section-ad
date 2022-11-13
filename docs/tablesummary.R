unemployment_rate_women <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/unemployment-rate-women.csv")
View(unemployment_rate_women)

unemployment_rate_women <- unemployment_rate_women %>% 
  mutate(unemployment_rate_women$Unemployment_rate_women, round, digits=2)

?mutate_if

names(unemployment_rate_women) [4] = "Unemployment_rate_women"

long_run_perspective <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/Long run perspective on female labor force participation rates.csv")
View(long_run_perspective)

names(long_run_perspective) [4] = "long_run_perspective_female_labor_force_participation_rate"

female_labor_force_by_age <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/female-labor-force-by-age.csv")
View(female_labor_force_by_age)

names(female_labor_force_by_age) [4] = "65+_females_in_labor_force"
names(female_labor_force_by_age) [5] = "55-64_females_in_labor_force"
names(female_labor_force_by_age) [6] = "45-54_females_in_labor_force"
names(female_labor_force_by_age) [7] = "35-44_females_in_labor_force"
names(female_labor_force_by_age) [8] = "25-34_females_in_labor_force"
names(female_labor_force_by_age) [9] = "15-24_females_in_labor_force"

ratio_of_female_to_labor_force_participation_rates <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/ratio-of-female-to-male-labor-force-participation-rates.csv")
View(ratio_of_female_to_labor_force_participation_rates)

names(ratio_of_female_to_labor_force_participation_rates) [4] = "ratio_of_female_to_male_labor_force_participation_rate"

summary_table_1 <- left_join(unemployment_rate_women, long_run_perspective, group_by= c("Year", "Entity", "Code"), all.x=TRUE)
View(summary_table_1)
  
summary_table_2 <- left_join(summary_table_1, female_labor_force_by_age, group_by = c("Year", "Entity", "Code"), all.x=TRUE)
View(summary_table_2)

summary_table_3 <- left_join(summary_table_2, ratio_of_female_to_labor_force_participation_rates, group_by=c("Year", "Entity", "Code"), all.x=TRUE)

View(summary_table_3)

?group_by

?groupby




?left_join


totals_by_day <- left_join(county_by_day, state_by_day, by = "date")
View(totals_by_day)

library(dplyr)
library(tidyverse)
