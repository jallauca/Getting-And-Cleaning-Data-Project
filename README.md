# Getting and Cleaning Data - Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps
1. Download the dataset
2. Load list of features and activities
3. Determine the column names that specify mean and standard deviation
4. Keep only a subset of features for the training data
5. Keep only a subset of features for the testing data
6. Merge the training and test sets to create one data set
7. Appropriately label the data set with descriptive variable names
8. Use descriptive activity names to name the activities in the data set
9. Create independent tidy data set with the average of each variable for each activity and each subject

The result data set is saved in `tidy.txt`