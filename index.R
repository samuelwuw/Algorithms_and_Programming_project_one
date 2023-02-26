setwd("C:/Users/Samuel Willian/Documents/mestrado/algoritmos e programação/projeto1")

#import sort functions from other files
source("sort_functions/bubblesort.R")
source("sort_functions/insertionsort.R")
source("sort_functions/selectionsort.R")
source("sort_functions/mergesort.R")
source("sort_functions/quicksort.R")

#create samples 
set.seed(123)
firstSample <- sample(0:500, replace = TRUE, size = 1000)
write.csv(firstSample, file="data/firstSample.csv", row.names=F)

secondSample <- sample(0:1000, replace = TRUE, size = 10000)
write.csv(secondSample, file="data/secondSample.csv", row.names=F)

thirdSample <- sample(0:10000, replace = TRUE, size = 100000)
write.csv(thirdSample, file="data/thirdSample.csv", row.names=F)


#import existing samples
firstSample <-  as.data.frame(read.csv("data/firstSample.csv", header=TRUE, stringsAsFactors=FALSE))$x
secondSample <- as.data.frame(read.csv("data/secondSample.csv", header=TRUE, stringsAsFactors=FALSE))$x
thirdSample <- as.data.frame(read.csv("data/thirdSample.csv", header=TRUE, stringsAsFactors=FALSE))$x


#sort samples increasing and decreasing 
firstSample_increasing <- sort(firstSample, decreasing = FALSE)
firstSample_decreasing <- sort(firstSample, decreasing = TRUE)

secondSample_increasing <- sort(secondSample, decreasing = FALSE)
secondSample_decreasing <- sort(secondSample, decreasing = TRUE)

thirdSample_increasing <- sort(thirdSample, decreasing = FALSE)
thirdSample_decreasing <- sort(thirdSample, decreasing = TRUE)


