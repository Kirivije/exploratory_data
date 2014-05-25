R Script to Analyze Human Activity Recognition Using Smartphones Data Set
========================================================
Pre-requisite
---------------------------
To run the run_analysis.R script, R, statistical package must be installed and optionally, Rstudio should also be installed. 
Down load the date from the following URL:
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
Unzip the file and extract the data to the “UCI HAR Dataset” folder. Set the working directory to “UCI HAR Dataset” using the following command:
setwd(“path-to-directory/UCI HAR Dataset/”)

The script requires two R packages: "stringr"", "reshape2"" and "data.table". These two packages can be installed using install.packages() function in R.

Component of the script
-----------------------------------
run_analysis.R has six main component:

1. Reading “test” and “train” data files and merging them:
“CombinedDataFrame” function will read and merge the files in “test” and “train” folders. It takes two arguments folder that contain the files and pattern of the files need to be merged. Prior to running the function, you need to run following two commands (in this case, test data has been used as an example.). 
```{r}
test.dir <- "test" # this the directory containing test data
test.files <- list.files(test.dir, pattern="*_test.txt") # get list of files that contains "*_test.txt" in the file name 
```
This will be run for both test and train data, separately.

2. Labeling the variable names:
this part of the code will read "features.txt" and set the column names to the variable names find in the file. It will also add "subject" and "activity"  labels. 

3. Extracting mean and std:
This part of the script will extract the variable on mean and standard deviation. 

4. Label the activities:
This section will read "activity_labels.txt" file and assign English names to the numerical values of the merged dataset. 

5. Function to make better column lables:
“MakeBetterNames” function will take the names present in the merged dataset and change column names as described in the CodeBook.md and return a vector containing names.  This vector will be used to rename the merged data. 

6. Getting average of each variable for each activity and each subject:
This will average the numerical variable for each activity and subject pair.  The resulting file will be written to "second_tidy.txt". 
 

Running the script: 
-------------------------
This code was run on MacBook Pro OS X version 10.9.3. 
You may either use on the command line of R:
source("PATH-TO_SCRIPT/run_analysis.R")
Or opening the script in Rstudio and run the script in Rstudio source. 
