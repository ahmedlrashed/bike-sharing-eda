install.packages("archive")
library(archive)    # scrape and unzip data from AWS bucket
archive_extract("https://divvy-tripdata.s3.amazonaws.com/Divvy_Trips_2020_Q1.zip", dir="data")