#======================#
# STEP 1: EXTRACT DATA #
#======================#

library(archive)

# Generate file list for all trip data in 2022
url_prefix <- "https://divvy-tripdata.s3.amazonaws.com/2022"
url_suffix <- "-divvy-tripdata.zip"
specifier <- c("01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12")

# Scrape and unzip data from AWS bucket
for (x in specifier) {
  data_source = paste(url_prefix,x,url_suffix,sep = "")
  archive_extract(data_source, dir="data")
}
