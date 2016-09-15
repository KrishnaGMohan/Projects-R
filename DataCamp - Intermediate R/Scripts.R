#-----------------------------------------------------------------
# 
# Relational Operators
#
#-----------------------------------------------------------------
TRUE == TRUE
TRUE != FALSE
3 > 2
1 < 5
"Adam" < "Bernie"
#-----------------------------------------------------------------
# 
# Conditional Operators - if statement
#
#-----------------------------------------------------------------
x <- -3
if (x < 0) {
    print("x is a negative number")
} else if (x == 0 ){
    print("x is zero")
} else {
    print("x is a positive number")
}

#-----------------------------------------------------------------
# 
# Conditional Operators - while loop
#
#-----------------------------------------------------------------
c <- 1
while (c <= 7) {
    print(paste("c has the value", c))
    c <- c + 1
}

# break statement

#-----------------------------------------------------------------
# 
# Conditional Operators - for loop
# for (var in seq) {
#     expr
# }
#
# break
# next
#-----------------------------------------------------------------
cities <- c("Toronto", "Vancouver", "Calgary", "Edmonton", "Quebec")

for (city in cities) {
    if (nchar(city) == 7) {
        print(city)
    }
}

for (i in 1:length(cities)) {
    print(cities[i])
}



# Pre-defined variables
rquote <- "r's internals are irrefutably intriguing"
chars <- strsplit(rquote, split = "")[[1]]

# Initialize rcount
rcount <- 0

# Finish the for loop
for (char in chars) {
    if (char == "u") {
        break
    }
    if (char == "R" | char == "r") {
        rcount <- rcount + 1
    }
}

# Print out rcount
rcount
