#----------------------------------------------------------------------
# Load Libraries
#----------------------------------------------------------------------
library(quantmod)
library(PerformanceAnalytics)
library(PortfolioAnalytics)

#----------------------------------------------------------------------
# Setup environment
#----------------------------------------------------------------------
rm(list = ls())
dataEnv <- new.env()
rfrEnv <- new.env()

#----------------------------------------------------------------------
#  Setup the ticker list and dates for analysis
#----------------------------------------------------------------------
tickers <- c('MSFT', 'AMZN', 'AAPL', 'GOOGL')
fromDate <- as.Date("2011-01-01", "%Y-%m-%d")
toDate <- Sys.Date()

#----------------------------------------------------------------------
#  Get the US 10 Year Trasurey Rates for Risk-Free Rate
# https://fred.stlouisfed.org/series/TB3MS  (FRED)
#----------------------------------------------------------------------
getSymbols(Symbols = "^TNX",
            from = fromDate,
            to = toDate,
            src = "google",
            auto.assign = TRUE,
            env = rfrEnv)
head(rfrEnv$TNX)
rfrEnv$TNX <- rfrEnv$TNX$TNX.Adjusted
rfr_returns <- Return.calculate(rfrEnv$TNX)
rfr_returns <- rfr_returns[-1,]
names(rfr_returns) <- c("TNX.Returns")
rfr_returns <- na.locf(rfr_returns)
# head(rfr_returns)
# tail(rfr_returns)
# dim(rfr_returns)

#----------------------------------------------------------------------
# Get the data for the tickers
# Calculate the adjusted close
# Calculate the returns
#----------------------------------------------------------------------

getSymbols( Symbols = tickers,
            from = fromDate,
            to = toDate,
            src = "google",
            auto.assign = TRUE,
            env = dataEnv)

cnames <- character()
for (ticker in tickers) {
    cmd <- parse(text = paste('adjustOHLC(dataEnv$', ticker, ', symbol.name = \"', ticker, '\", adjust = c("split", "dividend"), use.Adjusted = FALSE)', sep = ""))
    assign(ticker, eval(cmd), envir = dataEnv)
    cnames <- c(cnames, paste(ticker, ".Returns", sep = ""))
}

asset_close <- do.call(merge, eapply(dataEnv, Cl))
asset_returns <- Return.calculate(asset_close)
asset_returns <- asset_returns[-1,]
colnames(asset_returns) <- cnames
# head(asset_returns)
# tail(asset_returns)
# dim(asset_returns)

#sapply(rfr_returns, function(x) sum(is.na(x)))
#rfr_returns[!complete.cases(rfr_returns),]
#sapply(asset_returns, function(x) sum(is.na(x)))
#asset_returns[!complete.cases(asset_returns),]
#-----------------------------------------------------------
# Compute the annualized mean
Return.annualized(asset_returns, scale = 12)

# Compute the annualized standard deviation
StdDev.annualized(asset_returns, scale = 12)

# Compute the annualized Sharpe ratio: ann_sharpe
Return.annualized(asset_returns, scale = 12) / StdDev.annualized(asset_returns, scale = 12)

# Compute all of the above at once using table.AnnualizedReturns()
table.AnnualizedReturns(asset_returns, scale = 12, Rf = rfr_returns, geometric = TRUE)



