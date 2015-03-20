library(dplyr)
library(plyr)

#read in Training Data
subject_train <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

#read in Testing Data
subject_test <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

#read in the features file, create a vector to be used as column
#names for x_test and x_train
features <- read.table("./features.txt")
colnames <- as.vector(features[ , 2])
#add the column names to the data file
colnames(x_train) <- colnames
colnames(x_test) <- colnames

#rename y_train/test column headers to Activity
y_train <- rename(y_train, Activity = V1)
y_test <- rename(y_test, Activity = V1)
#rename subject_train/test column headers to Subject
subject_train <- rename(subject_train, SubjectID = V1)
subject_test <- rename(subject_test, SubjectID = V1)

#read in activity lables
activity <- read.table("./activity_labels.txt")
activityLabels <- levels(activity$V2)
#convert number lables to words describing what the activity was
y_train$Activity = factor(y_train$Activity, labels = activityLabels)
y_test$Activity = factor(y_test$Activity, labels = activityLabels)

##combine training and test data data
training <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
data <- rbind(training, test)

#grab only the columns relating to the subjectID, Activity, mean, std
meancol <- grep("mean()", colnames)
stdcol <- grep("std()", colnames)
colkeep <- sort(c(meancol, stdcol))
ReducedData <- subset(data, select = colkeep)

#summarize the data by SubjectID and Activity, take the mean for each variable
Summary <- ddply(ReducedData, .(SubjectID, Activity), colwise(mean))

#write the data out to upload to coursera
write.table(Summary, file = "Getting and Cleaning Data Course Project.txt", row.names=FALSE)
