my.ozone <- airquality$Ozone[!is.na(airquality$Ozone) & airquality$Ozone > 1]
mean.1 <- mean(my.ozone)
sd.1 <- sd(my.ozone)

length(my.ozone)


set.seed(55789)
simulated.1 <- rnorm(115, mean = mean.1, sd = sd.1)
qqplot(simulated.1, my.ozone)
lines(0:200, 0:200, type = "l", lwd = 3, col = "red")


mean.2 <- mean(log(my.ozone))
sd.2 <- sd(log(my.ozone))
set.seed(8942)
simulated.2 <- rnorm(115, mean = mean.2, sd = sd.2)
qqplot(exp(simulated.2), my.ozone)
lines(0:200, 0:200, type = "l", lwd = 3, col = "red")

#-------------------------------
doone <- function() {
    x <- sum(sample(1:6, 2, replace = TRUE))
    y <- sum(sample(1:6, x, replace = TRUE))
    y
}
set.seed(457778)
y.values <- replicate(1000, doone())
hist(y.values)

doone <- function() {
    rnorm(3, mean = 2, sd = 1)
}
set.seed(87346)
y.values <- replicate(1000, doone())
y.values <- t(y.values)
head(y.values)

colMeans(y.values)



#----------------------------
n <- 10000
doone <- function() {
    x <- rbinom(1, 50, 1 / 6)
    p <- x / 50
    p
}
p.sim <- replicate(n, doone())
length(p.sim)

#----------------------
n<-1000
doone <- function() {
    x <- rbinom(1, 50, 1 / 6)
    p <- x / 50
    p
}
p.sim <- replicate(n, doone())
hist(p.sim, breaks = 20)


#--------------
getwd()
my.data <- read.table("Lab10.csv", header = TRUE, sep = ",")
dim(my.data)
unique(my.data$Genotype)
data1 <- my.data$systolic.bp[my.data$Genotype == "BA"]
data2 <- my.data$systolic.bp[my.data$Genotype == "BB"]

data1
data2

testResult <- t.test(data1, data2)
testResult

plot(density(data1))
lines(density(data2), col = "blue")


#---------------------------------
n1 <- length(data1)


set.seed(1234)
my.new.data <- my.data
my.new.data$Genotype <- "BB"
index.temp <- sample(1:50, n1)
my.new.data$Genotype[index.temp] <- "BA"
new.data1 <- my.new.data$systolic.bp[my.new.data$Genotype == "BA"]
new.data2 <- my.new.data$systolic.bp[my.new.data$Genotype == "BB"]
t.test(new.data1, new.data2)$statistic


set.seed(554)
p.sim <- function() {
my.new.data <- my.data
my.new.data$Genotype <- "BB"
index.temp <- sample(1:50, n1)
my.new.data$Genotype[index.temp] <- "BA"
new.data1 <- my.new.data$systolic.bp[my.new.data$Genotype == "BA"]
new.data2 <- my.new.data$systolic.bp[my.new.data$Genotype == "BB"]
t.test(new.data1, new.data2)$statistic
}

options(digits = 20)

my.t.values <- replicate(10000, p.sim())

length(my.t.values)
head(my.t.values)

(sum(my.t.values < -2.027021) + sum(my.t.values > +2.027021)) / 10000


-2.027021 correct
