library(tidyverse)  # need purrr and readr functions
library(lubridate)  # dealing with date formats
library(fs)         # file system functions

data_dir <- "data"

data_dir %>% 
  dir_ls(regexp = "\\.csv$") %>% 
  map_dfr(read_csv, col_types = cols("start_station_id" = col_character(), "end_station_id" = col_character()))