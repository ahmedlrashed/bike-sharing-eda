#===================================#
# STEP 4: EXPLORE AND DESCRIBE DATA #
#===================================#

library(tidyverse)
library(lubridate)
library(ggplot2)

# Descriptive analysis on ride_length (minutes)
summary(clean_data$ride_time)

# Compare mean/median ride_time for members vs casuals
aggregate(clean_data$ride_time ~ clean_data$member_casual, FUN = mean)
aggregate(clean_data$ride_time ~ clean_data$member_casual, FUN = median)

# Compare mean/median ride_time by day_of_week for members vs casuals
aggregate(clean_data$ride_time ~ 
            clean_data$day_of_week + 
            clean_data$member_casual, FUN = mean)

# Visualize mean/median ride_time by day_of_week for members vs casuals
options(scipen=10000)
clean_data %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual,weekday) %>% 
  summarise(number_of_rides = n()
            , average_duration = mean(ride_time)) %>% 
  arrange(member_casual,weekday) %>% 
  ggplot(aes(x = weekday, 
             y = number_of_rides, 
             fill = member_casual, 
             scientific = FALSE)) + geom_col(position = "dodge")

