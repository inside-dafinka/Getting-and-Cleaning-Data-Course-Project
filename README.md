##Getting and Cleaning Data Course Project - Data Science Specialization
Dafinka Kaleshkoska (2015)

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing. The data for this project is collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


## Project files

* run_analysis.R
* tidy.txt
* CodeBook.md

The analysis of the data is done in the run_analysis.R script. It performs the following:

1. Downloads and extracts the .ZIP archive with the datasetif it does not already exist in the working directory. 
2. Loads the training and test data sets.
3. Merges the training and test data sets into one.
4. Extracts only the measurements for mean and standard deviation for each measurement.
5. Sets descriptive activity names to name the activities in the data set.
6. Appropriately labels the data set with descriptive variable names. 
7. From the dataset in step 6. creates independent tidy data set with the average of each variable for each activity and each subject.
8. Saves the aggregated data in tidy.txt file.

The tidy.txt file contains the aggregated data from step 8.

The CodeBook.md file describes the variables and the data. 

