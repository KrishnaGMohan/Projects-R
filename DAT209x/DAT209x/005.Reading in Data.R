getwd()
df <- read.table("grade.txt", header = TRUE, nrow = 12)
df

df <- read.table("grade.txt", header = TRUE, skip = 2, nrow = 12, sep = ",")
df
df <- read.csv("grade.txt", header = TRUE, skip = 2, nrow = 12)
df

vec <- readLines("dat.txt")
vec <- strsplit(vec[2], " ")
vec <- as.numeric(vec[[1]])
vec

f1 <- file("dat.txt", open = "r")
scan(f1, what = "", nlines = 2)




f1 <- file("Assignment 5.dat", open = "r") 
my.data <- read.table(f1, skip = 4, comment.char = "%", nrows = 7)
my.data
