
dataAchive <- "getdata-projectfiles-UCI HAR Dataset.zip"

## If the archive is not present in the current working directory, download it.
if (!file.exists(dataAchive)) {
        archiveUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(archiveUrl, destfile = dataAchive, method = "curl")
}

## If the dataset directory is not present in the current working directory, unzip the data archive.
directory <- "UCI HAR Dataset"
if (!file.exists(directory)) {
        unzip(dataAchive)
}

features <- read.table("UCI HAR Dataset/features.txt")
features[, 2] <- as.character(features[, 2]) 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[, 2] <- as.character(activityLabels[, 2]) 

## Load training data.
trainingSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt") 
trainingMeasurements <- read.table("UCI HAR Dataset/train/X_train.txt")
trainingActivities <- read.table("UCI HAR Dataset/train/y_train.txt")

## Set descriptive column names of the loaded training tables.
colnames(trainingSubjects) <- c("Subject")
colnames(trainingMeasurements) <- features[, 2]
colnames(trainingActivities) <- c("Activity")

trainingData <- cbind(trainingSubjects, trainingActivities, trainingMeasurements)

## Load test data.
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt") 
testMeasurements <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivities <- read.table("UCI HAR Dataset/test/y_test.txt")

## Set descriptive column names of the loaded test tables.
colnames(testSubjects) <- c("Subject")
colnames(testMeasurements) <- features[, 2]
colnames(testActivities) <- c("Activity")

testData <- cbind(testSubjects, testActivities, testMeasurements)

## 1. Merges the training and the test sets to create one data set.
data <- rbind(trainingData, testData)

## 2. Extracting mean and standard deviation columns.
targetFeatures <- grep(".*mean.*|.*std.*", features[, 2])
targetFeatures.names <- features[targetFeatures, 2]

targetColumns <- c("Subject", "Activity", targetFeatures.names)
data <- data[, targetColumns]

## 3. Replaces activity column to give descriptive names to activities.
data$Activity <- activityLabels[data$Activity, 2]

## Create descriptive feature names.
targetFeatures.names = gsub('-mean', 'Mean', targetFeatures.names)
targetFeatures.names = gsub('-std', 'Std', targetFeatures.names)
targetFeatures.names <- gsub('[-()]', '', targetFeatures.names)

## 4. Set descriptive column names.
colnames(data) <- c("Subject", "Activity", targetFeatures.names)

## 5. Average of each variable for each activity and each subject
aggregatedData <- aggregate(data[, 3:ncol(data)], by=list(Subject = data$Subject, Activity = data$Activity), mean)

write.table(aggregatedData, file="tidy.txt", row.names = FALSE, quote=FALSE)

