===========
# CodeBook
===========

==============
## Descrition
==============
This dataset is a subset from the:
Human Activity Recognition Using Smartphones Dataset Version 1.0.
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The description of the dataset can be found in the original dataset. A short version is cited here:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details." 


In this CodeBook the variables of the tidied dataset are described and the process to get the tidy dataset.

The description for the variables is the same, as described in the original dataset: 

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation"

The variable names in this datset are as follows, herer only listed for X, but also available for Y and Z:
"tBodyAcc_mean()_X"      "tGravityAcc_mean()_X"   "tBodyAccJerk_mean()_X"  "tBodyGyro_mean()_X"    
"tBodyGyroJerk_mean()_X" "fBodyAcc_mean()_X"      "fBodyAccJerk_mean()_X"  "fBodyGyro_mean()_X"    
"tBodyAcc_std()_X"       "tGravityAcc_std()_X"    "tBodyAccJerk_std()_X"   "tBodyGyro_std()_X"     
"tBodyGyroJerk_std()_X"  "fBodyAcc_std()_X"       "fBodyAccJerk_std()_X"   "fBodyGyro_std()_X"   
"tBodyAccMag_mean()"     "tGravityAccMag_mean()"  "tBodyAccJerkMag_mean()" "tBodyGyroMag_mean()"        
"tBodyGyroJerkMag_mean()"     "fBodyAccMag_mean()"          "fBodyBodyAccJerkMag_mean()" 
"fBodyBodyGyroMag_mean()"     "fBodyBodyGyroJerkMag_mean()" "tBodyAccMag_std()"          
"tGravityAccMag_std()"        "tBodyAccJerkMag_std()"       "tBodyGyroMag_std()"         
"tBodyGyroJerkMag_std()"      "fBodyAccMag_std()"           "fBodyBodyAccJerkMag_std()"  
"fBodyBodyGyroMag_std()"      "fBodyBodyGyroJerkMag_std()" 


=============
## Filtering
=============

5 steps are done to tidy up the data set.

1. Merge the training and the test sets to create one data set.

The files X_test and X_train are merged.
The files y_test and y_train are merged. 

2. Extract only the measurements on the mean and standard deviation 
   for each measurement

First the "-" is replaced by "_", because otherwise errors could occur in R.
There are three different types of means. The one mentioned with "mean()", 
the mean frequency (mentioned with meanFreq) and the additional vectors 
obtained by averaging the signals in a signal window sample. Only the first 
one is used, because only these variables seem to be a real mean.
So, measurements on the mean are extracted by filtering for "mean()".
The measurements on the standard deviation are extracted by filtering for "std".

3. Use descriptive activity names to name the activities in the data set.

The names in the activity_labels.txt file are used as descriptive activity names 
and added to the data in a separate column.

4. Appropriately label the data set with descriptive variable names.

The names in the features.txt file are used as descriptive variable names 
and added to the data in a separate column. The names are listed and explained above.

5. Creates a second, independent tidy data set with the average 
   of each variable for each activity and each subject.

The data are labeled by a binding of person and activity and sorted by person and 
activity.Then the mean for each activtiy per person is calculated. A dataset with 
30*6=180 rows and 66+2=68 columns. The rownames are a connections of person and activity
(person.activity).
The dataset is safed in a file called "tidy.dataset.txt".



