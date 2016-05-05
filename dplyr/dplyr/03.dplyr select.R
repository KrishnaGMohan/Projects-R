#--------------------------------------------------------------------------------
# select - removes columns
# filter - removes rows
# arrange - sorts data
# mutate - uses data to create new columns
# summarize - calculates summary statistics
#--------------------------------------------------------------------------------

# select(df, col1, col2, ...)
# select(df, 1:4, -2)


#--------------------------------------------------------------------------------
# Use select() to print out a tbl that contains only the columns ActualElapsedTime, AirTime, ArrDelay and DepDelay of hflights.
# Print out a tbl with the columns Origin up to Cancelled of hflights.
# Find the most concise way to select:columns Year up to and including DayOfWeek, columns ArrDelay up to and including Diverted. 
#  You can examine the order of the variables in hflights with names(hflights) in the console.
#--------------------------------------------------------------------------------

library(dplyr)
library(hflights)
# Convert the hflights data.frame into a hflights tbl
hflights <- tbl_df(hflights)

# Display the hflights tbl
hflights

# Print out a tbl with the four columns of hflights related to delay
select(hflights, ActualElapsedTime, AirTime, ArrDelay, DepDelay)

# Print out the columns Origin up to Cancelled of hflights
select(hflights, Origin:Cancelled)


# Answer to last question: be concise!
# names(hflights)
# select(hflights, Year:DayOfWeek, ArrDelay:Diverted)
select(hflights, - (DepTime:AirTime))

#--------------------------------------------------------------------------------
# dplyr comes with a set of helper functions that can help you select groups of variables inside a select() call:
# starts_with("X"): every name that starts with "X",
# ends_with("X"): every name that ends with "X",
# contains("X"): every name that contains "X",
# matches("X"): every name that matches "X", where "X" can be a regular expression,
# num_range("x", 1:5):the variables named x01, x02, x03, x04 and x05,
# one_of(x): every name that appears in x, which should be a character vector.
#--------------------------------------------------------------------------------

#--------------------------------------------------------------------------------
# Use select() and a helper function to print out a tbl that contains just ArrDelay and DepDelay of hflights.
# Use a combination of helper functions and variable names to print out only the UniqueCarrier, FlightNum, TailNum, Cancelled, and CancellationCode columns of hflights.
# Find the most concise way to return the following columns with select and its helper functions:DepTime, ArrTime, ActualElapsedTime, AirTime, ArrDelay, DepDelay. Use only helper functions!
#--------------------------------------------------------------------------------
names(hflights)

# Print out a tbl containing just ArrDelay and DepDelay
select(hflights, ends_with("Delay"))

# Print out a tbl as described in the second instruction, using both helper functions and variable names
select(hflights, ends_with("Num"), contains("C"), -Distance, -ActualElapsedTime)

# Print out a tbl as described in the third instruction, using only helper functions.
select(hflights, ends_with("Time"), ends_with("Delay"))



#--------------------------------------------------------------------------------
# Finish select call so that ex1d matches ex1r
ex1r <- hflights[c("TaxiIn", "TaxiOut", "Distance")]
ex1d <- select(hflights, starts_with("Taxi"), Distance)

# Finish select call so that ex2d matches ex2r
ex2r <- hflights[c("Year", "Month", "DayOfWeek", "DepTime", "ArrTime")]
ex2d <- select(hflights, Year:ArrTime, -DayofMonth)

# Finish select call so that ex3d matches ex3r
ex3r <- hflights[c("TailNum", "TaxiIn", "TaxiOut")]
ex3d <- select(hflights, TailNum, TaxiIn, TaxiOut)



#--------------------------------------------------------------------------------
#  mutate(df, var = expression)
# Create a new data frame, g1, which is the data frame hflights with an additional column: ActualGroundTime, the difference between ActualElapsedTime and AirTime.
# Extend g1 further, by adding an additional column GroundTime. This column is the sum of the TaxiIn and TaxiOut columns. Store the resulting data frame in g2. Check in the console that the GroundTime and ActualGroundTime columns are equal.
# Add a new variable to g2 named AverageSpeed that denotes the average speed that each plane flew in miles per hour. Save the resulting dataset as g3. Use the following formula:Distance / AirTime * 60.
# Print out g3.
#--------------------------------------------------------------------------------

# Add the new variable ActualGroundTime to a copy of hflights and save the result as g1.
g1 <- mutate(hflights, ActualGroundTime = ActualElapsedTime - AirTime)

# Add the new variable GroundTime to g1. Save the result as g2.
g2 <- mutate(g1, GroundTime = TaxiIn + TaxiOut)

# Add the new variable AverageSpeed to g2. Save the result as g3.
g3 <- mutate(g2, AverageSpeed = Distance / AirTime * 60)

# Print out g3
# g3[c("ActualGroundTime", "GroundTime", "AverageSpeed")]
g3

#--------------------------------------------------------------------------------
# Adapt the code that builds m1:add a variable loss_ratio, which is the ratio of loss to DepDelay.
# Create a tbl m2 from hflights by adding three variables:
#   - TotalTaxi, which is the sum of TaxiIn and TaxiOut;
#   - ActualGroundTime, which is the difference of ActualElapsedTime and AirTime;
#   - Diff, the difference between the two newly created variables. This column should be zero for all observations!
#--------------------------------------------------------------------------------
# Add a second variable loss_ratio to the dataset: m1
m1 <- mutate(hflights, loss = ArrDelay - DepDelay, loss_ratio = loss / DepDelay)


# Add the three variables as described in the third instruction: m2
m2 <- mutate(hflights, TotalTaxi = TaxiIn + TaxiOut, ActualGroundTime = ActualElapsedTime - AirTime, Diff = TotalTaxi - ActualGroundTime)

select(hflights, - (Year:Month), - (DepTime:Diverted))
select(hflights, starts_with("D"))
select(hflights, - (Year:Month), - (DepTime:Diverted))
select(hflights, starts_with("Day"))
