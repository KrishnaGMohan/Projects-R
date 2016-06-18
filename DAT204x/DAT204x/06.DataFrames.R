#---------------------------------------------------------------------------------------------
#
#   Rows = Observations
#   Columns = variables
#
#   Elements of different types

name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

df <- data.frame(name, age, child)
df
names(df) <- c("Name", "Age", "Child")
df

#   Data frames by default store the string columns as factors
#   To supress this set the stringsAsFactors argument of data.frame to FALSE
#---------------------------------------------------------------------------------------------
# Print the first observations of mtcars
head(mtcars)

# Print the last observations of mtcars
tail(mtcars)

# Print the dimensions of mtcars
dim(mtcars)

# Investigate the structure of the mtcars data set
str(mtcars)

#---------------------------------------------------------------------------------------------

# Definition of vectors
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet",
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Create a data frame: planets_df
planets_df <- data.frame(planets, type, diameter, rotation, rings)

# Display the structure of planets_df
str(planets_df)


#---------------------------------------------------------------------------------------------

# Definition of vectors
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet",
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Encode type as a factor: type_factor
type_factor <- factor(type)

# Construct planets_df: strings are not converted to factors!
planets_df <- data.frame(planets, type_factor, diameter, rotation, rings, stringsAsFactors = FALSE)

# Display the structure of planets_df
str(planets_df)

#---------------------------------------------------------------------------------------------

# Construct improved planets_df
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet",
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
type_factor <- factor(type)
planets_df <- data.frame(planets, type_factor, diameter, rotation, rings, stringsAsFactors = FALSE)

# Improve the names of planets_df
names(planets_df) <- c("name", "type", "diameter", "rotation", "has_rings")
planets_df

#---------------------------------------------------------------------------------------------
# Convert continents to factor: continents_factor
continents_factor <- factor(continents)

# Create countries_df with the appropriate column names
countries_df <- data.frame(countries, continents_factor, gdp, hdi, president, stringsAsFactors = FALSE)

# Display the structure of countries_df
str(countries_df)

#---------------------------------------------------------------------------------------------
#
#   subsetting data.frame
#       can use []
#       can also use[[]] and$
#
name <- c("Anne", "Pete", "Frank", "Julia", "Cath")
age <- c(28, 30, 21, 39, 35)
child <- c(FALSE, TRUE, TRUE, FALSE, TRUE)

people <- data.frame(name, age, child, stringsAsFactors = FALSE)
people

people[3, 2]
people[3, "age"]

people[2] #returns a data frame!

#
#   Adding new columns

height <- c(163, 177, 163, 162, 157)
people$height <- height
people[["height"]] <- height

weight <- c(74, 63, 68, 55, 56)
cbind(people, weight)

#   Adding new rows
tom <- data.frame(name = "Tom", age = 37, child = FALSE, height = 183)
rbind(people, tom)

#   Sorting rows
ranks <- order(people$age)
people[ranks,]
people[order(people$age, decreasing = TRUE),] 
#---------------------------------------------------------------------------------------------


# Construct improved planets_df
planets <- c("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune")
type <- c("Terrestrial planet", "Terrestrial planet", "Terrestrial planet",
          "Terrestrial planet", "Gas giant", "Gas giant", "Gas giant", "Gas giant")
diameter <- c(0.382, 0.949, 1, 0.532, 11.209, 9.449, 4.007, 3.883)
rotation <- c(58.64, -243.02, 1, 1.03, 0.41, 0.43, -0.72, 0.67)
rings <- c(FALSE, FALSE, FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)
type_factor <- factor(type)
planets_df <- data.frame(planets, type_factor, diameter, rotation, rings, stringsAsFactors = FALSE)

# Improve the names of planets_df
names(planets_df) <- c("name", "type", "diameter", "rotation", "has_rings")
planets_df


# The type of Mars: mars_type
mars_type <- planets_df[4, 2]

# Entire rotation column: rotation
rotation <- planets_df[, 4]

# First three planets: closest_planets_df
closest_planets_df <- planets_df[1:3,]

# Last three planets: furthest_planets_df
furthest_planets_df <- planets_df[6:8,]

#---------------------------------------------------------------------------------------------

# planets_df is pre-loaded

# Diameter and rotation for Earth: earth_data 
earth_data <- planets_df[3, c("diameter", "rotation")]

# Diameter for the last six rows: furthest_planets_diameter
furthest_planets_diameter <- planets_df[3:8, "diameter"]

# Print furthest_planets_diamter
furthest_planets_diameter

#---------------------------------------------------------------------------------------------

# planets_df is pre-loaded in your workspace

# Create rings_vector
rings_vector <- planets_df$has_rings

# Print rings_vector
rings_vector

#---------------------------------------------------------------------------------------------

# planets_df pre-loaded in your workspace

# Create rings_vector
rings_vector <- planets_df$has_rings

# Select the information on planets with rings: planets_with_rings_df
planets_with_rings_df <- planets_df[rings_vector,]  # looks up has_rings ?!

# Print planets_with_rings_df
planets_with_rings_df

#---------------------------------------------------------------------------------------------
#
# subset()

planets_df[planets_df$has_rings == TRUE,]

subset(planets_df, subset = has_rings == TRUE)

#---------------------------------------------------------------------------------------------

# Planets that are smaller than planet Earth: small_planets_df
small_planets_df <- planets_df[planets_df$diameter < 1,]

# Planets that rotate slower than planet Earth: slow_planets_df
slow_planets_df <- subset(planets_df, subset = abs(rotation) > 1)

#---------------------------------------------------------------------------------------------
# planets_df is already pre-loaded in your workspace

# Definition of moons and masses
moons <- c(0, 0, 1, 2, 67, 62, 27, 14)
masses <- c(0.06, 0.82, 1.00, 0.11, 317.8, 95.2, 14.6, 17.2)

# Add moons to planets_df under the name "moon"
planets_df$moon <- moons

# Add masses to planets_df under the name "mass"
planets_df[["mass"]] <- masses

#---------------------------------------------------------------------------------------------

# planets_df is pre-loaded (without the columns moon and mass)

# Name pluto correctly
pluto <- data.frame(name = "Pluto", type = "Terrestrial planet", diameter = 0.18, rotation = -6.38, has_rings = FALSE)

# Bind planets_df and pluto together: planets_df_ext
planets_df_ext <- rbind(planets_df, pluto)

# Print out planets_df_ext
planets_df_ext

#---------------------------------------------------------------------------------------------
# planets_df is pre-loaded in your workspace

# Create a desired ordering for planets_df: positions
positions <- order(planets_df$diameter, decreasing = TRUE)

# Create a new, ordered data frame: largest_first_df
largest_first_df <- planets_df[positions,]

# Print largest_first_df
largest_first_df
#---------------------------------------------------------------------------------------------
# Remove economic variables and add population
countries_df_dem <- data.frame(countries_df[, c(1, 2, 5)], data.frame(population))

# Add brazil
names(brazil) <- names(countries_df_dem)
countries_df2 <- rbind(countries_df_dem, brazil)


# Sort by population
countries_df2[order(countries_df2$population, decreasing = TRUE),]
#---------------------------------------------------------------------------------------------
