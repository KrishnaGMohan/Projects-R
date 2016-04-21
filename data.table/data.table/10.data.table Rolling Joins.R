#-----------------------------------------------------------------------------------
#
# Rolling Joins
#
#-----------------------------------------------------------------------------------
library(data.table)
DT <- data.table(A = c("c", "b", "a", "c", "b", "a"), B = c(4, 1, 6, 3, 5, 2), C = 1:6)
DT

setkey(DT, A, B)
DT

# The following looks for "b" and then 4 that falls in the gap between 1 and 5. Shows b 4 NA
DT[.("b", 4)]

# Rolls the prevailing gap forwards to b 4 2
DT[.("b", 4), roll = TRUE]


# Rolls the prevailing gap forwards or backwards to closest value
DT[.("b", 4), roll = "nearest"]

# Rolls the prevailing gap forwards always. Shows b 4 2
DT[.("b", 4), roll = +Inf]

# Rolls the prevailing gap backwards always. Shows b 4 5
DT[.("b", 4), roll = -Inf]

# Limit staleness. Return prevailing observation provided it is within 2 forwards. Shows b 4 NA
DT[.("b", 4), roll = 2]

# Limit staleness. Return prevailing observation provided it is within 2 backwards. Shows b 4 5
DT[.("b", 4), roll = -2]

# Control Ends. What is the data we need falls after the end of the data or before it? We set rollens = FALSE. 
DT[.("b", 7:8), roll = TRUE, rollends = FALSE]

#-----------------------------------------------------------------------------------
# Get the key of DT through the key() function.
# Use the super charged row names to look up the row where A == "b" & B == 6, without using == . Verify here that C is NA.
# Based on the query that was written in the previous instruction, return the prevailing row before this gap. Use roll.
# Again, start with the code from the second instruction, but this time find the nearest row.
#-----------------------------------------------------------------------------------

# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
                 B = c(5, 4, 1, 9, 8, 8, 6),
                 C = 6:12,
                 key = "A,B")

DT

# Get the key of DT through the key() function.
key(DT)

# Use the super charged row names to look up the row where A == "b" & B == 6, without using == . Verify here that C is NA.
DT[.("b", 6)]

# Based on the query that was written in the previous instruction, return the prevailing row before this gap. Use roll.
DT[.("b", 6), roll = +Inf]

# Again, start with the code from the second instruction, but this time find the nearest row.
DT[.("b", 6), roll = "nearest"]

#-----------------------------------------------------------------------------------
# Print out the sequence(-2):10 forthe "b" group.
# Copy and extend the code to carry the prevailing values forwards through the NA.
# Copy and extend the code to also carry the first observation backwards.
#-----------------------------------------------------------------------------------

# Keyed data.table DT
DT <- data.table(A = letters[c(2, 1, 2, 3, 1, 2, 3)],
                 B = c(5, 4, 1, 9, 8, 8, 6),
                 C = 6:12,
                 key = "A,B")

# Look at the sequence (-2):10 for the "b" group
DT[.("b", (-2):10)]

# Add code: carry the prevailing values forwards
DT[.("b", (-2):10), roll = TRUE]

# Add code: carry the first observation backwards
DT[.("b", (-2):10), roll = TRUE, rollends = TRUE]
DT[.("b", (-2):10), roll = TRUE, rollends = c(TRUE, TRUE)] # also OK

# DT is loaded in the console. If you look up the value B==20 in group A=="b" without limiting the roll, the value of column C is now … 11
DT[.("b", 20), roll = TRUE, rollends = TRUE]

