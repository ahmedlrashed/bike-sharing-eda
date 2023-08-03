Bike Sharing EDA
================

![](bike6.jpg)

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

#### 0-extract-data.R

We started by downloading the public data sets from the AWS S3 bucket.
We choose the latest complete year of data, which is from January 2022
(202201) to December 2022 (202212). Since each data set is a zip file,
we created a script to scrape and unzip the csv files to our project’s
data folder.

#### 1-load-data.R

The next step is to read in all of the CSV files inside the directory
and build one large data set by merging each of the smaller data sets
together as diagrammed below. ![Read and Combine](map_dfr.png)Since we
have a particularly large number of files, a loop can take some time.
Therefore, it is advantageous to use the fread() function from the
data.table package. This function is highly optimized and is much
quicker than other functions for reading in large data files.

#### 2-transform-data.R

At this point, our combined data set consists of 13 columns of 5,667,717
rows. The data format is long, so we can now start adding columns
representing calculated values of interest to our analysis.

There are a few problems we will need to fix:

- The “member_casual” column is the <chr> type.We will need to change
  that to the <factor> type so we can easily create plots that split
  along that category metric.

- The data can only be aggregated at the ride-level, which is too
  granular. We will want to add some additional columns of data – such
  as day, month, year – that provide additional opportunities to
  aggregate the data.

- We will want to add a calculated field “ride_length” to the entire
  data frame for analysis.

## Results

Under construction. . .

## Dependencies

**NOTE: Install packages only run on first call**

This list of commands in located in the config.R file.

install.packages(“archive”)

install.packages(“lubridate”)

install.packages(“data.table”)

install.packages(“tidyverse”)
