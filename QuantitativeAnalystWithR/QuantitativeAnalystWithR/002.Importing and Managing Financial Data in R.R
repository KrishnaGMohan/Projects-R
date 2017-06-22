#install.packages("quantmod")
# Load the quantmod package
library(quantmod)

# Import QQQ data from Yahoo! Finance
getSymbols(Symbols = "QQQ", src = "yahoo", auto.assign = TRUE)

# Look at the structure of the object getSymbols created
str(QQQ)

# Look at the first few rows of QQQ
head(QQQ)

# Import QQQ data from Google Finance
getSymbols("QQQ", src = "google")

# Look at the structure of QQQ
str(QQQ)
head(QQQ)

# Import GDP data from FRED
getSymbols("GDP", src = "FRED")

# Look at the structure of GDP
str(GDP)
head(GDP)

#----------------------------------------------------------
# auto.assign = FALSE same as env = NULL
#----------------------------------------------------------

# Assign SPY data to 'spy' object using auto.assign argument
spy <- getSymbols("SPY", auto.assign = FALSE)

# Look at the structure of the 'spy' object
str(spy)
head(spy)

# Assign JNJ data to 'jnj' object using env argument
jnj <- getSymbols("JNJ", env = NULL)

# Look at the structure of the 'jnj' object
str(jnj)
head(jnj)


#----------------------------------------------------------
# Quandl
#----------------------------------------------------------
install.packages("Quandl")
# Load the Quandl package
library(Quandl)

# Import GDP data from FRED
gdp <- Quandl(code = "FRED/GDP")

# Look at the structure of the object returned by Quandl
str(gdp)
head(gdp)

# Import GDP data from FRED as xts
gdp_xts <- Quandl(code = "FRED/GDP", type = "xts")

# Look at the structure of gdp_xts
str(gdp_xts)
head(gdp_xts)

# Import GDP data from FRED as zoo
gdp_zoo <- Quandl(code = "FRED/GDP", type = "zoo")

# Look at the structure of gdp_zoo
str(gdp_zoo)
head(gdp_zoo)

#------------------------------------------------------------------------

# Create an object containing the Pfizer ticker symbol
symbol <- "PFE"

# Use getSymbols to import the data
getSymbols(symbol, src = "google")

# Look at the first few rows of data
head(PFE)


#----------------------------------------------
quantmod::oanda.currencies

# Create a currency_pair object
currency_pair <- "GBP/CAD"

# Load British Pound to Canadian Dollar exchange rate data
getSymbols(currency_pair, src = "oanda")

# Examine object using str()
str(GBPCAD)
head(GBPCAD)

# Try to load more than 500 days
getSymbols(currency_pair, from = "2001-01-01", to = "2016-01-01", src = "oanda")


#----------------------------------------------
# Create a series_name object
series_name <- "UNRATE"

# Load the data using getSymbols
getSymbols(series_name, src = "FRED")

# Create a quandl_code object
quandl_code <- paste("FRED/", series_name, sep = "")

# Load the data using Quandl
unemploy_rate <- Quandl(code = quandl_code)


#----------------------------------------------------------
# Extracting data
#----------------------------------------------------------

# Look at the head of DC
head(DC)


# Extract the close column
dc_close <- Cl(DC)

# Look at the head of dc_close
head(dc_close)

# Extract the volume column
dc_volume <- Vo(DC)

# Look at the head of dc_volume
head(dc_volume)


# Extract the high, low, and close columns
dc_hlc <- HLC(DC)

# Look at the head of dc_hlc
head(dc_hlc)

# Extract the open, high, low, close, and volume columns
dc_ohlcv <- OHLCV(DC)

# Look at the head of dc_ohlcv
head(dc_ohlcv)


# Download CME data for CL and BZ as an xts object
oil_data <- Quandl(code = c("CME/CLH2016", "CME/BZH2016"), type = "xts")

# Look at the column names of the oil_data object
colnames(oil_data)

# Extract the Open price for CLH2016
cl_open <- getPrice(oil_data, symbol = "CLH2016", prefer = "Open$")

# Look at January, 2016 using xts' ISO-8601 subsetting
cl_open["2016-01-01/2016-01-31"]


#----------------------------
# CL and BZ Quandl codes
quandl_codes <- c("CME/CLH2016", "CME/BZH2016")

# Download quarterly CL and BZ prices
qtr_price <- Quandl(quandl_codes, type = "xts", collapse = "quarterly", auto.assign = TRUE)

# CL and BZ Quandl codes
quandl_codes <- c("CME/CLH2016", "CME/BZH2016")

# Download quarterly CL and BZ prices
qtr_price <- Quandl(quandl_codes, type = "xts", collapse = "quarterly", auto.assign = TRUE)

# View the high prices for both series
Hi(qtr_price)

# Download quarterly CL and BZ returns https://docs.quandl.com/docs/time-series-1#section-preprocess-the-data
qtr_return <- Quandl(quandl_codes, type = "xts", collapse = "quarterly", transform = "rdiff", auto.assign = TRUE)

# View the settle price returns for both series
getPrice(qtr_return, prefer = "Settle")

#---------
# Call head on each object in data_env using eapply
data_list <- eapply(data_env, FUN = head)

