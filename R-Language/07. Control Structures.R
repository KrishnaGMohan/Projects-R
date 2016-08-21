#------------------------------------
# Demo 17: Control Structures - if / while
#------------------------------------
# Collatz conjecture
x <- 27
steps <- 0
while (x > 1) {
    if (x %% 2 == 1)
        x <- 3 * x + 1
    else
        x <- x / 2
    steps <-steps +1
}
steps

#--------------------------
# repeat
#--------------------------

x <- 27
steps <- 0
repeat {
    if (x %% 2 == 1)
        x <- 3 * x + 1
    else
        x <- x / 2

    steps <- steps + 1
    
    if (x == 1)
        break
}
steps

#------------------------------------
# Demo 18: Control Structures - for loop
#------------------------------------
# Preparation
emp.id <- c(2501, 4672, 3520, 2119, 1874)
emp.fname <- c("Joe", "Lynda", "Zarook", "Edwin", "Brian")
emp.dept <- c("Marketing", "Personnel", "Operations", "Marketing", "Operations")
emp.DOJ <- c(as.Date("2013-04-15"),
                as.Date("2015-08-22"),
                as.Date("2014-06-12"),
                as.Date("2013-01-11"),
                as.Date("2014-11-21"))
emp.salary <- c(85000, 55000, 45000, 65000, 57000)

empDF <- data.frame(emp.id, emp.fname, emp.dept, emp.DOJ, emp.salary)
colnames(empDF) <- c("empid", "fname", "dept", "doj", "salary")

newEmp <- data.frame(7856, "Fiona", "Marketing", Sys.Date(), 62000)
colnames(newEmp) <- colnames(empDF)
empDF <- rbind(empDF, newEmp)
emp.cityid <- c(3, 5, 2, 2, 4, 5)
empDF <- cbind(empDF, emp.cityid)
colnames(empDF) <- c(colnames(empDF)[1:5], "cityid")

city.id <- c(3, 2, 5, 4)
city.name <- c("Ottawa", "Vancouver", "Calgary", "Toronto")
cityDF <- data.frame(city.id, city.name)
colnames(cityDF) <- c("cityid", "city")

empDF <- merge(empDF, cityDF, by = "cityid")
empDF$salary <- empDF$salary * 1.56

empDF

#------------------------------------------------------------------
# 15% on the first $45,282 of taxable income, +
# 20.5% on the next $45,281 of taxable income(on the portion of taxable income over$45,282 up to $90,563), +
# 26% on the next $49,825 of taxable income(on the portion of taxable income over $90,563 up to $140,388), +
# 29% on the next $59,612 of taxable income(on the portion of taxable income over $140,388 up to $200,000), +
# 33% of taxable income over $200,000.
#------------------------------------------------------------------
fedtax <- rep(0, nrow(empDF)) # Creating an Federal Income Tax vector
for (x in 1:nrow(empDF)) {
    s <- empDF[x,]$salary
    if (s < 45282)
        fedtax[x] <- s * 15 / 100
    else if (s < 90563)
        fedtax[x] <- 6792 + (s - 45282) * 20.5 / 100
    else if (s < 140388)
        fedtax[x] <- 16075 + (s - 90563) * 26 / 100
    else if (s < 200000)
        fedtax[x] <- 29029 + (s - 140388) * 29 / 100
    else
        fedtax[x] <- 46317 + (s - 200000) * 33 / 100
}
empDF <- cbind(empDF, fedtax) # Add the fed tax column to the Data frame
empDF
