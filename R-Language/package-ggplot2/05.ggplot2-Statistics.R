# ggplot2 is already loaded
library(ggplot2)

# Explore the mtcars data frame with str()
str(mtcars)

# A scatter plot with LOESS smooth:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth()



# A scatter plot with an ordinary Least Squares linear model:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth(method = "lm")



# The previous plot, without CI ribbon:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() + geom_smooth(method = "lm", se = FALSE)



# The previous plot, without points:
ggplot(mtcars, aes(x = wt, y = mpg)) + geom_smooth(method = "lm", se = FALSE)


#----------------------
# ggplot2 is already loaded
# ggplot2 is already loaded

# Define cyl as a factor variable
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F)

# Complete the following ggplot command as instructed
ggplot(mtcars, aes(x = wt, y = mpg, col = factor(cyl))) +
  geom_point() +
  stat_smooth(method = "lm", se = F) +
  stat_smooth(aes(group = 1), method = "lm", se = F)