# Merge all the list elements into one xts object
data_merged <- as.xts(do.call(merge, data_list))

# Ensure the columns are ordered: open, high, low, close
data_ohlc <- OHLC(data_merged)


#---------------------------------------------------------------
# Symbols
symbols <- c("AAPL", "MSFT", "IBM")

# Create new environment
data_env <- new.env()

# Load symbols into data_env
getSymbols(symbols, env = data_env, auto.assign = TRUE)

# Extract the close column from each object and merge into one xts object
close_data <- do.call(merge, eapply(data_env, Cl))

# View the head of close_data
head(close_data)

#--------------------------------------------------------------------
args(getSymbols)
args(getSymbols.google)
args(getSymbols.yahoo)

# Set the default to pull data from Google Finance
setDefaults(getSymbols, src = "google")

# Get GOOG data
getSymbols("GOOG")

# Verify the data was actually pulled from Google Finance
str(GOOG)

#-------------------------------------------
# Look at getSymbols.yahoo arguments
args(getSymbols.yahoo)

# Set default 'from' value for getSymbols.yahoo
setDefaults(getSymbols.yahoo, from = "2000-01-01")

# Confirm defaults were set correctly
getDefaults("getSymbols.yahoo")

#------------------------------------------------------
# Look at the first few rows of CP
head(CP)

# Set the source for CP to FRED
setSymbolLookup(CP = list(src = "FRED"))

# Load CP data again
getSymbols("CP")

# Look at the first few rows of CP
head(CP)

#-----------------------------------------------
# Save symbol lookup table
saveSymbolLookup("my_symbol_lookup.rda")

# Set default source for CP to "yahoo"
setSymbolLookup(CP = list(src = "yahoo"))

# Verify the default source is "yahoo"
getSymbolLookup("CP")

# Load symbol lookup table
loadSymbolLookup("my_symbol_lookup.rda")

# Verify the default source is "FRED"
getSymbolLookup("CP")

#---------------------------------------
# Load BRK-A data
getSymbols("BRK-A")

# Use backticks and head() to look at the loaded data
head(`BRK-A`)

# Use get() to assign the BRK-A data to an object named BRK.A
BRK.A <- get("BRK-A")

#---------------------------------------
# Fix Names
# Create BRK.A object
BRK.A <- getSymbols("BRK-A", auto.assign = FALSE)

# Create col_names object with the column names of BRK.A
col_names <- colnames(BRK.A)

# Set BRK.A column names to syntactically valid names
colnames(BRK.A) <- make.names(col_names, unique = TRUE)

# Set name for BRK-A to BRK.A
setSymbolLookup(BRK.A = list(name = "BRK-A"))

# Set name for T (AT&T) to ATT
setSymbolLookup(ATT = list(name = "T"))

# Load BRK.A and ATT data
getSymbols(c("BRK.A", "ATT"))

#--------------------------------------------
# Zero width xts

# Extract the start date of the series
start_date <- start(irregular_xts)

# Extract the end date of the series
end_date <- end(irregular_xts)

# Create a regular date-time sequence
regular_index <- seq(from = start_date, to = end_date, by = "day")

# Create a zero-width xts object
regular_xts <- xts(x = NULL, order.by = regular_index)

#------------------------------
#Fill NA
# Merge irregular_xts and regular_xts
merged_xts <- merge(irregular_xts, regular_xts)

# Look at the first few rows of merged_xts
head(merged_xts)

# Use the fill argument to fill NA with their previous value
merged_filled_xts <- merge(irregular_xts, regular_xts, fill = na.locf)

# Look at the first few rows of merged_filled_xts
head(merged_filled_xts)

#-----------------------------------------
# Example
# Aggregate DFF to monthly
monthly_fedfunds <- apply.monthly(DFF, mean, na.rm = TRUE)

# Convert index to yearmon
index(monthly_fedfunds) <- as.yearmon(index(monthly_fedfunds))


# Merge FEDFUNDS with the monthly aggregate
merged_fedfunds <- merge(FEDFUNDS, monthly_fedfunds)

# Look at the first few rows of the merged object
head(merged_fedfunds)

#----------------------------
# Look at the first few rows of merged_fedfunds
head(merged_fedfunds)

# Fill NA forward
merged_fedfunds_locf <- na.locf(merged_fedfunds, fromLast = FALSE)
head(merged_fedfunds_locf)
# Extract index values containing last day of month
aligned_last_day <- merged_fedfunds_locf[index(monthly_fedfunds)]
head(aligned_last_day)

# Fill NA backward
merged_fedfunds_locb <- na.locf(merged_fedfunds, fromLast = TRUE)
head(merged_fedfunds_locb)
# Extract index values containing first day of month
aligned_first_day <- merged_fedfunds_locb[index(FEDFUNDS)]
head(aligned_first_day)

#-------------------------------------------------
#Making Endpoints on Wednesdays
# Extract index weekdays
index_weekdays <- .indexwday(DFF)

# Find locations of Wednesdays
wednesdays <- which(index_weekdays == 3)

# Create custom end points
end_points <- c(0, wednesdays, nrow(DFF))

# Calculate weekly mean using custom end points
weekly_mean <- period.apply(DFF, end_points, mean)
