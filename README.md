# GetCleanData
Course Project for Getting  &amp; Cleaning Data

Files:

run_analysis.R - the R script that downloads, extracts, and processes the relevant data into a tidy data set
TidySet2.txt - the final processed tidy data set in .txt format

run_analysis.R does the following:
1. Downloads the a zip file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzips the file into the current working directory
3. loads the various data sets (train, test, subjects) into individual variables
4. Merges the training and test sets into seperate variables for the readings, activity ids, and subject ids
5. Identifies the columns related to standard deviation and means
6. subsets the readings variable to include only these variables
7. Joins the readings data frame wth the activity data frame to combine the activity names
8. adds the column names listed in the features table
9. uses ddply function to calculate means for each column based on activity and subject groupings
10. Save data set as TidySet2.txt
