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

columns = c("bubble","insertion","selection", "merg", "quick", "Database", "Measure") 
rows = c("1st sample random", "1st sample increasing", "1st sample decreasing",
         "2nd sample random", "2nd sample increasing", "2nd sample decreasing",
         "3rd sample (min) random", "3rd sample (min) increasing", "3rd sample (min) decreasing")

results <- data.frame(
  matrix(nrow = 9, ncol = 5)
)

results[, 6] <- row() 
colnames(results) = columns
rownames(results) = rows

rows_label = c("Minutes", "Seconds")
results[,6] <- rows
results[1:6, 7] <- rows_label[2]
results[7:9, 7] <- rows_label[1]


################################################################################
################################ function ######################################
################################################################################

func <- function(sortMethod, sample){
  start_time <- Sys.time()
  sortMethod(sample)
  end_time <- Sys.time()
  time <- end_time - start_time
  print(time)
  return(time)
}

################################################################################
########################### USE OF BUBBLESORT ##################################
################################################################################

results[1, 1] <- func(bubble_sort, firstSample)
results[2, 1] <- func(bubble_sort, firstSample_increasing)
results[3, 1] <- func(bubble_sort, firstSample_decreasing)

results[4, 1] <- func(bubble_sort, secondSample)
results[5, 1] <- func(bubble_sort, secondSample_increasing)
results[6, 1] <- func(bubble_sort, secondSample_decreasing)

results[7, 1] <- func(bubble_sort, thirdSample)
results[8, 1] <- func(bubble_sort, thirdSample_increasing)
results[9, 1] <- func(bubble_sort, thirdSample_decreasing)

plot(results[,1])

################################################################################
########################### USE OF INSERTION SORT ##############################
################################################################################

results[1, 2] <- func(insertion_sort, firstSample)
results[2, 2] <- func(insertion_sort, firstSample_increasing)
results[3, 2] <- func(insertion_sort, firstSample_decreasing)

results[4, 2] <- func(insertion_sort, secondSample)
results[5, 2] <- func(insertion_sort, secondSample_increasing)
results[6, 2] <- func(insertion_sort, secondSample_decreasing)

results[7, 2] <- func(insertion_sort, thirdSample)
results[8, 2] <- func(insertion_sort, thirdSample_increasing)
results[9, 2] <- func(insertion_sort, thirdSample_decreasing)


################################################################################
########################### USE OF SELECTION SORT ##############################
################################################################################

results[1, 3] <- func(selection_sort, firstSample)
results[2, 3] <- func(selection_sort, firstSample_increasing)
results[3, 3] <- func(selection_sort, firstSample_decreasing)

results[4, 3] <- func(selection_sort, secondSample)
results[5, 3] <- func(selection_sort, secondSample_increasing)
results[6, 3] <- func(selection_sort, secondSample_decreasing)

results[7, 3] <- func(selection_sort, thirdSample)
results[8, 3] <- func(selection_sort, thirdSample_increasing)
results[9, 3] <- func(selection_sort, thirdSample_decreasing)

################################################################################
########################### USE OF MERGE SORT ##################################
################################################################################

results[1, 4] <- func(mergeSort, firstSample)
results[2, 4] <- func(mergeSort, firstSample_increasing)
results[3, 4] <- func(mergeSort, firstSample_decreasing)

results[4, 4] <- func(mergeSort, secondSample)
results[5, 4] <- func(mergeSort, secondSample_increasing)
results[6, 4] <- func(mergeSort, secondSample_decreasing)

results[7, 4] <- func(mergeSort, thirdSample)
results[8, 4] <- func(mergeSort, thirdSample_increasing)
results[9, 4] <- func(mergeSort, thirdSample_decreasing)

################################################################################
########################### USE OF QUICK SORT ##################################
################################################################################

results[1, 5] <- func(quickSort, firstSample)
results[2, 5] <- func(quickSort, firstSample_increasing)
results[3, 5] <- func(quickSort, firstSample_decreasing)

results[4, 5] <- func(quickSort, secondSample)
results[5, 5] <- func(quickSort, secondSample_increasing)
results[6, 5] <- func(quickSort, secondSample_decreasing)

results[7, 5] <- func(quickSort, thirdSample)
results[8, 5] <- func(quickSort, thirdSample_increasing)
results[9, 5] <- func(quickSort, thirdSample_decreasing)

#######################################################################exports
write.csv(results, file="results/results.csv", row.names=F)

# 1 grafico p cada método com os 3 tempos
# 1 gráfico p cada tipo de ordenação com os 5 métodos




results <-  as.data.frame(read.csv("results/results.csv", header=TRUE, stringsAsFactors=FALSE))

results_round <- results

for(i in 1:5){
  for(j in 1:9){
    results_round[j, i] <- format(round(results[j, i], 5), nsmall = 4)
  }
}

results_round[, 6:7] <- results[, 6:7]

################################################################################
################################## PLOT ########################################
################################################################################


require(ggplot2)

##########################################################################BUBBLE
p <- ggplot(results_round, aes(x=bubble, y = Database, color = Measure)) +
  geom_line(linetype = "dashed") + 
  geom_point(size = 3) +
  geom_text(label=results_round$bubble, 
            nudge_x = 0.25, nudge_y = 0.25, 
            check_overlap = T)
p + ggtitle("Results for BubbleSort") + xlab("Execution Time") + ylab("Database")

#######################################################################iNSERTION
p <- ggplot(results_round, aes(x=insertion, y = Database, color = Measure)) +
  geom_line(linetype = "dashed") + 
  geom_point(size = 3) +
  geom_text(label=results_round$insertion, 
            nudge_x = 0.25, nudge_y = 0.25, 
            check_overlap = T)
p + ggtitle("Results for insertion") + xlab("Execution Time") + ylab("Database")

#######################################################################selection
p <- ggplot(results_round, aes(x=selection, y = Database, color = Measure)) +
  geom_line(linetype = "dashed") + 
  geom_point(size = 3) +
  geom_text(label=results_round$selection, 
            nudge_x = 0.25, nudge_y = 0.25, 
            check_overlap = T)
p + ggtitle("Results for selection") + xlab("Execution Time") + ylab("Database")

##########################################################################merge
p <- ggplot(results_round, aes(x=merg, y = Database)) +
  geom_line(linetype = "dashed") + 
  geom_point(size = 3) +
  geom_text(label=results_round$merg, 
            nudge_x = 0.25, nudge_y = 0.25, 
            check_overlap = T)
p + ggtitle("Results for merge") + xlab("Execution Time (in seconds)") + ylab("Database")

##########################################################################quick
p <- ggplot(results_round, aes(x=quick, y = Database)) +
  geom_line(linetype = "dashed") + 
  geom_point(size = 3) +
  geom_text(label=results_round$quick, 
            nudge_x = 0.25, nudge_y = 0.25, 
            check_overlap = T)
p + ggtitle("Results for quick") + xlab("Execution Time (in seconds)") + ylab("Database")
 
















