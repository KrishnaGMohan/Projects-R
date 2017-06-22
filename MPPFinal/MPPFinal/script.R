getwd()
inst
AWCustomers <- read.csv("AWCustomers.csv", stringsAsFactors = FALSE)
#head(AWCustomers)
#str(AWCustomers)
names(AWCustomers)
sum(duplicated(AWCustomers$CustomerID))
vDuplicatedCustomers <- AWCustomers[duplicated(AWCustomers$CustomerID),]$CustomerID
AWCustomers[AWCustomers$CustomerID %in% vDuplicatedCustomers,]
vDuplicatedCustomers
AWCustomersClean <- AWCustomers[!(AWCustomers$CustomerID %in% vDuplicatedCustomers & AWCustomers$LastUpdated == "2017-03-06"),]
AWCustomersClean[duplicated(AWCustomersClean$CustomerID),]$CustomerID
AWCustomersClean[AWCustomersClean$CustomerID %in% vDuplicatedCustomers,]
dim(AWCustomersClean)

AWCustomers01 <- AWCustomersClean[, !names(AWCustomersClean) %in% "CustomerID"]
head(AWCustomers01)
dim(AWCustomers01)


vDuplicatedCustomers <- duplicated(AWCustomers01)
head(vDuplicatedCustomers)

AWCustomersClean <- AWCustomers[!(AWCustomers$CustomerID %in% vDuplicatedCustomers & AWCustomers$LastUpdated == "2017-03-06"),]
head(AWCustomersClean[AWCustomersClean$MiddleName != "NULL" & !(AWCustomersClean$MiddleName %in% c("A","L","M","J","C","E","R","D","S","G","N","F","V","P","K","B","W","H","Z","I","T","Y","O")),])


AWCustomersClean[AWCustomersClean$MiddleName == "NULL",] <- as.character("")
head(AWCustomersClean)



AWCustomers01 <- AWCustomers[, !names(AWCustomers) %in% c("PhoneNumber", "LastUpdated")]
str(AWCustomers01)
vDuplicatedCustomers <- AWCustomers01[duplicated(AWCustomers01$CustomerID),]$CustomerID
#AWCustomers01[AWCustomers01$CustomerID %in% vDuplicatedCustomers,]
vDuplicatedCustomers

AWCustomers02 <- unique(AWCustomers01)
str(AWCustomers02)
vDuplicatedCustomers <- AWCustomers02[duplicated(AWCustomers02$CustomerID),]$CustomerID
#AWCustomers02[AWCustomers02$CustomerID %in% vDuplicatedCustomers,]
vDuplicatedCustomers

AWCustomers[AWCustomers == 13385,]$YearlyIncome <- 84367

AWCustomers02[AWCustomers02 == 13385,]
AWCustomers02[AWCustomers02 == 13385,]




AWCustomers01 <- AWCustomers[, !names(AWCustomers) %in% c("Title", "Suffix", "AddressLine2",  "PhoneNumber", "LastUpdated")]
str(AWCustomers01)
vDuplicatedCustomers <- AWCustomers01[duplicated(AWCustomers01$CustomerID),]$CustomerID
#AWCustomers01[AWCustomers01$CustomerID %in% vDuplicatedCustomers,]
vDuplicatedCustomers

AWCustomers01[AWCustomers01$MiddleName == "NULL",]$MiddleName <- ""
vDuplicatedCustomers <- AWCustomers01[duplicated(AWCustomers01$CustomerID),]$CustomerID
AWCustomers01[AWCustomers01$CustomerID %in% vDuplicatedCustomers,]
vDuplicatedCustomers

head(AWCustomers01[AWCustomers01$MiddleName == "NULL",])




AWSales <- read.csv("AWSales.csv", stringsAsFactors = FALSE)
AWSales[duplicated(AWSales),]
head(AWSales)
str(AWSales)

as.numeric(AWSales$AvgMonthSpend)

vDuplicatedCustomers <- AWCustomers[duplicated(AWCustomers$CustomerID),]$CustomerID
AWCustomers[AWCustomers$CustomerID %in% vDuplicatedCustomers,]


