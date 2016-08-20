#------------------------------------
# Demo 17: Control Structures
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
itax <- rep(0, 6) # Creating an Income Tax vector
ctr <- 1 # Counter for looping

while (ctr <= 6) {
    if (empDF$salary[ctr] < 45282)
        itax[ctr] <- empDF$salary[ctr] * 15 / 100
    else if (empDF$salary[ctr] < 90563)
        itax[ctr] <- 6792 + (empDF$salary[ctr] - 45282) * 20.5 / 100
    else if (empDF$salary[ctr] < 140388)
        itax[ctr] <- 16075 + (empDF$salary[ctr] - 90563) * 26 / 100
    else if (empDF$salary[ctr] < 200000)
        itax[ctr] <- 29029 + (empDF$salary[ctr] - 140388) * 29 / 100
    else 
        itax[ctr] <- 46317 + (empDF$salary[ctr] - 200000) * 33 / 100

    ctr <- ctr + 1 # increment counter
}

itax # Display Income Tax vector
