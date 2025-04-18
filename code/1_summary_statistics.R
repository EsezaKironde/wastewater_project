#set directory to project directory


#Eseza's computer: setwd("C:/Users/nesez/OneDrive/Desktop/Data_Science_Toolkit/midterm/wastewater_project")

#Zoli's computer: setwd("/Users/zolismith/Desktop/wastewater_project")


here::i_am("code/1_summary_statistics.R")
absolute_path_to_data <- here::here("data", "NWSS_Public_SARS-CoV-2_Wastewater_Metric_Data_20250307.csv")

raw_wastewater_data <- read.csv(absolute_path_to_data, header = TRUE)

table_one <-raw_wastewater_data %>%
  group_by(wwtp_jurisdiction) %>%
  summarise(
    n_counties = n_distinct(county_names),
    n_fips = n_distinct(county_fips),
    n_sewersheds = n_distinct(key_plot_id),
    n_sample_locations = n_distinct(sample_location),
    avg_population_served = round(mean(population_served, na.rm = TRUE), 0),
    .groups = "drop"
  ) %>%
  arrange(desc(n_sewersheds))

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)




print("I did step 1 without any errors!")
=======


