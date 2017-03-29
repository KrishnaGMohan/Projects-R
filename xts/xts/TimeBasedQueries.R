library(xts)

# Select all of 2016 from x
x_2016 <- x["2016"]

# Select January 1, 2016 to March 22, 2016
jan_march <- x["2016/2016-03-22"]

# Extract all data from irreg between 8AM and 10AM
morn_2010 <- irreg["T08:00/T10:00"]

# Extract the observations in morn_2010 for January 13th, 2010
morn_2010["2010-01-13"]


# Subset x using the vector dates
x[dates]


# Subset x using dates as POSIXct
x[as.POSIXct(dates)]

# Replace all values in x on dates with NA
x[dates] <- NA

# Replace dates from 2016-06-09 and on with 0
x[index(x) >= "2016-06-09"] <- 0

#---------------------------------------------------------------
# Create lastweek using the last 1 week of temps
lastweek <- last(temps, "1 week")

# Print the last 2 observations in lastweek
tail(lastweek, 2)

# Extract all but the last two days of lastweek
first(lastweek, "-2 days")

# Extract the first three days of the second week of temps
first(last(first(temps, "2 weeks"), "1 week"), "3 days")


#-----------------------------------------
# Add a and b
a + b


# Add a with the numeric value of b
a + as.numeric(b)


# Add a to b, and fill all missing rows of b wil 0
a + merge(b, index(a), fill = 0)

# Add a to b and fill NAs with the last observation
a + merge(b, index(a), fill = na.locf)


#------------------------------------------
# Perform an inner join of a and b
merge(a, b, join = "inner")

# Perform of a left-join of a and b, fill mising values with 0
merge(a, b, join = "left", fill = 0)

# Row bind temps_june30 to temps, assign this to temps2
temps2 <- rbind(temps, temps_june30)

# Row bind temps_july17 and temps_july18 to temps2, call this temps3
temps3 <- rbind(temps2, temps_july17, temps_july18)

#------------------------------------------------

# Fill missing values in temps using the last observation
temps_last <- na.locf(temps)

# Fill missing values in temps using the next observation
temps_next <- na.locf(temps, fromLast = TRUE)

# Interpolate NAs using linear approximation
na.approx(AirPass)

#-----------------------------------------------------
# Create a leading object called lead_x
lead_x <- lag(x, k = -1)

# Create a lagging object called lag_x
lag_x <- lag(x, k = 1)

# Merge your three series together and assign to z
z <- merge(lead_x, x, lag_x)

AirPass <- as.xts(AirPassengers)

# calculate the first difference of AirPass using lag and subtraction
AirPass - lag(AirPass, k = 12)
AirPass - lag(AirPass)

# calculate the first order 12 month difference if AirPass
diff(AirPass, lag = 12, differences = 1)



#--------------------------
# Locate the weeks
endpoints(temps, on = "weeks")

# Locate every two weeks
endpoints(temps, on = "weeks", k = 2)


# Calculate the weekly endpoints
ep <- endpoints(temps, on = "weeks")

# Now calculate the weekly mean and display the results
period.apply(temps[, "Temp.Mean"], INDEX = ep, FUN = mean)

# Split temps by week
temps_weekly <- split(temps, f = "weeks")

# Create a list of weekly means, temps_avg, and print this list
temps_avg <- lapply(X = temps_weekly, FUN = mean)
temps_avg

#--------------------------------------------------
# use the proper combination of split, lapply and rbind
temps_1 <- do.call(rbind, lapply(split(temps, "weeks"), function(w) last(w, n = "1 day")))

# create last_day_of_weeks using endpoints()
last_day_of_weeks <- endpoints(temps, "weeks")

# subset temps using last_day_of_weeks 
temps_2 <- temps[last_day_of_weeks]


#-------------------------------------------
# Convert usd_eur to weekly
usd_eur_weekly <- to.period(usd_eur, period = "weeks")

# Convert usd_eur_weekly to monthly
usd_eur_monthly <- to.period(usd_eur, period = "months")

# Convert usd_eur_monthly to yearly univariate
usd_eur_yearly <- to.period(usd_eur, period = "years", OHLC = FALSE)


# Convert eq_mkt to quarterly OHLC
mkt_quarterly <- to.period(eq_mkt, period = "quarters")

# Convert eq_mkt to quarterly using shortcut function
mkt_quarterly2 <- to.quarterly(eq_mkt, name = "edhec_equity", indexAt = "firstof")



#--------------------------

# Download the following file to the working directory:
# http://www.edhec-risk.com/indexes/pure_style/data/table/history.csv
x = read.csv(file = "history.csv", sep = ";", header = TRUE, check.names = FALSE)
x.dates = as.Date(x[, 1], format = "%d/%m/%Y")
x.data = apply(x[, -1], MARGIN = 2, FUN = function(x) { as.numeric(sub("%", "", x, fixed = TRUE)) / 100 }) # get rid of percentage signs
edhec = xts(x.data, order.by = x.dates)


# Split edhec into years
edhec_years <- split(edhec, f = "years")

# Use lapply to calculate the cumsum for each year in edhec_years
edhec_ytd <- lapply(edhec_years, FUN = cumsum)

# Use do.call to rbind the results
edhec_xts <- do.call(rbind, edhec_ytd)

# Use rollapply to calculate the rolling 3 period sd of eq_mkt
eq_sd <- rollapply(eq_mkt, 3, FUN = sd)


#----------------------------------------------
help(OlsonNames)
# Get the index class of temps
indexClass(temps)


# Get the timezone of temps
indexTZ(temps)


# Change the format of the time display
indexFormat(temps) <- "%Y/%m/%d"

# View the new format
head(temps)


# Construct times_xts with tzone set to America/Chicago
times_xts <- xts(1:10, order.by = times, tzone = "America/Chicago")

# Change the time zone of times_xts to Asia/Hong_Kong
tzone(times_xts) <- "Hong Kong"

# Extract the current time zone of times_xts
tzone(times_xts)

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Calculate the periodicity of temps
periodicity(temps)

# Calculate the periodicity of edhec
periodicity(edhec)

# Convert edhec to yearly
edhec_yearly <- to.yearly(edhec)

# Calculate the periodicity of edhec_yearly
periodicity(edhec_yearly)

#-----------------------------------------------
# Explore underlying units of temps in two commands: .index() and .indexwday()
.index(temps)
.indexwday(temps)

# Create an index of weekend days using which()
index <- which(.indexwday(temps) == 0 | .indexwday(temps) == 6)

# Select the index
temps[index]

#--------------------------
# Make z have unique timestamps
z_unique <- make.index.unique(z, eps = 1e-4) # Perturb


# Remove duplicate times in z
z_dup <- make.index.unique(z, drop = TRUE) # Drop duplicates


# Round observations in z to the next time
z_round <- align.time(z, n = 3600)
