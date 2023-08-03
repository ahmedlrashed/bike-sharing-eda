Bike Sharing EDA
================

<figure>
<img src="bike6.jpg" alt="Bike Rack" />
<figcaption aria-hidden="true">Bike Rack</figcaption>
</figure>

## Goal

Explore historical bike trip data to identify key metrics and trends to
drive improvements to the company’s marketing strategy.

## Background

Consider a fictitious bike-share company in Chicago. The director of
marketing believes the company’s future success depends on maximizing
the number of annual memberships. Therefore, it is required to
understand how casual riders and annual members use the company’s bikes
differently. From these insights, a new marketing strategy can be
designed to convert casual riders into annual members. Company
executives must approve any recommendations, so they must be backed up
with compelling data insights and professional data visualizations.

## Methodology

### 0-extract-data.R

We started by downloading the public data sets from the AWS S3 bucket.
We choose the latest complete year of data, which is from January 2022
(202201) to December 2022 (202212). Since each data set is a zip file,
we created a script to generate scrape and unzip the csv files to our
project’s data folder.

### 1-load-data.R

The next step is to read in all of the CSV files inside the directory
and build one large data set by merging each of the smaller data sets
together as diagrammed below. ![Read and Combine](map_dfr.png) Since we
have a particularly large number of files, a loop can take some time.
Therefore, it is advantageous to use the fread() function from the
data.table package. This function is highly optimized and is much
quicker than other functions for reading in large data files.

### 2-clean-data.R

At this point, our combined data set consists of 13 columns of 5,667,717
rows. The data format is long, so we can now start adding columns
representing calculated values of interest to our analysis.

## Results

In the end, we went back to our single-file implementation (main.py) and
used *auto-py-to-exe* to build a stand-alone executable file that users
could download to the test stand machine and run to decompose the .mdb
file into its constituent CSV data logs. This executable worked
perfectly on different machines, transforming TestStand Database files
into their component CSV data logs.

## Dependencies

NOTE: Python packages should be installed with `poetry install` command
for current pyproject.toml

\[tool.poetry.dependencies\]

python = “^3.10”

pyodbc = “^4.0.35”

pandas = “^2.0.0”

## Including Code

You can include R code in the document as follows:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

## Including Plots

You can also embed plots, for example:

![](README_files/figure-gfm/pressure-1.png)<!-- -->

Note that the `echo = FALSE` parameter was added to the code chunk to
prevent printing of the R code that generated the plot.