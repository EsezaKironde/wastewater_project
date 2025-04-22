all: Wastewater_Analysis.html

Wastewater_Analysis.html: Wastewater_Analysis.Rmd data/clean_data.rds output/table_one.rds output/monthly_wastewater_changes.png
	Rscript code/3_render_report.R

output/table_one.rds: data/clean_data.rds code/1_summary_statistics.R
	Rscript code/1_summary_statistics.R

output/monthly_wastewater_changes.png: data/clean_data.rds code/2_time_series_plot.R
	Rscript code/2_time_series_plot.R

.PHONY: clean all

clean:
	rm -f output/*.rds output/*.png Wastewater_Analysis.html


install:
		Rscript -e 'if (!requireNamespace("renv", quietly = TRUE)) install.packages("renv"); renv::restore()'