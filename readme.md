## Introduction
The tidy dataset is created using only one script "run_analysis.R"
It is dependent on three libraries:
1. dplyr
2. plyr
3. reshape2

##Input Data
The script creates a data sub-directory off the main working directory and downloads the data file and extracts into the data directory.
Data file:"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

##Output Data
The final output file "finaldataset.txt" is created in the data sub-directory.
The finaldataset.txt is the tidy data set output from the run_analysis.R script.

##Variables
featurestable
featurestable_desc 
activitylabelstable
train_set_table
train_labels_table
train_subject_table
train_set_table_subset
test_set_table
test_labels_table
test_subject_table
test_set_table_subset

traintest_subject
traintest_labels
traintest_features
subjectlabels
featuressubjectlabels

setWithActivityNames
