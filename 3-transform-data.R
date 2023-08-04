#==================================#
# STEP 3: CLEAN AND TRANSFORM DATA #
#==================================#

library(tidyverse)
library(lubridate)

# Add a "ride_time" calculation to all_trips
# Convert 'difftime' to numeric so we can calculate and aggregate
combined_data$ride_time <- 
  as.numeric(difftime(combined_data$ended_at, combined_data$started_at))

# Convert ride_time from seconds to minutes for user-friendly summaries
combined_data$ride_time <- combined_data$ride_time / 60

# Clean data frame to keep only ride_times greater than 1 minute
clean_data <- combined_data[(combined_data$ride_time > 1),]

# Add columns for date, month, day, and year of each ride
# This will let us aggregate ride data for each month, day, or year
clean_data$date <- as.Date(clean_data$started_at)
clean_data$year <- format(as.Date(clean_data$date), "%Y")
clean_data$month <- format(as.Date(clean_data$date), "%m")
clean_data$day <- format(as.Date(clean_data$date), "%d")
clean_data$day_of_week <- wday(clean_data$date)
