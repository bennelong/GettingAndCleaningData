##################################################################### 
# Purpose: Coursera Project for Getting and Cleaning Data
# Session: June 2015
#####################################################################


#-----------------------------
# Read the test data files 
#-----------------------------
subject_test <- read.table("./test/subject_test.txt")
y_test <- read.table("./test/y_test.txt")
X_test <- read.table("./test/X_test.txt")

#---------------------------------
# Read the training data files 
#---------------------------------
subject_train <- read.table("./train/subject_train.txt")
y_train <- read.table("./train/y_train.txt")
X_train <- read.table("./train/X_train.txt")

#-------------------------
# Read the feature names
#-------------------------
features <- read.table("./features.txt")

#----------------------------------------
# Combine the test and train dataframes
#----------------------------------------
X_combined <- rbind(X_train, X_test)

#-----------------------------------------------------------------------------
# Change the combined data frame column names to that in features data frame
#-----------------------------------------------------------------------------
colnames(X_combined) <- features$V2

#--------------------------------------
# combine training and test subjects
#--------------------------------------
subject_combined <- rbind(subject_train, subject_test)

#---------------------------------------
# combine training and test activities
#---------------------------------------
y_combined <- rbind(y_train, y_test)

#------------------------------------------------------------------------------------
# further combine subject_combined and y_combined, i.e. subject and activities names
#-------------------------------------------------------------------------------------
subject_activity <- cbind(subject_combined, y_combined)

#---------------------------------------------------------------
# Give more descriptive names to columns in subject_activity
#---------------------------------------------------------------
colnames(subject_activity) <- c("subject","activity_id")

#------------------------------------------------------------------------------
# create a vector of activity labels based on the info in activity_labels.txt
#------------------------------------------------------------------------------

activity_labels <- c("WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#----------------------------------------------------------------------------------------
# create a new column in subject_activity df that mapps activity_id to activity_labels
#----------------------------------------------------------------------------------------
subject_activity$activity <- activity_labels[match(subject_activity$activity_id, c(1,2,3,4,5,6))]

# -----------------------------------------------
# removed activity_id from subject_activity df
# -----------------------------------------------
subject_activity <- subset(subject_activity,select = -activity_id)

#---------------------------------------------------------------------
# keep only those columns that have mean and std from X_combined df
#--------------------------------------------------------------------

## (1) find columns that have "mean" or "std" in the name
meanStdColumns <- grep("mean|std", names(X_combined), value = TRUE)

## (2) create a new df with only those columns with "mean" or "std" in the name
X_combined_meanStd <- X_combined[ ,meanStdColumns]

#----------------------------------------------------------
# make variable names more descriptive and user-friendly
#----------------------------------------------------------
## (1) remove "()" characters
varnames <- colnames(X_combined_meanStd)
varnames <- gsub("\\(\\)", "", varnames)

## (2) Expand "Mag" to Magnitude
varnames <- gsub("Mag", "Magnitude", varnames)

## (3) Replace "-" with "."
varnames <- gsub("-", ".", varnames)

## (4) Replace variable names in the X_combined_meanStd df
colnames(X_combined_meanStd) <- varnames

#------------------------------------------------------
# Combine subject_activity and X_combined_meanStd df 
#------------------------------------------------------
tidy_dataset_stage <- cbind(subject_activity, X_combined_meanStd)


#--------------------------------------------------------------------------------
# Create the tidy dataset by averaging all the metrics by subject and activity  
#--------------------------------------------------------------------------------
tidy_dataset <- aggregate( tidy_dataset_stage[,3:81], tidy_dataset_stage[,1:2], FUN = mean )


#----------------------------------------------------------------------------
# Write the tidy dataset to a text file under a directory called tidy_data
#----------------------------------------------------------------------------

if(!file.exists("./tidy_data")) {dir.create("./tidy_data")}
write.table(tidy_dataset, file="./tidy_data/tidy_data.txt", row.name=FALSE)

#----------------------------------------------------------------------------
#                             the end
#----------------------------------------------------------------------------
