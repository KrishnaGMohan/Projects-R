install.packages("tm")
install.packages("slam")
install.packages("ggplot2")
install.packages("SnowballC")


library(tm)
dataset <- read.csv("tweets.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(dataset) <- c("sentiment", "tweets")
head(dataset)


tweet.text <- Corpus(VectorSource(dataset["tweets"]))
class(tweet.text)

# Normalize the tweet text

tweet.text <- tm_map(tweet.text, content_transformer(removeNumbers))
tweet.text <- tm_map(tweet.text, content_transformer(removePunctuation))
tweet.text <- tm_map(tweet.text, content_transformer(stripWhitespace))
tweet.text <- tm_map(tweet.text, content_transformer(tolower))

to.WF <- function(corpus) {
    library(slam)
    tdm <- TermDocumentMatrix(corpus, control = list(stopwords = FALSE))
    tdm <- removeSparseTerms(tdm, 0.9999999)
    freq <- row_sums(tdm, na.rm = T)
    freq <- sort(freq, decreasing = TRUE)
    word.freq <- data.frame(word = factor(names(freq), levels = names(freq)), freq = freq)
    word.freq["Cum"] <- cumsum(word.freq["freq"]) / sum(word.freq$freq)
    word.freq
}

wf <- to.WF(tweet.text)
head(wf)


bar.TDF <- function(word.freq) {
    library(ggplot2)
    ggplot(word.freq[1:40,], aes(word, freq)) +
    geom_bar(stat = "identity") +
    ggtitle("Frequency of most common words") +
    ylab("Frequency") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}
bar.TDF(wf)


cdf.TDF <- function(word.freq) {
    ggplot(word.freq[1:40,], aes(word, Cum)) +
    geom_bar(stat = "identity") +
    ggtitle("Cumulative fraction of most common words") +
    ylab("Cumulative frequency") +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}
cdf.TDF(wf)

head(data.frame(sentiment = dataset$sentiment, text = enc2utf8(unlist(sapply(tweet.text, `[`, "content"))), stringsAsFactors = F))


#-----------------------------------------
stop.words <- read.csv("stopwords.csv", header = TRUE, stringsAsFactors = FALSE)
stop.words <- unique(stop.words)
stop.words[1:100,]

tweet.text <- tm_map(tweet.text, removeWords, stop.words[, "words"])
wf <- to.WF(tweet.text)
bar.TDF(wf)
cdf.TDF(wf)

#----------------------------------------
# Stemming
#----------------------------------------

library(SnowballC) ## For stemming words
tweet.text <- tm_map(tweet.text, stemDocument)
wf = to.WF(tweet.text)
bar.TDF(wf)
cdf.TDF(wf)

head(data.frame(sentiment = dataset$sentiment, text = enc2utf8(unlist(sapply(tweet.text, `[`, "content"))), stringsAsFactors = F))

#----------------------------------------
