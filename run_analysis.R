## You should create one R script called run_analysis.R that does the following.
##
## Duane Imambaksh - Nov 20th, 2016
##
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement.
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names.
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
## The submitted data set is tidy.
## The Github repo contains the required scripts.
## GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, 
## along with units, and any other relevant information.
## The README that explains the analysis files is clear and understandable.
## The work submitted for this project is the work of the student who submitted it.

## Load libraries that will be required for code
require(reshape2)
require(plyr)
require(dplyr)

## Define data directory and dataset filename
datsetfilename <- "./data/dataset.zip"
datadirectory <- "./data"

## Check to see if data directory exists, if not create the data directory
if (!file.exists(datadirectory)){dir.create(datadirectory)}

## Define the URL that contains the dataset to be used for the script
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

## If the dataset zip file has already been downloaded, do not download it again
if (!file.exists(datsetfilename)){
  download.file(fileURL, destfile = datsetfilename, method = "auto")
}

## Unzip the dataset zip file into the data directory and overwrite any previous files that may exist
unzip(datsetfilename, exdir=datadirectory, overwrite = TRUE)

## extract the directory paths into a data frame that can be used to build the path to the data files
zipfiledirectorynames <- unzip(datsetfilename, exdir=datadirectory, list = TRUE)

## Load column names from features.txt and label the columns
featurestable <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*features.txt?",zipfiledirectorynames$Name),1], sep="/"))
colnames(featurestable) <- c("index","column")

## Create descriptive labels for the features columns
featurestable_desc <- featurestable[,2]
featurestable_desc <-gsub("^t", "time", featurestable_desc)
featurestable_desc <-gsub("^f", "frequency", featurestable_desc)
featurestable_desc <-gsub("Acc", "Accelerometer", featurestable_desc)
featurestable_desc <-gsub("Gyro", "Gyroscope", featurestable_desc)
featurestable_desc <-gsub("Mag", "Magnitude", featurestable_desc)
featurestable_desc <-gsub("BodyBody", "Body", featurestable_desc)

## Load the activity labels from activity_labels.txt and label the columns
activitylabelstable <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*activity_labels.txt?",zipfiledirectorynames$Name),1], sep="/"))
colnames(activitylabelstable) <- c("activity","activitydescription")
activitylabelstable$activitydescription <- as.character(activitylabelstable$activitydescription)

## Load X,y and subject train data and extract the mean and standard deviation columns
train_set_table <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*/train/X_*?",zipfiledirectorynames$Name),1], sep="/"))
train_labels_table <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*/train/y_*?",zipfiledirectorynames$Name),1], sep="/"))
train_subject_table <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*/train/subject_*?",zipfiledirectorynames$Name),1], sep="/"))
colnames(train_set_table) <- featurestable_desc
train_set_table_subset <- train_set_table[,grep("\\-mean\\(\\)|\\-std\\(\\)", featurestable_desc)]

## Load X,y and subject test data and extract the mean and standard deviation columns
test_set_table <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*/test/X_*?",zipfiledirectorynames$Name),1], sep="/"))
test_labels_table <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*/test/y_*?",zipfiledirectorynames$Name),1], sep="/"))
test_subject_table <- read.table(paste(datadirectory,zipfiledirectorynames[grep("*/test/subject_*?",zipfiledirectorynames$Name),1], sep="/"))
colnames(test_set_table) <- featurestable_desc
test_set_table_subset <- test_set_table[,grep("\\-mean\\(\\)|\\-std\\(\\)", featurestable_desc)]

## Join the train and test subject data, label the column names descriptively
traintest_subject <- rbind(train_subject_table, test_subject_table)
traintest_labels <- rbind(train_labels_table, test_labels_table)
colnames(traintest_subject) <- c("subject")
colnames(traintest_labels) <- c("activity")

## Join the train and test features data using the subset of columns with mean and stdev
traintest_features <- rbind(train_set_table_subset, test_set_table_subset)

## Join subject, activity and features data sets
subjectlabels <- cbind(traintest_subject, tcraintest_labels)
featuressubjectlabels <- cbind(traintest_features, subjectlabels) #Merged data set of train and test data

## Replace activity ID with activity labels
setWithActivityNames <- merge(featuressubjectlabels, activitylabelstable, by="activity", all.x=TRUE)

## Remove the activityID leaving only the column with activity description
setWithActivityNames <- select(setWithActivityNames,-(activity))

## Create final data set with the average for each feature by subject and activity description
finaldataset<-aggregate(. ~subject + activitydescription, setWithActivityNames, mean)
finaldataset<-finaldataset[order(finaldataset$subject,finaldataset$activitydescription),]

## Output tidy data set (finaldataset.txt) to the data directory
write.table(finaldataset, file = paste(datadirectory, "finaldataset.txt",sep = "/"),row.name=FALSE)
