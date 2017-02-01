x <- matrix(1:12, 4)
x[cbind(c(1, 3, 2), c(3, 3, 2))] #first selection
x[c(1, 3, 2), c(3, 3, 2)]


row <- matrix(rep(1:100, 100), nrow = 100)
column <- matrix(rep(1:100, 100), nrow = 100, byrow = T)
A <- 3 * column ^ 3 / (1 + row * column)

row
column

sum(A)
sum(A[row <= column])


x <- 1:3
y <- seq(4, 8)
z <- rep(9:10, 1)
xyz <- c(x, y, z)
xyz


x <- 1:10
x[2 * (1:5) - 1]

x <- matrix(-4:5, nrow = 2)
x

set.seed(9852)
my.data <- list()
for (i in 1:100) {
    my.data[[i]] <- matrix(rnorm(16), nrow = 4)
}

my.index <- list()
for (i in 1:100) {
    my.index[[i]] <- (my.data[[i]] < 0) 
}


my.negatives <- matrix(rep(0, 16), nrow = 4)
for (i in 1:100) {
    my.negatives <- my.negatives + my.index[[i]]
}
my.negatives

sum(my.negatives)

my.negative.values <- numeric(0)
for (i in 1:100) {
    my.negative.values <- c(my.negative.values, my.data[[i]][my.index[[i]]])
}
my.negative.values

summary(my.negative.values)