#--------------------------------------------------------------------------------
#  filter(df, <logical test>)
#
# Print out all flights in hflights that traveled 3000 or more miles.
# Print out all flights in hflights flown by JetBlue, Southwest, or Delta.
# Extract from hflights all flights where taxiing took longer than the actual flight. 
#     Avoid the use of mutate() and do the math directly in the logical expression of filter() .
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
# All flights that traveled 3000 miles or more
filter(hflights, Distance > 3000 )

# All flights flown by one of JetBlue, Southwest, or Delta
filter(hflights, UniqueCarrier == "JetBlue" | UniqueCarrier == "Southwest" | UniqueCarrier ==  "Delta")

# All flights where taxiing took longer than flying
filter(hflights, TaxiIn + TaxiOut > AirTime)

#--------------------------------------------------------------------------------
# Use R 's logical and boolean operators to select just the rows where a flight left before 5:00 am (500) or arrived after 10:00 pm (2200).
# Print out all of the flights that departed late but arrived ahead of schedule.
# Find all of the flights that were cancelled after being delayed. These are flights that were cancelled, while having a DepDelay greater than zero.
#--------------------------------------------------------------------------------
# All flights that departed before 5am or arrived after 10pm
filter(hflights, DepTime < 500 | ArrTime > 2200)

# All flights that departed late but arrived ahead of schedule
filter(hflights, DepDelay >0 & ArrDelay < 0)

# All flights that were cancelled after being delayed
filter(hflights, Cancelled == 1 & DepDelay >0)


#--------------------------------------------------------------------------------
# First, use filter() to select the flights that had JFK as their destination and save this result to c1.
# Second, add a new column named Date to c1:paste() together the Year, Month and DayofMonth variables, 
#       seperate them by a "-" by using the sep attribute of paste() . Save the resulting data frame as c2.
# Finally, select some columns to provide an overview:Date, DepTime, ArrTime and TailNum, in this order. 
# Do not assign the resulting database to a variable; just print it to the console.
#--------------------------------------------------------------------------------
names(hflights)

# Select the flights that had JFK as their destination: c1
c1 <- filter(hflights, Dest == "JFK")

# Combine the Year, Month and DayofMonth variables to create a Date column: c2
c2 <- mutate(c1, Date = paste(Year, "-", Month, "-", DayofMonth, sep = ""))

# Print out a selection of columns of c2
select(c2, Date, DepTime, ArrTime, TailNum)


# How many weekend flights flew a distance of more than 1000 miles but had a total taxiing time below 15 minutes
filter(hflights, Distance > 1000 & DayOfWeek >= 6 & TaxiIn + TaxiOut < 15)
filter(hflights, DayOfWeek %in% c(6, 7), Distance > 1000, TaxiIn + TaxiOut < 15)




#--------------------------------------------------------------------------------
#  arrange(df, <col1>, <col2>, ...)

# Arrange dtc, by departure delays so that the shortest departure delay is at the top of the data set.
# Arrange dtc so that flights that were cancelled for
#     the same reason appear next to each other.
# Arrange dtc so that flights by the same carrier appear next to each other. Within each carrier, 
#     flights that have smaller departure delays appear before flights that have higher departure 
#     delays. Do this in a one - liner.
#--------------------------------------------------------------------------------


# Definition of dtc
dtc <- filter(hflights, Cancelled == 1, !is.na(DepDelay))

# Arrange dtc by departure delays
arrange(dtc, DepDelay)

# Arrange dtc so that cancellation reasons are grouped
arrange(dtc, CancellationCode)

# Arrange dtc according to carrier and departure delays
arrange(dtc, UniqueCarrier, DepDelay)



#--------------------------------------------------------------------------------
# Arrange hflights so that flights by the same carrier appear next to each other 
#            and within each carrier, flights that have larger departure delays 
#            appear before flights that have smaller departure delays.
# Arrange the flights in hflights by their total delay(the sum of DepDelay and 
#             ArrDelay) . Try to do this directly inside arrange() .
#--------------------------------------------------------------------------------

# Arrange according to carrier and decreasing departure delays
arrange(hflights, UniqueCarrier, desc(DepDelay))

# Arrange flights by total delay (normal order).
arrange(hflights, DepDelay + ArrDelay)



