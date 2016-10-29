#--------------------------------------------------------------------------------
#  group_by(df, Group)
#--------------------------------------------------------------------------------
rm(list = ls())
library(dplyr)
library(hflights)
hflights <- tbl_df(hflights)

lut <- c("AA" = "American", "AS" = "Alaska", "B6" = "JetBlue", "CO" = "Continental",
         "DL" = "Delta", "OO" = "SkyWest", "UA" = "United", "US" = "US_Airways",
         "WN" = "Southwest", "EV" = "Atlantic_Southeast", "F9" = "Frontier",
         "FL" = "AirTran", "MQ" = "American_Eagle", "XE" = "ExpressJet", "YV" = "Mesa")

hflights$UniqueCarrier <- lut[hflights$UniqueCarrier]

names(hflights)



#--------------------------------------------------------------------------------
# Use group_by() to group hflights by UniqueCarrier.
# summarise() the grouped tbl with two summary variables:? p_canc, the percentage of cancelled flights
#
# avg_delay, the average arrival delay of flights whose delay does not equal NA.
# Finally, order the carriers in the summary from low to high by their average arrival delay. Use percentage of flights cancelled to break any ties.
#--------------------------------------------------------------------------------
library(dplyr)
library(hflights)
# Convert the hflights data.frame into a hflights tbl
hflights <- tbl_df(hflights)

hflights %>%
  group_by(UniqueCarrier) %>%
  summarise(p_canc = sum(Cancelled) / n() * 100,
            avg_delay = mean(ArrDelay, na.rm = T)) %>%
arrange(avg_delay, p_canc)

hflights %>%
group_by(UniqueCarrier) %>%
summarise(p_canc = mean(Cancelled == 1) * 100, avg_delay = mean(ArrDelay, na.rm = TRUE)) %>%
arrange(avg_delay, p_canc)
#--------------------------------------------------------------------------------
# filter() the hflights tbl to only keep observations for
#    which ArrDelay is not NA and positive.
# Use group_by() on the result to group by UniqueCarrier.
# Next, use summarise() to calculate the average ArrDelay per carrier. Call this summary variable avg.
# Feed the result into a mutate() call:create a new variable, rank, calculated as rank(avg) .
# Finally, arrange by this new rank variable
#--------------------------------------------------------------------------------

# dplyr is loaded, hflights is loaded with translated carrier names

# Ordered overview of average arrival delays per carrier
hflights %>%
filter(!is.na(ArrDelay), ArrDelay > 0) %>%
group_by(UniqueCarrier) %>%
summarise(avg = mean(ArrDelay)) %>%
mutate(rank = rank(avg)) %>%
arrange(rank)


#--------------------------------------------------------------------------------
#How many airplanes only flew to only one destination ? The tbl you print out should have a single column, named nplanes and a single row.
#Find the most visited destination for
#    each carrier. The tbl you print out should contain four columns:? UniqueCarrier and Dest,
# n, how often a carrier visited a particular destination,
# rank, how each destination ranks per carrier. rank should be 1 for
#    every row, as you want to find the most visited destination for
#        each carrier.
#--------------------------------------------------------------------------------
# dplyr and hflights (with translated carrier names) are pre-loaded

# How many airplanes only flew to one destination from Houston? adv1
hflights %>%
  group_by(TailNum) %>%
  summarise(ndest = n_distinct(Dest)) %>%
  filter(ndest == 1) %>%
  summarise(nplanes = n())

# Find the most visited destination for each carrier: adv2
hflights %>%
  group_by(UniqueCarrier, Dest) %>%
  summarise(n = n()) %>%
  mutate(rank = rank(desc(n))) %>%
  filter(rank == 1)

