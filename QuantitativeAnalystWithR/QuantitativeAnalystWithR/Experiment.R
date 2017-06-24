install.packages("quantmod")
library(quantmod)

symbol <- "MSFT"
fromDate <- as.Date("2011-01-01","%Y-%m-%d")
toDate <- Sys.Date()
fromSrc <- "google"

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
#rm(MSFT)

str(MSFT)
class(MSFT)

#----------------------------------------------

tail(Op(MSFT))
tail(Cl(MSFT))
tail(Hi(MSFT))
tail(Lo(MSFT))
tail(Vo(MSFT))
tail(Ad(MSFT))
tail(OHLCV(MSFT))

MSFT["2017"]
MSFT["2017-03"]
MSFT["2017-03-10/2017-03-20"]
MSFT[index(MSFT) > "2017-03-20"]

last(MSFT, "1 week")
last(MSFT, "2 weeks")
first(last(MSFT, "2 weeks"), "5 days")

#----------------------------------------------

MSFT2016 <- MSFT["2016-01-01/2016-12-31"]
ep <- endpoints(MSFT2016, on = "months")
period.apply(MSFT2016[, "Adjusted Close"], INDEX = ep, FUN = mean)

#----------------------------------------------

MSFT2016 <- MSFT["2016-01-01/2016-12-31"]
MSFT2016.monthly <- split(MSFT2016, on = "months")
MSFT2016.monthly[[6]]

#----------------------------------------------
# Finds records of the last day of the trading week
MSFT2016 <- MSFT["2016-01-01/2016-12-31"]
lastDayOfWeeks <- endpoints(MSFT2016, on = "weeks")
head(MSFT2016.weekly <- MSFT2016[lastDayOfWeeks])

# or

MSFT2016 <- MSFT["2016-01-01/2016-12-31"]
head(to.period(MSFT2016, "weeks"))

#----------------------------------------------
# First trading day of each quarter
MSFT2016 <- MSFT["2016-01-01/2016-12-31"]
to.quarterly(MSFT2016, indexAt = "firstof")
to.quarterly(MSFT2016, name = "LastYear", indexAt = "firstof")
to.quarterly(MSFT2016, name = "LastYear", indexAt = "firstof", OHLC= FALSE)
Op(to.quarterly(MSFT2016, name = "LastYear", indexAt = "firstof", OHLC = FALSE))

#----------------------------------------------
MSFT2016 <- MSFT["2016-01-01/2016-12-31"]
periodicity(MSFT2016)
periodicity(MSFT)


#--------------------------------------------------------
#Quandl.api_key("Vnyv--827Kp8rDnVxBUd")
#myData <- Quandl.datatable("WIKI/PRICES")
#--------------------------------------------------------
