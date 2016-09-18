#------------------------------------
# Demo 19: Functions
#------------------------------------
mul <- function(x, y) { x * y }
mul(5, 7)

mul <- function(x, y) { x * y }
mul(y = 7, x = 5)


mul <- function(x, y = 8) { x * y }
mul(3)

mul <- function(x, y = 8) { x * y }
mul(3, 5)
mul(y = 5, x = 3)

#-----------------------------------
fib <- function(n) {
    if (n <= 1) {
        return(n)
    } else {
        return(fib(n - 1) + fib(n - 2))
    }
}

for (i in 1:8) {
    print (fib(i))
}
#-----------------------------------

(function(x) { 2 ^ x + 1 })(3)

#-----------------------------------
pow <- function(first, second) { return(first ^ second) }
pow(first = 2, second = 3)
pow(second = 3, first = 2)

pow(f = 2, s = 3)
pow(2, 3)


#------------------------------------
# Demo 20: apply Functions - lapply
#------------------------------------

cities <- c("Toronto","Vancouver", "Calgary", "Edmonton", "Winnipeg")
unlist(lapply(cities, nchar))

# Lets gets the average temperatures in Toronto for 2015
# Ref: http://toronto.weatherstats.ca/charts/temperature-5years.html
# Notice that the temperatures are in Celcius
# To convert we write a function CelciusToFarenheit and apply it to all values in torTemps2015

torTemps2015 = c(-7.2, 13.9, 20.7, 6.9)
quarterNames = c("Q1", "Q2", "Q3", "Q4")
names(torTemps2015) <- quarterNames

CelciusToFarenheit <- function(x) {(x * 1.8) + 32 }

torTemps2015inFarenheit <- unlist(lapply(torTemps2015, CelciusToFarenheit))
torTemps2015inFarenheit

# Anonymous functions
torTemps2015 = c(-7.2, 13.9, 20.7, 6.9)
quarterNames = c("Q1", "Q2", "Q3", "Q4")
names(torTemps2015) <- quarterNames

torTemps2015inFarenheit <- unlist(lapply(torTemps2015,
    function(x) {
        (x * 1.8) + 32
    }
))

torTemps2015inFarenheit

# Multiple arguments
# convert takes a value and a string “F” or “C” to indicate the conversion.
#  If the string is “F” convert the value to Farenheit
#  If the string is “C” convert the value to Celsius

convert <- function(x, s) {
    if (s == "F") {
        return((x * 1.8) + 32)
    }
    else if (s == "C") {
        return((x - 32) / 1.8)
    }
    else {
        return(x)
    }
}

torTemps2015 = c(-7.2, 13.9, 20.7, 6.9)
quarterNames = c("Q1", "Q2", "Q3", "Q4")
names(torTemps2015) <- quarterNames

torTemps2015inFarenheit <- unlist(lapply(torTemps2015, convert, "F"))
torTemps2015inFarenheit

#------------------------------------
# Demo 21: apply Functions - sapply
#------------------------------------

cities <- c("Toronto", "Vancouver", "Calgary", "Edmonton", "Winnipeg")
sapply(cities, nchar)
cities <- c("Toronto", "Vancouver", "Calgary", "Edmonton", "Winnipeg")
sapply(cities, nchar, USE.NAMES = FALSE)

#----
install.packages("gmp")
library(gmp)
factorize(73245)

num <- c(65873, 37578, 74357, 75784)
lapply(num, factorize)
sapply(num, factorize)


#------------------------------------
# Demo 22: apply Functions - vapply
#------------------------------------

cities <- c("Toronto", "Vancouver", "Calgary", "Edmonton", "Winnipeg")
vapply(cities, nchar, numeric(1))

cities <- c("Toronto", "Vancouver", "Calgary", "Edmonton", "Winnipeg")
vapply(cities, nchar, numeric(1), USE.NAMES = FALSE)

# install.packages("gmp")
# library(gmp)
num <- c(65873, 37578, 74357, 75784)
vapply(num, factorize, FUN.VALUE = numeric(28)) # Will result in an error

