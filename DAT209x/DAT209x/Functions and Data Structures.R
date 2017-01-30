paste("R session", 1)

data.frame(x = 1:3, y = 4:6) + 2
data.frame(x = 1:3, y = c("A", "B", "C")) + 2

#-------------------------



z <- function(x) {
    m <- mean(x)
    s <- sd(x)
    zvals <- (x - m) / s
    return(zvals)
}

x <- rnorm(1000)
head(z(x))

x <- rnorm(2)
z(x)

head(z(x))

#-------


f <- function(x) { 3 * sin(x / 2) + x }
f(0)
f(-1)
f(pi)
curve(f, -7, 7)


x <- c("b", 2, TRUE)
str(x)

y <- c(1, 2, 3.14, 4, 5)
y


z <- c(FALSE, TRUE, 2, 3, 4)
z

matrix(c(5, 4, 3, 2, 1, 0) + 2, nrow = 2) < 5

? sin
sin(pi,)

#------------------
a <- 7
b <- 5

myfunc <- function(x, y) {
    a <- x + y
    b <- x - y
    return(a * b)
}

myfunc(3, 4)


#-----------------------------
plot(sin, 0, 2 * pi)
plot(sin, - pi, 2 * pi)
plot(sin, - pi, pi)
plot(sin, pi, 3 * pi)
? plot
? hist
? cat
? density
? "if"
methods(plot)
?plot.density

#-----------------------
my.display <- function(x, display = FALSE, type = "none", prob = FALSE) {
    if (display) {
        if (type == "hist") {
            if (prob == TRUE)
                hist(x, freq = FALSE)
            else
                hist(x)
        } else if (type == "density") {
            plot(density(x))
        } else if (type == "none") {
            print("Please specify type as either hist or density")
        }
    }
    cat("Summary of input: \n")
    return(summary(x))
}

set.seed(1234)
my.data <- rnorm(200)
my.display(my.data)
my.display(my.data, display = TRUE, type = "hist")
my.display(my.data, display = TRUE, type = "hist", prob = TRUE)
my.display(my.data, display = TRUE, type = "density")
my.display(my.data, display = TRUE)