# ---------------------------------------------------------------------
# R script for Getting and Cleaning Data Course Project

# Note: run from directory containing 'test' and 'train'
# subdirs with test and train sets taken from "Human 
# Activity Recognition Using Smartphones Dataset 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# 
# Script does the following:
#  1. Merges the training and the test sets to create one data set
#  2. Extracts only the measurements on the mean and standard deviation 
#     for each measurement
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names 
#  5. Creates a second, independent tidy data set with the average of 
#     each variable for each activity and each subject (a tidy data set is written 
#     to "final-tidy-data-set.txt" file in the same directory)
# ---------------------------------------------------------------------

# read data from train set
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt",col.names="ActivityID")
subj_train <- read.table("train/subject_train.txt",col.names="SubjectID")

# read data from test set
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt",col.names="ActivityID")
subj_test <- read.table("test/subject_test.txt",col.names="SubjectID")

# read list of feature names (561 features)
flabels <- read.table("features.txt",col.names=c("fid","fname"))

# assign descriptive feature names to columns in 'x_train' and 'x_test' data frames 
colnames(x_train) <- flabels$fname
colnames(x_test) <- flabels$fname

# add 'SubjectID' and 'ActivityID' columns to train set
train <- cbind(x_train,subj_train,y_train)

# add 'SubjectID' and 'ActivityID' columns to test set
test <- cbind(x_test,subj_test,y_test)

# merge train and test sets to one set
wearable <- rbind(train,test)

# identify features with mean- and standard deviation-based values
featurestoextract<-c(grep("mean()",flabels$fname,fixed=T),grep("std()",flabels$fname,fixed=T))

# get rid of all features expect those in 'featurestoextract' and 'SubjectID' and 
# 'ActivityID' (these two are last columns) 
wearable2 <- wearable[,c(featurestoextract,562,563)]

# read descriptive activity names
alabels <- read.table("activity_labels.txt",col.names=c("ActivityID","ActivityName"))

# change activity-ids to activity names in 'wearable2' data frame
wearable2$Activity <- sapply(wearable2$ActivityID, function(id) { as.factor(alabels$ActivityName[id]) })

# remove 'ActivityID' column
wearable2$ActivityID <- NULL

# create final tidy dataset with average aggregation on 'ActivityID' and 'SubjectID' columns
final_tidy_data_set <- aggregate(. ~ Activity + SubjectID, wearable2, FUN=mean) 

# write final tidy dataset to disk
write.table(final_tidy_data_set, file = "final-tidy-data-set.txt", row.names = F)
