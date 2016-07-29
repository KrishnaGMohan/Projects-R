#------------------------------------
# Arithmetic
#------------------------------------

# Addition
10 + 7

# Subtraction
9 - 4

# Multiplication
6 * 3

 # Division
(8 - 3) / 2

# Exponentiation
3 ^ 4

# Modulo
42 %% 5



#------------------------------------
# Variables
#------------------------------------
# Assign 5 to variable 'x'
x <- 5

# Assign 'x + 3' to 'y'
y <- x + 3

# Assign '(y - x) * 2' to 'z'
z <- (y - x) * 2

# Print the values of x, y, z
x
y
z


#------------------------------------
#Basic Data Types in R
#------------------------------------
val <- 15
amount <- 23.75
product <- "shoes"
isRaining <- TRUE


#------------------------------------
#Verifying the Data Type of a variable
#------------------------------------
class(val)
class(amount)
class(product)
class(isRaining)

#------------------------------------
#Some additional stuff
#------------------------------------
# List all the objects in your local workspace
ls()

# Delete an object
rm(z)

# Delete all objects
rm(list = ls())

#------------------------------------
# Sequences of Numbers
#------------------------------------

1:5
3:-2
seq(2, 9, by = 3)
seq(2, 4, by = 0.5)
seq(4, 8, length = 8)

x <- c(1, 3, 5, 7, 9, 11)
1:length(x)

x <- c(1, 3, 5, 7, 9, 11)
seq(along.with = x)

x <- c(1, 3, 5, 7, 9, 11)
seq_along(x)

rep(0, 5)
rep(c(1, 2, 3), times = 3)
rep(c(0, 1, 2), each = 3)
rep(c(1, 2), c(2, 3))
rep(c(1:3), length.out = 10)

