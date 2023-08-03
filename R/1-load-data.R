library(data.table)
library(tidyverse)  # need purrr and readr functions
library(lubridate)  # dealing with date formats
library(fs)         # file system functions

# Declare target working directory
data_dir <- "data"

# Create a list of the files from our target directory
file_list <- list.files(path=data_dir, pattern = ".csv", full.names = TRUE)

# Initiate a blank data frame
combined_data <- data.frame()

# Iterate for each file in our file_list
for (i in 1:length(file_list)){
  
  # Import with the fread function from the data.table package
  temp_data <- fread(file_list[i], stringsAsFactors = F) 
  
  # For each iteration, append the new data to the blank dataset
  # We set use.names=T just in case the column indexes changed
  combined_data <- rbindlist(list(combined_data, temp_data), use.names = T) 
}
