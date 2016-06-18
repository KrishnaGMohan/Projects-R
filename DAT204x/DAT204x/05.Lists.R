#--------------------------------------------------------------------------------------------- 
#
#   Lists
#
#   1-D Different R Objects
#
#   song <- list("RSome Songs", 190, 5)
#   is.list(song)
#   names(song) <- c("title","duration","track")
#
#   song <- list(title = "RSome times", duration = 190, track = 5)
#
#   Cancreate lists of lists
#--------------------------------------------------------------------------------------------- 

# Numeric vector: 1 up to 10
my_vector <- 1:10

# Numeric matrix: 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# Factor of sizes
my_factor <- factor(c("M", "S", "L", "L", "M"), ordered = TRUE, levels = c("S", "M", "L"))

# Construct my_list with these different elements
my_list <- list(my_vector, my_matrix, my_factor)

# Construct my_super_list with the four data structures above
my_super_list <- list(my_vector, my_matrix, my_factor, my_list)

# Display structure of my_super_list
str(my_super_list)

#--------------------------------------------------------------------------------------------- 

# Numeric vector: 1 up to 10
my_vector <- 1:10

# Numeric matrix: 1 up to 9
my_matrix <- matrix(1:9, ncol = 3)

# Factor of sizes
my_factor <- factor(c("M", "S", "L", "L", "M"), ordered = TRUE, levels = c("S", "M", "L"))

# Construct my_list with these different elements
my_list <- list(vec = my_vector, mat = my_matrix, fac = my_factor)

# Print my_list to the console
my_list

#--------------------------------------------------------------------------------------------- 

# Create actors and reviews
actors_vector <- c("Jack Nicholson", "Shelley Duvall", "Danny Lloyd", "Scatman Crothers", "Barry Nelson")
reviews_factor <- factor(c("Good", "OK", "Good", "Perfect", "Bad", "Perfect", "Good"),
                  ordered = TRUE, levels = c("Bad", "OK", "Good", "Perfect"))

# Create shining_list
shining_list <- list(title = "The Shining", actors = actors_vector, reviews = reviews_factor)

#--------------------------------------------------------------------------------------------- 
# Create the list lst
lst <- list(top[5], prop[, 4])

# Create the list skills
skills <- list(topics = top, context = cont, properties = prop, list_info = lst)

# Display the structure of skills
str(skills)


#--------------------------------------------------------------------------------------------- 
#
# subset and extend lists
#
#   song[[1]]
#
#   song[[4]][1]
#   somg[[c(4,1)]]
#   song[["duration"]]
#
#   song$duration ## only works on named elements
#
#   Adding an element
#   friends <- c("Adrian", "Beth", "Charlie")
#   song$sent <- friends
#   
#   song$similar$reason <- "too long" 
#
#--------------------------------------------------------------------------------------------- 

# shining_list is already defined in the workspace

# Actors from shining_list: act
act <- shining_list[["actors"]]

# List containing title and reviews from shining_list: sublist
sublist <- list(shining_list[["title"]], shining_list[["reviews"]])

# Display structure of sublist
str(sublist)

#--------------------------------------------------------------------------------------------- 

# shining_list is already defined in the workspace

# Select the last actor: last_actor
last_actor <- shining_list[["actors"]][5]

# Select the second review: second_review
second_review <- shining_list[["reviews"]][2]

#--------------------------------------------------------------------------------------------- 

# shining_list is already defined in the workspace

# Add the release year to shining_list
shining_list$year <- 1980

# Add the director to shining_list
shining_list$director <- "Stanley Kubrick"

# Inspect the structure of shining_list
str(shining_list)

#---------------------------------------------------------------------------------------------

# shining_list is already defined in the workspace

# Add both the year and director to shining_list: shining_list_ext
shining_list_ext <- c(shining_list, year = 1980, director = "Stanley Kubrick")

# Have a look at the structure of shining_list_ext
str(shining_list_ext)

#---------------------------------------------------------------------------------------------

# Create the list key_skills
key_skills <- list(skills$topics[2], skills$context[2], skills$list_info[[2]][4])