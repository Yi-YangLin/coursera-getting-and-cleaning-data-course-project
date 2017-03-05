
library(dplyr)
library("reshape2")


#download zip file if it hasn't been dowloaded and unzip the file if the directory doesn't already exsist
zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI HAR Dataset.zip"
dataPath <- "UCI HAR Dataset"

if (!file.exists(zipFile)) {
    download.file(zipUrl, zipFile, mode = "wb")
}

if (!file.exists(dataPath)) {
    unzip(zipFile)
}

# read train & test data
subject_train <- read.table(file.path(dataPath,"train","subject_train.txt"))
X_train <- read.table(file.path(dataPath, "train", "X_train.txt"))
y_train <- read.table(file.path(dataPath, "train", "y_train.txt"))

subject_test <- read.table(file.path(dataPath, "test", "subject_test.txt"))
X_test <- read.table(file.path(dataPath, "test", "X_test.txt"))
y_test <- read.table(file.path(dataPath, "test", "y_test.txt"))

# read features & activity labels
features <- read.table(file.path(dataPath, "features.txt"), as.is = TRUE)
activities <- read.table(file.path(dataPath, "activity_labels.txt"))

colnames(activities) <- c("activityId", "activityLabel")

##Step 1: Merges the training and the test sets to create one data set.
alldata <- rbind(cbind(subject_train, X_train, y_train), cbind(subject_test, X_test, y_test))
colnames(alldata) <- c("subject", features[, 2], "activity")


##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
col_mean_std_only <- grepl("subject|activity|mean|std", colnames(alldata))
alldata <- alldata[,col_mean_std_only]

##Step 3: Uses descriptive activity names to name the activities in the data set.

alldata$activity <- factor(alldata$activity,levels = activities[,1], labels = activities[,2])

##Step 4: Appropriately labels the data set with descriptive variable names. 
alldataCols <- colnames(alldata)
alldataCols <- gsub("[\\(\\)-]", "", alldataCols)

alldataCols <- gsub("Acc", "Accelerometer",alldataCols)
alldataCols <- gsub("Gyro", "Gyroscope",alldataCols)
alldataCols <- gsub("Mag", "Magnitude",alldataCols)
alldataCols <- gsub("Freq", "Frequency",alldataCols)
alldataCols <- gsub("mean", "Mean",alldataCols)
alldataCols <- gsub("std", "Standard_Deviation",alldataCols)
alldataCols <- gsub("BodyBody", "Body",alldataCols)

colnames(alldata) <- alldataCols

##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

alldataMeans <- melt(alldata, id = c("subject", "activity")) %>%
    dcast(subject + activity ~ variable, mean)
    
write.table(alldataMeans, "tidy_data.txt", row.names = FALSE, quote = FALSE)

