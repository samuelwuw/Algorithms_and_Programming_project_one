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


################################################################################
########################## CREATE RESULT DATAFRAME #############################
################################################################################

results_first_sample <- data.frame(
  matrix(nrow = 3, ncol = 5)
)
columns = c("bubble","insertion","selection", "merg", "quick") 
colnames(results_first_sample) = columns

results_second_sample <- data.frame(
  matrix(nrow = 3, ncol = 5)
)
columns = c("bubble","insertion","selection", "merg", "quick") 
colnames(results_second_sample) = columns


results_third_sample <- data.frame(
  matrix(nrow = 3, ncol = 5)
)
columns = c("bubble","insertion","selection", "merg", "quick") 
colnames(results_third_sample) = columns

################################################################################
########################### USE OF BUBBLESORT ##################################
################################################################################

####################################################################first sample
start_time <- Sys.time()
bubble_sort(firstSample)
end_time <- Sys.time()
results_first_sample[1, 1] <- end_time - start_time

start_time <- Sys.time()
bubble_sort(firstSample_increasing)
end_time <- Sys.time()
results_first_sample[2, 1] <- end_time - start_time

start_time <- Sys.time()
bubble_sort(firstSample_decreasing)
end_time <- Sys.time()
results_first_sample[3, 1] <- end_time - start_time

###################################################################second sample
start_time <- Sys.time()
bubble_sort(secondSample)
end_time <- Sys.time()
results_second_sample <- end_time - start_time

start_time <- Sys.time()
bubble_sort(secondSample_increasing)
end_time <- Sys.time()
results_second_sample[2, 1] <- end_time - start_time

start_time <- Sys.time()
bubble_sort(secondSample_decreasing)
end_time <- Sys.time()
results_second_sample[3, 1] <- end_time - start_time

####################################################################third sample
start_time <- Sys.time()
bubble_sort(thirdSample)
end_time <- Sys.time()
results_third_sample[1, 1] <- end_time - start_time

start_time <- Sys.time()
bubble_sort(thirdSample_increasing)
end_time <- Sys.time()
results_third_sample[2, 1] <- end_time - start_time

start_time <- Sys.time()
bubble_sort(thirdSample_decreasing)
end_time <- Sys.time()
results_third_sample[3, 1] <- end_time - start_time

################################################################################
########################### USE OF INSERTION SORT ##############################
################################################################################

start_time <- Sys.time()
insertion_sort(firstSample)
end_time <- Sys.time()
results_first_sample[1, 2] <- end_time - start_time

start_time <- Sys.time()
insertion_sort(firstSample_increasing)
end_time <- Sys.time()
results_first_sample[2, 2] <- end_time - start_time

start_time <- Sys.time()
insertion_sort(firstSample_decreasing)
end_time <- Sys.time()
results_first_sample[3, 2] <- end_time - start_time

###################################################################second sample

start_time <- Sys.time()
insertion_sort(secondSample)
end_time <- Sys.time()
results_second_sample[1, 2] <- end_time - start_time

start_time <- Sys.time()
insertion_sort(secondSample_increasing)
end_time <- Sys.time()
results_second_sample[2, 2] <- end_time - start_time

start_time <- Sys.time()
insertion_sort(secondSample_decreasing)
end_time <- Sys.time()
results_second_sample[3, 2] <- end_time - start_time

####################################################################third sample

start_time <- Sys.time()
insertion_sort(thirdSample)
end_time <- Sys.time()
results_third_sample[1, 2] <- end_time - start_time

start_time <- Sys.time()
insertion_sort(thirdSample_increasing)
end_time <- Sys.time()
results_third_sample[2, 2] <- end_time - start_time

start_time <- Sys.time()
insertion_sort(thirdSample_decreasing)
end_time <- Sys.time()
results_third_sample[3, 2] <- end_time - start_time


################################################################################
########################### USE OF SELECTION SORT ##############################
################################################################################

start_time <- Sys.time()
selection_sort(firstSample)
end_time <- Sys.time()
results_first_sample[1, 3] <- end_time - start_time

start_time <- Sys.time()
selection_sort(firstSample_increasing)
end_time <- Sys.time()
results_first_sample[2, 3] <- end_time - start_time

