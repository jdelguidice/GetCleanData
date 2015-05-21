##
## Getting and Cleaning Data Course Project
## 
## run_analysis.R
##

# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)
library(plyr)
library(dplyr)


## download and unzip the file
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "localcopy.zip")
unzip("localcopy.zip")

##read the relevant files into variables
##testPath <- "C:\\Users\\James\\Documents\\GitHub\\GetCleanData\\UCI HAR Dataset\\test"
##trainPath <- "C:\\Users\\James\\Documents\\GitHub\\GetCleanData\\UCI HAR Dataset\\train"

features <- read.table(".\\UCI HAR Dataset\\features.txt")
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

x_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\Y_test.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt")

x_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\Y_train.txt")
subject_train <-  read.table(".\\UCI HAR Dataset\\train\\subject_train.txt")
        
        

##
## 1. Merges the training and the test sets to create one data set.
##
readings <- rbind(x_test, x_train)              ## combine the readings
activity <- rbind(y_test, y_train)              ## combine the activities
subjects <- rbind(subject_test, subject_train)  ## combine the subjects

## 
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##

stds<-grep("std()", features[,2])       # identify the columns that include std() in the name
means<-grep("mean()", features[,2])     # identify the columns that include mean() in the name

readings <- readings[,c(stds, means)]   # subset readings for only the above columns


##
## 3. Uses descriptive activity names to name the activities in the data set
##
mydf <- cbind(readings, Activity = join(activity, activity_labels, by="V1")[,2])        #create new DF with activity labels appended

##
## 4. Appropriately labels the data set with descriptive variable names. 
##
colnames(mydf) <- features[c(stds, means),2]
colnames(mydf)[80] <- "Activity"



##
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
mydf2 <- cbind(mydf, subjects)
colnames(mydf2)[81] <- "Subject"
mydf2 <- ddply(mydf2, .(Activity, Subject), colwise(mean))



##
## Save data sets as CSV files
write.csv(mydf, file="C:\\Users\\James\\Documents\\GitHub\\GetCleanData\\TidySet1.csv")
write.csv(mydf2, file="C:\\Users\\James\\Documents\\GitHub\\GetCleanData\\TidySet2.csv")

