# Install packages
install.packages(c("tidyverse", "fs"))

library(tidyverse)  # attaches purrr and readr
library(fs)

data_dir <- "data"

data_dir %>% 
  dir_ls(regexp = "\\.csv$") %>% 
  map_dfr(read_csv, col_types = cols("start_station_id" = col_character(), "end_station_id" = col_character()))