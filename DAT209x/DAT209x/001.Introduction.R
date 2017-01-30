x <- rnorm(1000)

mean(exp(x))
exp(mean(x) + (sd(x) ^ 2) / 2)
exp(mean(x) - (sd(x) ^ 2) / 2)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
a <- 1
b <- 3
c <- 1

x <- c(( - b + sqrt(b ^ 2 - 4 * a * c)) / (2 * a), ( - b - sqrt(b ^ 2 - 4 * a * c)) / (2 * a))
options(digits = 1)
x

options(digits = 8)
c(-0.4, -2.6) / x - 1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set.seed(1234)
x <- rnorm(100, mean = .5, sd = .3)
mean(x)
sd(x)
histogram(x)
hist(x)
axis(4)
#--------------------
set.seed(1)
x <- rnorm(100)
head(x)

help(tail)
? tail
? "tail"

x <- 5:6
x

#-------------------
x <- 5 + 6
y <- x + 3
z <- y - 10
z

A <- c(1, 3, 5, 7, 9)
B <- mean(A)
X <- seq(2, 10, by = 2)
Z <- A + X
