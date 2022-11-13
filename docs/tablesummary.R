unemployment_rate_women <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/unemployment-rate-women.csv")
View(unemployment_rate_women)

long_run_perspective <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/Long run perspective on female labor force participation rates.csv")
View(long_run_perspective)

female_labor_force_by_age <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/female-labor-force-by-age.csv")
View(female_labor_force_by_age)

ratio_of_female_to_labor_force_participation_rates <- read.csv("C:/Users/katie/Documents/info201/assignments/project-group-3-section-ad/data/ratio-of-female-to-male-labor-force-participation-rates.csv")
View(ratio_of_female_to_labor_force_participation_rates)

summary_table_1 <- left_join(unemployment_rate_women, long_run_perspective, by = "Year")
  
summary_table_2 <- left_join(summary_table_1, female_labor_force_by_age, by = "Year")

summary_table_3 <- left_join(summary_table_2, ratio_of_female_to_labor_participation_rates, by = "Year")

View(summary_table_3)




?left_join


totals_by_day <- left_join(county_by_day, state_by_day, by = "date")
View(totals_by_day)

library(dplyr)
library(tidyverse)
