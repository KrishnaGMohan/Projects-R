#--------------------------------------------------------------------------------
#  summarise(df, var = <agg.expr>, var = <agg. expr>)
#  summarise(df, sum = sum(A), avg = mean(B), var = var(B))
# agg.expr =    min, mean, max, sum, var, sd, length, median, 
#               first, last, nth, n, n_distinct
#--------------------------------------------------------------------------------
library(dplyr)
library(hflights)
hflights <- tbl_df(hflights)

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental",
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways",
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier",
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]

names(hflights)

#--------------------------------------------------------------------------------
# Use summarise() to print out a summary of hflights containing two variables:min_dist, 
#     the shortest distance flown, and max_dist, the longest distance flown.
# Print out a summary of hflights with a single variable, max_div:the longest Distance for
#     diverted flights. You will need one of the four other verbs to do this!
#--------------------------------------------------------------------------------

# Print out a summary with variables min_dist and max_dist
summarize(hflights, min_dist = min(Distance), max_dist = max(Distance))

# Print out a summary with variable max_div
summarise(filter(hflights, Diverted == 1), max_div = max(Distance))


#--------------------------------------------------------------------------------
# Remove rows that have NAs in the arrival delay column and save the resulting dataset to temp1.
# Print out a summary of temp1 with the following variables(in this order):
#           earliest: the minimum arrival delay,
#           average: the average arrival delay,
#           latest: the longest arrival delay,
#           sd: the standard deviation for arrival delays.

# Filter hflights such that only rows that have no NA TaxiIn and no NA TaxiOut are kept; save 
#          this temporary result to temp2.
# Print out a summary of temp2, with one variable, max_taxi_diff:the biggest absolute difference in 
#           time between TaxiIn and TaxiOut for a single flight.
#--------------------------------------------------------------------------------

# Remove rows that have NA ArrDelay: temp1
temp1 <- filter(hflights, !is.na(ArrDelay))

# Generate summary about ArrDelay column of temp1
summarise(temp1, earliest = min(ArrDelay), average = mean(ArrDelay), latest = max(ArrDelay), sd = sd(ArrDelay))

# Keep rows that have no NA TaxiIn and no NA TaxiOut: temp2
temp2 <- filter(hflights, !is.na(TaxiIn), !is.na(TaxiOut))

# Print the maximum taxiing difference of temp2 with summarise()
summarise(temp2, max_taxi_diff = max(abs(TaxiIn - TaxiOut)))


#--------------------------------------------------------------------------------
# 
# min(x) - minimum value of vector x.
#  max(x) - maximum value of vector x.
#  mean(x) - mean value of vector x.
#  median(x) - median value of vector x.
#  quantile(x, p) - pth quantile of vector x.
#  sd(x) - standard deviation of vector x.
#  var(x) - variance of vector x.
#  IQR(x) - Inter Quartile Range(IQR) of vector x.
#  diff(range(x)) - total range of vector x.

# dplyr provides several helpful aggregate functions of its own, in addition to the ones that are already defined in R. These include:
#          first(x) - The first element of vector x.
#          last(x) - The last element of vector x.
#          nth(x, n) - The nth element of vector x.
#          n() - The number of rows in the data.frame or group of observations that summarise() describes.
#          n_distinct(x) - The number of unique values in vector x.
#          
#          
# Print out a summary of hflights with the following variables:
#          n_obs: the total number of observations,
#          n_carrier: the total number of carriers,
#          n_dest: the total number of destinations,
# aa, a tbl with all flights flown by American Airlines, is already available. Print out a summary of aa with the following variables:
#          n_flights: the total number of flights(each observation is a flight),
#          n_canc: the total number of cancelled flights,
#          avg_delay: the average arrival delay of flights whose delay is not NA(na.rm = TRUE) .
#--------------------------------------------------------------------------------
# Generate summarizing statistics for hflights
summarise(hflights, n_obs = n(), n_carrier = n_distinct(UniqueCarrier), n_dest = n_distinct(Dest))

# All American Airline flights
aa <- filter(hflights, UniqueCarrier == "American")

# Generate summarizing statistics for aa 
summarise(aa, n_flights = n(), n_canc = sum(Cancelled), avg_delay = mean(ArrDelay, na.rm = TRUE))


#--------------------------------------------------------------------------------
#
# pipe operator : %>%
# from magritter package by Stefan Bache
#
#    object %>% function( _________ , arg1, arg2, ...)
#--------------------------------------------------------------------------------

#--------------------------------------------------------------------------------
# Use dplyr functions and the pipe operator to transform the following English sentences into R code:
#          Take the hflights data set and then …
#          Add a variable named diff that is the result of subtracting TaxiIn from TaxiOut, and then …
#          Pick all of the rows whose diff value does not equal NA, and then …
#          Summarise the data set with a value named avg that is the mean diff value.
#--------------------------------------------------------------------------------

# Write the 'piped' version of the English sentences.
hflights %>% mutate(diff = TaxiOut - TaxiIn) %>% filter(!is.na(diff)) %>% summarise(avg = mean(diff))


#--------------------------------------------------------------------------------
# mutate() the hflights dataset and add two variables:
#          RealTime: the actual elapsed time plus 100 minutes(for the overhead that flying involves) and
#          mph: calculated as Distance / RealTime * 60, then
#
# filter() to keep observations that have an mph that is not NA and below 70, finally
# summarise() the result by creating four summary variables:
#          n_less, the number of observations,
#          n_dest, the number of destinations,
#          min_dist, the minimum distance and
#          max_dist, the maximum distance.
#--------------------------------------------------------------------------------
hflights %>%
mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
filter(!is.na(mph), mph < 70) %>%
summarise(n_less = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))

#--------------------------------------------------------------------------------
# filter() the result of mutate to:?keep observations that have an mph under 105 or for
#    which Cancelled equals 1 or for
#        which Diverted equals 1.
#
# summarise() the result by creating four summary variables:
#   n_non, the number of observations,
#   n_dest, the number of destinations,
#   min_dist, the minimum distance and
#   max_dist, the maximum distance.
#--------------------------------------------------------------------------------
# Finish the command with a filter() and summarise() call
hflights %>%
mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
filter(mph < 105 | Cancelled == 1 | Diverted == 1) %>%
summarise(n_non = n(), n_dest = n_distinct(Dest), min_dist = min(Distance), max_dist = max(Distance))


hflights %>%
  mutate(RealTime = ActualElapsedTime + 100, mph = Distance / RealTime * 60) %>%
  filter(mph < 105 | Cancelled == 1 | Diverted == 1) %>%
  summarise(n_non = n(),
            n_dest = n_distinct(Dest),
            min_dist = min(Distance),
            max_dist = max(Distance))



#--------------------------------------------------------------------------------
# Let's use hflights to answer another question: How many flights where overnight flights?
# filter() the hflights tbl to keep only observations whose DepTime is not NA, whose ArrTime is not NA and for which DepTime exceeds ArrTime.
# Pipe the result into a summarise() call to create a single summary variable:num, that simply counts the number of observations.
#--------------------------------------------------------------------------------
# Count the number of overnight flights

hflights %>%
filter(!is.na(DepTime) & !is.na(ArrTime) & DepTime > ArrTime) %>%
summarise(num = n())

