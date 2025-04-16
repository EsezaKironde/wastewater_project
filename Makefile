Wastewater_Analysis.html: Wastewater_Analysis.Rmd code/3_render_report.R
	Rscript code/3_render_report.R



.PHONY: clean
clean:
	rm -f output/*.rds && rm -f Wastewater_Analysis.html