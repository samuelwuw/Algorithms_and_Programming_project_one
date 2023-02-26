setwd("C:/Users/Samuel Willian/Documents/mestrado/algoritmos e programação/projeto1")

source("bubblesort.R")
source("quicksort.R")

#create samples 
set.seed(123)
firstSample <- sample(0:500, replace = TRUE, size = 1000)
write.csv(firstSample, file="firstSample.csv", row.names=F)

secondSample <- sample(0:1000, size = 10000)
write.csv(secondSample, file="secondSample.csv", row.names=F)

thirdSample <- sample(0:10000, size = 100000)
write.csv(thirdSample, file="thirdSample.csv", row.names=F)


#import existing samples 
firstSample <- read.csv("firstSample.csv", header=TRUE, stringsAsFactors=FALSE)
secondSample <- read.csv("secondSample.csv", header=TRUE, stringsAsFactors=FALSE)
thirdSample <- read.csv("thirdSample.csv", header=TRUE, stringsAsFactors=FALSE)


#sort samples increasing and decreasing 
firstSample_increasing <- sort(firstSample)
firstSample_decreasing <- sort(firstSample, decreasing = true)

secondSample_increasing <- sort(secondSample)
secondSample_decreasing <- sort(secondSample, decreasing = true)

thirdSample_increasing <- sort(thirdSample)
thirdSample_decreasing <- sort(thirdSample, decreasing = true)


