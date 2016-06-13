#--------------------------------------------------------------------------------------------- 
#
#  Sequence of data elements of the same basic type
#
#--------------------------------------------------------------------------------------------- 

numeric_vector <- c(1, 10, 49)
character_vector <- c("a", "b", "c")

# Create boolean_vector
boolean_vector <- c(TRUE, FALSE, TRUE)

#--------------------------------------------------------------------------------------------- 

# Poker winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)

# Roulette winnings from Monday to Friday
roulette_vector <- c(-24, -50, 100, -350, 10)

# Create the variable days_vector
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

# Assign the names of the day to roulette_vector and poker_vector
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

#--------------------------------------------------------------------------------------------- 

# A_vector and B_vector have already been defined for you
A_vector <- c(1, 2, 3)
B_vector <- c(4, 5, 6)

# Take the sum of A_vector and B_vector: total_vector
total_vector <- A_vector + B_vector

# Print total_vector
total_vector

# Calculate the difference between A_vector and B_vector: diff_vector
diff_vector <- A_vector - B_vector

# Print diff_vector
diff_vector

#--------------------------------------------------------------------------------------------- 

# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Calculate your daily earnings: total_daily
total_daily <- poker_vector + roulette_vector

#--------------------------------------------------------------------------------------------- 

# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Total winnings with poker: total_poker
total_poker <- sum(poker_vector)

# Total winnings with roulette: total_roulette
total_roulette <- sum(roulette_vector)

# Total winnings overall: total_week
total_week <- total_poker + total_roulette

# Print total_week
total_week

#--------------------------------------------------------------------------------------------- 

# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Calculate poker_better
poker_better <- poker_vector > roulette_vector

# Calculate total_poker and total_roulette, as before
total_poker <- sum(poker_vector)
total_roulette <- sum(roulette_vector)

# Calculate choose_poker
choose_poker <- total_poker > total_roulette

# Print choose_poker
choose_poker

#--------------------------------------------------------------------------------------------- 

# Calculate total gains for your entire past week: total_past
total_past <- sum(poker_past) + sum(roulette_past)

# Difference of past to present performance: diff_poker
diff_poker <- poker_present - poker_past


#--------------------------------------------------------------------------------------------- 
#
# Vector Subsetting
#
#--------------------------------------------------------------------------------------------- 

# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Poker results of Wednesday: poker_wednesday
poker_wednesday <- poker_vector["Wednesday"]

# Roulette results of Friday: roulette_friday
roulette_friday <- roulette_vector["Friday"]

#--------------------------------------------------------------------------------------------- 

# Mid-week poker results: poker_midweek
poker_midweek <- poker_vector[c(2, 3, 4)]

# End-of-week roulette results: roulette_endweek
roulette_endweek <- roulette_vector[c(4, 5)]

#--------------------------------------------------------------------------------------------- 

# Roulette results for Tuesday to Friday inclusive: roulette_subset
roulette_subset <- roulette_vector[2:5]

# Print roulette_subset
roulette_subset

#--------------------------------------------------------------------------------------------- 

# Select Thursday's roulette gains: roulette_thursday
roulette_thursday <- roulette_vector["Thursday"]

# Select Tuesday's poker gains: poker_tuesday
poker_tuesday <- poker_vector["Tuesday"]

#--------------------------------------------------------------------------------------------- 

# Select the first three elements from poker_vector: poker_start
poker_start <- poker_vector[c(1, 2, 3)]

# Calculate the average poker gains during the first three days: avg_poker_start
avg_poker_start <- mean(poker_start)

#--------------------------------------------------------------------------------------------- 

# Roulette results for day 1, 3 and 5: roulette_subset
roulette_subset <- roulette_vector[c(1, 3, 5)]

# Poker results for first three days: poker_start
poker_start <- poker_vector[1:3]

#--------------------------------------------------------------------------------------------- 

# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Create logical vector corresponding to profitable poker days: selection_vector
selection_vector <- poker_vector > 0

# Select amounts for profitable poker days: poker_profits
poker_profits <- poker_vector[selection_vector]

#--------------------------------------------------------------------------------------------- 
# Casino winnings from Monday to Friday
poker_vector <- c(140, -50, 20, -120, 240)
roulette_vector <- c(-24, -50, 100, -350, 10)
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
names(poker_vector) <- days_vector
names(roulette_vector) <- days_vector

# Select amounts for profitable roulette days: roulette_profits
roulette_profits <- roulette_vector[roulette_vector > 0]

# Sum of the profitable roulette days: roulette_total_profit
roulette_total_profit <- sum(roulette_profits)

# Number of profitable roulette days: num_profitable_days
num_profitable_days <- sum(roulette_vector > 0)

#--------------------------------------------------------------------------------------------- 

player <- c(14, 17, 20, 21, 20, 18, 14)
house <- c(20, 15, 21, 20, 20, 17, 19)

# Select the player's score for the third game: player_third
player_third <- player[3]

# Select the scores where player exceeds hous: winning_scores
winning_scores <- player[player > house]

# Count number of times player < 18: n_low_score
n_low_score <- sum(player < 18)