start_time <- Sys.time()
selection_sort(firstSample_decreasing)
end_time <- Sys.time()
results_first_sample[3, 3] <- end_time - start_time

###################################################################second sample

start_time <- Sys.time()
selection_sort(secondSample)
end_time <- Sys.time()
results_second_sample[1, 3] <- end_time - start_time

start_time <- Sys.time()
selection_sort(secondSample_increasing)
end_time <- Sys.time()
results_second_sample[2, 3] <- end_time - start_time

start_time <- Sys.time()
selection_sort(secondSample_decreasing)
end_time <- Sys.time()
results_second_sample[3, 3] <- end_time - start_time
####################################################################third sample

start_time <- Sys.time()
selection_sort(thirdSample)
end_time <- Sys.time()
results_third_sample[1, 3] <- end_time - start_time

start_time <- Sys.time()
selection_sort(thirdSample_increasing)
end_time <- Sys.time()
results_third_sample[2, 3] <- end_time - start_time

start_time <- Sys.time()
selection_sort(thirdSample_decreasing)
end_time <- Sys.time()
results_third_sample[3, 3] <- end_time - start_time


################################################################################
########################### USE OF MERGE SORT ##################################
################################################################################

start_time <- Sys.time()
mergeSort(firstSample)
end_time <- Sys.time()
results_first_sample[1, 4] <- end_time - start_time

start_time <- Sys.time()
mergeSort(firstSample_increasing)
end_time <- Sys.time()
results_first_sample[2, 4] <- end_time - start_time

start_time <- Sys.time()
mergeSort(firstSample_decreasing)
end_time <- Sys.time()
results_first_sample[3, 4] <- end_time - start_time

###################################################################second sample

start_time <- Sys.time()
mergeSort(secondSample)
end_time <- Sys.time()
results_second_sample[1, 4] <- end_time - start_time

start_time <- Sys.time()
mergeSort(secondSample_increasing)
end_time <- Sys.time()
results_second_sample[2, 4] <- end_time - start_time

start_time <- Sys.time()
mergeSort(secondSample_decreasing)
end_time <- Sys.time()
results_second_sample[3, 4] <- end_time - start_time
####################################################################third sample

start_time <- Sys.time()
mergeSort(firstSample)
end_time <- Sys.time()
results_third_sample[1, 4] <- end_time - start_time

start_time <- Sys.time()
mergeSort(secondSample_increasing)
end_time <- Sys.time()
results_third_sample[2, 4] <- end_time - start_time

start_time <- Sys.time()
mergeSort(secondSample_decreasing)
end_time <- Sys.time()
results_third_sample[3, 4] <- end_time - start_time


################################################################################
########################### USE OF QUICK SORT ##################################
################################################################################


start_time <- Sys.time()
quickSort(firstSample)
end_time <- Sys.time()
results_first_sample[1, 5] <- end_time - start_time

start_time <- Sys.time()
quickSort(firstSample_increasing)
end_time <- Sys.time()
results_first_sample[2, 5] <- end_time - start_time

start_time <- Sys.time()
quickSort(firstSample_decreasing)
end_time <- Sys.time()
results_first_sample[3, 5] <- end_time - start_time

###################################################################second sample

start_time <- Sys.time()
quickSort(secondSample)
end_time <- Sys.time()
results_second_sample[1, 5] <- end_time - start_time

start_time <- Sys.time()
quickSort(secondSample_increasing)
end_time <- Sys.time()
results_second_sample[2, 5] <- end_time - start_time

start_time <- Sys.time()
quickSort(secondSample_decreasing)
end_time <- Sys.time()
results_second_sample[3, 5] <- end_time - start_time
####################################################################third sample

start_time <- Sys.time()
quickSort(thirdSample)
end_time <- Sys.time()
results_third_sample[1, 5] <- end_time - start_time

start_time <- Sys.time()
quickSort(thirdSample_increasing)
end_time <- Sys.time()
results_third_sample[2, 5] <- end_time - start_time

start_time <- Sys.time()
quickSort(thirdSample_decreasing)
end_time <- Sys.time()
results_third_sample[3, 5] <- end_time - start_time



















