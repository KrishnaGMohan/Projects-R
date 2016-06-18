#---------------------------------------------------------------------------------------------
#
#   ggplot2, ggvis, lattice
#
# plot() and hist()
# barplot()
# boxplot()
#   pairs()
#---------------------------------------------------------------------------------------------

# movies is already pre-loaded

# Display the structure of movies
str(movies)

# Plot the genre variable of movies
plot(movies$genre)

# Plot the genre variable against the rating variable
plot(movies$genre, movies$rating)

#---------------------------------------------------------------------------------------------

# movies is already pre-loaded

# Plot the runtime variable of movies
plot(movies$runtime)

# Plot rating (x) against runtime (y)
plot(movies$rating, movies$runtime)

#---------------------------------------------------------------------------------------------

# movies is already pre-loaded

# Create a boxplot of the runtime variable
boxplot(movies$runtime)

# Subset the dateframe and plot it entirely
plot(movies[, c("rating", "votes", "runtime")])

# Create a pie chart of the table of counts of the genres
pie(table(movies$genre))

#---------------------------------------------------------------------------------------------
# Subset salaries: salaries_educ
salaries_educ <- salaries[salaries$degree >= 3,]

# Create a histogram of the salary column
hist(salaries_educ$salary, breaks = 10)

#---------------------------------------------------------------------------------------------

plot(mercury$temperature, mercury$pressure, xlab = "Temperature", ylab = "Pressure",
        main = "T vs P for Mercury", type = "o", col = "orange")

par() # sessionwide graphical parameters
par()$col

plot(mercury$temperature, mercury$pressure,
    xlab = "Temperature",
    ylab = "Pressure",
    main = "T vs P for Mercury",
    type = "o",
    col = "orange",
    col.main = "darkgrey", # color of main title
    cex.axis = 0.6,     # ratio of font size of axis
    lty = 5,    # line type 1-6
    pch = 4     # symbols for plotting)
#---------------------------------------------------------------------------------------------
# movies is pre-loaded in your workspace

# Create a customized plot
plot(movies$votes, movies$runtime,
     main = "Votes versus Runtime",
     xlab = "Number of votes [-]",
     ylab = "Runtime [s]",
     sub = "No clear correlation")

#---------------------------------------------------------------------------------------------

# movies is pre-loaded in your workspace

# Customize the plot further
plot(movies$votes, movies$runtime,
     main = "Votes versus Runtime",
     xlab = "Number of votes [-]",
     ylab = "Runtime [s]",
     sub = "No clear correlation",
     pch = 9,
     col = "#dd2d2d",
     col.main = 604)
#---------------------------------------------------------------------------------------------

# movies is pre-loaded in your workspace

# Customize the plot further
plot(movies$votes, movies$year,
     main = "Are recent movies voted more on?",
     xlab = "Number of votes [-]",
     ylab = "Year [-]",
     pch = 19,
     cex.axis = 0.8,
     col = "orange")

#---------------------------------------------------------------------------------------------
# Build a customized histogram
hist(movies$runtime,
    breaks = 20,
    xlim = c(90, 220),
    main = "Distribution of Runtime",
    xlab = "Runtime [-]",
    col = "cyan",
    border = "red")

#---------------------------------------------------------------------------------------------
# Add the exp vector as a column experience to salaries
salaries$exp <- exp

# Filter salaries: only keep degree == 3: salaries_educ
salaries_educ <- salaries[salaries$degree == 3,]

# Create plot with many customizations
plot(salaries_educ$exp, salaries_educ$salary,
    main = "Does experience matter?",
    xlab = "Work experience", ylab = "Salary",
    col = "blue", col.main = "red",
    cex.axis = 1.2)

#---------------------------------------------------------------------------------------------
#
#   Multiple plots on a single graph
#
#   par(mfrow = c(2,2))
#   par(mfcol = c(2,2))

#   grid <- matrix(c(1,1,2,3), nrow = 2, byrow = TRUE)
#   layout(grid)
#   layout(1)
#
#   abline(), points(), segments(), lines(), text()

# movies is pre-loaded in your workspace

# List all the graphical parameters
par()

# Specify the mfrow parameter
par(mfrow = c(2, 1))

# Build two plots
plot(movies$votes, movies$rating)
hist(movies$votes)

#---------------------------------------------------------------------------------------------
# movies is pre-loaded in your workspace

# Build the grid matrix
grid <- matrix(c(1, 3, 2, 3), nrow = 2, byrow = TRUE)

# Specify the layout
layout(grid)

# Build three plots
plot(movies$rating, movies$runtime)
plot(movies$votes, movies$runtime)
boxplot(movies$runtime)
#---------------------------------------------------------------------------------------------
# movies is pre-loaded in your workspace

# Build the grid matrix
grid <- matrix(c(1, 2, 3, 3), nrow = 2)

# Specify the layout
layout(grid)

# Customize the three plots
plot(movies$rating, movies$runtime, xlab = "Rating", ylab = "Runtime", pch = 4)
plot(movies$votes, movies$runtime, xlab = "Number of Votes", ylab = "Runtime", col = "blue")
boxplot(movies$runtime, border = "darkgray", main = "Boxplot of Runtime")

#---------------------------------------------------------------------------------------------

# movies is pre-loaded in your workspace

# Fit a linear regression: movies_lm
movies_lm = lm(movies$rating ~ movies$votes)

# Build a scatterplot: rating versus votes
plot(movies$votes, movies$rating)

# Add straight line to scatterplot
abline(coef(movies_lm))

#---------------------------------------------------------------------------------------------

# movies is pre-loaded in your workspace

# Fit a linear regression (don't change)
movies_lm <- lm(movies$rating ~ movies$votes)

# Customize scatterplot
plot(movies$votes, movies$rating,
     main = "Analysis of IMDb data",
     xlab = "Number of Votes",
     ylab = "Rating",
     col = "darkorange",
     pch = 15,
     cex = 0.7)

# Customize straight line
abline(coef(movies_lm), lwd = 2, col = "red")

# Add text
xco <- 7e5
yco <- 7
text(xco, yco, label = "More votes? Higher rating!")

#---------------------------------------------------------------------------------------------

# OPTION A
par(mfrow = c(1, 3))
plot(salaries$degree, salaries$salary,
     xlab = "Level of degree", ylab = "Salary")
coef_lm <- coef(lm(salaries$salary ~ salaries$experience))
abline(coef_lm, col = "red")
hist(salaries$salary, col = "blue", xlab = "Salary")
plot(salaries$experience, salaries$salary,
     col = "green", xlab = "Experience", ylab = "Salary")

# OPTION B
par(mfrow = c(1, 3))
plot(salaries$experience, salaries$salary,
     col = "green", xlab = "Experience", ylab = "Salary")
coef_lm <- coef(lm(salaries$salary ~ salaries$experience))
abline(coef_lm, col = "red")
hist(salaries$salary, col = "blue", xlab = "Salary")
plot(salaries$degree, salaries$salary,
     xlab = "Level of degree", ylab = "Salary")

# OPTION C
par(mfrow = c(3, 1))
plot(salaries$experience, salaries$salary,
     col = "green", xlab = "Experience", ylab = "Salary")
coef_lm <- coef(lm(salaries$salary ~ salaries$experience))
abline(coef_lm, col = "red")
hist(salaries$salary, col = "blue", xlab = "Salary")
plot(salaries$degree, salaries$salary,
     xlab = "Level of degree", ylab = "Salary")