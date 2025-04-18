
#set directory to project directory

library(here)
here::i_am("code/0_clean_data.R")
absolute_path_to_data <- here::here("data", "NWSS_Public_SARS-CoV-2_Wastewater_Metric_Data_20250307.csv")

raw_wastewater_data <- read.csv(absolute_path_to_data, header = TRUE)

library(labelled)
library(gtsummary)
library(dplyr)


# Rename the headers with more descriptive labels
var_label(raw_wastewater_data) <- list(
  wwtp_jurisdiction = "State",
  wwtp_id = "Treatment Plant ID",
  reporting_jurisdiction = "Reporting State",
  sample_location = "Sample Collection Point",
  sample_location_specify = "Upstream Location ID",
  key_plot_id = "Sewershed Identifier", #unique identifier for the sewershed (geog area of sampling site)
  county_names = "Counties Served",
  county_fips = "County FIPS Codes",
  population_served = "Population Coverage", #no of people served by the sampling site
  date_start = "Period Start Date",
  date_end = "Period End Date",
  ptc_15d = "15-Day Percent Change", # % change in covid levels over the 15-days, calculated from linear regression of log-transformed data.
  detect_prop_15d = "15-Day Detection Rate", #proportion of tests detecting covid over the 15-day period.
  percentile = "Historical Percentile Rank", #How current covid levels compare to historical levels at the same site (0% = lowest ever, 100% = highest ever).
  sampling_prior = "Pre-December 2021 Sampling" # yes or no
)




# We are going to focus on Fulton County, Georgia
fulton_data <- raw_wastewater_data %>%
  filter(wwtp_jurisdiction %in% c("Georgia")) %>%
  filter(county_names == "Fulton")



#---------------------------------------------------------------------------------------------------------------
# Save the data as an RDS file

saveRDS(
  fulton_data,
  file = here::here("data/clean_data.rds")
)


print("I cleaned the data without any errors!")





