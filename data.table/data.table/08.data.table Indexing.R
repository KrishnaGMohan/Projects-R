#-----------------------------------------------------------------------------------
#
# Indexing
#
#-----------------------------------------------------------------------------------
library(data.table)
DT <- data.table(A = c("c", "b", "a", "c", "b", "a"), B = 1:6)
DT

# data.table automatically creates an index on column A
DT[A == "a"]
DT[, A == "a"]

# So the following statement is much faster
DT[A == "b"]


# Convert iris to a data.table
iris <- as.data.table(iris)

# Species is "virginica"
iris[Species == "virginica"]

# Species is either "virginica" or "versicolor"
iris[Species %in% c("virginica", "versicolor")]




#-----------------------------------------------------------------------------------
# Change the names of the columns in iris that contain "Sepal.":remove the "Sepal." prefix. Use gsub() .
# Remove the two columns that start with "Petal" from the iris data.table
#-----------------------------------------------------------------------------------

# iris as a data.table
iris <- as.data.table(iris)

# Remove the Sepal. prefix... 
setnames(iris, gsub("^Sepal\\.", "", names(iris)))

# Remove the two columns starting with "Petal"
iris[, grep("^Petal", names(iris)) := NULL]


#-----------------------------------------------------------------------------------
# Select the rows where the area is greater than 20 square centimeters.
#
# Add a new boolean column containing Width * Length > 25 and call it is_large.
# Select the rows for which the value of is_large is TRUE.
#-----------------------------------------------------------------------------------

# Cleaned up iris data.table
iris

# Rows for which area is greater than 20 sq cm
iris[Length * Width > 20]

# Add new boolean column is_large (area greater than 25 sq cm)
iris[, is_large := Length * Width > 25]

# Now select rows again where the area is greater than 25 square centimeters
iris[is_large == TRUE]