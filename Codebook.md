The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The data is downloaded manually from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The run_analysis.R script has the following variables and summaries calculated:
1.	Clear work space and set work directory
2.	Read data from “features.txt” into the variable “feature”. Only the indices of measurements on the mean and standard deviation are wanted and kept in the variable “feature_wanted”. Followed by creating the variable “ feature_wanted”, the measurement names are cleaned, such as “mean” was converted to “Mean”, brackets were removed.
3.	Read data from “y_train.txt” into the variable “train_activity”. Read data from “subject_train.txt” into the variable “train_subject”. Read data from “X_train.txt” into the variable “train” and only keep the column wanted based on the indices stored in the variable “feature_wanted”. Bind three variables on column wise and store the data in the variable “train”.
4.	Read data from “y_test.txt” into the variable “test_activity”. Read data from “subject_test.txt” into the variable “test_subject”. Read data from “X_test.txt” into the variable “test” and only keep the column wanted based on the indices stored in the variable “feature_wanted”. Bind three variables on column wise and store the data in the variable “test”.
5.	Merge the variables “train” and “test” into “data”.
6.	Rename column names for the variable “data”. Replace the IDs in “Activity” column in the variable “data” with descriptive names. The descriptive names are sourced from the file “activity_labels.txt”.
7.	The data in the variable “data” is reshaped and stored in the variable “data.melted”. The mean is calculated. The independent tidy data is stored in the variable “data.mean” and write in to the file “tide_data.txt”. 
