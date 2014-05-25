library(stringr)
library(reshape2)
library(data.table)

############function to read files in the test and train data###########################
CombinedDataFrame <- function(file.directory, file.pattern){
  all.dfs <- lapply(file.path(file.directory, file.pattern), read.table)
  combined.df <- data.table(cbind.data.frame(all.dfs[1], all.dfs[3], all.dfs[2]))
}


test.dir <- "test" # this the directory containing test data
test.files <- list.files(test.dir, pattern="*_test.txt") # get list of files that contains "*_test.txt" in the file name 



test.combined.files <- CombinedDataFrame(test.dir, test.files) #this will read the "_test.txt files in the "test" directory and combine them

train.dir <- "train" # this the directory containing train data
train.files <- list.files(train.dir, pattern="*_train.txt")  # get list of files that contains "*_train.txt" in the file name 
train.combined.files <- CombinedDataFrame(train.dir, train.files) #this will combined the files in train directory

complete_set <- rbind(test.combined.files, train.combined.files) #combine train and test data

##############labeling the variable names#############################
features <- read.table("features.txt") # read "features.txt" file
mynames <- as.vector(features$V2) # take the varaible names
mynames <- c("subject", "activity", mynames) # add additional variable names
test_combined.df <- setnames(complete_set, mynames) # rename the columns 


head(test_combined.df)


#train.dfs <- lapply(file.path(train.dir, train_files), read.table)
#train_combined.df <- data.table(cbind.data.frame(train.dfs[1], train.dfs[3], train.dfs[2]))
#head(train_combined.df)
#train_combined.df <- setnames(train_combined.df, mynames)
#names(train_combined.df) <- NULL
#complete_set <- rbind(test_combined.df, train_combined.df)

#mean_std <- c("mean()", "std()")

#mynames <- features(features$V2))
###############extracting mean and std####################################
matches_mean <- features[grep("mean()", (as.character(features$V2)), fixed =TRUE), ] #get mean variables
angel <- features[grep("Mean", (as.character(features$V2)), fixed =TRUE),] # get mean of angle variables
matches_std <- features[agrep("std()", (as.character(features$V2)), fixed = TRUE) ,] # get standard deviations variables
mean_std <- as.character((rbind(matches_mean, matches_std, angel))$V2) #combined names of mean, mena angles and standard deviations to single vector
mean_std_df <- subset(complete_set, select=c("subject", "activity", mean_std)) #extract mean, mean of angles and standard deviations from the main dataset 

head(mean_std_df)

###############label the activities ####################################
activity_labels <- read.table("activity_labels.txt") # get activity labels
#activity_labels_dt <- data.table(activity_labels)
mean_std_df_actlabled <- merge.data.frame(mean_std_df, activity_labels, by.x="activity", by.y = "V1",
                                all =TRUE) # labelling the activities with activity labels 
########Function to make better column lables#################################

MakeBetterNames <- function(better_names)
{
  # Get rid of non-alphanumeric characters
  better_names <- str_replace_all(names(mean_std_df_actlabled),"[^[:alnum:]]","")
  # replace f with frequency
  better_names <- sub("^f", "frequency", better_names)
  # replace f with frequency
  better_names <- sub("^t", "time", better_names)
  #replace V2 with activitynames
  better_names <- sub("V2", "activitynames", better_names)
  #remove possible error in naming 
  better_names <- sub("BodyBody", "Body", better_names)
  #make letters lowercase 
  better_names <- tolower(better_names)
  return(better_names)
}

bettercolumnnames <- MakeBetterNames(names(mean_std_df_actlabled)) #make better column names 
mean_std_df_actlabled <- setnames(mean_std_df_actlabled, bettercolumnnames) #assign better column names to

##########getting average of each variable for each activity and each subject##################################

 

melt_data <- melt(mean_std_df_actlabled, id=c("subject", "activity", "activitynames")) # reform the table 

second_tidy <- dcast(melt_data, subject + activitynames ~ variable, fun.aggregate=mean) # get the average of the measured variables



write.table(second_tidy, file = "second_tidy.txt", append = FALSE, quote = FALSE, sep = "\t", 
            na = "NA", dec = ".", row.names = FALSE, col.names = TRUE) # wrtie the final tidy data set to the "second_tidy.txt" file

