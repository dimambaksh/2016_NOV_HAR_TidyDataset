## Introduction
This file describes the variables, the data, and any transformations or work that you performed to clean up the data.

## Variables and Transformations
*datsetfilename
- the source file for the data set that will be cleaned and transformed

*datadirectory
- the directory where the files will be extracted and the final tidy data set created

*zipfiledirectorynames
- this is a data frame that contains the file directories in the data zip file
- the file directories for the input data is extracted from the data frame

*featurestable_desc
- this is a character vector with the column names of the data set
- the column names are made more "friendly" as follows:t = time, f = frequency, Acc = Accelerometer, Gyr = Gyroscope, Mag = Magnitude, BodyBody = Body

*..._set_table_subset
- the train and test data sets that have the required columns with std and mean are extracted into these variables

*setWithActivityNames
- this data set contains the merged train and test data
- the data set is merged with the activity table by activity which results in the activitydescription column
- the activity (index for activity description) is removed from the data set using a select statement

*finaldataset
- the "setWithActivityNames" is summarized using the aggregate function to calculate the mean of the values by subject and activity description
- the data set is then orderd by subject and activity description

## Data
*                                        subject
*                            activitydescription
*                 timeBodyAccelerometer-mean()-X
*                 timeBodyAccelerometer-mean()-Y
*                 timeBodyAccelerometer-mean()-Z
*                  timeBodyAccelerometer-std()-X
*                  timeBodyAccelerometer-std()-Y
*                  timeBodyAccelerometer-std()-Z
*              timeGravityAccelerometer-mean()-X
*              timeGravityAccelerometer-mean()-Y
*              timeGravityAccelerometer-mean()-Z
*               timeGravityAccelerometer-std()-X
*               timeGravityAccelerometer-std()-Y
*               timeGravityAccelerometer-std()-Z
*             timeBodyAccelerometerJerk-mean()-X
*             timeBodyAccelerometerJerk-mean()-Y
*             timeBodyAccelerometerJerk-mean()-Z
*              timeBodyAccelerometerJerk-std()-X
*              timeBodyAccelerometerJerk-std()-Y
*              timeBodyAccelerometerJerk-std()-Z
*                     timeBodyGyroscope-mean()-X
*                     timeBodyGyroscope-mean()-Y
*                     timeBodyGyroscope-mean()-Z
*                      timeBodyGyroscope-std()-X
*                      timeBodyGyroscope-std()-Y
*                      timeBodyGyroscope-std()-Z
*                 timeBodyGyroscopeJerk-mean()-X
*                 timeBodyGyroscopeJerk-mean()-Y
*                 timeBodyGyroscopeJerk-mean()-Z
*                  timeBodyGyroscopeJerk-std()-X
*                  timeBodyGyroscopeJerk-std()-Y
*                  timeBodyGyroscopeJerk-std()-Z
*          timeBodyAccelerometerMagnitude-mean()
*           timeBodyAccelerometerMagnitude-std()
*       timeGravityAccelerometerMagnitude-mean()
*        timeGravityAccelerometerMagnitude-std()
*      timeBodyAccelerometerJerkMagnitude-mean()
*       timeBodyAccelerometerJerkMagnitude-std()
*              timeBodyGyroscopeMagnitude-mean()
*               timeBodyGyroscopeMagnitude-std()
*          timeBodyGyroscopeJerkMagnitude-mean()
*           timeBodyGyroscopeJerkMagnitude-std()
*            frequencyBodyAccelerometer-mean()-X
*            frequencyBodyAccelerometer-mean()-Y
*            frequencyBodyAccelerometer-mean()-Z
*             frequencyBodyAccelerometer-std()-X
*             frequencyBodyAccelerometer-std()-Y
*             frequencyBodyAccelerometer-std()-Z
*        frequencyBodyAccelerometerJerk-mean()-X
*        frequencyBodyAccelerometerJerk-mean()-Y
*        frequencyBodyAccelerometerJerk-mean()-Z
*         frequencyBodyAccelerometerJerk-std()-X
*         frequencyBodyAccelerometerJerk-std()-Y
*         frequencyBodyAccelerometerJerk-std()-Z
*                frequencyBodyGyroscope-mean()-X
*                frequencyBodyGyroscope-mean()-Y
*                frequencyBodyGyroscope-mean()-Z
*                 frequencyBodyGyroscope-std()-X
*                 frequencyBodyGyroscope-std()-Y
*                 frequencyBodyGyroscope-std()-Z
*     frequencyBodyAccelerometerMagnitude-mean()
*      frequencyBodyAccelerometerMagnitude-std()
* frequencyBodyAccelerometerJerkMagnitude-mean()
*  frequencyBodyAccelerometerJerkMagnitude-std()
*         frequencyBodyGyroscopeMagnitude-mean()
*          frequencyBodyGyroscopeMagnitude-std()
*     frequencyBodyGyroscopeJerkMagnitude-mean()
*      frequencyBodyGyroscopeJerkMagnitude-std()
