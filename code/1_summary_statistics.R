

here::i_am("code/1_summary_statistics.R")

#Read in the dataset
ww_data <- readRDS(
  file = here::here("data/clean_data.rds")
)

table_one <- ww_data %>%
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


print("I printed table one without any errors!")