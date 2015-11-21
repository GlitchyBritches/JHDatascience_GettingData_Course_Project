##NOTE: This code uses plyr & Reshape2 packages, please install these packages
##before running this code or this code will not work.

##This code operates on UCI HAR Dataset on wearable technologies available at 
##https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##The code does the following things in order when run
##1. Downloads the raw data (divided between training and test sets)
##2. Associates the measurements with their corresponding feature names,
##test subjects whom they were recorded on, and the activities the test subjects were
##peforming.  Gives all features & activities descriptive names.
##3. Combines training and test data
##4. Extracts only the measurements which correspond to means and standard deviations
##5. takes the average of these measurements for each activity performed by each subject.  
##6. Writes tidied data into file called tidydata.txt for future use.

##This code makes use of the plyr, reshape2 packages.  However it does not 
##contain any install.packages() commands for these packages
##so as not download any code the end user does not wish downloaded.  Thus 
##if you do not have these libraries installed and wish to use this R script
##please uncomment the install code below to install these libraries
##or else this code will not work.

##Load plyr and reshape2 libraries
##install.packages("plyr")
##install.("reshape2") 
library(plyr)
library(reshape2)

## Download and extract the dataset if not already in working directory:
zipName <- "getdata-projectfiles-UCI HAR Dataset.zip"
if (!file.exists(zipName)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, zipName, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(zipName)
}

##Save file directories for test, train, and feature list files
featureFileDirectory <- paste(getwd(),"UCI HAR Dataset/", sep = "/")
testFileDirectory <- paste(getwd(),"UCI HAR Dataset/test/", sep = "/")
trainFileDirectory <- paste(getwd(),"UCI HAR Dataset/train/", sep = "/")

##Import test, train, and feature list files into their own dataframes
testData = read.table(paste(testFileDirectory,"X_test.txt", sep=""))
testActivities = read.table(paste(testFileDirectory,"y_test.txt", sep=""))
testUsers = read.table(paste(testFileDirectory,"subject_test.txt", sep=""))
trainData = read.table(paste(trainFileDirectory,"X_train.txt", sep=""))
trainActivities = read.table(paste(trainFileDirectory,"y_train.txt", sep=""))
trainUsers = read.table(paste(trainFileDirectory,"subject_train.txt", sep=""))
featureNames = read.table(paste(featureFileDirectory,"features.txt", sep=""))

##Make descriptive names for features
names(testData) = featureNames$V2
names(trainData) = featureNames$V2

##Make new columns for train & test subjects, cast them as factors
testData$subject <- as.factor(testUsers$V1)
trainData$subject <- as.factor(trainUsers$V1)

##Make a new columns for test activities, cast them as factors, label them descriptively
testData$activities <- factor(testActivities$V1,labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))
trainData$activities <- factor(trainActivities$V1,labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))

##Merge test and training data (uses join from plyr package)
mergedData = join(trainData,testData, by = "subject", type = "full")

##Extract the means and standard deviations using grepl & regular expressions
meansAndDeviations <-mergedData[c(names(mergedData)[grepl("[Mm]ean|[Ss]td",names(mergedData))],"subject","activities")]

##Take average of std deviations and means for each activity each individual subject performed
##Done by melting subject & activities columns and then using dcast to take the means
meltedMeans <- melt(meansAndDeviations, id = c("subject", "activities"))
activityMeans <- dcast(meltedMeans, subject + activities ~ variable, mean)

##Clean up R environment a bit by removing intermediate variables, leaves data 
##structures requested in steps 1 & 2 & 5 of the assignment
rm(testFileDirectory, zipName, trainFileDirectory,testUsers,testActivities,trainUsers,trainActivities, featureNames,featureFileDirectory, testData, trainData, meltedMeans)

##Write tidy data to a file called tidydata.txt
write.table(activityMeans, "tidydata.txt", row.names = FALSE, quote = FALSE)
