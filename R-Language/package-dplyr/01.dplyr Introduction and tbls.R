install.packages("dplyr")
library(dplyr)
install.packages("hflights")
library(hflights)

head(hflights)
summary(hflights)
dim(hflights)


#--------------------------------------------------------------------------------
# Convert hflights(which is a data.frame) into a tbl, also named hflights.
# Display the new hflights in your console window. Notice the easy - to - read layout.
# To see how tbls behave like data.frames, save the UniqueCarrier column of hflights as an object named carriers, using standard R syntax only.
#--------------------------------------------------------------------------------
library(dplyr)
library(hflights)
# Convert the hflights data.frame into a hflights tbl
hflights <- tbl_df(hflights)

# Display the hflights tbl
hflights

# Create the object carriers
carriers <- hflights$UniqueCarrier


#--------------------------------------------------------------------------------
# Use lut to translate the UniqueCarrier column of hflights. Assign the recoded vector to the UniqueCarrier column again.
# It's rather hard to assess whether your solution is actually the right one, since the UniqueCarrier variable does not appear 
#   when you display hflights. Use the glimpse() function to inspect the raw values of the variables.
#--------------------------------------------------------------------------------


two <- c("AA", "AS")
lut <- c("AA" = "American",
         "AS" = "Alaska",
         "B6" = "JetBlue")
two <- lut[two]
two


# Both the dplyr and hflights packages are loaded into workspace
lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental",
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways",
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier",
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

# Use lut to translate the UniqueCarrier column of hflights
hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]

# Inspect the resulting raw values of your variables
glimpse(hflights)


#--------------------------------------------------------------------------------
# Use lut to change the labels of the CancellationCode column of hflights.
#As before, check your results by glimpsing at them
#--------------------------------------------------------------------------------

unique(hflights$CancellationCode)

# The hflights tbl you built in the previous exercise is available in the workspace.

# The lookup table
lut <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")

# Recode the CancellationCode column with lut
hflights$CancellationCode <- lut[hflights$CancellationCode]

# Glimpse at hflights
glimpse(hflights)