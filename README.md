## Run_Analysis.R Readme
####NOTE: This code uses plyr & Reshape2 packages, please install these packages before running this code or this code will not work.

This code operates on UCI HAR Dataset on wearable technologies available at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The code does the following things in order when run
1. Downloads the raw data if the user does not already have it
2. Associates the measurements with their corresponding feature names, test subjects whom they were recorded on, and the activities the test subjects were peforming.  
3. Combines training and test data.  
4. Gives all features & activities descriptive names.
5. Extracts only the measurements which correspond to means and standard deviations
6. takes the average of these measurements for each activity performed by each subject.  
7. Writes tidied data into file called tidydata.txt for future use.

This code makes use of the plyr, reshape2 packages.  However it does not contain any install.packages() commands to download these packages so as to not download anything the end user does not wish downloaded.  If you do not have these libraries installed and wish to use this R script, please install these libraries prior to running the script or else this code will not work.
