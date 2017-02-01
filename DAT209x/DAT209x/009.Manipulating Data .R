tapply(presidents, cycle(presidents), mean, na.rm = T)

summary(airquality$Wind)


# The cut() function supplies the intervals to which an observation belongs, if we specify 
# the cut points with the breaks option. In this case, we should have 11 cut points to 
# give us 10 intervals. We can get those as the numbers 1, 3, 5, …,21, which spans the 
# values of airquality$Wind using the following code:
my.cut <- cut(airquality$Wind, breaks = 2 * (1:11) - 1)
tapply(airquality$Solar.R, my.cut, mean, na.rm = TRUE)


#------------------------
summary(swiss)
my.cut2 <- cut(swiss$Agriculture, breaks = 10 * (0:10))
my.cut3 <- cut(swiss$Catholic, breaks = 10 * (0:10))
tapply(swiss$Fertility, list(my.cut2, my.cut3), mean)


#-----------------
colMeans(airquality)
sapply(airquality, mean)

#-----------------
tapply(chickwts$weight, chickwts$feed, mean)
aggregate(weight ~ feed, data = chickwts, mean)
by(chickwts$weight, chickwts$feed, mean)



#----------
with(airquality, table(Month, Temp < 65))
table(LowTemp = airquality$Temp < 65, airquality$Month)

#--------------------
prop.table(with(airquality, table(Month, Temp > 80)), 1)
prop.table(with(airquality, table(Temp > 80, Month)), 2)
#------------------------


lapply(airquality, mean)
as.list(sapply(airquality, mean))


#---------------------------------------
my.data <- data.frame(Treatment = c(rep("A", 4), rep("B", 4)),
                    Stone = rep(rep(c("Small", "Large"), c(2, 2)), 2),
                    Success = rep(c(1, 0), 4),
                    Count = c(81, 6, 192, 71, 234, 36, 55, 25))
dim(my.data)

my.table <- xtabs(Count ~ Treatment + Success + Stone, data = my.data)
#--------------------
prop.table(margin.table(my.table, 1:2), 1)

prop.table(my.table[,, 2], 1) # small stone (2)
prop.table(my.table[,, 1], 1)


prop.table(my.table[1,,], 2)
prop.table(my.table[2,,], 2)



prop.table(margin.table(my.table, c(3, 1)), 1)
prop.table(margin.table(my.table, c(1, 3)), 2)



