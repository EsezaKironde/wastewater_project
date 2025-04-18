library(markdown)

here::i_am("code/3_render_report.R")

rmarkdown::render("Wastewater_Analysis.Rmd")


print("I did step 3 without any errors!")

library(markdown)

#Read in the dataset
raw_wastewater_data <- readRDS(
  file = here::here("data/clean_data.rds")
)


# Read in the monthly data
monthly_data <- readRDS(
 file = here::here("output", "fulton_monthly_summary.rds")
)


#print("I rendered the report without any errors!")