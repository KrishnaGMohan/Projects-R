today <- Sys.Date()
today
class(today)

now <- Sys.time()
now
class(now)

# as.Date(x)  -- "%Y-%m-%d"
xdate <- as.Date("1970-10-31")
xdate

# as.Date(x, format = "%Y-%m-%d")
xdate <- as.Date("1970-31-10", format = "%Y-%d-%m")
xdate
