#==================================================#
# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS #
#==================================================#

# Export cleaned and aggregated data to a csv file for further
counts <- aggregate(clean_data$ride_time ~ 
                      clean_data$day_of_week + 
                      clean_data$member_casual, FUN = mean)

write.csv(counts, file = './output/avg_ride_length.csv')
