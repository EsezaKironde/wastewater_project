here::i_am("code/2_time_series_plot.R")

library(ggplot2)
library(lubridate)

#Read in the dataset
ww_data <- readRDS(
  file = here::here("data/clean_data.rds")
)


# Convert date_start to Date object
ww_data$date_start <- as.Date(ww_data$date_start)

# Add a month column
ww_data$month <- floor_date(ww_data$date_start, "month")

# Group by month and calculate average percent change
monthly_data <- ww_data %>%
  group_by(month) %>%
  summarize(
    avg_ptc_15d = mean(ptc_15d, na.rm = TRUE),
    count = n()
  )


# Create a monthly bar plot with vertical month labels
plot <- ggplot(monthly_data, aes(x = month, y = avg_ptc_15d, fill = avg_ptc_15d > 0)) +
  geom_col(width = 20) +
  geom_text(aes(label = paste0(round(avg_ptc_15d, 1), "%")), 
            vjust = ifelse(monthly_data$avg_ptc_15d >= 0, -0.5, 1.5),
            color = "black") +
  geom_hline(yintercept = 0, linetype = "solid", color = "black") +
  scale_fill_manual(values = c("firebrick", "forestgreen"), guide = "none") +
  labs(
    title = "Monthly Average SARS-CoV-2 Change in Wastewater",
    subtitle = "Fulton County, GA",
    x = "",
    y = "Average Percent Change"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  ) +
  scale_x_date(date_labels = "%B %Y", date_breaks = "1 month") +
  scale_y_continuous(labels = function(x) paste0(x, "%"))


#Output files
ggsave(here::here("output/monthly_wastewater_changes.png"),
       plot,
       width = 8, 
       height = 5, 
       dpi = 300,
       device = "png"
)


# Also- save the monthly summary data for the report
saveRDS(monthly_data, here::here("output", "fulton_monthly_summary.rds"))

print("I did time series plot without any errors!")
