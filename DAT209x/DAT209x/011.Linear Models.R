my.analysis <- lm(log(Ozone) ~ Solar.R + Wind + Temp, data = airquality[airquality > 1,])

qqnorm(my.analysis$res)
sd.1 <- sd(my.analysis$res)
lines((-3):3, ((-3):3) * sd.1, type = "l", lwd = 3, col = "red")

#------------------
my.analysis <- lm(log(Ozone) ~ Solar.R + Wind + Temp +
                Solar.R:Wind + Solar.R:Temp + Wind:Temp,
                data = airquality[airquality > 1,])

drop1(my.analysis, test = "F")
my.analysis <- update(my.analysis, ~ . - Solar.R:Wind)
drop1(my.analysis, test = "F")
my.analysis <- update(my.analysis, ~ . - Wind:Temp)
drop1(my.analysis, test = "F")
#------------------------------------
install.packages("glm2")
library(glm2)

options(digits = 6)
data(crabs)
head(crabs)
crab.data <- data.frame(satellite = 1 * (crabs$Satellites > 0), width = crabs$Width)

my.analysis <- glm(satellite ~ width, family = binomial, data = crab.data)
my.analysis

my.linear.predictor <- data.frame(
  prediction = predict(my.analysis, se.fit = TRUE)$fit,
  lower = predict(my.analysis, se.fit = TRUE)$fit -
        1.96 * predict(my.analysis, se.fit = TRUE)$se.fit,
  upper = predict(my.analysis, se.fit = TRUE)$fit +
        1.96 * predict(my.analysis, se.fit = TRUE)$se.fit)

my.linear.predictor <- my.linear.predictor[order(crab.data$width),]
logistic <- function(x) { exp(x) / (1 + exp(x)) }
my.predictor <- logistic(my.linear.predictor)
plot(sort(crab.data$width), my.predictor$prediction, type = "l",
     xlab = 'width', ylab = 'p(satellite)')
lines(sort(crab.data$width), my.predictor$upper, type = "l", lty = 2)
lines(sort(crab.data$width), my.predictor$lower, type = "l", lty = 2)


summary(crab.data$width)
my.cut <- cut(crab.data$width, breaks = 20 + (0:5) * 3)
my.means <- tapply(crab.data$satellite, my.cut, mean)
lines(20 + (0:4) * 3 + 1.5, my.means, type = "p", pch = 16)

#-----------------------------------
diabetes.data <- read.csv2("my.diabetes.data.csv")
new.diabetes.data <- read.csv2("my.new.diabetes.data.csv")
diabetes.data <- diabetes.data[, -1]
new.diabetes.data <- new.diabetes.data[, -1]

my.model <- "gender"
for (i in 2:17) { my.model <- paste(my.model, "+", names(diabetes.data)[i]) }
my.formula <- as.formula(paste("readmi_class~", my.model))
my.analysis <- glm(my.formula, family = binomial(link = logit),
                 data = diabetes.data)

my.linear.predictor <- c(predict(my.analysis, newdata = new.diabetes.data))
logistic <- function(x) { exp(x) / (1 + exp(x)) }
predict.diabetes <- logistic(my.linear.predictor)
plot(density(predict.diabetes[new.diabetes.data$readmi_class == "YES"]),
     main = "Fitted values", ylim = c(0, 4))
lines(density(predict.diabetes[new.diabetes.data$readmi_class == "NO"]), lty = 2)
#-------------------------------------------------------

install.packages("UsingR")
library(UsingR)
head(father.son)

my.analysis <- lm(sheight ~ fheight, data = father.son)
my.analysis


#-----------------------------------
install.packages("R330")
library(R330)
data(wine.df)
str(wine.df)
?drop1


z.analysis <- lm(price ~ year + temp + h.rain + w.rain + h.rain:w.rain, data = wine.df)
summary(z.analysis)
drop1(z.analysis, test = "F")
z.analysis <- update(z.analysis, ~ . - h.rain:w.rain)
drop1(z.analysis, test = "F")
summary(z.analysis)


z.analysis <- update(z.analysis, ~ . - year)
summary(z.analysis)

z.analysis <- update(z.analysis, ~ . - temp)
summary(z.analysis)

coef(z.analysis)
coef(z.analysis)[4] + 800 * coef(z.analysis)[6]
predict(z.analysis, newdata = )
?predict

str(wine.df)


year <- 1985
temp <- mean(wine.df$temp)
h.rain <- mean(wine.df$h.rain)
w.rain <- mean(wine.df$w.rain)

test.data <- data.frame(year, temp, h.rain, w.rain)
predict(z.analysis, test.data)

#------------------------------------
z.analysis <- lm(log(price) ~ year + temp + h.rain + w.rain + h.rain:w.rain, data = wine.df)
summary(z.analysis)
drop1(z.analysis, test = "F")
z.analysis <- update(z.analysis, ~ . - h.rain:w.rain)
summary(z.analysis)

year <- 1985
temp <- mean(wine.df$temp)
h.rain <- mean(wine.df$h.rain)
w.rain <- mean(wine.df$w.rain)

test.data <- data.frame(year, temp, h.rain, w.rain)
exp(predict(z.analysis, test.data))

#--------------------------------------------

par(mfrow = c(1, 2))
g <- function(x) { dnorm(x, sd = sd(model1$res)) }
hist(model1$res, probability = TRUE)
curve(g, col = "red", lwd = 3, add = TRUE)
hist(model2$res, probability = TRUE)
g <- function(x) { dnorm(x, sd = sd(model2$res)) }
curve(g, col = "red", lwd = 3, add = TRUE)

