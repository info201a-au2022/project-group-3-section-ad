
#List Containing Different Values from Data Set
summary_info <- list()

# 1 - Number of Observations 
summary_info$number_observations <- nrow(summary_table_3)
summary_info$number_observations

# 2 & 3 - Number of Unique Countries/Entities in Dataset
summary_info$list_of_countries <- unique(summary_table_3$Entity)
summary_info$list_of_countries

summary_info$number_of_countries <- n_distinct(summary_table_3$Entity)
summary_info$number_of_countries

#4 & 5 - Highest/Lowest Unemployment Rate of Women
summary_info$highest_unemployment_rate_of_women <- summary_table_3 %>% 
  filter(Unemployment_rate_women == max(Unemployment_rate_women, na.rm = TRUE)) %>% 
  pull(Year,Entity)
summary_info$highest_unemployment_rate_of_women

summary_info$lowest_unemployment_rate_of_women <- summary_table_3 %>% 
  filter(Unemployment_rate_women == max(Unemployment_rate_women, na.rm = TRUE)) %>% 
  pull(Year,Entity)
summary_info$lowest_ratio_in_country

# 6 & 7 -Highest/Lowest Long Run Perspective on Female Labor Force Participation Rates
summary_info$highest_long_run_perspective <- summary_table_3 %>% 
  filter(long_run_perspective_female_labor_force_participation_rate == 
           max(long_run_perspective_female_labor_force_participation_rate,
               na.rm = TRUE)) %>% 
  pull(Year, Entity)
summary_info$highest_long_run_perspective

summary_info$lowest_long_run_perspective <- summary_table_3 %>% 
  filter(long_run_perspective_female_labor_force_participation_rate == 
           min(long_run_perspective_female_labor_force_participation_rate,
               na.rm = TRUE)) %>% 
  pull(Year, Entity)
summary_info$lowest_long_run_perspective

#Summary Information List
View(summary_info)
