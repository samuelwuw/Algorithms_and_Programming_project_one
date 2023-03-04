setwd("C:/Users/Samuel Willian/Documents/mestrado/algoritmos e programação/projeto1")

#import sort functions from other files
source("sort_functions/bubblesort.R")
source("sort_functions/insertionsort.R")
source("sort_functions/selectionsort.R")
source("sort_functions/mergesort.R")
source("sort_functions/quicksort.R")

#create samples 
set.seed(123)
firstSample <- sample(0:1000, replace = TRUE, size = 1000)
write.csv(firstSample, file="data/firstSample.csv", row.names=F)

secondSample <- sample(0:10000, replace = TRUE, size = 10000)
write.csv(secondSample, file="data/secondSample.csv", row.names=F)

thirdSample <- sample(0:100000, replace = TRUE, size = 100000)
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

columns = c("bubble","insertion","selection", "merg", "quick") 
rows = c("random", "increasing", "decreasing")

results_first_sample <- data.frame(
  matrix(nrow = 3, ncol = 5)
)
colnames(results_first_sample) = columns
rownames(results_first_sample) = rows

results_second_sample <- data.frame(
  matrix(nrow = 3, ncol = 5)
)
colnames(results_second_sample) = columns
rownames(results_first_sample) = rows


results_third_sample <- data.frame(
  matrix(nrow = 3, ncol = 5)
)
colnames(results_third_sample) = columns
rownames(results_first_sample) = rows

####FORM 2


################################################################################
################################ function ######################################
################################################################################

func <- function(sortMethod, sample){
  start_time <- Sys.time()
  sortMethod(sample)
  end_time <- Sys.time()
  return(end_time - start_time)
}

################################################################################
########################### USE OF BUBBLESORT ##################################
################################################################################

####################################################################first sample
results_first_sample[1, 1] <- func(bubble_sort, firstSample)
results_first_sample[2, 1] <- func(bubble_sort, firstSample_increasing)
results_first_sample[3, 1] <- func(bubble_sort, firstSample_decreasing)

###################################################################second sample
results_second_sample[1, 1] <- func(bubble_sort, secondSample)
results_second_sample[2, 1] <- func(bubble_sort, secondSample_increasing)
results_second_sample[3, 1] <- func(bubble_sort, secondSample_decreasing)

####################################################################third sample

results_third_sample[1, 1] <- func(bubble_sort, thirdSample)
results_third_sample[2, 1] <- func(bubble_sort, thirdSample_increasing)
results_third_sample[3, 1] <- func(bubble_sort, thirdSample_decreasing)

################################################################################
########################### USE OF INSERTION SORT ##############################
################################################################################

results_first_sample[1, 2] <- func(insertion_sort, firstSample)
results_first_sample[2, 2] <- func(insertion_sort, firstSample_increasing)
results_first_sample[3, 2] <- func(insertion_sort, firstSample_decreasing)

###################################################################second sample

results_second_sample[1, 2] <- func(insertion_sort, secondSample)
results_second_sample[2, 2] <- func(insertion_sort, secondSample_increasing)
results_second_sample[3, 2] <- func(insertion_sort, secondSample_decreasing)

####################################################################third sample

results_third_sample[1, 2] <- func(insertion_sort, thirdSample)
results_third_sample[2, 2] <- func(insertion_sort, thirdSample_increasing)
results_third_sample[3, 2] <- func(insertion_sort, thirdSample_decreasing)


################################################################################
########################### USE OF SELECTION SORT ##############################
################################################################################

results_first_sample[1, 3] <- func(selection_sort, firstSample)
results_first_sample[2, 3] <- func(selection_sort, firstSample_increasing)
results_first_sample[3, 3] <- func(selection_sort, firstSample_decreasing)

###################################################################second sample

results_second_sample[1, 3] <- func(selection_sort, secondSample)
results_second_sample[2, 3] <- func(selection_sort, secondSample_increasing)
results_second_sample[3, 3] <- func(selection_sort, secondSample_decreasing)

####################################################################third sample

results_third_sample[1, 3] <- func(selection_sort, thirdSample)
results_third_sample[2, 3] <- func(selection_sort, thirdSample_increasing)
results_third_sample[3, 3] <- func(selection_sort, thirdSample_decreasing)

################################################################################
########################### USE OF MERGE SORT ##################################
################################################################################

results_first_sample[1, 4] <- func(mergeSort, firstSample)
results_first_sample[2, 4] <- func(mergeSort, firstSample_increasing)
results_first_sample[3, 4] <- func(mergeSort, firstSample_decreasing)

###################################################################second sample

results_second_sample[1, 4] <- func(mergeSort, secondSample)
results_second_sample[2, 4] <- func(mergeSort, secondSample_increasing)
results_second_sample[3, 4] <- func(mergeSort, secondSample_decreasing)
####################################################################third sample

results_third_sample[1, 4] <- func(mergeSort, thirdSample)
results_third_sample[2, 4] <- func(mergeSort, thirdSample_increasing)
results_third_sample[3, 4] <- func(mergeSort, thirdSample_decreasing)


################################################################################
########################### USE OF QUICK SORT ##################################
################################################################################

results_first_sample[1, 5] <- func(quickSort, firstSample)
results_first_sample[2, 5] <- func(quickSort, firstSample_increasing)
results_first_sample[3, 5] <- func(quickSort, firstSample_decreasing)

###################################################################second sample

results_second_sample[1, 5] <- func(quickSort, secondSample)
results_second_sample[2, 5] <- func(quickSort, secondSample_increasing)
results_second_sample[3, 5] <- func(quickSort, secondSample_decreasing)

####################################################################third sample

results_third_sample[1, 5] <- func(quickSort, thirdSample)
results_third_sample[2, 5] <- func(quickSort, thirdSample_increasing)
results_third_sample[3, 5] <- func(quickSort, thirdSample_decreasing)


# 1 grafico p cada método com os 3 tempos
# 1 gráfico p cada tipo de ordenação com os 5 métodos





write.csv(results_first_sample, file="data/results_first_sample.csv", row.names=F)
write.csv(results_second_sample, file="data/results_second_sample.csv", row.names=F)
write.csv(results_third_sample, file="data/results_third_sample.csv", row.names=F)









