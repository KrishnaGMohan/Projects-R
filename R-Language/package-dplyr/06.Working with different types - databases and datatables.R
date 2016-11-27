#--------------------------------------------------------------------------------
# dplyr deals with different types
#
#--------------------------------------------------------------------------------
#install.packages("data.table")
library(data.table)
hflights2 <- as.data.table(hflights)


#--------------------------------------------------------------------------------
# Use summarise() to calculate n_carrier, the total number of unique carriers in hflights2. Whether or not you use the pipe is up to you!
#--------------------------------------------------------------------------------
hflights2 %>% summarise(n_carrier = n_distinct(UniqueCarrier))


#--------------------------------------------------------------------------------
#Try to understand the code that creates nycflights, a reference to a MySQL table.
#Use glimpse() to check out nycflights. Although nycflights is a reference to a tbl in a remote database, there is no difference in syntax. Look carefully:the variable names in nycflights differ from the ones in hflights!
#Group nycflights data by carrier, then summarise() with two variables:n_flights, the number of flights flown by each carrier and avg_delay, the average arrival delay of flights flown by each carrier. Finally, arrange the carriers by average delay from low to high.
#--------------------------------------------------------------------------------
# Set up a connection to the mysql database

my_db <- src_mysql(dbname = "dplyr",
                   host = "courses.csrrinzqubik.us-east-1.rds.amazonaws.com",
                   port = 3306,
                   user = "student",
                   password = "datacamp")

# Reference a table within that source: nycflights
nycflights <- tbl(my_db, "dplyr")

# glimpse at nycflights
glimpse(nycflights)

# Ordered, grouped summary of nycflights
nycflights %>%
group_by(carrier) %>%
summarise(n_flights = n(), avg_delay = mean(arr_delay)) %>%
arrange(avg_delay)