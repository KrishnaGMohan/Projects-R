# Exercise 1: Creating a subset of rows and columns

# Create a data frame
set.seed(59)
myData <- data.frame(
  x = rnorm(100),
  y = runif(100),
  z = rep(1:20, times = 5))
# Subset observations and variables
myNewData <- rxDataStep( inData = myData,
                         rowSelection = y > .5,
                         varsToKeep = c("y", "z"))
# Get information about the new data frame
rxGetInfo(data = myNewData, getVarInfo = TRUE)

#Exercise 2: Imputing missing values

# Create a data frame with missing values
set.seed(59)
myData1 <- data.frame(x = rnorm(100), y = runif(100))
xmiss <- seq.int(from = 5, to = 100, by = 5)
ymiss <- seq.int(from = 2, to = 100, by = 5)
myData1$x[xmiss] <- NA
myData1$y[ymiss] <- NA
rxGetInfo(myData1, numRows = 5)


# Compute the summary statistics and extract
# the means in a named vector
sumStats <- rxResultsDF(rxSummary(~., myData1))
sumStats
meanVals <- sumStats$Mean
names(meanVals) <- row.names(sumStats)

# Use rxDataStep to replace missings with imputed mean values
myData2 <- rxDataStep(inData = myData1, transforms = list(
  x = ifelse(is.na(x), meanVals["x"], x),
  y = ifelse(is.na(y), meanVals["y"], y)),
  transformObjects = list(meanVals = meanVals))
rxGetInfo(myData2, numRows = 5)


# Exercise 3: Removing duplicates while sorting

set.seed(17)
users <- sample(c("Aiden", "Ella", "Jayden", "Ava", "Max", "Grace", "Riley",
                  "Lolita", "Liam", "Emma", "Ethan", "Elizabeth", "Jack",
                  "Genevieve", "Avery", "Aurora", "Dylan", "Isabella",
                  "Caleb", "Bella"), 100, replace=TRUE)
state <- sample(c("Washington", "California", "Texas", "North Carolina",
                  "New York", "Massachusetts"), 100, replace=TRUE)
transAmt <- round(runif(100)*100, digits=3)
df <- data.frame(users=users, state=state, transAmt=transAmt)
rxSort(df, sortByVars=c("users", "state"), removeDupKeys=TRUE,
       dupFreqVar = "DUP_COUNT")

