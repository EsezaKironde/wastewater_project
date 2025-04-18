
data_path <- here("data", "NWSS_Public_SARS-CoV-2_Wastewater_Metric_Data_20250307.csv")
ww_data <- read_csv(data_path)

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

saveRDS(table_one, here("output", "table_one.rds"))
















print("I did step 1 without any errors!")