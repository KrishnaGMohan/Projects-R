# Plot the correct variables of mtcars
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
# Change cyl inside mtcars to a factor
mtcars$cyl <- as.factor(mtcars$cyl)

# Make the same plot as in the first instruction
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

#------------------------------------------------
# Basic plot
mtcars$cyl <- as.factor(mtcars$cyl)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)

# Use lm() to calculate a linear model and save it as carModel
carModel <- lm(mpg ~ wt, data = mtcars)

# Call abline() with carModel as first argument and set lty to 2
abline(carModel, lty = 2)

# Plot each subset efficiently with lapply
# You don't have to edit this code
lapply(mtcars$cyl, function(x) {
    abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})

# This code will draw the legend of the plot
# You don't have to edit this code
legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n")



#-------------------------------------------------------

# Convert cyl to factor (don't need to change)
mtcars$cyl <- as.factor(mtcars$cyl)

# Example from base R (don't need to change)
plot(mtcars$wt, mtcars$mpg, col = mtcars$cyl)
abline(lm(mpg ~ wt, data = mtcars), lty = 2)
lapply(mtcars$cyl, function(x) {
    abline(lm(mpg ~ wt, mtcars, subset = (cyl == x)), col = x)
})
legend(x = 5, y = 33, legend = levels(mtcars$cyl),
       col = 1:3, pch = 1, bty = "n")

# Plot 1: add geom_point() to this command to create a scatter plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()
# Fill in using instructions Plot 1

# Plot 2: include the lines of the linear models, per cyl
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point() + # Copy from Plot 1
geom_smooth(method = lm, se = FALSE) # Fill in using instructions Plot 2

# Plot 3: include a lm for the entire dataset in its whole
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
geom_point() + # Copy from Plot 2
geom_smooth(method = lm, se = FALSE) + # Copy from Plot 2
geom_smooth(aes(group = 1), method = lm, se = FALSE, linetype = 2) # Fill in using instructions Plot 3


#-----------------------------------
# Consider the structure of iris, iris.wide and iris.tidy (in that order)
str(iris)
str(iris.wide)
str(iris.tidy)

# Think about which dataset you would use to get the plot shown right
# Fill in the ___ to produce the plot given to the right
ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
facet_grid(. ~ Measure)




#--------------------------------------------
# Load the tidyr package
library(tidyr)


# Fill in the ___ to produce to the correct iris.tidy dataset
iris.tidy <- iris %>%
gather(key, Value, - Species) %>%
  separate(key, c("Part", "Measure"), "\\.")

ggplot(iris.tidy, aes(x = Species, y = Value, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Measure)
  
# Consider the head of iris, iris.wide and iris.tidy (in that order)
library(tidyr)

head(iris)
head(iris.wide)
head(iris.tidy)

iris.wide <- cbind(iris, Flower = 1:nrow(iris)) %>%
  gather(key, value, - Flower, - Species) %>%
  separate(key, c("Part","Measure"), "\\.") %>%
  spread(Measure, value)

iris.wide <- iris.wide[, -2]
head(iris.wide)

# OR
iris.wide <- subset(cbind(iris, Flower = 1:nrow(iris)) %>%
  gather(key, value, - Flower, - Species) %>%
  separate(key, c("Part", "Measure"), "\\.") %>%
  spread(Measure, value), select = -c(Flower))
head(iris.wide)

#---------------------------
# Wrong!
# iris$Flower <- 1:nrow(iris)
# iris.wide <- iris %>%
#   gather(key, value, - Flower, - Species) %>%
#   separate(key, c("Part", "Measure"), "\\.") %>%
#  spread(Measure, value)

#-----------------------------------------

ggplot(iris.wide, aes(x = Length, y = Width, col = Part)) +
  geom_jitter() +
  facet_grid(. ~ Species)