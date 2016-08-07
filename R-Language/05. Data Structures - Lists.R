#------------------------------------
# Demo 11: Lists
# 
#------------------------------------

emp <- list(2501, "Joe", "Sales", as.Date("2013-04-15"), 75000)
str(emp)
names(emp) <- c("EmpID", "FName", "Dept", "DOJ", "Salary")
str(emp)

emp[[1]]
emp[c(3, 5)]
emp$DOJ

#--------------------------------------------------------------

emp.id <- c(2501, 4672, 3520, 2119, 1874)
emp.fname <- c("Joe", "Lynda", "Zarook", "Edwin", "Brian")
emp.dept <- c("Marketing", "Personnel", "Operations", "Marketing", "Operations")
emp.DOJ <- c(   as.Date("2013-04-15"), 
                as.Date("2015-08-22"), 
                as.Date("2014-06-12"), 
                as.Date("2013-01-11"), 
                as.Date("2014-11-21"))
emp.salary <- c(75000, 65000, 58000, 69000, 62000)

emp <- list(emp.id, emp.fname, emp.dept, emp.DOJ, emp.salary)
names(emp) <- c("EmpID", "FName", "Dept", "DOJ", "Salary")
str(emp)

emp[["FName"]][[4]]
emp$FName[[4]]
emp$Salary[emp$FName == "Lynda"]
emp$FName[emp$DOJ > Sys.Date() - 365*3]
mean(emp$Salary[emp$Dept == "Marketing"])
