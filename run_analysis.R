## Download the data set

download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile = 'activity.zip');
unzip('activity.zip')

# Extract labels and features
labels <- read.table('UCI HAR Dataset/activity_labels.txt')
features <- read.table('UCI HAR Dataset/features.txt')

# Extract test sets for X and Y
Xtst = read.table('UCI HAR Dataset/test/X_test.txt')
ytst = read.table('UCI HAR Dataset/test/y_test.txt')

# Extract Train Sets for X and Y
Xtrain = read.table('UCI HAR Dataset/train/X_train.txt')
ytrain = read.table('UCI HAR Dataset/train/y_train.txt') 

# Extract Subjects
subtest <- read.table('UCI HAR Dataset/test/subject_test.txt')
subtrain <- read.table('UCI HAR Dataset/train/subject_train.txt')

# Combine training and test set to create one data set
DataX <- rbind(Xtrain, Xtst)
DataY <- rbind(ytrain,ytst)
subjects <- rbind(subtrain,subtest)


# Extract mean and std deviation
mnstd <- grepl("mean|std",features[,2])

## Extracting total data on features
TDataXmeas <- DataX[,features[,2][mnstd]]


## Extracting training and testing data on features. 
Trainmeas <- Xtrain[,features[,2][mnstd]]
Testmeas <- Xtst[,features[,2][mnstd]]

# Use descriptive activity names to name the activities.
ytrain[,2] <- labels[,2][ytrain[,1]]
ytst[,2] <-  labels[,2][ytst[,1]]
DataYact <- rbind(ytrain,ytst)


# Appropriately labels the data set with descriptive variable names. 
colnames(TDataXmeas) = features[,2][mnstd]

names(TDataXmeas)<- gsub("^t", "Time", names(TDataXmeas))
names(TDataXmeas)<-gsub("^f", "frequency", names(TDataXmeas))
names(TDataXmeas)<-gsub("Acc", "Accelerometer", names(TDataXmeas))
names(TDataXmeas)<-gsub("Gyro", "Gyroscope", names(TDataXmeas))
names(TDataXmeas)<-gsub("Mag", "Magnitude", names(TDataXmeas))
names(TDataXmeas)<-gsub("BodyBody", "Body", names(TDataXmeas))



# Separate table for mean of activity per subject. 
A <- aggregate(TDataXmeas[,1:length(TDataXmeas)], list(subjects[,1],DataYact[,2]), mean)
newnames = append("Activity", as.character(names(TDataXmeas)));
newnames = append("Subjects", as.character(newnames));
colnames(A) = newnames;
write.table(A,file = "result1.txt", sep = " ", row.names =FALSE)







