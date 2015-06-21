## Getting and Cleaning Data Project Codebook  

As part of the **Getting and Cleaning Data** Project, the following activities were performed on the traing and test datasets for _Human Activity Recognition Using Smartphones Dataset_ sourced from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip):

1. Read the training, test, feature, subject and activity label datasets into separate data frames
2. Combine training and test measurement data frames and set the column names to the labels in the features data frame
3. Combine subject and activity label data frames and give descriptive column names
4. Create a separate variable in the data frame created in step 3 to hold description of activities, i.e. "WALKING" for activity label 1, etc.
5. Drop the numeric activity labels from the data frame from step 4 as this is redundant now
6. Create a new data frame from the one created in step 2, keeping only those columns that have "means" or "std" in their names.
7. In the data frame created in step 6, make the column names more user friendly by removing "()", expaning "Mag" to "Magnitude", and replacing "-" with "."
8. Create a new data frame by combining the data frames from step 5 and step 7. This new data frame holds subjects, activity labels and the measurements
9. Create the tidy data frame by taking the mean of all the metrics by subject and activity 
10. Write out the tidy dataset to a text file called _tidy\_dat.txt_ within a sub-folder called _tidy\_data_ in the working directory

### Activity Measurements and Other Values

In the original datasets, all the measurements were normalized and bounded within [-1,1]. This still holds true. The values of _subject_ column range from 1 to 30 inclusive whereas _activity_ column contains a value from the set of {WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING,LAYING}.

### Variables

The tidy dataset has 81 variables. Only the first 2 are described in this codebook: 

1. **subject** - This is the number assigned to the participant, raning from 1 to 30 inclusive
2. **activity** - One of 6 activities recorded for the study. The activities are WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING and LAYING.

The rest of the variables are averages of the measurements obtained at various points. The file _features\_info.txt_ included with the original dataset gives descriptions of these variables as follows:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

>These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

It was decided that the descriptions in the block quote provide enough information for the motivated researchers and the merely curious about the measurement variables in the tidy dataset.