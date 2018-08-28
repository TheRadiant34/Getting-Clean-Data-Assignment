# The Project

The purpose of this project is to clean raw data and submit a tidy file. The requirements are to create an R script 
called run_analysis.R  that does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Create a second, independent tidy data set with the average of each variable for each 
activity and each subject.

# Source Data

The data linked to from the course website represent data collected from the accelerometers 
from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Dataset

README.txt describing the experiment
features_info.txt: Shows information about the variables used on the feature vector.
features.txt: List of all features.
activity_labels.txt: Links the class labels with their activity name.
train/X_train.txt: Training set.
train/y_train.txt: Training labels.
test/X_test.txt: Test set.
test/y_test.txt: Test labels.

# Desired Measurements
#### tBodyAcc-mean()-X
#### tBodyAcc-mean()-Y 
#### tBodyAcc-mean()-Z
#### tBodyAcc-std()-X
#### tBodyAcc-std()-Y
#### tBodyAcc-std()-Z
#### tGravityAcc-mean()-X
#### tGravityAcc-mean()-Y
#### tGravityAcc-mean()-Z
#### tGravityAcc-std()-X
#### tGravityAcc-std()-Y
#### tGravityAcc-std()-Z
#### tBodyAccJerk-mean()-X
#### tBodyAccJerk-mean()-Y
#### tBodyAccJerk-mean()-Z
#### tBodyAccJerk-std()-X
#### tBodyAccJerk-std()-Y
#### tBodyAccJerk-std()-Z
#### tBodyGyro-mean()-X
#### tBodyGyro-mean()-Y
#### tBodyGyro-mean()-Z
#### tBodyGyro-std()-X
#### tBodyGyro-std()-Y
#### tBodyGyro-std()-Z
#### tBodyGyroJerk-mean()-X
#### tBodyGyroJerk-mean()-Y
#### tBodyGyroJerk-mean()-Z
#### tBodyGyroJerk-std()-X
#### tBodyGyroJerk-std()-Y
#### tBodyGyroJerk-std()-Z
#### tBodyAccMag-mean()
#### tBodyAccMag-std()
#### tGravityAccMag-mean()
#### tGravityAccMag-std()
#### tBodyAccJerkMag-mean()
#### tBodyAccJerkMag-std()
#### tBodyGyroMag-mean()
#### tBodyGyroMag-std()
#### tBodyGyroJerkMag-mean()
#### tBodyGyroJerkMag-std()
#### fBodyAcc-mean()-X
#### fBodyAcc-mean()-Y
#### fBodyAcc-mean()-Z
#### fBodyAcc-std()-X
#### fBodyAcc-std()-Y
#### fBodyAcc-std()-Z
#### fBodyAccJerk-mean()-X
#### fBodyAccJerk-mean()-Y
#### fBodyAccJerk-mean()-Z
#### fBodyAccJerk-std()-X
#### fBodyAccJerk-std()-Y
#### fBodyAccJerk-std()-Z
#### fBodyGyro-mean()-X
#### fBodyGyro-mean()-Y
#### fBodyGyro-mean()-Z
#### fBodyGyro-std()-X
#### fBodyGyro-std()-Y
#### fBodyGyro-std()-Z
#### fBodyAccMag-mean()
#### fBodyAccMag-std()
#### fBodyBodyAccJerkMag-mean()
#### fBodyBodyAccJerkMag-std()
#### fBodyBodyGyroMag-mean()
#### fBodyBodyGyroMag-std()
#### fBodyBodyGyroJerkMag-mean()
#### fBodyBodyGyroJerkMag-std()

# Activity Labels
1. WALKING: subject was walking during the test.
2. WALKING_UPSTAIRS: subject was walking up a staircase during the test.
3. WALKING_DOWNSTAIRS: subject was walking down a staircase during the test.
4. SITTING: subject was sitting during the test.
5. STANDING: subject was standing during the test.
6. LAYING: subject was laying down during the test.

# R script

1. Merging the training and the test sets to create one data set.

Read files:
Reading test tables.
Reading train tables.
Readiing feature vector.
Reading activity labels.

Assigning column names:

Merging all data in one set:

2. Extracting only the measurements on the mean and standard deviation for each measurement

Reading column names.

Create vector for defining ID, mean and standard deviation.

Making subset from data_one_set to only contain mean and standard deviation variables.

3. Using descriptive activity names to name the activities in the data set:

4. Appropriately labeling the data set with descriptive variable names:

5. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

Making second tidy data set.

Writing second tidy data set in tidy_data.txt file.

# The Tidy Data
The data is group by subject as follows:
subject IDs in the 1st column;
activity labels in the 2nd column;
the average of features in the next 66 columns.


