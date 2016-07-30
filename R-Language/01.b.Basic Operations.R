#------------------------------------
# Workspace Operations
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

#------------------------------------
# String operations
#------------------------------------
# substr(x, start pos, stop pos)
# substring(text, first, last = 1000000L)
# substr(x, start, stop) <- value
# substring(text, first, last = 1000000L) <- value

v <- c("Every cloud has a silver lining")
substr(v, 7, 15)
substring(v, 7)
substring(v, 7, 24)

v <- c("Every cloud has a silver lining")
substr(v, 19, 26) <- c("golden")
v

v <- c("Every cloud has a silver lining")
substr(v, 19, 26) <- c("platinum")
v

v <- c("Every cloud has a silver lining")
substring(v, 19) <- c("golden")
v

v <- c("Every cloud has a silver lining")
substring(v, 19) <- c("platinum")
v
