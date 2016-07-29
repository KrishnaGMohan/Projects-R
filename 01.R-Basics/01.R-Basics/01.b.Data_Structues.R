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

torTemps2013 = c(-2.1, 13.4, 19.7, 2.9)
quarterNames = c("Q1", "Q2", "Q3", "Q4")
names(torTemps2013) <- quarterNames
torTemps2013

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

#------------------------------------
# Selecting vector elements
#------------------------------------

v <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89)

v[1]
v[2:5]
v[c(1, 2, 4, 8)]
v[-1]
v[v < 7]
v[v %% 2 == 0]
v[v > median(v)]
v[(v < quantile(v, 0.10)) | (v > quantile(v, 0.90))]
v[abs(v - mean(v)) > 2 * sd(v)]

dailyRain <- c(Mon = 22, Tue = NA, Wed = 35, Thu = NULL, Fri = 6, Sat = 17, Sun = 11)
mean(dailyRain)
dailyRain[!is.na(dailyRain) & !is.null(dailyRain)]
mean(dailyRain[!is.na(dailyRain) & !is.null(dailyRain)])

#------------------------------------
# Selecting vector elements - using names
#------------------------------------

torTemps2013 = c(-2.1, 13.4, 19.7, 2.9)
torTemps2014 = c(-7.0, 13.4, 19.1, 4.3)
torTemps2015 = c(-7.2, 13.9, 20.7, 6.9)

quarterNames = c("Q1", "Q2", "Q3", "Q4")

names(torTemps2013) <- quarterNames
names(torTemps2014) <- quarterNames
names(torTemps2015) <- quarterNames

torTemps2013["Q2"]
torTemps2014[c("Q2", "Q4")]
torTemps2015[paste(c("Q"),2:4,sep = "")]