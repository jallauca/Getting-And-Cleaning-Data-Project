library(reshape2)

## Download the dataset

dataset.filename = 'HARDataset.zip'
dataset.folder = 'UCI HAR Dataset'
if (!file.exists(dataset.filename)){
    dataset.URL = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(dataset.URL, dataset.filename, method="curl")
    print('Dataset zip file downloaded')
}  

# Unzip the dataset
if (!file.exists(dataset.folder)) { 
    unzip(dataset.filename) 
    print('Dataset file unzipped')
}

## Load list of features and activities

features = read.table("UCI HAR Dataset/features.txt", col.names=c('id', 'name'), stringsAsFactors=FALSE)
activity_labels = read.table("UCI HAR Dataset/activity_labels.txt", col.names=c('id', 'name'), stringsAsFactors=FALSE)

## Determine the column names that specify mean and standard deviation

feature_subset = grep('(mean|std)', features$name)
feature_subset.names = features[feature_subset, 'name']
feature_subset.names = gsub('-mean', 'Mean', feature_subset.names)
feature_subset.names = gsub('-std', 'Std', feature_subset.names)
feature_subset.names = gsub('[-()]', '', feature_subset.names)

## Keep only a subset of features for the training data

X_train = read.table("UCI HAR Dataset/train/X_train.txt")[feature_subset]
# Load Y and subject values 
Y_train = read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
X_train = cbind(subject_train, Y_train, X_train)

## Keep only a subset of features for the testing data

X_test = read.table("UCI HAR Dataset/test/X_test.txt")[feature_subset]
# Load Y and subject values 
Y_test = read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
X_test = cbind(subject_test, Y_test, X_test)

## Merge the training and test sets to create one data set

X = rbind(X_train, X_test)

## Appropriately label the data set with descriptive variable names

colnames(X) = c("subject", "activity", feature_subset.names)

## Use descriptive activity names to name the activities in the data set

X$activity = factor(X$activity, levels=activity_labels$id, labels=activity_labels$name)
X$subject = as.factor(X$subject)

## Create independent tidy data set with the average of each variable for each activity and each subject

X.melted = melt(X, id=c("subject", "activity"))
X.mean = dcast(X.melted, subject + activity ~ variable, mean)
write.table(X.mean, "tidy.txt", row.names=FALSE, quote=FALSE)