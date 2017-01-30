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
