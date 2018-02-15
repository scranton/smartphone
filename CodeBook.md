
There are 2 data sets created by the ``run_analysis.R`` script. The ``df_merge`` ``data.frame`` includes all of the following measuerments for 30 participants in 6. The ``df_average`` ``data.frame`` includes an average (mean) for each of the measurements by activity by subject.

## Variables
* **subjectId** - subject identifer factor for the 30 participants in this expereiment
* **activity** - factor indicating one of 6 states the participant was in during mearsurments
    * ``WALKING``
    * ``WALKING_UPSTAIRS``
    * ``WALKING_DOWNSTAIRS``
    * ``SITTING``
    * ``STANDING``
    * ``LAYING``

### Measurement Variables

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcceleration and timeGravityAcceleration) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccelerationJerk and timeBodyAngularVelocityJerk-XYZ).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequencyBodyAcceleration, frequencyBodyAccelerationJerk, and frequencyBodyAngularVelocity. (Note the prefix 'frequency' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'X' or 'Y' or 'Z' suffix is used to denote 3-axial signals in the X, Y and Z directions.

This dataset includes the Mean and Standard Deviation for each of the mearsurements taken along the 3 axis: X, Y, Z.

### Full List of Measurement Variables
* **timeBodyAccelerationMeanX**
* **timeBodyAccelerationMeanY**
* **timeBodyAccelerationMeanZ**
* **timeBodyAccelerationStandardDeviationX**
* **timeBodyAccelerationStandardDeviationY**
* **timeBodyAccelerationStandardDeviationZ**
* **timeGravityAccelerationMeanX**
* **timeGravityAccelerationMeanY**
* **timeGravityAccelerationMeanZ**
* **timeGravityAccelerationStandardDeviationX**
* **timeGravityAccelerationStandardDeviationY**
* **timeGravityAccelerationStandardDeviationZ**
* **timeBodyAccelerationJerkMeanX**
* **timeBodyAccelerationJerkMeanY**
* **timeBodyAccelerationJerkMeanZ**
* **timeBodyAccelerationJerkStandardDeviationX**
* **timeBodyAccelerationJerkStandardDeviationY**
* **timeBodyAccelerationJerkStandardDeviationZ**
* **timeBodyAngularVelocityMeanX**
* **timeBodyAngularVelocityMeanY**
* **timeBodyAngularVelocityMeanZ**
* **timeBodyAngularVelocityStandardDeviationX**
* **timeBodyAngularVelocityStandardDeviationY**
* **timeBodyAngularVelocityStandardDeviationZ**
* **timeBodyAngularVelocityJerkMeanX**
* **timeBodyAngularVelocityJerkMeanY**
* **timeBodyAngularVelocityJerkMeanZ**
* **timeBodyAngularVelocityJerkStandardDeviationX**
* **timeBodyAngularVelocityJerkStandardDeviationY**
* **timeBodyAngularVelocityJerkStandardDeviationZ**
* **frequencyBodyAccelerationMeanX**
* **frequencyBodyAccelerationMeanY**
* **frequencyBodyAccelerationMeanZ**
* **frequencyBodyAccelerationStandardDeviationX**
* **frequencyBodyAccelerationStandardDeviationY**
* **frequencyBodyAccelerationStandardDeviationZ**
* **frequencyBodyAccelerationJerkMeanX**
* **frequencyBodyAccelerationJerkMeanY**
* **frequencyBodyAccelerationJerkMeanZ**
* **frequencyBodyAccelerationJerkStandardDeviationX**
* **frequencyBodyAccelerationJerkStandardDeviationY**
* **frequencyBodyAccelerationJerkStandardDeviationZ**
* **frequencyBodyAngularVelocityMeanX**
* **frequencyBodyAngularVelocityMeanY**
* **frequencyBodyAngularVelocityMeanZ**
* **frequencyBodyAngularVelocityStandardDeviationX**
* **frequencyBodyAngularVelocityStandardDeviationY**
* **frequencyBodyAngularVelocityStandardDeviationZ**
