# Load xts
library(xts)

# View the structure of ex_matrix
str(ex_matrix)

# Extract the 3rd observation of the 2nd column of ex_matrix
ex_matrix[3, 2]

# Extract the 3rd observation of the 2nd column of core 
core[3, 2]

#--------------------------------------------------------------------
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
#--------------------------------------------------------------------

# Extract the core data of hayek
hayek_core <- coredata(hayek)

# View the class of hayek_core
class(hayek_core)

# Extract the index of hayek
hayek_index <- index(hayek)

# View the class of hayek_index
class(hayek_index)

#---------------------------------------------------------
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
#----------------------------------------------------------

# Convert austres to an xts object called au
au <- as.xts(austres)

# Convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Convert the original austres into a matrix am2
am2 <- as.matrix(austres)
#-----------------------------------------------------------


