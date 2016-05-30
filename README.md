# UCI_HAR_dataset
Getting and cleaning data from UCI HAR dataset

## R program:
### Remarks: 
* run_analysis.R is a R code using the dplyr library, make sure you have already installed this package on R before running the program. 
* make sure you have downloaded the data set you can find here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* unzip the downloaded file in your working directory.

### Those are the different steps in the run_analysis.R code:
* first the program reads all the different data set we need in this evaluation (X_test, y_test, X_train, y_train, subject_test, subject_train, and later activity_labels)
* than, it merges the training and the test sets to create one data set to create a new data frame called "data_set"
* than, it extracts only the measurements on the mean and standard deviation for each measurement in a new data frame called "data_set_mean_std"
* descriptive names and label names are used to tidy the data set
* finally, from the data set "data_set_mean_std", it creates a second, independent tidy data set called "data_set_question5" with the average of each variable for each activity and each subject
