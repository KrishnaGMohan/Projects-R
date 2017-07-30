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
tickers <- c('GOOGL')
fromDate <- as.Date("2014-01-01", "%Y-%m-%d")
toDate <- Sys.Date()

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
    #cmd <- parse(text = paste('adjustOHLC(dataEnv$', ticker, ', symbol.name = \"', ticker, '\", adjust = c("split", "dividend"), use.Adjusted = FALSE)', sep = ""))
    cmd <- parse(text = paste('adjustOHLC(dataEnv$', ticker, ', symbol.name = \"', ticker, '\")', sep = ""))
    print(cmd)
    assign(ticker, eval(cmd), envir = dataEnv)
    cnames <- c(cnames, paste(ticker, ".Returns", sep = ""))
}
dataEnv$GOOGL["201404"]
asset_close <- do.call(merge, eapply(dataEnv, Cl))
asset_returns <- Return.calculate(asset_close)
asset_returns <- asset_returns[-1,]
colnames(asset_returns) <- cnames
# head(asset_returns)
# head(rfr_returns)
# tail(asset_returns)
# dim(asset_returns)

#sapply(rfr_returns, function(x) sum(is.na(x)))
#rfr_returns[!complete.cases(rfr_returns),]
#sapply(asset_returns, function(x) sum(is.na(x)))
#asset_returns[!complete.cases(asset_returns),]

#----------------------------------------------------------------------
#  Get the US 10 Year Trasurey Rates for Risk-Free Rate
# https://fred.stlouisfed.org/series/TB3MS  (FRED)
#----------------------------------------------------------------------
getSymbols( Symbols = "TB3MS",
            from = fromDate,
            to = toDate,
            src = "FRED",
            auto.assign = TRUE,
            env = rfrEnv)
rfr_returns_monthly <- (rfrEnv$TB3MS[index(rfrEnv$TB3MS) >= fromDate]) / 100

#head(rfr_returns_monthly)
#tail(rfr_returns_monthly)

#----------------------------------------------------------------------
# align rfr_returns periodicty (it's monthly) with the ticker data 
# periodicity (it's irregular)
#----------------------------------------------------------------------

# Create a zero-width xts object
rfr_index <- xts(, order.by = index(asset_returns))

# Merge irregular_xts and regular_xts, filling NA with their previous value
rfr_returns <- merge(rfr_returns_monthly, rfr_index, fill = na.locf)
rfr_returns <- rfr_returns[index(asset_returns),]
# head(rfr_returns)
# tail(rfr_returns)
# dim(rfr_returns)

#----------------------------------------------------------------------
# Computing Annulatized Sharpe ratio
#----------------------------------------------------------------------

mean(asset_returns$MSFT - rfr_returns)
mean(asset_returns)
MSFT_sharpe <- mean(asset_returns$MSFT - rfr_returns) / sd(asset_returns$MSFT - rfr_returns)

table.AnnualizedReturns(asset_returns, scale = 252, Rf = rfr_returns, geometric = TRUE)

#----------------------------------------------------------------------
# The skewness will help you identify whether or not negative or positive 
# returns occur more frequently. A negative skewness indicates that large 
# negative returns occur more often than large positive ones, and vice 
# versa.
#
# Kurtosis will be positive if there are fat tails in your distribution. 
# This means that large positive or negative returns will happen more 
# often than can be assumed under a normal distribution
#
# The Semi-Deviation is the calculation of the variability of returns 
# below the mean return.
#
# Value-at-Risk (or VaR).The VaR corresponds to the 5% quantile of the 
# return distribution, meaning that a more negative return can only happen 
# with a probability of 5%. For example you might ask: "what is the 
# largest loss I could potentially take within the next quarter, with 
# 95% confidence?" 
#
# The expected shortfall is another measure of risk that focuses on 
# the average loss below the 5% VaR quantile.
#----------------------------------------------------------------------

skewness(asset_returns)
kurtosis(asset_returns)

SemiDeviation(asset_returns)

# Calculate the value at risk
VaR(asset_returns, p = 0.025)
VaR(asset_returns, p = 0.05)

# Calculate the expected shortfall
ES(asset_returns, p = 0.025)
ES(asset_returns, p = 0.05)

# Table of drawdowns
table.Drawdowns(asset_returns$MSFT)

# Plot of drawdowns
chart.Drawdown(asset_returns)

for (ticker in tickers) {
    eval(parse(text = paste('chart.Drawdown(asset_returns$', ticker, ')', sep = "")))
}

#----------------------------------------------------------------------
# Portfolio optimization
#----------------------------------------------------------------------
# Create a vector of equal weights
equal_weights <- rep(1 / ncol(asset_returns), ncol(asset_returns))

# Compute the benchmark returns
r_benchmark <- Return.portfolio(R = asset_returns, weights = equal_weights, rebalance_on = "quarters")
colnames(r_benchmark) <- "benchmark"

# Plot the benchmark returns
plot(r_benchmark)


asset_returns$GOOGL["201403/04"]
dataEnv$GOOGL["201403/04"]