Getting and Cleaning Data Course Project
========================================
The goal of this project is to prepare tidy data that can be used for later analysis. The original raw data can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The main script can be found in the *run_analysis.R* file. This R script does the following:
* Step 1: Merges the training and the test sets to create one data set.
* Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
* Step 3: Uses descriptive activity names to name the activities in the data set
* Step 4: Appropriately labels the data set with descriptive activity names. 
* Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The resulting tidy data can be found in the *tidydata.txt* file. It can be loaded with the line: `tidydata<-read.table("./tidydata.txt")`. Please, find the description of the tidy data in the file *CodeBook.md*.

#### Process replication

In order to replicate the process followed to obtain the tidy data, one have to accomplish the following steps:
* Step 1: Unzip the raw data in the local drive.
* Step 2: Put the run_analysis.R script into the unzipped *UCI HAR Dataset* folder.
* Step 3: Set the working directory to the one with the *run_analysis.R* script and the raw data.
* Step 4: Run the *run_analysis.R* script with the lines:
```{r}
source("run_analysis.R")
```
The library *plyr* should be installed. Otherwise run:
```{r}
install.packages("plyr")
```
* Step 5: The file *tidydata.txt* with the tidy data set can be found inside the working directory.

The above steps took 59 secons running on a Macbook Pro Mid 2010 (2.4 GHz Intel Core 2 Duo and 8 GB 1067 MHz DDR3) with RStudio 0.98.501 and Mac OS X 10.9.2 (Mavericks).