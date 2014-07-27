# Simplified Tidy HAR Dataset Code Book

## Transformation

We loaded and transformed data from "UCI HAR Dataset"

These are steps of transformation we made:

1. At first, we loaded feature names, and selected only those names, that deal with mean and standard deviation values. These names were transformed to comply R naming rules: parenthesis were removed, dash symbols '-' transformed to underscore '_', commas transformed to dots.

2. The source feature variables, subject and activity identifiers were loaded from test and train sets. Then feature variables columns were subsetted by variable names selected in step 1. For test and train set there were data frame combined from subject identifier, activity inentifier and corresponding selected feature variables.

3. Test and train sets were combined into single full data set. Activity identifiers were transformed into factor with level names from activity lables data set. The full data set was reordered by subject identifier to speed up further processing.

4. The resulting data set was made from single full data set by aggregating it, grouping by activity and subject with mean function. It was written to txt file.

Resulting data set consists of 88 variables. The data variables contains experimental feature variables data averaged for each activity and each subject.

## Variables

### Grouping columns

* Activity
  * Label of subject activity. One of the following names: 
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING
* Subject
  * Identifier of the subject who carried out the experiment.


### Time domain values

#### Body acceleration

Axial means:

* tBodyAcc_mean_X
* tBodyAcc_mean_Y
* tBodyAcc_mean_Z

Axial standard deviations:

* tBodyAcc_std_X
* tBodyAcc_std_Y
* tBodyAcc_std_Z

#### Gravity acceleration

Axial means:

* tGravityAcc_mean_X
* tGravityAcc_mean_Y
* tGravityAcc_mean_Z

Axial standsrd deviations:

* tGravityAcc_std_X
* tGravityAcc_std_Y
* tGravityAcc_std_Z

#### Body acceleration jerk (derivative)

Axial means:

* tBodyAccJerk_mean_X
* tBodyAccJerk_mean_Y
* tBodyAccJerk_mean_Z

Axial standard deviations:

* tBodyAccJerk_std_X
* tBodyAccJerk_std_Y
* tBodyAccJerk_std_Z

#### Body angular velocity

Axial means:

* tBodyGyro_mean_X
* tBodyGyro_mean_Y
* tBodyGyro_mean_Z

Axial standard deviations:

* tBodyGyro_std_X
* tBodyGyro_std_Y
* tBodyGyro_std_Z

#### Body angular velocity jerk (derivative)

Axial means:

* tBodyGyroJerk_mean_X
* tBodyGyroJerk_mean_Y
* tBodyGyroJerk_mean_Z

Axial standard deviations:

* tBodyGyroJerk_std_X
* tBodyGyroJerk_std_Y
* tBodyGyroJerk_std_Z

#### Magnitude values

* tBodyAccMag_mean
  * Body acceleration magnitude mean
* tBodyAccMag_std
  * Body acceleration magnitude standard deviation
* tGravityAccMag_mean
  * Gravity acceleration magnitude mean
* tGravityAccMag_std
  * Gravity acceleration magnitude standard deviation
* tBodyAccJerkMag_mean
  * Body acceleration jerk magnitude mean
* tBodyAccJerkMag_std
  * Body acceleration jerk magnitude standard deviation
* tBodyGyroMag_mean
  * Angular velocity magnitude mean
* tBodyGyroMag_std
  * Angular velocity magnitude standard deviation
* tBodyGyroJerkMag_mean
  * Angular velocity jerk magnitude mean
* tBodyGyroJerkMag_std
  * Angular velocity jerk magnitude standard deviation
  
### Frequency domain values

#### Body acceleration

Axial means:

* fBodyAcc_mean_X
* fBodyAcc_mean_Y
* fBodyAcc_mean_Z

Axial standard deviations:

* fBodyAcc_std_X
* fBodyAcc_std_Y
* fBodyAcc_std_Z

Axial frequency means: 

* fBodyAcc_meanFreq_X
* fBodyAcc_meanFreq_Y
* fBodyAcc_meanFreq_Z

#### Body acceleration jerk (derivative)

Axial means:

* fBodyAccJerk_mean_X
* fBodyAccJerk_mean_Y
* fBodyAccJerk_mean_Z

Axial standard deviations:

* fBodyAccJerk_std_X
* fBodyAccJerk_std_Y
* fBodyAccJerk_std_Z

Axial frequency means: 

* fBodyAccJerk_meanFreq_X
* fBodyAccJerk_meanFreq_Y
* fBodyAccJerk_meanFreq_Z

#### Angular velocity

Axial means:

* fBodyGyro_mean_X
* fBodyGyro_mean_Y
* fBodyGyro_mean_Z

Axial standard deviations:

* fBodyGyro_std_X
* fBodyGyro_std_Y
* fBodyGyro_std_Z

Axial frequency means:

* fBodyGyro_meanFreq_X
* fBodyGyro_meanFreq_Y
* fBodyGyro_meanFreq_Z

#### Magnitude values

* fBodyAccMag_mean
  * Body acceleration magnitude mean
* fBodyAccMag_std
  * Body acceleration magnitude standard deviation
* fBodyAccMag_meanFreq
  * Body acceleration magnitude frequency mean
* fBodyBodyAccJerkMag_mean
  * Body acceleration jerk magnitude mean
* fBodyBodyAccJerkMag_std
  * Body acceleration jerk magnitude standard deviation
* fBodyBodyAccJerkMag_meanFreq
  * Body acceleration jerk magnitude frequency mean
* fBodyBodyGyroMag_mean
  * Angular velocity magnitude mean
* fBodyBodyGyroMag_std
  * Angular velocity magnitude standard deviation
* fBodyBodyGyroMag_meanFreq
  * Angular velocity magnitude frequency mean
* fBodyBodyGyroJerkMag_mean
  * Angular velocity jerk magnitude mean
* fBodyBodyGyroJerkMag_std
  * Angular velocity jerk magnitude standard deviation
* fBodyBodyGyroJerkMag_meanFreq
  * Angular velocity jerk magnitude frequency mean
  
### Angle values

* angle_tBodyAccMean.gravity
  * Angle between mean body acceleration and gravity mean
* angle_tBodyAccJerkMean.gravityMean
  * Angle between mean body acceleration jerk and gravity mean
* angle_tBodyGyroMean.gravityMean
  * Angle between mean anglular velocity and gravity mean
* angle_tBodyGyroJerkMean.gravityMean
  * Angle between mean anglular velocity jerk and gravity mean
* angle_X.gravityMean
  * Angle between X axis and gravity mean
* angle_Y.gravityMean
  * Angle between Y axis and gravity mean
* angle_Z.gravityMean
  * Angle between Z axis and gravity mean
