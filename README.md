# Course Project Readme
John Hopkins Data Science - Getting Data Course - Course Project
NOTE: This code uses plyr & Reshape2 packages, please install these packages before running this code or this code will not work.

This code operates on UCI HAR Dataset on wearable technologies available at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code does the following things in order when run
1. Downloads the raw data (divided between training and test sets)
2. Associates the measurements with their corresponding feature names, test subjects whom they were recorded on, and the activities the test subjects were peforming.  Gives all features & activities descriptive names.
3. Combines training and test data
4. Extracts only the measurements which correspond to means and standard deviations
5. takes the average of these measurements for each activity performed by each subject.  
6. Writes tidied data into file called tidydata.txt for future use.

This code makes use of the plyr, reshape2 packages.  However it does notcontain any install.packages() commands for these packages so as not download any code the end user does not wish downloaded.  Thus if you do not have these libraries installed and wish to use this R script please uncomment the install code for these libraries within the R script to install these libraries or else this code will not work.
