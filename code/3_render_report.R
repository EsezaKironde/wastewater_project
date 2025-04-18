

library(markdown)

here::i_am("code/3_render_report.R")

#Read in the dataset
ww_data <- readRDS(
  file = here::here("data/clean_data.rds")
)


# Read in the monthly data
#monthly_data <- readRDS(
#  file = here::here("output", "fulton_monthly_summary.rds")
#)

rmarkdown::render("Wastewater_Analysis.Rmd")

#print("I rendered the report without any errors!")