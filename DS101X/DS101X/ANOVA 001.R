plot(count ~ spray, data = InsectSprays,
     xlab = "Types of Insecticide",
     ylab = "Counts of Insects")

anova(lm(count ~ spray, data = InsectSprays))



strsplit(, " ")



install.packages("tm")
install.packages("SnowballC")

library(tm)
txt <- c("All happy families are alike; each unhappy family is unhappy in its own way")
txt <- tm_map(txt, content_transformer(tolower))

#------------------------------------------

# VCorpus(x, readerControl) 
# PCorpus
# tm provides a set of predefined sources, e.g., DirSource, VectorSource, or DataframeSource, which handle a directory, a vector interpreting each component as document, or data frame like structures(like CSV les), respectively.



docs <- c("All happy families are alike; each unhappy family is unhappy in its own way")
reuters <- VCorpus(VectorSource(docs))

inspect(reuters)
reuters <- tm_map(reuters, stripWhitespace)
writeLines(as.character(reuters))

reuters <- tm_map(reuters, content_transformer(tolower))
writeLines(as.character(reuters))

reuters <- tm_map(reuters, removeWords, stopwords("english"))
writeLines(as.character(reuters))

reuters <- tm_map(reuters, stemDocument)
writeLines(as.character(reuters))

inspect(reuters)
writeLines(as.character(reuters))


#---------------------------------------

x <- c(-1, 0, 1, 2, 23)
mean(x)
median(x)

#-----------------------------------------
install.packages("rstan", repos = "https://cloud.r-project.org/", dependencies = TRUE)

install.packages("ggplot2")
library(ggplot2)
library(rstan)
install.packages("colorspace")


fx <- inline::cxxfunction(signature(x = "integer", y = "numeric"), '
    return ScalarReal( INTEGER(x)[0] * REAL(y)[0] ) ;
')
fx(2L, 5)

remove.packages("rstan")