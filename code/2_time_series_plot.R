#set directory to project directory

#Eseza's computer: setwd("C:/Users/nesez/OneDrive/Desktop/Data_Science_Toolkit/midterm/wastewater_project")

#Zoli's computer: setw("/Users/zolismith/Desktop/wastewater_project")

here::i_am("code/2_time_series_plot.R")
absolute_path_to_data <- here::here("data", "NWSS_Public_SARS-CoV-2_Wastewater_Metric_Data_20250307.csv")

raw_wastewater_data <- read.csv(absolute_path_to_data, header = TRUE)

raw_wastewater_data <- raw_wastewater_data %>%
  mutate(date = ymd(date_start)) %>%
  filter(!is.na(ptc_15d))  # ptc_15d = 15-day avg SARS-CoV-2 RNA concentration

# Temporal summary for Fulton County, GA
fulton_data <- raw_wastewater_data %>%
  filter(reporting_jurisdiction == "Georgia", county_names == "Fulton") %>%
  arrange(date) %>%
  mutate(
    month = floor_date(date, "month"),
    roll_avg = rollmean(ptc_15d, 7, fill = NA),
    is_peak = lag(roll_avg) < roll_avg & lead(roll_avg) < roll_avg
  )

#  summary statistics by month
fulton_summary <- fulton_data %>%
  group_by(month) %>%
  summarise(
    mean_ptc = mean(ptc_15d, na.rm = TRUE),
    max_ptc = max(ptc_15d, na.rm = TRUE),
    n_obs = n(),
    .groups = "drop"
  )

saveRDS(fulton_summary, file = here("output", "fulton_monthly_summary.rds"))

# Time-series plot: ptc_15d over time
p1 <- ggplot(fulton_data, aes(x = date, y = ptc_15d)) +
  geom_line(color = "steelblue") +
  geom_line(aes(y = roll_avg), color = "darkred", linetype = "dashed") +
  labs(
    title = "SARS-CoV-2 Viral Load in Fulton County, GA",
    subtitle = "15-day average concentrations with 7-day rolling average",
    x = "Date",
    y = "ptc_15d (viral concentration)"
  ) +
  theme_minimal()

# Plot detected peaks
peak_data <- fulton_data %>% filter(is_peak == TRUE)
p2 <- p1 +
  geom_point(data = peak_data, aes(x = date, y = ptc_15d), color = "red", size = 2)

# Save plots
ggsave(filename = here("output", "fulton_time_series.png"), plot = p2, width = 8, height = 5)






















print("I did step 2 without any errors!")
