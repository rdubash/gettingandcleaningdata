# Getting and Cleansing Data Course Project

This is the README.md file for the Getting and Cleaning Data Course Project offered at Coursera by Johns Hopkins Univerity.

## Project Purpose - As Stated in the Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of  yes/no questions related to the project. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean 
up the data called CodeBook.md. You should also include a README.md in the repo with your scripts.


## Description - as stated in the Course Project
One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S 
smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Repository Contents
1. README.md - this README file
2. CodeBook.md - information about the data ingested and the output including the tranformation steps
3. run_analysis.R - the script that will transform the raw data into the expected tidy data set

## Steps for downloading, transforming and producing the output data
1. Download the data from the link mentioned above. The data is in a zip file named getdata-projuectfiles-UCIHAR Dataset.zip
2. Unzip the downloaded file. It will create a UCIHAR Dataset folder. 
2a. The folder contains test and train folders, and files - activity_labels.txt, features.txt, features_info.txt and README.txt files
2b. The test folder in turn contain a folder Intertial signal folder and files - subject_test.txt, X_test.txt and Y-test.txt
2c. The train folder contains files and folders similarly named as in 2b above except for that test is substituted by train
3. To run the run_analysis.R script do the following:
3a. Place the run_analysis.R script in the UCIHAr Data set folder
3c. Open R console
3d. Change working directory to the location of UCIHAR folder
3e. source("run_analysis.R")
3f. Upon successful execution the script will create a file named new_xysub_test_train_avgstd.txt 

The file created in step 3f above is the tidy data set as required by this project.

