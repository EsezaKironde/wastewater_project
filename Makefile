Wastewater_Analysis.html: Wastewater_Analysis.Rmd data/clean_data.rds code/3_render_report.R
	Rscript code/3_render_report.R

Summary_statistics: code/1_summary_statistics.R data/clean_data.rds
		Rscript code/1_summary_statistics.R

Time_series_plot: code/2_time_series_plot.R data/clean_data.rds
		Rscript code/2_time_series_plot.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Wastewater_Analysis.html
