#--------------------------------------------------------------------------------------------- 
#
#  2D Sequence of data elements of the same basic type
#
#   matrix(1:6, nrow = 2)
#   matrix(1:6, ncol = 3)
#   matrix(1:6, nrow = 2, byrow = TRUE)
#
#   cbind(), rbind()
#
#   rownames(), colnames()
#   matrix( 1:6, byrow = TRUE, nrow = 2, dimnames = list(c("r1", "r2"), c("c1", "c2", "c3")))
#
#--------------------------------------------------------------------------------------------- 


# Star Wars box office in millions (!)
box <- c(460.998, 314.4, 290.475, 247.900, 309.306, 165.8)

# Create star_wars_matrix
star_wars_matrix <- matrix(box, nrow = 3, byrow = TRUE)

#--------------------------------------------------------------------------------------------- 

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)

# Create star_wars_matrix
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)

#--------------------------------------------------------------------------------------------- 

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)

# Name the columns and rows of star_wars_matrix
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
colnames(star_wars_matrix) <- c("US", "non-US")


#--------------------------------------------------------------------------------------------- 

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Calculate the worldwide box office: worldwide_vector
worldwide_vector <- rowSums(star_wars_matrix)

#--------------------------------------------------------------------------------------------- 

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# The worldwide box office figures
worldwide_vector <- rowSums(star_wars_matrix)

# Bind the new variable worldwide_vector as a column to star_wars_matrix: star_wars_ext
star_wars_ext <- cbind(star_wars_matrix, worldwide_vector)

#--------------------------------------------------------------------------------------------- 

# Matrix that contains the first trilogy box office
star_wars_matrix

# Matrix that contains the second trilogy box office
star_wars_matrix2

# Combine both Star Wars trilogies in one matrix: all_wars_matrix
all_wars_matrix <- rbind(star_wars_matrix, star_wars_matrix2)

#--------------------------------------------------------------------------------------------- 

# Print box office Star Wars
all_wars_matrix

# Total revenue for US and non-US: total_revenue_vector
total_revenue_vector <- colSums(all_wars_matrix)


#--------------------------------------------------------------------------------------------- 

# Create the theater matrix
theater <- rbind(first_row, second_row, third_row, fourth_row)

# Calculate row_scores with rowSums()
row_scores <- rowSums(theater)

# cbind() together theater and row_scores: scores
scores <- cbind(theater, row_scores)


#--------------------------------------------------------------------------------------------- 
#
# Subsetting matrices
# 
#--------------------------------------------------------------------------------------------- 
#


# star_wars_matrix is already defined in your workspace

# US box office revenue for "The Empire Strikes Back"
star_wars_matrix[2, 1]

# non-US box office revenue for "A New Hope"
star_wars_matrix[1, 2]


#--------------------------------------------------------------------------------------------- 

# star_wars_matrix is already defined in your workspace

# Select all US box office revenue
star_wars_matrix[, 1]

# Select revenue for "A New Hope"
star_wars_matrix[1,]

# Average non-US revenue per movie: non_us_all
non_us_all <- mean(star_wars_matrix[, 2])

# Average non-US revenue of first two movies: non_us_some
non_us_some <- mean(star_wars_matrix[1:2, 2])

#--------------------------------------------------------------------------------------------- 

# star_wars_matrix is already defined in your workspace

# All figures for "A New Hope" and "Return of the Jedi"
star_wars_matrix[c(1, 3),]


#--------------------------------------------------------------------------------------------- 

# Select the US revenues for "A New Hope" and "The Empire Strikes Back"
star_wars_matrix[c("A New Hope", "The Empire Strikes Back"), "US"]

# Select the last two rows and both columns
star_wars_matrix[c(FALSE, TRUE, TRUE), c(TRUE, TRUE)]

# Select the non-US revenue for "The Empire Strikes Back"
star_wars_matrix[2, "non-US"]

#--------------------------------------------------------------------------------------------- 

view_count_all
# Mark Laurent Rachel Pierre Christel Walter Dave Monica
# A New Hope 1 3 2 3 2 1 5 0
# The Empire Strikes Back 2 4 3 2 2 1 2 0
# Return of the Jedi 1 3 2 1 2 0 3 0
# The Phantom Menace 1 2 1 1 4 2 2 0
# Attack of the Clones 1 1 0 1 5 3 2 0
# Revenge of the Sith 0 1 0 0 4 1 3 1

# Combine view_count_1 and view_count_2 in a new matrix: view_count_all
view_count_all <- cbind(view_count_1, view_count_2)

# Subset view counts for three loudest debaters: view_count_loud
view_count_loud <- view_count_all[, c(F, F, T, F, F, T, T, F)]

# Use colSums() to calculate the number of views: total_views_loud
total_views_loud <- colSums(view_count_loud)




#--------------------------------------------------------------------------------------------- 

# Star Wars box office in millions (!)
new_hope <- c(460.998, 314.4)
empire_strikes <- c(290.475, 247.900)
return_jedi <- c(309.306, 165.8)
star_wars_matrix <- rbind(new_hope, empire_strikes, return_jedi)
colnames(star_wars_matrix) <- c("US", "non-US")
rownames(star_wars_matrix) <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")

# Estimation of visitors
# Assume that the price of a ticket was 5 dollars. Box office numbers divided by the ticket price gives you the number of visitors.
visitors <- star_wars_matrix/5


# Print the estimate to the console
visitors

#--------------------------------------------------------------------------------------------- 

# Star Wars box office in millions (!)
box_office_all <- c(461, 314.4, 290.5, 247.9, 309.3, 165.8)
movie_names <- c("A New Hope", "The Empire Strikes Back", "Return of the Jedi")
col_titles <- c("US", "non-US")
star_wars_matrix <- matrix(box_office_all, nrow = 3, byrow = TRUE, dimnames = list(movie_names, col_titles))

# Definition of ticket_prices_matrix
ticket_prices_matrix <- matrix(c(5, 5, 6, 6, 7, 7), nrow = 3, byrow = TRUE, dimnames = list(movie_names, col_titles))

# Estimated number of visitors
visitors <- star_wars_matrix / ticket_prices_matrix

# Average number of US visitors
average_us_visitors <- mean(star_wars_matrix[, "US"] / ticket_prices_matrix[, "US"])

# Average number of non-US visitors
average_non_us_visitors <- mean(star_wars_matrix[, "non-US"] / ticket_prices_matrix[, "non-US"])

#--------------------------------------------------------------------------------------------- 
# > star_wars_matrix
# US non - US
# A New Hope 461.0 314.4
# The Empire Strikes Back 290.5 247.9
# Return of the Jedi 309.3 165.8
# > commission_rates
# US non - US
# A New Hope 0.25 0.28
# The Empire Strikes Back 0.23 0.26
# Return of the Jedi 0.20 0.21
# > budget
# A New Hope The Empire Strikes Back Return of the Jedi
# 13.0 18.0 32.5

# Calculate the money that remains after subtracting the commission: remaining
remaining <- star_wars_matrix - (star_wars_matrix * commission_rates)

# Calculate income per film: remaining_tot
remaining_tot <- rowSums(remaining)

# Calculate profit
profit <- remaining_tot - budget