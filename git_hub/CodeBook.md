Reformated Human Activity Recognition Using Smartphones Data Set
========================================================


Data set:
------------------------------------------------
The data was downloaded from the Human Activity Recognition database that has recordings of 30 individuals of their daily activities. The study and original data are described in following webpage: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#) 
In addition, the original dataset can be downloaded from the following URL:
(https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Variables describe in the original dataset (this is copied from the feature_info.txt in the original dataset)


Data transformation
-----------------------------------
Original data set had been divided into test (obtained from 30% of the volunteers) and train data sets (obtained from 70% of the volunteers). Each set contained three files X, Y and subject, containing data from X-axis, Y-axis and names of the individuals, respectively. Files from each set were combined to obtain a single dataset for all 30 individuals for all variables. The activity labels (contained in activity_labels.txt) and variable names (contained in features.txt) were combined with newly created data file that contained 563 variables and 10299 observations. 

Extract columns containing mean and standard deviations
--------------------------------------------------------
As per assignment, variable on mean and standard deviation were extracted. As described in the “feature_info.txt”, variable names containing “mean()” and “std()” are mean and standard deviation values for the signals and therefore, included for extraction.  In addition, since following vectors were also obtained by averaging the signals in a single window sample, they were also included:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

However, variable names with “meanFreq()” were not selected as these are weighted average of the frequency component and not simple arithmetic mean. The resulting file contained 75 variables with 10299 observations. Mean was calculated for each individual and each activity for all the measurements in the second dataset. The resulting file contains 75 variables with 180 observations. 

Reformatting of the variable names 
-----------------------------------------------
To improve readability and to conform to naming conventions in data sciences, variable names were reformatted to remove any non-alpha numerical characters (e.g., parenthesis and dashes present in some of the variable names). In addition, “t” and “f” at the start of the variable names were replaced with “time” and “frequency” to indicate the full names. In addition, an apparent human error in naming  (“bodybody”) was corrected. 

Variables present in tidy data set
--------------------------------------------------
subject: individuals participated in the study denoted by a number 

activitynames: activities the individuals performed

For the rest of variable names have different component and these component are described below:


Component of variable:   definition 	
--------------------------------------
time:	time the activity was performed

frequency: 	frequency component of Fast Fourier Transform data

acc:	data from accelerometer

gyro:	data from gyroscope 3-axial

body: 	the magnitude of these three-dimensional signals were calculated using the Euclidean norm 

gravity: 	gravity acceleration signals

jerk:	jerk signals derived from the body linear acceleration and angular velocity

body:	magnitude of these three-dimensional signals

x, y, z:	3-axial signals in the X, Y and Z direction

mean:	mean values

std: 	strandard deviation 

angle:	vectors obtained by averaging the signals in a signal window sample

for e.g, “timebodyaccmeanx” indicates mean of the time domain of the magnitude of the x-axis signal calculated using the Euclidean norm.

All the variables:
--------------------------------
subject

activitynames

timebodyaccmeanx

timebodyaccmeany

timebodyaccmeanz

timegravityaccmeanx

timegravityaccmeany

timegravityaccmeanz

timebodyaccjerkmeanx

timebodyaccjerkmeany

timebodyaccjerkmeanz

timebodygyromeanx

timebodygyromeany

timebodygyromeanz

timebodygyrojerkmeanx

timebodygyrojerkmeany

timebodygyrojerkmeanz

timebodyaccmagmean

timegravityaccmagmean

timebodyaccjerkmagmean

timebodygyromagmean

timebodygyrojerkmagmean

frequencybodyaccmeanx

frequencybodyaccmeany

frequencybodyaccmeanz

frequencybodyaccjerkmeanx

frequencybodyaccjerkmeany

frequencybodyaccjerkmeanz

frequencybodygyromeanx

frequencybodygyromeany

frequencybodygyromeanz

frequencybodyaccmagmean

frequencybodyaccjerkmagmean

frequencybodygyromagmean

frequencybodygyrojerkmagmean

timebodyaccstdx

timebodyaccstdy

timebodyaccstdz

timegravityaccstdx

timegravityaccstdy

timegravityaccstdz

timebodyaccjerkstdx

timebodyaccjerkstdy

timebodyaccjerkstdz

timebodygyrostdx

timebodygyrostdy

timebodygyrostdz

timebodygyrojerkstdx

timebodygyrojerkstdy

timebodygyrojerkstdz

timebodyaccmagstd

timegravityaccmagstd

timebodyaccjerkmagstd

timebodygyromagstd

timebodygyrojerkmagstd

frequencybodyaccstdx

frequencybodyaccstdy

frequencybodyaccstdz

frequencybodyaccjerkstdx

frequencybodyaccjerkstdy

frequencybodyaccjerkstdz

frequencybodygyrostdx

frequencybodygyrostdy

frequencybodygyrostdz

frequencybodyaccmagstd

frequencybodyaccjerkmagstd

frequencybodygyromagstd

frequencybodygyrojerkmagstd

angletbodyaccmeangravity

angletbodyaccjerkmeangravitymean

angletbodygyromeangravitymean

angletbodygyrojerkmeangravitymean

anglexgravitymean

angleygravitymean

anglezgravitymean



