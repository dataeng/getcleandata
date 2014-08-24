CodeBook for Getting and Cleaning Data Course Project
=====================================================
Date: 25.08.2014


Overview
--------
This file is a codebook for "Getting and Cleaning Data Course" Project. It describes the variables, the data, and transformations performed to clean up the source data.


Source data
---------------
The original data is [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), which is Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The original data is available at http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

Due to the requirements to the (final) project's tidy data set, only the following files from the dataset are needed:
* test/X_test.txt
* train/X_train.txt
* test/y_test.txt
* train/y_train.txt
* test/subject_test.txt
* train/subject_train.txt
* features.txt
* activity_labels.txt


Transformation steps
--------------------
Below is a transformation process, coded in *run_analysis.R* script, producing the project's tidy data set from the source data:
     
 1.  Read data from test and train sets
 2.  Read list of feature names (561 features) and assign them to 'x_train' and 'x_test' data frames
 3.  Add 'SubjectID' and 'ActivityID' columns to data frames representing train and test sets
 4.  Merge train and test to one set ('wearable' data frame)
 5.  Identify features with mean- and standard deviation-based values (those contain "mean()" or "std()") and get rid of all other features. Note1: two last columns, 'SubjectID', 'ActivityID' are kept). Note2: features with the substring 'mean' (without brackets '()') are excluded as not representing true means. The result is in 'wearable2' data frame
 6.  Read descriptive activity names and change activity-ids to activity names in 'wearable2' data frame
 7.  Create final tidy dataset with average aggregation on 'ActivityID' and 'SubjectID' columns ('final_tidy_data_set' data frame) and write it to disk


Output (final tidy dataset)
---------------------------
The tidy wide dataset has:
* 68 variables ("Activity", "SubjectID" and 66 features)
* 180 observations (i.e., 30 subjects x 6 activities)

Variables description
---------------------
Below is the list of variables in the final tidy dataset produced by "run_analysis.R" script.

* *Activity*
    - Characters  
    - Descriptive name of the activity performed by the subject.
    - The list of its values is "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"

* *SubjectID*
    - Numeric
    - Numeric value identifying the subject who performed the activity. 
    - Range: 1:30
    
* **66** time domain variables
    - Variable names: "tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyAccMag-mean()" "tGravityAccMag-mean()" "tBodyAccJerkMag-mean()" "tBodyGyroMag-mean()" "tBodyGyroJerkMag-mean()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" "fBodyAccMag-mean()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroJerkMag-mean()" "tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" "tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" "tBodyAccMag-std()" "tGravityAccMag-std()" "tBodyAccJerkMag-std()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-std()" "fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyAccMag-std()" "fBodyBodyAccJerkMag-std()" "fBodyBodyGyroMag-std()" "fBodyBodyGyroJerkMag-std()"
    - Numeric
    - Values included in the [-1,1] range
    
---------------------------------------------------------------------

    
