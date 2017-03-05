# Coursera-Getting and Cleaning Data - Course Project

This is a README file to explain the analysis files is clear and understandable. 

This repository contains the work for "Getting and Cleaning data" course project of Data Science Specialization.

`CodeBook.md` and `run_analysis.R` describe the variables, the data, and any other related summaries that was performed to clean the data. If needed the raw data, you can download from here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

the features in `features.txt` file can be found and used for X_related files. Activities in `activity_labels.txt` file can be found and used for y_related files.

In `run_analysis.R`, we also need to check whether Dataset has been downloaded and available in the directory. Then we merged train and test sets, label column names, choose the required columns, rename to descriptive name, and then create a tidy data set containing the means of all the columns according to subject and activity. The tidy dataset is called `tidy_data.txt`, which can be found in this repository as well.



