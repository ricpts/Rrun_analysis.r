## R Palazuelos
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation 
##    for each measurement.
## 3. Uses descriptive activity names to name the activities in the data 
##    set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. Creates a second, independent tidy data set with the average of 
##    each variable for each activity and
##    each subject.

## CLEAN DATA - MATCH COLS - OTHER
## Incl "UCI HAR Dataset" dir so this can run in reviewer's wd"
## Person will replace 'subject' (latter is preferred, but...)
## Measures will replace 'features'
## 'subject_test' will be Person_id
## 'subject_train' will be Person_id, so they can talk to ea other
## 'y_test' will be Activity_id
## 'y_train' will be Activity_id, so they can talk to ea other
## 'features' has two cols: (now) measure_id + measure_label
## 'activity_labels' two cols: (now) activity_id + activity_label 

## TEST DATA
Person_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("Person_id"))
Person_test$ID <- as.numeric(rownames(Person_test))
Activity_test <-read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("Activity_id"))
Activity_test$ID <- as.numeric(rownames(Activity_test))
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_test$ID <- as.numeric(rownames(X_test))
Test <- merge(Person_test, Activity_test, all=TRUE)
Test <- merge(Test, X_test, all=TRUE)

## TRAINING DATA
Person_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("Person_id"))
Person_train$ID <- as.numeric(rownames(Person_train))
X_train =  read.table("UCI HAR Dataset/train/X_train.txt")
X_train$ID <- as.numeric(rownames(X_train))
Activity_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("Activity_id"))
Activity_train$ID <-as.numeric(rownames(Activity_train))
Training <- merge(Person_train, Activity_train, all=TRUE)
Training <- merge(Training, X_train, all=TRUE)

## MERGE THEM TOGETHER
OneDataSet <- rbind(Training, Test)
## ----------------------------------------------------##


## GET THE MEAN AND STD DEV
Measures <- read.table("UCI HAR Dataset/features.txt", col.names=c("measure_id", "measure_label"), )
MeanStdDev <- Measures[grepl("mean\\(\\)", Measures$measure_label) | grepl("std\\(\\)", Measures$measure_label), ] 
MSDevDataSet <- OneDataSet[, c(c(1,2,3), MeanStdDev$measure_id + 3) ]

## RELABEL ACTIVITY
ActivityNames <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("Activity_id", "Activity_label"))
NamedActivityDataSet <- merge(MSDevDataSet, ActivityNames)
## head(NamedActivityDataSet, n=3)
## names(NamedActivityDataSet)


## USE DESCRIPTIVE VARIABLE NAMES *recommended to look at loops and older lessons!
MeanStdDev$measure_label <- gsub("\\(\\)", "", MeanStdDev$measure_label)
MeanStdDev$measure_label <- gsub("-", ".", MeanStdDev$measure_label)
## for to loop!
for (i in 1:length(MeanStdDev$measure_label)) {
  colnames(NamedActivityDataSet) [i + 3] <- MeanStdDev$measure_label[i]
}


## CREATE ANOTHER TIDY SET
ToUseDataSet <- NamedActivityDataSet
Cleaner <- c("ID", "Activity_label")
Tidy2 <- ToUseDataSet[, !(names(ToUseDataSet) %in% Cleaner)]
AggregateD <- aggregate(Tidy2, by=list(Person = Tidy2$Person_id, Activity= Tidy2$Activity_id), FUN=mean, na.rm=TRUE)
Cleaner <- c("Person", "Activity")
AggregateD <- AggregateD[, !(names(AggregateD) %in% Cleaner)]
AggregateD <- merge(AggregateD, ActivityNames)
write.table("Tidy2.txt", x=AggregateD)
write.table("Tidy2.txt", row.name=FALSE)
