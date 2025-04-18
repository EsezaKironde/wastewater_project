
library(markdown)

here::i_am("code/3_render_report.R")

rmarkdown::render("Wastewater_Analysis.Rmd")


print("I rendered the report without any errors!")