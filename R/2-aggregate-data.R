library(tidyverse)  # need purrr and readr functions
library(lubridate)  # dealing with date formats

mutate(combined_data, ride_length = ended_at - started_at)