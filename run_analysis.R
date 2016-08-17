# clear the workspace
rm(list = ls())
library(reshape2)

# set work directory
workdir <- "C:/Users/daveh/OneDrive/Documents/Data Science Coursera Course/3. Getting and Cleaning Data/Peer Review Assignment"
setwd(workdir)


# read features and store the indice of only the mean and standard deviation for each measurement
feature <- read.table("./data/features.txt")
feature_wanted <- grep(".*mean\\(\\)|.*std\\(\\)", feature[,2])
feature_wanted_names <- feature[feature_wanted,2]
feature_wanted_names <- gsub('-mean', 'Mean', feature_wanted_names)
feature_wanted_names <- gsub('-std', 'Std', feature_wanted_names)
feature_wanted_names <- gsub('[-()]', '', feature_wanted_names)

# read data for train and extract only the mean and standard deviation for each measurement
train_path <- "./data/train/X_train.txt"
train_activity_path <- "./data/train/y_train.txt"
train_subject_path <- "./data/train/subject_train.txt"
train_activity <- read.table(train_activity_path)
train_subject <- read.table(train_subject_path)
train <-read.table(train_path)[, feature_wanted]
train <- cbind(train_subject, train_activity, train)

# read data for test only the mean and standard deviation for each measurement
test_path <- "./data/test/x_test.txt"
test_activity_path <- "./data/test/y_test.txt"
test_suject_path <- "./data/test/subject_test.txt"
test_activity <- read.table(test_activity_path)
test_suject <- read.table(test_suject_path)
test <- read.table(test_path)[, feature_wanted]
test <- cbind(test_suject, test_activity, test)

# merges the training and the test sets to create on data set
data <-rbind(train, test)
dim(data)

# uses descriptive activity names to name the activities in the data set
# apporpriately lables the data set with descriptive variable names
colnames(data) <- c("Subject", "Activity", feature_wanted_names)
activity_label <- read.table("./data/activity_labels.txt")
activity_label[, 2] <- tolower(activity_label[, 2])
data$Activity <- activity_label[data$Activity, 2]

# creates a second, independent tidy data set with the average
# of each variable for each activity and each subject
data.melted <- melt(data, id = c("Subject", "Activity"))
data.mean <- dcast(data.melted, Subject + Activity ~ variable, mean)
dim(data.mean)
write.table(data.mean, "tide_data.txt", row.name=FALSE)
