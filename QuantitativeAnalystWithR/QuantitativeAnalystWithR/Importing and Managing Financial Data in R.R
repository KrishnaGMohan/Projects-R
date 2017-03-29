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