AWSales <- read.csv("AWSales.csv", stringsAsFactors = FALSE)
vDuplicatedSales <- AWSales[duplicated(AWSales$CustomerID),]$CustomerID
vDuplicatedSales
AWSales[]

x <- Sys.Date()  - as.Date("1987-11-13T00:00:00Z")
str(x)
difftime(Sys.Date(), as.Date("1987-11-13T00:00:00Z"), units = "months")

# turn a date into a 'monthnumber' relative to an origin
monnb <- function(d) {  lt <- as.POSIXlt(as.Date(d, origin = "1900-01-01")); lt$year * 12 + lt$mon }
# compute a month difference as a difference between two monnb's
mondf <- function(d1, d2) { monnb(d2) - monnb(d1) }
# take it for a spin
mondf(as.Date(as.Date("2016-11-13T00:00:00Z")), Sys.Date()) - 1
as.Date('1/15/2001', format = 'm/%d/%Y')
months(as.Date("2016-11-13T00:00:00Z"))
as.numeric(format(as.Date("2016-11-13T00:00:00Z"), "%Y"))
as.numeric(format(as.Date("2016-11-13T00:00:00Z"), "%m"))




joinData <- read.csv("JoinData.csv", stringsAsFactors = FALSE)

summary(joinData$AvgMonthSpend)


#---------------------------------------------------------------
FullResults dataset.csv
FullResults <- read.csv("FullResults.csv", stringsAsFactors = FALSE)
str(FullResults)
dim(FullResults)

sourceDF <- data.frame(FullResults$Occupation, FullResults$YearlyIncome, FullResults$AvgMonthSpend)
names(sourceDF) <- c("Occupation", "MedianYearlyIncome", "MedianAvgMonthSpend")
targetDF1 <- aggregate(MedianYearlyIncome ~ Occupation, data = sourceDF, median)
targetDF1$Occupation <- factor(targetDF1$Occupation, levels = targetDF1[order(targetDF1$MedianYearlyIncome), "Occupation"])

ggplot(data = targetDF1, aes(x = Occupation, y = MedianYearlyIncome, fill = Occupation)) +
    geom_bar(colour = "blue", stat = "identity")
# Select data.frame to be sent to the output Dataset port

targetDF2 <- aggregate(MedianAvgMonthSpend ~ Occupation, data = sourceDF, median)
targetDF2$Occupation <- factor(targetDF2$Occupation, levels = targetDF2[order(targetDF2$MedianAvgMonthSpend), "Occupation"])


ggplot(data = targetDF2, aes(x = Occupation, y = MedianAvgMonthSpend, fill = Occupation)) +
    geom_bar(colour = "blue", stat = "identity")


install.packages("lubridate")
library(lubridate)

calc_age <- function(birthDate, refDate = Sys.Date()) {
require(lubridate)
period <- as.period(interval(birthDate, refDate), unit = "year")
period$year
}

calc_age("2006-04-01")


RS2 <- read.csv("RS2.csv", stringsAsFactors = FALSE)

sum(RS2$AgeInYears <= 18)
sum(RS2$AgeInYears >= 19 & RS2$AgeInYears <= 25)
sum(RS2$AgeInYears > 26 & RS2$AgeInYears <= 29)
sum(RS2$AgeInYears >= 30 & RS2$AgeInYears <= 50)
sum(RS2$AgeInYears > 50)

sum(RS2$AgeInYears == 19)

range(RS2[RS2$AgeInYears >= 19 & RS2$AgeInYears <= 25 & RS2$Gender == "M",]$AvgMonthSpend)
range(RS2[RS2$AgeInYears >= 19 & RS2$AgeInYears <= 25 & RS2$Gender == "F",]$AvgMonthSpend)
range(RS2[RS2$AgeInYears >= 30 & RS2$AgeInYears <= 50 & RS2$Gender == "M",]$AvgMonthSpend)
range(RS2[RS2$AgeInYears >= 30 & RS2$AgeInYears <= 50 & RS2$Gender == "F",]$AvgMonthSpend)

?aggregate
summarise