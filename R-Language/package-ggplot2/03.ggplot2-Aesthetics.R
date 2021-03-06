library(ggplot2)

# Map cyl to y
ggplot(mtcars, aes(x = mpg, y = cyl)) + geom_point()


# Map cyl to x
ggplot(mtcars, aes(x = cyl, y = mpg)) + geom_point()


# Map cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()



# Change shape and size of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(shape = 1, size = 4)


#--------------------------------
# Given from the previous exercise
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) +
  geom_point(shape = 1, size = 4)

# Map cyl to fill
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) +
  geom_point()


# Change shape, size and alpha of the points in the above plot
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(shape = 16, size = 6, alpha = 0.6)

#------------------------------------------------------------

# Map cyl to size
ggplot(mtcars, aes(x = wt, y = mpg, size = cyl)) + geom_point()


# Map cyl to alpha
ggplot(mtcars, aes(x = wt, y = mpg, alpha = cyl)) + geom_point()


# Map cyl to shape 
ggplot(mtcars, aes(x = wt, y = mpg, shape = cyl)) + geom_point()


# Map cyl to labels
ggplot(mtcars, aes(x = wt, y = mpg, label = cyl)) + geom_text()


#----------------------------------
# Define a hexadecimal color
my_color <- "#123456"

# Set the color aesthetic 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point()



# Set the color aesthetic and attribute 
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(col = my_color)


# Set the fill aesthetic and color, size and shape attributes
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(size = 10, shape = 23, col = my_color)

#-----------------------------------------

# Expand to draw points with alpha 0.5
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(alpha = 0.5)


# Expand to draw points with shape 24 and color yellow
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_point(shape = 24, color = "yellow")


# Expand to draw text with label x, color red and size 10
ggplot(mtcars, aes(x = wt, y = mpg, fill = cyl)) + geom_text(label = "x", col = "red", size = 10)



#---------------------------------------------------
# Map mpg onto x, qsec onto y and factor(cyl) onto col
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl))) + geom_point()

# Add mapping: factor(am) onto shape
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl), shape = factor(am))) + geom_point()

# Add mapping: (hp/wt) onto size
ggplot(mtcars, aes(x = mpg, y = qsec, col = factor(cyl), shape = factor(am), size = (hp / wt))) + geom_point()



#-----------------------------------------------------
# position

cyl.am <- ggplot(mtcars, aes(x = factor(cyl), fill = factor(am)))
cyl.am + geom_bar(position = "stack")
cyl.am + geom_bar(position = "fill")  # Proportion
cyl.am + geom_bar(position = "dodge")


# Clean up the axes with scale_ functions
val = c("#E41A1C", "#377EB8")
lab = c("Manual", "Automatic")
cyl.am +
  geom_bar(position = "dodge") +  # bar chart
  scale_x_discrete("Cylinders") +  # x-axis label
  scale_y_continuous("Number") +   # y-axis label
  scale_fill_manual("Transmission", #Legend
                    values = val, # Colors
                    labels = lab) # Labels on legend

#----------------------------------------------------------
mtcars$group <- c(0)

# Create jittered plot of mtcars: mpg onto x, group onto y
ggplot(mtcars, aes(x = mpg, y = group)) + geom_jitter()


# Change the y aesthetic limits
ggplot(mtcars, aes(x = mpg, y = group)) + geom_jitter() + scale_y_continuous(limits = c(-2, 2))

# Basic scatter plot: wt on x-axis and mpg on y-axis; map cyl to col
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(size = 4)


# Hollow circles - an improvement
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(shape = 1, size = 4)



# Add transparency - very nice
ggplot(mtcars, aes(x = wt, y = mpg, col = cyl)) + geom_point(size = 4, alpha = 0.6)


#-------------------------------------------------
# Scatter plot: carat (x), price (y), clarity (col)
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + geom_point()


# Adjust for overplotting
ggplot(diamonds, aes(x = carat, y = price, col = clarity)) + geom_point(alpha = 0.5)

# Scatter plot: clarity (x), carat (y), price (col)
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) + geom_point(alpha = 0.5)

# Dot plot with jittering
ggplot(diamonds, aes(x = clarity, y = carat, col = price)) + geom_point(position = "jitter", alpha = 0.5)
