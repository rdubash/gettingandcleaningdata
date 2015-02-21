# CodeBook for the Getting and Cleaning Data Course Project

## Raw data for this project
The raw data, per the README.txt, was collected for this project from the Human Activity Recognition Using Smartphones Project - Data set 1.
It was collected by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.

## What is the raw data? (From README.txt)
Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person  performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the 
volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which 
has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The data set includes:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

For more information about this dataset contact: activityrecognition@smartlab.ws

## Processing/Transforming the Raw Data Set to produce the Tidy Data Set
For reproduction purposes simply set the working directory in R concole and then source the run_analysis.R script.

The following describes the actual data transformation that happens within run_analysis.R script:

For the purposes of this project data from the folder Inertial Signals was not read and/or processed.

Steps for Transforming the data (as found in run_analysis.R):
1. Set working directory to the UCIHAR Dataset folder (done through menu in R-console)
2. Source the various libraries
3. Read the various data sets using the read.table function - activity labels, features, subject test, x test, y test, subject train, x train and y train. In all 8 data files are read.
4. Merge the train and test data sets for subject, X and Y. This fulfills requirement 1 from project description
5. Label the activity and subject columns with appropriate labels for processing
6. Subset the data to only Mean and Standard Deviation variables (columns) using the grepl function. This fulfills requirement 2 from project description
7. Change the activity column to their description from the numeric values using the merge function. This fulfills requirement 3 from the project description
8. Change the variable names to more descriptive/friendly names. This fulfills requirement 4 from project description
9. Generate a new data set that has the means of the variables grouped by Activity and Subject. This fulfills requirement 5 from project description. Remove the y actvity numeric columnsince we have the activity descriptions.
10. Write the data set generated in step 8 to a file - new_xysub_test_train_avgstd.txt in the UCIHAR Dataset folder.

## Variables in output file
1. activity - it is one of the 6 activities (e.g. WALKING, WALKING UPSTAIRS, LAYING, etc.)
2. subject - the subject of the record
3. Means of the Mean and Std. Deviation columns - the rest of the columns are the means of the subsettted mean and stanrdad deviation columns.
4. For this data set the output has 180 rows (6 activities times 30 subjects) and 81 columns (including activity, subjects, mean of means and mean of std. deviations)
