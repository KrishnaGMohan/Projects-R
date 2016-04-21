#-----------------------------------------------------------------------------------
#
# Keys
#
#-----------------------------------------------------------------------------------

library(data.table)
DT <- data.table(A = c("c", "b", "a", "c", "b", "a"), B = 1:6)
DT

# Sorts the data by the column we specify
# and changes the table by reference
setkey(DT, A)
DT


# DT["b"] is allowed. DF["b"] results in error
DT["b"]

# mult argument
DT["b", mult = "first"] # returns first row
DT["b", mult = "last"] # returns last row


# nomatch argument
DT[c("b", "d")] # "d" is not matched so results in an NA for "d"
DT[c("b", "d"), nomatch = 0] # eliminates values not found in table
DT[c("b", "d"), nomatch = NA]  # is the default


# two-column keys
DT <- data.table(A = c("c", "b", "a", "c", "b", "a"), B = c(4,1,6,3,5,2), C = c(6,3,2,5,4,1))
DT

setkey(DT, A, B)
DT[.("b", 5)]


#-----------------------------------------------------------------------------------
# Select the "b" group without using == .
# Select the "b" and "c" groups, again without using == .
# Select the first row of the b and c groups using mult.
# Use by = .EACHI and .SD to select the first and last row of the b and c groups.
# Extend the previous command to print out the group before returning the first and last row from it.
#-----------------------------------------------------------------------------------



# The 'keyed' data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
                 B = c(5, 4, 1, 9, 8, 8, 6),
                 C = 6:12)

setkey(DT, A, B)
# Select the "b" group without using == .
DT["b"]

# Select the "b" and "c" groups, again without using == .
DT[c("b", "c")]

# Select the first row of the b and c groups using mult.
DT[c("b", "c"), mult = "first"]

# Use by = .EACHI and .SD to select the first and last row of the b and c groups.
DT[c("b", "c"), .SD[c(1, .N)], by = .EACHI]

# Extend the previous command to print out the group before returning the first and last row from it.
DT[c("b", "c"), {
    print(.SD);
    .SD[c(1, .N)]
}, by = .EACHI]

