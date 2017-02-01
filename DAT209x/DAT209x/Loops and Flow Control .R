set.seed(1786)
data.exercise.3.1 <- exp(matrix(rnorm(2000), nrow = 100))
index1.temp <- sample(1:100, 10)
index2.temp <- sample(1:20, 10)
for (i in 1:10) {
    data.exercise.3.1[index1.temp[i], index2.temp[i]] <- -1
}

my.data <- data.exercise.3.1
head(my.data)

#dim(my.data)[1]
cnt <- 0
for (i in 1:dim(my.data)[1]) {
    neg <- sum(my.data[i,] < 0)
    if (neg == 0) {
        print(cat("The mean of row number ", i, " is ", mean(my.data[i,]), "\n"))
    } else {
        cnt <- cnt + 1
        if (cnt <= 3) {
            print(cat("<Row ", i, " contains negative values>\n"))
        } else {
            print("Too many negative values")
            break
        }
    }
}


#-------------
my.dimensions <- c(10, 20, 50, 100, 200, 500, 800, 1000)
my.runtime.factors <- numeric(8)

r <- 1
k <- my.dimensions[r]
y <- matrix(rnorm(k ^ 2), nrow = k)
z <- 0 * y
time1 <- as.numeric(Sys.time())
#loop:
for (i in 1:k) {
    for (j in 1:k) {
        z[i, j] <- y[i, j] ^ 2
    }
}
time2 <- as.numeric(Sys.time())
time3 <- as.numeric(Sys.time())
# using object form in R:z<-y^2
time4 <- as.numeric(Sys.time())
# run time increase factor: 
my.runtime.factors[r] <- (time2 - time1) / (time4 - time3)
#Lastly, we plot the runtime factors against the number of elements i
plot(my.dimensions ^ 2, my.runtime.factors, log = "xy", xlab = "Number of operations")
#-----------------------


k1 <- 10
k2 <- 100000
my.data <- as.data.frame(matrix(rnorm(k1 * k2), nrow = k1))
mean1 <- numeric(k2)
mean2 <- numeric(k2)

for (i in 1:k2) {
    mean1[i] <- mean(my.data[, i])
}
time1 <- as.numeric(Sys.time())
for (i in 1:k2) {
    mean1[i] <- mean(my.data[, i])
}
time2 <- as.numeric(Sys.time())
time3 <- as.numeric(Sys.time())
mean2 <- sapply(my.data, mean)
time4 <- as.numeric(Sys.time())
(time2 - time1) / (time4 - time3)


#------------------
for (i in 0:10) {
    if (i %% 2 != 0) cat(i)
    }

#----------------------
notfound <- TRUE
i <- 0
while (notfound) {
    if (i %% 2 != 0) {
        cat(i)
        notfound <- FALSE
    }
}
#-------------
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE, FALSE, FALSE, TRUE))
lapply(x, mean)

#-------------------------
k <- 1000
r <- 100
set.seed(5556)
x <- as.data.frame(matrix(rnorm(r * k), nrow = k))

dim(x)


my.summary <- matrix(nrow = 4, ncol = k)
head(my.summary)

my.function <- function(x) {
    ... .
}

?sapply
