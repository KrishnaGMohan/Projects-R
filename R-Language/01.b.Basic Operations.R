#------------------------------------
# Workspace Operations
#------------------------------------
# List all the objects in your local workspace
ls()

# Delete an object
rm(z)

# Delete all objects
rm(list = ls())

#------------------------------------
# Sequences of Numbers
#------------------------------------

1:5
3:-2
seq(2, 9, by = 3)
seq(2, 4, by = 0.5)
seq(4, 8, length = 8)

x <- c(1, 3, 5, 7, 9, 11)
1:length(x)

x <- c(1, 3, 5, 7, 9, 11)
seq(along.with = x)

x <- c(1, 3, 5, 7, 9, 11)
seq_along(x)

rep(0, 5)
rep(c(1, 2, 3), times = 3)
rep(c(0, 1, 2), each = 3)
rep(c(1, 2), c(2, 3))
rep(c(1:3), length.out = 10)

#------------------------------------
# String operations
#------------------------------------
# substr(x, start pos, stop pos)
# substring(text, first, last = 1000000L)
# substr(x, start, stop) <- value
# substring(text, first, last = 1000000L) <- value

v <- c("Every cloud has a silver lining")
substr(v, 7, 15)
substring(v, 7)
substring(v, 7, 24)

v <- c("Every cloud has a silver lining")
substr(v, 19, 26) <- c("golden")
v

v <- c("Every cloud has a silver lining")
substr(v, 19, 26) <- c("platinum")
v

v <- c("Every cloud has a silver lining")
substring(v, 19) <- c("golden")
v

v <- c("Every cloud has a silver lining")
substring(v, 19) <- c("platinum")
v

s1 = c("waste")
s2 = c("not")
s3 = c("want")

paste(s1, s2, s3, s2)
paste(s1, s2, s3, s2, sep = "")
paste(s1, s2, s3, s2, sep = "-")
paste(c(s1, s3), c(s2, s3), sep = "-")
paste(c(s1, s3), c(s2, s3), sep = "-", collapse = ", ")

month.abb = c("Jan", "Feb", "Mar", "Apr", "May", "Jun")
month.abb
nth <- paste0(1:6, c("st", "nd", "rd", rep("th", 3)))
nth
paste(month.abb, nth, sep = ": ", collapse = "; ")


today <- Sys.Date()
today
class(today)

now <- Sys.time()
now
class(now)


xdate <- as.Date("1970-10-31")
xdate
class(xdate)


str1 <- "Aug 22, '07"str2 <- "1992-11-15"str3 <- "30/January/89"date1 <- as.Date(str1, format = "%b %d, '%y")date2 <- as.Date(str2)date3 <- as.Date(str3, format = "%d/%B/%y")format(date1, "%A")format(date2, "%B %dth, %Y, %a")format(date3, "%b %Y")s1 <- c("1996-05-15 09:15:25")
s2 <- c("May 23, '96 hours:23 minutes:01 seconds:45")time01 <- as.POSIXct(s1)time02 <- as.POSIXct(s2, format = "%B %d, '%y hours:%H minutes:%M seconds:%S")format(time01, "%H.%M")
format(time02, "%I:%M %p")

#----------------------------------------

date01 <- as.Date("2015-10-31") 
date02 <- as.Date("2015-06-12")

date01 - date02
date02 - date01

date01 + 45
date02 - 10



