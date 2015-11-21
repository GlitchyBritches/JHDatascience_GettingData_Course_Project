#Tidy Data Code Book

##1. Overview
The code contained within this repository will generate a file called tidydata.txt, the following subsections describe the data within tidydata.txt and dataset and how it was derived.

##2. Description of Data Sources

###2.1. Source Dataset Description
This data was derived from the "Human Activity Recognition Using Smartphones Data Set” (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) available University of California Irvine’s Machine Learning Repository.  This source data set is data collected from accelerometers and gyroscopes of a Samsung Galaxy S smartphone attached to 30 separate subjects performing 6 distinct movements (Cataloged below in Section 3: Activity Labels).  The accelerometer and gyroscope raw data were used to derive several meaningful motion quantities called (called “features” by the original authors of this data) which are detailed in features.txt and features_info.txt, available in the dataset source file here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

###2.2  Derived Data Description
The original data (described in Section 2.1 above) provided derived mean and standard deviation measurements for each feature taken at a specified sample rate over a given period of time for each activity performed by each distinct subject.  tidydata.txt takes the average of these mean and std deviation measurements, and provides them in the format below.

| Subject Identifier | Activity Name | Averaged Mean or Std Deviation Measurements (86 in total) |

###2.3 Derivation Methodology
The original data contained a division of subjects between training & test groups.  Each group had 3 files 
X_test.txt/X_train.txt containing feature measurements for test & training groups respectively
y_test.txt/y_train.txt containing the activities being performed during measurements for test & training groups respectively
subject_test.txt/subject_train.txt containing the identifier of the subject performing the test in test & training groups respectively

The R language was used to first combine the feature measurements (X_test.txt/X_train.txt), subject list (subject_test.txt/subject_train.txt), the activity list (y_test.txt/y_train.txt) and the feature names features.txt into 2 R data frames (one for test, one for training) which matched the feature measurements with the corresponding subject and activity being performed at the time of measurement.  The two data frames for test & training were then combined into a single data frame.  From the combined data frame, mean and std deviation measurements were extracted and averaged for each subject and activity and outputted to tidydata.txt

##3. Data Organization
The following sections describe how data is organized within tidydata.txt

###3.1 Data Column Descriptions
Data is organized into 88 total columns of 3 classes described below

* subject (1 column) - Numerical ID identifying the 30 subjects ranging from 1-30. Each number identifies a unique subject
* activities (1 column) - Activity performed by subject.  Labels are described in detail in Section 4.2: Activity Labels below.
* feature name (86 columns) - 86 columns which are averages of the measured means and standard deviations from the original source data. Feature Labels are detailed in section 4.3: feature labels below.

###3.2 Data Column Layout
The columns described above are laid out in the following manner

| subject | activities | features 1 | feature 2 | ….. | feature 86 |


##4 Data Labels
The following section describes the labels for all data

###4.1 Subject Labels
Subjects are identified with numbers 1-30.  Each number describes a unique subject.

###4.2 Activity Labels
* WALKING - Measurements taken from subject while walking
* WALKING_UPSTARS - Measurements taken from subject while walking up stairs
* WALKING_DOWNSTAIRS - Measurements taken from subject while walking down stairs
* SITTING - Measurements taken from subject while sitting
* STANDING - Measurements taken from subject while standing
* LYING - Measurements taken from subject when lying down

These names were taken from activity_labels.txt within the original dataset.  They remain unchanged in order to provide consistency for those who wish to work with this data AND source data.

###4.3 Feature Measurement Labels
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)

These names were taken from features.txt within the original dataset.  They remain unchanged in order to provide consistency for those who wish to work with this data AND source data.
