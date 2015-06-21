### Running the R Script

The script _run\_analysis.R_ fulfils the project requirements set out for the course **Getting and Cleaning Data**. In order to run this script, the following steps need to be performed:

1. Download the zipped project data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the downloaded file. The required data files will be inside the sub-folder called _UCI HAR Dataset_, which will have a README file as well as files with data about features and activity labels. Two sub-folders called _train_ and _test_ will have training and test datasets, respectively
3. Start an R session and set the working directory to the folder _UCI HAR Dataset_. For example, if the contents of the downloaded zip file were extracted to C: on a Windows machine, then, from within R, set the working directory to _UCI HAR Dataset_ folder as follows: `setwd("C:\getdata-projectfiles-UCI HAR Dataset\UCI HAR Dataset")`
