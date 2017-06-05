# Getting-and-Cleaning-Data
This is the repository of the course project for getting and cleaning data. 
## Download the data
This section downloads the data from the website provided in the project
It then unzips the file to extract folders

# Extract labels and features
It reads the activity labels from the Dataset
It also reads the features from the dataset

# Extract test sets for X and Y
It extracts the Test set for X and Y

# Extract train sets for X and Y
It extracts the training set for X and Y

# Extract Subjects
It extracts the subject listed for testing and training

# Combine training and test set to create one data set
Using the rbind function it combines the training and test set for X and Y. 

# Extract feature names having mean and std deviation
Using the grepl function it extracts the feature names which has mean and std in them 

# Extracting total data on features
Using the feature names obtained above it extracts the feature values of X for those names

# Extracting training and testing data on features. 
Using the feature names obtained above it also extracts the feature values for training and testing data set. 
This step may not be required. 

# Use descriptive activity names to name the activities.
Using indexing, this section adds names to the activity values as a second column of Y. 


# Appropriately labels the data set with descriptive variable names. 
This section changes the column names as below
If a column name starts with t, it substitues t by Time
If a column name starts with f, it substitues f by frequency
If a column name has Acc in it, it substitues Acc by Accelerometer
If a column name has Gyro in it, it substitues Gyro by Gyroscope
If a column name has Mag in it, it substitues Mag by Magnitude
If a column name has BodyBody in it, it substitues BodyBody by Body


# Separate table for mean of activity per subject. 
This section creates a data frame to calculate the mean value for each activity per subject. 
It uses the aggregate function to do this, creates the frame organised by Subjects first then their activities. 
The results are the mean values for each activity of each subject. 
The resulting table will have 2 extra columns, the first name is given as activity then subject. 
Using the write.table function the txt file is created. 
