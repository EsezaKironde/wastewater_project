
library(markdown)

here::i_am("code/3_render_report.R")

rmarkdown::render("Wastewater_Disease_Analysis.Rmd")


print("I did step 3 without any errors!")