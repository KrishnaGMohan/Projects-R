#-----------------------------------------------------------------------------------
#
#  Using 
#  set() : sets value of a column by reference
#  setnames() : sets/changes the names of a column
#  setcolorder() : sets the columns order by reference
#
#-----------------------------------------------------------------------------------
library(data.table)
DT <- data.table(x = c(1:5), y = c(1, 8, 1, 1, 1), z = c(2, 5, 4, 2, 3))
DT

for (i in 1:5)
{
    DT[i, z := i + 1]
}

# set(<data.table>, row, col, value)
for (i in 1:5)
{
    set(DT, i, 3L, i+1)
}

# setnames(<data.table>, "old colname","new colname")
setnames(DT, "z", "z_new")

# setcolorder(<data.table>, c("colname1", "colname2", "colname3"))
setcolorder(DT, c("z", "x", "y"))


#-----------------------------------------------------------------------------------
# A data.table DT has been created for you in the workspace. Check it out!
# Loop through columns 2, 3 and 4, and for each one select 3 rows at random and set the value of that column to NA.
# Change the column names to lower case. When setnames() is passed just one input vector, that needs to be all the new names.
# Print the resulting DT to the console to see what changed
#-----------------------------------------------------------------------------------


# Set the seed
set.seed(1)

# Check the DT that is made available to you
DT <- data.table(
        A = c(2, 2, 3, 5, 2, 5, 5, 4, 4, 1),
        B = c(2, 1, 4, 2, 4, 3, 4, 5, 2, 4),
        C = c(5, 2, 4, 1, 2, 2, 1, 2, 5, 2),
        D = c(3, 3, 3, 1, 5, 4, 4, 1, 4, 3)
        )
DT

# For loop with set
for (i in 2:4) 
    set(DT, sample(1:nrow(DT), 3, replace = FALSE), i, NA)

# Change the column names to lowercase
setnames(DT, colnames(DT), tolower(colnames(DT)))

# Print the resulting DT to the console
DT

#-----------------------------------------------------------------------------------
# First, add a postfix "_2" to all column names of DT. You can use paste0() here.
# Next, use setnames() to change a_2 to A2.
# To end, reverse the order of the columns.
#-----------------------------------------------------------------------------------

DT <- data.table(a = letters[c(1, 1, 1, 2, 2)], b = 1)

# Add a postfix "_2" to all column names
setnames(DT, colnames(DT), paste(colnames(DT), "_2", sep ="" ))

# Change column name "a_2" to "A2"
setnames(DT, "a_2", "A2")

# Reverse the order of the columns
setcolorder(DT, rev(colnames(DT)))