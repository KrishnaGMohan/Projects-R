set.seed(9007)
my.data <- data.frame(x = rnorm(10), y = rnorm(10) + 5, z = rchisq(10, 1))
additional.data <- data.frame(x = rnorm(3), y = rnorm(3) + 5, z = rchisq(3, 1))

write.table(my.data, "Exercise 6.1.txt", row.names = FALSE, col.names = FALSE)
write.table(additional.data, "Exercise 6.1.txt", row.names = FALSE, col.names = FALSE, append = T)


set.seed(45)
my.data <- data.frame(x = rnorm(10), y = rnorm(10), z = rnorm(10))
write.csv2(my.data, "Data/Exercise 6.2.csv")


set.seed(45)
my.data <- data.frame(x = rnorm(10), y = rnorm(10), z = rnorm(10))
save(my.data, file = "Exercise 6.4.Rdata")
rm(my.data)
load("Exercise 6.4.Rdata")
head(my.data)


mtcars

write.table(mtcars, file = "mtcars1.txt", sep = ",")
write.csv(mtcars, file = "mtcars2.txt")

?sink
?cat
?save
?write.table;
?round


set.seed(9007)
my.data <- data.frame(x = rnorm(10), y = rnorm(10) + 5, z = rchisq(10, 1))
my.data2 <- my.data * 10e5
write.table(my.data2, "Assignment 6c.txt", row.names = FALSE)
my.data3 <- read.table("Assignment 6c.txt", header = TRUE) / 10e5

options(digits = 20)

my.data[1, 1]-my.data3[1, 1]
