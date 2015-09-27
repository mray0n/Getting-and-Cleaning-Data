# Getting-and-Cleaning-Data
Assignment for Getting and Cleaning Data of Coursera Data Science Specialization

## Script to get the data

  
  ### 1.- load y_train; y_test; X_train, X_test subject_train, subject_test 
  ### bind the test data and the train data on X, y and subject
  ### To Name the variables in  the data load the names in feature.txt
  ### and assign via colnames and traspond to the merge test_train data
  ### extract only the data relative to mean and Standard deviation on the data set
  ### On the features names this is equivalent to all the columns in whcih name 
  ### either the word mean or std appear. Use grep "mean|std" to do so
  ## On the other hand, to the y_total file, assign names to the activities with ifelse
  ### 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
  ### drop the variable that indicates the activities with the numerical code
  ### Finnally attach together all the data frames:
  ### X_tidy is the df containing the means and standard deviation with the activities names
  ### correspond to step 4 of assignment
  ### and last, to get to step 5, use the data.table package an lapply to get the data sorted
  ### by subject and activity name, assigning the mean of all variables
  
## CODE BOOK:
"Subject_number" : Indicates the subject on which the measure was take. Numbers form 1 to 30
(30 subjects)
"activity_names" : The activity the subject performed. Numbers form 1 to 6 meanins:
1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
"tBodyAcc-mean()-X" mean of the acc of the body x axis
"tBodyAcc-mean()-Y" mean of the acc of the body y axis
"tBodyAcc-mean()-Z" mean of the acc of the body z axis
"tBodyAcc-std()-X" standard deviation of the acc of the body x axis
"tBodyAcc-std()-Y" standard deviation of the acc of the body y axis
"tBodyAcc-std()-Z" standard deviation of the acc of the body z axis
"tGravityAcc-mean()-X" mean of the gravity acc of the body x axis 
"tGravityAcc-mean()-Y" mean of the gravity acc of the body y axis
"tGravityAcc-mean()-Z" mean of the gravity acc of the body z axis
"tGravityAcc-std()-X" standard deviation of the gravity acc of the body x axis
"tGravityAcc-std()-Y" standard deviation of the gravity acc of the body y axis
"tGravityAcc-std()-Z" standard deviation of the gravity acc of the body z axis
"tBodyAccJerk-mean()-X" mean of the jerk acc of the body x axis
"tBodyAccJerk-mean()-Y" mean of the jerk acc of the body y axis
"tBodyAccJerk-mean()-Z" mean of the jerk acc of the body z axis
"tBodyAccJerk-std()-X" standard deviation of the jerk acc of the body x axis
"tBodyAccJerk-std()-Y" standard deviation of the jerk acc of the body y axis
"tBodyAccJerk-std()-Z" standard deviation of the jerk acc of the body z axis
"tBodyGyro-mean()-X" mean of the gyroscope  of the body x axis
"tBodyGyro-mean()-Y" mean of the gyroscope  of the body y axis
"tBodyGyro-mean()-Z" mean of the gyroscope  of the body z axis
"tBodyGyro-std()-X" standard deviation of the gyroscope  of the body x axis
"tBodyGyro-std()-Y" standard deviation of the gyroscope  of the body y axis
"tBodyGyro-std()-Z" standard deviation of the gyroscope  of the body z axis
"tBodyGyroJerk-mean()-X" mean of the gyroscope  jerk of the body x axis
"tBodyGyroJerk-mean()-Y" mean of the gyroscope  jerk of the body y axis
"tBodyGyroJerk-mean()-Z" mean of the gyroscope  jerk of the body z axis
"tBodyGyroJerk-std()-X" standard deviation of the gyroscope  jerk of the body x axis
"tBodyGyroJerk-std()-Y" standard deviation of the gyroscope  jerk of the body y axis
"tBodyGyroJerk-std()-Z" standard deviation of the gyroscope  jerk of the body z axis
"tBodyAccMag-mean()" mean of the magnitude of the signal 
"tBodyAccMag-std()" Standard deviation of the magnitude of the signal
"tGravityAccMag-mean()" mean of the magnitude of the gravity
"tGravityAccMag-std()" standard deviation of the magnitude of the gravity
"tBodyAccJerkMag-mean()"  mean of the magnitude of the jerk
"tBodyAccJerkMag-std()" standard deviation of the magnitude of the jerk
"tBodyGyroMag-mean()"  mean of the magnitude of the gyrosppcope
"tBodyGyroMag-std()" standard deviation of the magnitude gyrosppcope
"tBodyGyroJerkMag-mean()"  mean of the magnitude of the gyrosppcope jerk
"tBodyGyroJerkMag-std()" standard deviation of the magnitude gyrosppcope jerk
"fBodyAcc-mean()-X" FFT mean of the acc of the body x axis
"fBodyAcc-mean()-Y" FFT mean of the acc of the body y axis
"fBodyAcc-mean()-Z" FFT mean of the acc of the body z axis
"fBodyAcc-std()-X" FFT standard deviation of the acc of the body x axis
"fBodyAcc-std()-Y" FFT standard deviation of the acc of the body y axis
"fBodyAcc-std()-Z" FFT standard deviation of the acc of the body z axis
"fBodyAcc-meanFreq()-X" FFT mean of the frequency of the body x axis
"fBodyAcc-meanFreq()-Y"  FFT mean of the frequency of the body y axis
"fBodyAcc-meanFreq()-Z"  FFT mean of the frequency of the body z axis
"fBodyAccJerk-mean()-X" FFT  mean of the jerk acc of the body x axis
"fBodyAccJerk-mean()-Y" FFT mean of the jerk acc of the body y axis
"fBodyAccJerk-mean()-Z" FFT mean of the jerk acc of the body z axis
"fBodyAccJerk-std()-X" FFT standard deviation of the jerk acc of the body x axis
"fBodyAccJerk-std()-Y" FFT standard deviation of the jerk acc of the body y axis
"fBodyAccJerk-std()-Z" standard deviation of the jerk acc of the body z axis
"fBodyAccJerk-meanFreq()-X"
"fBodyAccJerk-meanFreq()-Y"
"fBodyAccJerk-meanFreq()-Z"
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
"fBodyGyro-meanFreq()-X"
"fBodyGyro-meanFreq()-Y"
"fBodyGyro-meanFreq()-Z"
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
"fBodyAccMag-meanFreq()"
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
"fBodyBodyAccJerkMag-meanFreq()"
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
"fBodyBodyGyroMag-meanFreq()"
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"
"fBodyBodyGyroJerkMag-meanFreq()"
