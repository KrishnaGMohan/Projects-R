#------------------------------------
# Demo 12: DataFrames
#------------------------------------
emp.id <- c(2501, 4672, 3520, 2119, 1874)
emp.fname <- c("Joe", "Lynda", "Zarook", "Edwin", "Brian")
emp.dept <- c("Marketing", "Personnel", "Operations", "Marketing", "Operations")
emp.DOJ <- c(as.Date("2013-04-15"),
                as.Date("2015-08-22"),
                as.Date("2014-06-12"),
                as.Date("2013-01-11"),
                as.Date("2014-11-21"))
emp.salary <- c(75000, 65000, 58000, 69000, 62000)


empDF <- data.frame(emp.id, emp.fname, emp.dept, emp.DOJ, emp.salary)
empDF

colnames(empDF) <- c("empid", "fname", "dept", "doj", "salary")
empDF

str(empDF)

# Adding a Row
newEmp <- data.frame(7856, "Fiona", "Marketing", Sys.Date(), 62000)
colnames(newEmp) <- colnames(empDF)
empDF <- rbind(empDF, newEmp)
empDF


#Adding a Column
emp.cityid <- c(3, 5, 2, 2, 4, 5)
empDF <- cbind(empDF, emp.cityid)
colnames(empDF) <- c(colnames(empDF)[1:5], "cityid")
empDF

#----------------------
city.id <- c(3, 2, 5, 4)
city.name <- c("Ottawa", "Vancouver", "Calgary", "Toronto")
cityDF <- data.frame(city.id, city.name)
colnames(cityDF) <- c("cityid", "city")

cityDF

empDF <- merge(empDF, cityDF, by = "cityid")
empDF

temp <- edit(empDF)