#-----------------------------------------------------------------------------------
#
#  Using := in "j"
#
#-----------------------------------------------------------------------------------
library(data.table)

# The data.table DT
DT <- data.table(A = letters[c(1, 1, 1, 2, 2)], B = 1:5)

# Add a column to DT by reference, named Total, that contains sum(B) for each group in column A.
DT[, Total := sum(B), by = A]
DT


#Add 1L to the values in column B, but only in the rows 2 and 4.
DT[c(2, 4), B := B + 1L]
DT


# Add a new column Total2 that contains sum(B) grouped by A but just over rows 2, 3 and 4. 
DT[2:4, Total2 := sum(B), by = .(A)]
DT

# Remove the Total column from DT
DT[, Total := NULL]

# Use[[to select the third column as a vector. Simply print it out to the console
DT[[3]]



#-----------------------------------------------------------------------------------


DT <- data.table(A = c(1, 1, 1, 2, 2), B = 1:5)
DT

# Update B with B + 1 and add a new column C with A + B, and D with constant 2. 
DT[, `:=`(B = B + 1L, C = A + B, D = 2)]
DT
#  DT[, c("B","C","D"):=.(B + 1L, A+B, 2)]  # This will also work



# A variable my_cols has been defined. Use it to delete these columns from DT.
my_cols <- c("B", "C")
DT[, (my_cols) := NULL]
DT

# Finally, Delete column D by number (2), not by name (D).
DT[, names(DT)[2] := NULL]
DT
