install.packages("xts")
library(xts)

# Create the object data using 5 random numbers
data <- rnorm(5)

# Create dates as a Date class object starting from 2016-01-01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")

# Use xts() to create smith
smith <- xts(x = data, order.by = dates)

# Create bday (1899-05-08) using a POSIXct date class object
bday <- as.POSIXct("1899-05-08")

# Create hayek and add a new attribute called born
hayek <- xts(x = data, order.by = dates, born = bday)
str(hayek)

# Extract the core data of hayek
hayek_core <- coredata(hayek)

# View the class of hayek_core
class(hayek_core)

# Extract the index of hayek
hayek_index <- index(hayek)

# View the class of hayek_index
class(hayek_index)


#-----------------------------------------------------------

# Create dates
dates <- as.Date("2016-01-01") + 0:4

# Create ts_a
ts_a <- xts(x = 1:5, order.by = dates)

# Create ts_b
ts_b <- xts(x = 1:5, order.by = as.POSIXct(dates))

# Extract the rows of ts_a using the index of ts_b
ts_a[index(ts_b)]

# Extract the rows of ts_b using the index of ts_a
ts_b[index(ts_a)]


#---------------------------------------------------------
data(sunspots)
class(sunspots)
sunspots_xts <- as.xts(sunspots)
class(index(sunspots_xts))

# read.zoo()
# write.zoo(x, "file")
# saveRDS(x, "file")
#---------------------------------------------------------


# Convert austres to an xts object called au
au <- as.xts(austres)

# Convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Convert the original austres into a matrix am2
am2 <- as.matrix(austres)


#---------------------------------------------------------
tmp_file <- "http://s3.amazonaws.com/assets.datacamp.com/production/course_1127/datasets/tmp_file.csv"

# Create dat by reading tmp_file
dat <- read.csv(tmp_file)

# Convert dat into xts
xts(dat, order.by = as.Date(rownames(dat), "%m/%d/%Y"))

# Read tmp_file using read.zoo
dat_zoo <- read.zoo(tmp_file, index.column = 0, sep = ",", format = "%m/%d/%Y")

# Convert dat_zoo to xts
dat_xts <- as.xts(dat_zoo)

#--------------------------------------------------------
# Convert sunspots to xts using as.xts(). Save this as sunspots_xts
sunspots_xts <- as.xts(sunspots)

# Get the temporary file name
tmp <- tempfile()

# Write the xts object using zoo to tmp 
write.zoo(sunspots_xts, sep = ",", file = tmp)

# Read the tmp file. FUN = as.yearmon converts strings such as Jan 1749 into a proper time class
sun <- read.zoo(tmp, sep = ",", FUN = as.yearmon)

# Convert sun into xts. Save this as sun_xts
sun_xts <- as.xts(sun)


#-------------------------------------
# Replace the values in x contained in the dates vector with NA
x[dates] <- NA

# Replace all values in x for dates starting June 9, 2016 with 0
x["2016-06-09/"] <- 0

# Verify that the value in x for June 11, 2016 is now indeed 0
x["2016-06-11"]

#-------------------------------------------------
# Create lastweek using the last 1 week of temps
lastweek <- last(temps, "1 week")

# Print the last 2 observations in lastweek
tail(lastweek, 2)

# Extract all but the last two days of lastweek
first(lastweek, "-2 days")



help(OlsonNames)
Sys.getenv()
