#------------------------------------
# Demo 10: Factors
# 
#------------------------------------
gender_vec <- c("F", "M", "F", "F", "M", "F", "M", "M", "M", "F")
response_vec <- c("H", "E", "M", "VE", "E", "VH", "M", "E", "H", "M")

factor_gender <- factor(gender_vec,
            levels = c("M", "F"),
            ordered = F,
            labels = c("Male", "Female")
            )

factor_gender
summary(factor_gender)

game_difficulty <- c("VE", "E", "M", "H", "VH")
game_difficulty_desc <- c("VeryEasy", "Easy", "Medium", "Hard", "VeryHard")
factor_response <- factor(response_vec, 
                    levels = game_difficulty, 
                    ordered = T, 
                    labels = game_difficulty_desc)
factor_response
summary(factor_response)

factor_response[2]
factor_response[6]
factor_response[2] > factor_response[6]