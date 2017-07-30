#----------------------------------------------------------------------
# Load Libraries
#----------------------------------------------------------------------
# install.packages("tseries")

library(quantmod)
library(PerformanceAnalytics)
library(PortfolioAnalytics)
library(tseries)
#----------------------------------------------------------------------
# Setup environment
#----------------------------------------------------------------------
rm(list = ls())
dataEnv <- new.env()
rfrEnv <- new.env()

#----------------------------------------------------------------------
#  Setup the ticker list and dates for analysis
#----------------------------------------------------------------------
tickers <- c('MSFT','AMZN','GOOGL','AAPL')
fromDate <- as.Date("2011-01-01", "%Y-%m-%d")
toDate <- Sys.Date()

#----------------------------------------------------------------------
# Get the data for the tickers including the adjusted close
# Calculate the returns
#----------------------------------------------------------------------
getSymbols( Symbols = tickers,
            from = fromDate,
            to = toDate,
            src = "yahoo",
            auto.assign = TRUE,
            env = dataEnv)

asset_adjusted <- do.call(merge, eapply(dataEnv, Ad))
asset_returns <- Return.calculate(asset_adjusted)
asset_returns <- asset_returns[-1,]
colnames(asset_returns) <- paste(tickers, ".Returns", sep = "")

asset_returns_monthly <- do.call(merge, eapply(dataEnv, monthlyReturn))
colnames(asset_returns_monthly) <- paste(tickers, ".Returns", sep = "")
index(asset_returns_monthly) <- as.yearmon(index(asset_returns_monthly))


# Plot the returns
# for (ticker in tickers) {
#     print(eval(parse(text = paste('plot(asset_returns_monthly$', ticker,'.Returns, main = "',ticker,  '")', sep = ""))))
# }

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
rfr_returns_raw <- rfrEnv$TB3MS[index(rfrEnv$TB3MS) >= fromDate]
plot(rfr_returns_raw)
#----------------------------------------------------------------------
# align rfr_returns periodicty (it's monthly) with the ticker data 
# periodicity (it's irregular)
#----------------------------------------------------------------------

# Create a zero-width xts object
rfr_index <- xts(, order.by = index(asset_returns))

# Merge irregular_xts and regular_xts, filling NA with their previous value
rfr_returns <- merge(rfr_returns_raw, rfr_index, fill = na.locf)
rfr_returns <- rfr_returns[index(asset_returns),]
rfr_returns <- rfr_returns / (365 * 100)

rfr_returns_monthly <- rfr_returns_raw / (12 * 100)
index(rfr_returns_monthly) <- as.yearmon(index(rfr_returns_monthly))

#----------------------------------------------------------------------
# Computing Annulatized Sharpe ratio
#----------------------------------------------------------------------

mean(asset_returns$MSFT - rfr_returns)
mean(asset_returns$MSFT)
mean(asset_returns$MSFT - rfr_returns) / sd(asset_returns$MSFT - rfr_returns)
(mean(asset_returns$MSFT - rfr_returns) / sd(asset_returns$MSFT - rfr_returns)) * sqrt(252)
table.AnnualizedReturns(asset_returns, scale = 252, Rf = rfr_returns, geometric = FALSE)
table.AnnualizedReturns(asset_returns, scale = 252, Rf = rfr_returns, geometric = TRUE)

mean(asset_returns_monthly$MSFT - rfr_returns_monthly)
mean(asset_returns_monthly$MSFT)
mean(asset_returns_monthly$MSFT - rfr_returns_monthly) / sd(asset_returns_monthly$MSFT - rfr_returns_monthly)
(mean(asset_returns_monthly$MSFT - rfr_returns_monthly) / sd(asset_returns_monthly$MSFT - rfr_returns_monthly)) * sqrt(12)
table.AnnualizedReturns(asset_returns_monthly, scale = 12, Rf = rfr_returns_monthly, geometric = FALSE)
table.AnnualizedReturns(asset_returns_monthly, scale = 12, Rf = rfr_returns_monthly, geometric = TRUE)



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
for (ticker in tickers) {
    eval(parse(text = paste('chart.Drawdown(asset_returns$', ticker, ')', sep = "")))
    print(ticker)
    print(eval(parse(text = paste('table.Drawdowns(asset_returns$', ticker, ')', sep = ""))))
}

#----------------------------------------------------------------------
# Portfolio optimization
#----------------------------------------------------------------------
# Load tseries
library(tseries)

# Calculate each stocks mean returns
stockmu <- colMeans(asset_returns_monthly)

# Create a grid of target values
grid <- seq(from = 0.011895, to = max(stockmu), length.out = 50)

# Create empty vectors to store means and deviations
vpm <- vpsd <- rep(NA, length(grid))

# Create an empty matrix to store weights
mweights <- matrix(NA, 50, ncol(asset_returns_monthly))

# Create your for loop
for (i in 1:length(grid)) {
    opt <- portfolio.optim(x = asset_returns_monthly, pm = grid[i], rf = rfr_returns_monthly)
    vpm[i] <- opt$pm
    vpsd[i] <- opt$ps
    mweights[i,] <- opt$pw
}

plot(vpsd, vpm, type = "l", xlab = "Volatility (sd)", ylab = "Average Returns (means)" )
paste("Minimum sd:", min(vpsd), sep =  " ")
paste("Corresponding mean return:", vpm[which(vpsd %in% sort(vpsd)[1])], sep = " ")
optweights <- mweights[which(vpsd %in% sort(vpsd)[1]),]
names(optweights) <- tickers
print("Optimum Weights")
optweights



