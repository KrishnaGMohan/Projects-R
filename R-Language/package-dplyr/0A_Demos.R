rm(list = ls())

library(dplyr)
NCDB <- read.csv("D:\\DATA\\NationalCollisionDatabase\\NCDB_1999_to_2012.csv")
NCDB <- rbind(NCDB, read.csv("D:\\DATA\\NationalCollisionDatabase\\ncdb_2012.csv"))
NCDB <- tbl_df(NCDB)

#dim(NCDB)
#glimpse(NCDB)
#head(NCDB)

MNTH <- c(paste("0", 1:9, sep = ""), 10:12, "UU", "XX")
MNTH_desc <- c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC", "UNK", "NOP")
C_MNTH_NAME <- factor(NCDB$C_MNTH, levels = MNTH, ordered = T, labels = MNTH_desc)


WDAY <- c(1:7, "U", "X")
WDAY_desc <- c("MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN", "UNK", "NOP")
C_WDAY_NAME <- factor(NCDB$C_WDAY, levels = WDAY, ordered = T, labels = WDAY_desc)
#rm(list = list(WDAY, WDAY_desc))
rm(MNTH)
rm(MNTH_desc)

NCDB <- cbind(NCDB, C_MNTH_NAME, C_WDAY_NAME)

#NCDB <- select(NCDB, C_YEAR:C_MNTH, C_MNTH_NAME, C_WDAY:P_USER)

head(NCDB)



#------------------------------------
# Demo_tbl_and_five verbs
#------------------------------------
# Create a tbl
library(dplyr)

# Create a tbl to hold data about mountains higher than 8000 m
peak <- c("Everest", "K2", "Kangchenjunga", "Lhotse", "Makalu", "Cho Oyu", "Dhaulagiri I", "Manaslu", "Nanga Parbat", "Annapurna I", "Gasherbrum I", "Broad Peak", "Gasherbrum II", "Shishapangma")
height_m <- c(8848, 8611, 8586, 8516, 8485, 8201, 8167, 8163, 8126, 8091, 8080, 8051, 8035, 8027)
first_ascent <- c("29-May-1953", "31-Jul-1954", "25-May-1955", "18-May-1956", "15-May-1955", "19-Oct-1954", "13-May-1960", "9-May-1956", "3-Jul-1953", "3-Jun-1950", "5-Jul-1958", "9-Jun-1957", "7-Jul-1956", "2-May-1964")
first_ascent <- as.Date(first_ascent, format = "%d-%b-%Y")
first_winter_ascent <- c("17-Feb-1980", NA, "11-Jan-1986", "31-Dec-1988", "9-Feb-2009", "12-Feb-1985", "21-Jan-1985", "12-Jan-1984", "26-Feb-2016", "3-Feb-1987", "9-Mar-2012", "5-Mar-2013", "2-Feb-2011", "14-Jan-2005")
first_winter_ascent <- as.Date(first_winter_ascent, format = "%d-%b-%Y")
ascents <- c(5656, 306, 283, 461, 361, 3138, 448, 661, 335, 191, 334, 404, 930, 302)
deaths <- c(223, 81, 40, 13, 31, 44, 69, 65, 68, 61, 29, 21, 21, 25)

eight_thousander <- data.frame(peak, height_m, first_ascent, first_winter_ascent, ascents, deaths)
eight_thousander <- tbl_df(eight_thousander)

# Know the contents
class(eight_thousander)
dim(eight_thousander)
names(eight_thousander)
str(eight_thousander)
head(eight_thousander)

#------------------------------------
# Five Verbs

# NOTE: all the following commands will work even 
# if eight_thousander is a dataframe and not a tbl

# select the peak and height_m columns
select(eight_thousander, peak, height_m)

# select columns that have the word ascent 
select(eight_thousander, contains("ascent")) 
# Note:Variables not shown: ascents (dbl)

#select columns starting with "first"
select(eight_thousander, starts_with("first"))

# select all columns except "deaths"
select(eight_thousander, -deaths)

# select all columns from height_m to ascents
select(eight_thousander, height_m:ascents)

# select all columns that contain "ascent" but not "winter"
select(eight_thousander, contains("ascent"), - contains("winter"))


# select rows where the height of the mountain is greater than 8500m
filter(eight_thousander, height_m > 8500)

# select rows where the height of the mountain is greater than 8500m
# and that have been climbed in winter
filter(eight_thousander, height_m > 8500, !is.na(first_winter_ascent))
filter(eight_thousander, height_m > 8500 & !is.na(first_winter_ascent))


#Arrange the rows in the order of the mountain last climbed to first climbed
arrange(eight_thousander, desc(first_ascent))

#Arrange the rows in order by the least climbed mountains to the most climbed mountains
arrange(eight_thousander, ascents)

#Add a column to show the percent ratio of deaths to ascents and call it death_rate_percent
eight_thousander <- mutate(eight_thousander, death_rate_percent = deaths / ascents * 100)
eight_thousander

#Add a column to show the difference in days between the first_ascent and first_winter_ascent
# and call it winter_ascent_diff
eight_thousander <- mutate(eight_thousander, winter_ascent_diff = first_winter_ascent - first_ascent)
eight_thousander
# Note that K2 has never been climbed in winter


# Find the average height of all eight_thousanders
summarise(eight_thousander, avg = mean(height_m))

# Find the max, min and average height of all eight_thousanders
summarise(eight_thousander, min = min(height_m), max = max(height_m), avg = mean(hei)