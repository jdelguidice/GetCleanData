---
title: "CodeBook"
output: html_document
---

This is the code book for the Getting and Cleaning Data course project. 

SOURCE DATA COLLECTION  
Human Activity Recognition Using Smartphones Data Set  
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

Source data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


DATA TRANSFORMATIONS  
All measurements from the original experiment ("training", "Test") are combined into a single set and only the measurements related to either means or standard deviations are included (-std or -mean.)  

Activity IDs are replaced with corresponding activity names.  

Each corresponding variable in the original data set is then grouped by Subject and Activity pairs and an average calculated. The original measurements were normalized and bounded within [-1,1], as are the averages in this data set.   


ATTRIBUTE INFORMATION  

Subject.Id - integer; value representing the individual subject being measured  
Activity - factor; Indicates the activity being measured:   
        \t        'WALKING',  
                'WALKING_UPSTAIRS',  
                'WALKING_DOWNSTAIRS',  
                'SITTING',  
                'STANDING',  
                'LAYING'  
                
The data set is structured as follows:  
```{r, echo=FALSE}
load(file="C://Users//James//Documents//GitHub//GetCleanData//mydf2.RData")
str(mydf2)

```
