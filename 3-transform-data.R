library(tidyverse)  # need purrr and readr functions
library(lubridate)  # dealing with date formats

combined_data$ride_length <- difftime(combined_data$ended_at,combined_data$started_at)
combined_data$day_of_week <- wday(combined_data$date_column)
