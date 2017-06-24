# CL and BZ Quandl codes
quandl_codes <- c("CME/CLH2016", "CME/BZH2016")

# Download quarterly CL and BZ prices
qtr_price <- Quandl(quandl_codes, type = "xts", collapse = "quarterly", auto.assign = TRUE)

# View the high prices for both series
Hi(qtr_price)

# Download quarterly CL and BZ returns
qtr_return <- Quandl(quandl_codes, type = "xts", collapse = "quarterly", transform = "rdiff", auto.assign = TRUE)

# View the settle price returns for both series
getPrice(qtr_return, prefer = "Settle")


#---------------------------------------------------
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
tail(close_data)


#-----------------------------------------------
# Set the default to pull data from Google Finance
setDefaults(getSymbols, src = "google")

# Get GOOG data
getSymbols("GOOG")

# Verify the data was actually pulled from Google Finance
str(GOOG)

#---------------------------------------------------------------
# Load BRK-A data
getSymbols("BRK-A")

# Use backticks and head() to look at the loaded data
head(`BRK-A`)

# Use get() to assign the BRK-A data to an object named BRK.A
BRK.A <- get("BRK-A")

# Create BRK.A object
BRK.A <- getSymbols("BRK-A", auto.assign = FALSE)

# Create col_names object with the column names of BRK.A
col_names <- colnames(BRK.A)

# Set BRK.A column names to syntactically valid names
colnames(BRK.A) <- make.names(col_names, unique = TRUE)


#---------------------------------------------------
# Set name for BRK-A to BRK.A
setSymbolLookup(BRK.A = list(name = "BRK-A"))

# Set name for T (AT&T) to ATT
setSymbolLookup(ATT = list(name = "T"))

# Load BRK.A and ATT data
getSymbols(c("BRK.A", "ATT"))


