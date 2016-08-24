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



