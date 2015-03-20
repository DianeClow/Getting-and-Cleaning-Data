# Getting-and-Cleaning-Data
This repo will hold the data for the Course Project for the "Getting and Cleaning Data" class on Coursera.  This repo includes, and R script showing how the data was manipulated, a text file (csv) showing the final product, a README.md, and a code book.

======================================
Getting and Cleaning Data on Coursera March 2015
Version 1.0
======================================
Diane Clow

=====================================

This repo containes the necessary information to clean up the data from UCI's Machine Learning Reposatory (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  The inital dataset came wtih 28 text files.  For explinations of this data please refer to the README file avalable with the data at the link above.  The ones used in this analysis were:
- activity_lables.txt: Links the class labels with their activity name.
- features.txt: List of all features.
- test/subject_test.txt: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- test/X_test.txt: Test set.
- test/y_test.txt: Test labels.
- train/subject_test.text: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- train/X_train.txt: Training set.
- train/y_train.txt: Training labels.

====================================

In the run_analysis.R script a number of intermidiary data sets were created.  "data" is the combination of the test and training data with correct column and activity names.  "ReducedData" is the combined data set (data) reduced to just the columns that represent either the mean or standard deviation of a measurment.  "Summary" (which is also the final export) creates a table of 180 rows giving the average of each column combined by the subject and the activity.