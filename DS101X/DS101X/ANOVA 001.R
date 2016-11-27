plot(count ~ spray, data = InsectSprays,
     xlab = "Types of Insecticide",
     ylab = "Counts of Insects")

anova(lm(count ~ spray, data = InsectSprays))