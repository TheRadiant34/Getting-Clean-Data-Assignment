if (!require("reshape2")) {
        install.packages("reshape2")
        }

library(reshape2)

# Creates a directory for download.

if(!file.exists("./data")){dir.create("./data")}

# Desired data downloaded named datazipfile

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/datazipfile.zip")

# Unzip file to data directory.

unzip("./data/datazipfile.zip", exdir= "./data")

# Goal 1: Merging the training and the test sets to create one data set.
        
## A: Reading files.
        
### A1: Test table files.
        
x_test<- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test<- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

### A2: Train table files.

x_train<- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train<- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

### A3: Features file.

features <- read.table("./data/UCI HAR Dataset/features.txt")

### A4: Activity labels file.

activity_label<- read.table("./data/UCI HAR Dataset/activity_labels.txt")
        
## B: Column names.

### B1: For activity label.

colnames(activity_label)<- c("activity_id", "activity")

### B2: For test files.

colnames(x_test)<- features[ ,2]
colnames(y_test)<- "activity_id"
colnames(subject_test)<- "subject_id"

### B3: For train files.

colnames(x_train)<- features[ ,2]
colnames(y_train)<- "activity_id"
colnames(subject_train)<- "subject_id"

## C: Merging all data into one set.

merged_test<- cbind(subject_test,y_test, x_test)
merged_train<- cbind(subject_train, y_train, x_train)
data_one_set<- rbind(merged_test, merged_train)

# Goal 2: Extract only the measurements on the mean and standard deviation 
#for each measurement.

## A1: Selecting only columns with IDs, means and standard deviations.

read_colnames <- colnames(data_one_set)

means_stds <- grepl("activity_id" , read_colnames) | 
                         grepl("subject_id" , read_colnames) | 
                         grepl("mean\\(\\)" , read_colnames) | 
                         grepl("std\\(\\)" , read_colnames) 

## A2: Only TRUE values for means and stds

means_stds_values<- data_one_set[ , means_stds == TRUE]

# Goal 3: Uses descriptive activity names to name the activities in the data set

data_set_activities <- merge(means_stds_values, activity_label,
                              by='activity_id',
                              all.x=TRUE)


# Goal 4: Appropriately labels the data set with descriptive variable names.
## See Goals 2 A1 and 3. Data is equal to means_stds_values

#Goal 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity 
# and each subject.

## A1: Melt data using library(reshape2)

final_data_melt<- melt(means_stds_values, id = c("activity_id", "subject_id"))

## A2: Recast melted data and apply the mean function
tidy_data <- dcast(final_data_melt, subject_id + activity_id ~ variable, mean)

## A3: Save tidy data

write.table(tidy_data, file = "./data/tidy_data.txt")
