## The goal of this script is to prepare tidy data that can be used for later 
## analysis. This R script does the following:
## Step 1: Merges the training and the test sets to create one data set.
## Step 2: Extracts only the measurements on the mean and standard deviation for
##         each measurement. 
## Step 3: Uses descriptive activity names to name the activities in the data 
##         set
## Step 4: Appropriately labels the data set with descriptive activity names. 
## Step 5: Creates a second, independent tidy data set with the average of each 
##         variable for each activity and each subject.   

library(plyr)                             #load plyr library
features<-read.table("./features.txt")    #load features names

## Load trainning data
X_train<-read.table("./train/X_train.txt",col.names=features[,2]) #load features
y_train<-read.table("./train/y_train.txt",col.names="activity")   #load activity
subject_train<-read.table("./train/subject_train.txt",col.names="id") #subjects
train_data<-cbind(subject_train,y_train,X_train)       #merge the above together

## Load test data
X_test<-read.table("./test/X_test.txt",col.names=features[,2])    #load features
y_test<-read.table("./test/y_test.txt",col.names="activity")      #load activity
subject_test<-read.table("./test/subject_test.txt",col.names="id") #subjects
test_data<-cbind(subject_test,y_test,X_test)           #merge the above together

## Step 1: Merges the training and the test sets to create one data set.
X_data<-rbind(train_data,test_data) #appendd test data to trainning data
X_data<-arrange(X_data,id,activity) #order data by subject ID and activity

## Step 2: Extracts only the measurements on the mean and standard deviation for
##         each measurement. 
extracteddata<-X_data[,c(1,2,2+sort(c(grep("-mean\\(\\)",features$V2),
                                 grep("-std\\(\\)",features$V2))))]

## Step 3: Uses descriptive activity names to name the activities in the data 
##         set
activity_labels<-read.table("./activity_labels.txt")

## Step 4: Appropriately labels the data set with descriptive activity names. 
extracteddata$activity<-activity_labels[extracteddata$activity,2]

## Step5: Creates a second, independent tidy data set with the average of each 
##        variable for each activity and each subject. 
splitteddata<-split(extracteddata[,3:68],interaction(extracteddata$id,extracteddata$activity),
                    drop=TRUE)            #split data by subject ID and activity
tidydata<-t(sapply(splitteddata,colMeans))#obtain a matrix [ID.activity,feature]

## Save tidy data in a file
write.table(tidydata, file="./tidydata.txt", sep="\t") 