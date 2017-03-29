library(quantmod)

symbol <- "MSFT"
fromDate <- as.Date("2011-01-01","%Y-%m-%d")
toDate <- Sys.Date()
fromSrc <- "yahoo"

MSFT <- getSymbols(Symbols = symbol, from = fromDate, to = toDate, src = fromSrc, auto.assign = FALSE)
tail(MSFT)
rm(MSFT)

#-----------------------------------------------------
library(Quandl)

fromSrc <- "YAHOO"
symbol <- "MSFT"
searchCode <- paste(fromSrc, "/", symbol, sep = "")
outType = "xts"

MSFT <- Quandl(code = searchCode, type = outType)
tail(MSFT)
rm(MSFT)
