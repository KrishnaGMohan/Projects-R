#------------------------------------
# Vectors
#------------------------------------

numeric_vect <- c(10, 15.5, 2, -5, 8)
char_vect <- c("January", "February", "March", "April", "May", "June")

logical_vect <- numeric_vect < 5
logical_vect

# Vector comparison
A <- c(25.9, 27.1, 36, 47.3, 57.9)
B <- c(33.6, 17.8, 28, 53.7, 56.3)

Comp <- A > B
Comp

#------------------------------------
# Naming Vector elements
#------------------------------------
torTemps2013 = c(Q1 = -2.1, Q2 = 13.4, Q3 = 19.7, Q4 = 2.9)

torTemps2013[3]
torTemps2013["Q3"]

torTemps2013 = c(-2.1, 13.4, 19.7, 2.9)
torTemps2014 = c(-7.0, 13.4, 19.1, 4.3)
torTemps2015 = c(-7.2, 13.9, 20.7, 6.9)

quarterNames = c("Q1", "Q2", "Q3", "Q4")

names(torTemps2013) <- quarterNames
names(torTemps2014) <- quarterNames
names(torTemps2015) <- quarterNames

torTemps2013["Q1"]
torTemps2014["Q1"]

#------------------------------------
# Vector Arithmetic
#------------------------------------

x <- c(5, 8, 9, 3)
y <- c(2, 4, 8, 1)

x + y
x - y
x * y
x / y
x %% y

x ^ 2

sqrt(x)

#------------------------------------
# Comparing Vectors
#------------------------------------
pi
v <- c(3, pi, pi, 7)
w <- c(pi, pi, 6, 4)
v == w
v >= w
v != w
