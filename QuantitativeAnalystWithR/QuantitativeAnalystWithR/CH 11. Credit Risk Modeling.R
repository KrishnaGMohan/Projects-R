#---------------------------------------------------------

loan_data <- readRDS("D:/Personal/OneDrive/LEARNING/Quantitative Analyst with R/Importing and Managing Financial Data in R/CH 11. Credit Risk Modeling in R/loan_data_ch1.rds")

head(loan_data, 10)

# View the structure of loan_data
str(loan_data)

# Load the gmodels package 
#install.package("gmodels")
library(gmodels)

# Call CrossTable() on loan_status
CrossTable(loan_data$loan_status)

# Call CrossTable() on grade and loan_status
CrossTable(loan_data$grade, loan_data$loan_status, prop.r = TRUE, prop.c = FALSE, prop.t = FALSE, prop.chisq = FALSE)

#---------------------------------------------------------

# Create histogram of loan_amnt: hist_1
hist_1 <- hist(loan_data$loan_amnt)

# Print locations of the breaks in hist_1
hist_1$breaks

# Change number of breaks and add labels: hist_2
hist_2 <- hist(loan_data$loan_amnt, breaks = 200, xlab = "Loan amount",
               main = "Histogram of the loan amount")

# Bingo! Note that there are some high peaks at round values: 5000, 10000, 15000,� People tend to borrow round numbers. Makes sense, right? 



#---------------------------------------------------------
# Plot the age variable
plot(loan_data$age, ylab = "Age")

# Save the outlier's index to index_highage
index_highage <- which(loan_data$age > 122)

# Create data set new_data with outlier deleted
new_data <- loan_data[-index_highage,]

# Make bivariate scatterplot of age and annual income
plot(loan_data$age, loan_data$annual_inc, xlab = "Age", ylab = "Annual Income")

# Great!Did you notice that you have a bivariate outlier ? The person with the huge annual wage of$6 million appeared to be 144 years old. This must be a mistake, so you will definitely delete this observation from the data in the following exercises.


#----------------------------------
# Look at summary of loan_data
summary(loan_data$int_rate)

# Get indices of missing interest rates: na_index
na_index <- which(is.na(loan_data$int_rate))

# Remove observations with missing interest rates: loan_data_delrow_na
loan_data_delrow_na <- loan_data[-na_index,]

# Make copy of loan_data
loan_data_delcol_na <- loan_data

# Delete interest rate column from loan_data_delcol_na
loan_data_delcol_na$int_rate <- NULL



#-----------------------------------------------------
# Compute the median of int_rate
median_ir <- median(loan_data$int_rate, na.rm = TRUE)

# Make copy of loan_data
loan_data_replace <- loan_data

# Replace missing interest rates with median
loan_data_replace$int_rate[na_index] <- median_ir

# Check if the NAs are gone
summary(loan_data_replace$int_rate)

#--------------------------------------------------
# Make the necessary replacements in the coarse classification example below 
loan_data$ir_cat <- rep(NA, length(loan_data$int_rate))

loan_data$ir_cat[which(loan_data$int_rate <= 8)] <- "0-8"
loan_data$ir_cat[which(loan_data$int_rate > 8 & loan_data$int_rate <= 11)] <- "8-11"
loan_data$ir_cat[which(loan_data$int_rate > 11 & loan_data$int_rate <= 13.5)] <- "11-13.5"
loan_data$ir_cat[which(loan_data$int_rate > 13.5)] <- "13.5+"
loan_data$ir_cat[which(is.na(loan_data$int_rate))] <- "Missing"

loan_data$ir_cat <- as.factor(loan_data$ir_cat)

# Look at your new variable using plot()
plot(loan_data$ir_cat)

#------------------------------------------------
# Set seed of 567
set.seed(567)

# Store row numbers for training set: index_train
index_train <- sample(1:nrow(loan_data), 2 / 3 * nrow(loan_data))

# Create training set: training_set
training_set <- loan_data[index_train,]

# Create test set: test_set
test_set <- loan_data[-index_train,]

#-------------------------------
# Create confusion matrix
conf_matrix <- table(test_set$loan_status, model_pred)

# Compute classification accuracy
(conf_matrix[1, 1] + conf_matrix[2, 2]) / sum(conf_matrix)

# Compute sensitivity
conf_matrix[2, 2] / (conf_matrix[2, 2] + conf_matrix[2, 1])


#-------------------------------


loan_data <- readRDS("D:/Personal/OneDrive/LEARNING/Quantitative Analyst with R/Importing and Managing Financial Data in R/CH 11. Credit Risk Modeling in R/loan_data_ch2.rds")

head(loan_data, 10)
training_set < loan_data

# Build a glm model with variable ir_cat as a predictor
log_model_cat <- glm(loan_status ~ ir_cat, family = "binomial", data = training_set)

# Print the parameter estimates 
log_model_cat

# Look at the different categories in ir_cat using table()
table(loan_data$ir_cat)

log_model_cat
log_model_cat$coefficients
#-------------------------------------------------
# Build the logistic regression model
predictions_all_small <- predict(log_model_small, newdata = test_set, type = "response")

# Look at the range of the object "predictions_all_small"
range(predictions_all_small)

# Change the code below to construct a logistic regression model using all available predictors in the data set
log_model_full <- glm(loan_status ~ ., family = "binomial", data = training_set)

# Make PD-predictions for all test set elements using the the full logistic regression model
predictions_all_full <- predict(log_model_full, newdata = test_set, type = "response")

# Look at the predictions range
range(predictions_all_full)