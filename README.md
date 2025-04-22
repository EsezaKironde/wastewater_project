WASTEWATER PROJECT


*Please download wastewater dataset onto data/ directory for this code to work*

Dataset: NWSS Public SARS-CoV-2 Wastewater Data

This dataset from the National Wastewater Surveillance System tracks SARS-CoV-2 concentrations in wastewater across the US. Updated daily, it contains metrics like 15-day percent changes and historical percentiles that help public health officials monitor COVID-19 community spread through wastewater analysis.



## Repository structure

```
.
├── code/                           # R scripts for each step of analysis
│   ├── 0_clean_data.R              # Cleans the raw data
│   ├── 1_summary_statistics.R      # Generates summary statistics by jurisdiction
│   ├── 2_time_series_plot.R        # Creates time series visualization for Fulton County
│   └── 3_render_report.R           # Renders the final report
│
├── data/
│   ├── NWSS_Public_SARS-CoV-2_Wastewater_Metric_Data_20250307.csv  # Raw input dataset 
│   ├── clean_data.rds             # Cleaned dataset
│
├── output/
│   ├── table_one.rds              # Summary statistics by jurisdiction
│   ├── monthly_wastewater_changes.png  # Monthly average change visualization
│   ├── fulton_monthly_summary.rds # Monthly data for Fulton County
│   ├── .gitkeep
│
├── Wastewater_Analysis.Rmd        # Final report (renders to HTML)
├── Makefile                        # Automates full workflow
├── .gitignore                      # Prevents tracking of outputs and temp files
└── README.md                       # This file
```

---


## Instructions for creating the report from terminal

### Option 1: Use `make`

```bash
make
```

### Option 2: Run each step manually

```bash
Rscript code/0_clean_data.R
Rscript code/1_summary_statistics.R
Rscript code/2_time_series_plot.R
Rscript code/3_render_report.R
```

---



# Data Description:

This dataset tracks COVID-19 levels in wastewater across different locations in the US, which helps public health officials monitor viral presence in communities.


wwtp_jurisdiction - Two-letter abbreviation for the state, DC, territory, or Freely Associated State where the wastewater treatment plant is located.
wwtp_id - A unique numerical identifier for each wastewater treatment plant that remains consistent over time.
reporting_jurisdiction - Two-letter abbreviation for the CDC Epidemiology and Laboratory Capacity jurisdiction (typically a state) that reported the data.
sample_location - Indicates where the sample was collected - either at a wastewater treatment plant or upstream in the wastewater system.
sample_location_specify - A unique identifier for upstream sample collection sites, used only when "sample_location" is "upstream."
key_plot_id - A unique identifier for the sewershed (geographic area served by the sampling site), created by combining wwtp_jurisdiction, wwtp_id, and potentially sample_location_specify.
county_names - Names of counties corresponding to the FIPS codes listed in county_fips.
county_fips - Five-digit FIPS codes for all counties served by the sampling site.
population_served - Estimated number of people served by the sampling site.
date_start - Beginning date of the interval for metric calculation.
date_end - Ending date of the interval for metric calculation.
ptc_15d - Percent change in SARS-CoV-2 RNA levels over the 15-day interval, calculated from linear regression of log-transformed data.
detect_prop_15d - Proportion of tests detecting SARS-CoV-2 over the 15-day period.
percentile - Shows how current SARS-CoV-2 levels compare to historical levels at the same site (0% = lowest ever, 100% = highest ever).
sampling_prior - Indicates whether wastewater sampling at the site began before or on December 1, 2021

