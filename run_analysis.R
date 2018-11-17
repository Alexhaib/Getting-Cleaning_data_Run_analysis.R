#loads dplyr
library(dplyr)

#0.Reads TRAINING data:
X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt")

#Reads TESTING data:
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt")

#Reads descriprions:
features <- read.table("~/UCI HAR Dataset/features.txt")
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt")

##1.Merges the training and the test sets to create one data set.
X_all <- rbind(X_train,X_test)
y_all <- rbind(y_train,y_test)
subject_all <- rbind(subject_train,subject_test)

##(optional) removes redundant data
rm(X_test)
rm(y_test)
rm(subject_test)
rm(X_train)
rm(y_train)
rm(subject_train)

#2.Extracts only the measurements on the mean (mean()) and standard deviation (std()) for each measurement.
needed_variables <- features[grep("mean\\(\\)|std\\(\\)",features[,2]),]
X_all <- X_all[,needed_variables[,1]]

#3.Uses descriptive activity names to name the activities in the data set
colnames(y_all)<- "activity"
y_all$activityname <- factor(y_all$activity,labels = as.character(activity_labels[,2]))


#4.Appropriately labels the data set with descriptive variable names.
colnames(X_all) <- needed_variables[,2]

#5.From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable 
#for each activity and each subject.
colnames(subject_all) <- "subject"
average_data <- cbind(subject_all,activityname=y_all$activityname,X_all)
average_data <- average_data %>% group_by(activityname,subject) %>% summarize_all(mean)

#Writes text file Average_data.txt
write.table(average_data,file="average_data.txt",row.name=FALSE)

