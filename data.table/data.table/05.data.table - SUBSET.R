#-----------------------------------------------------------------------------
#
#   Subset of Data
#
#-----------------------------------------------------------------------------
library(data.table)

DT <- data.table(x = c(2, 1, 2, 1, 2, 2, 1), y = seq(1, 13, by = 2), z = seq(2, 14, by = 2))
DT

# Mean of columns
DT[, lapply(.SD, mean), by = .(x)]

# Median of columns
DT[, lapply(.SD, median), by = .(x)]

#-----------------------------------------------------------------------------
DT <- data.table(
                grp = c(6, 6, 8, 8, 8),
                Q1 = c(2, 2, 3, 5, 2),
                Q2 = c(5, 5, 4, 4, 1),
                Q3 = c(2, 1, 4, 2, 4),
                H1 = c(3, 4, 5, 2, 4),
                H2 = c(5, 2, 4, 1, 2)
                )

DT

# Calculate the sum of the Q columns
DT[, lapply(.SD, sum), .SDcols=2:4]

# Calculate the sum of columns H1 and H2 
DT[,lapply(.SD,sum), .SDcols=paste0("H",1:2)]

# Select all but the first row of groups 1 and 2, returning only the grp column and the Q columns. 
DT[, .SD[-1], by = grp, .SDcols = paste0("Q", 1:3)]


#-----------------------------------------------------------------------------

DT <- data.table(x = c(2, 1, 2, 1, 2, 2, 1), y = seq(1, 13, by = 2), z = seq(2, 14, by = 2))
DT

# Sum of all columns and the number of rows
DT[, c(lapply(.SD, sum), .N), by = .(x), .SDcols = c("x", "y", "z")]

# Cumulative sum of column x and y while grouping by x and z > 8
DT[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z > 8), .SDcols = c("x", "y")]

# Chaining
DT[, lapply(.SD, cumsum), by = .(by1 = x, by2 = z > 8), .SDcols = c("x", "y")][, lapply(.SD, max), by = .(by1), .SDcols = c("x", "y")]

