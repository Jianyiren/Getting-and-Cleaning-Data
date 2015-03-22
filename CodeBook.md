---
title: "CodeBook"
author: "Jianyi"
date: "Sunday, March 22, 2015"
output: html_document
---

Here I listed all the main data frame that I have been using

**1.Merges the training and the test sets to create one data set**

**X**: a merged data frame for X training and testing data

**Y**: a merged data frame for Y training and testing data

**subject**:a merged data frame for corresponding subject in training and testing data set

**Data**: a combined data frame for everything which looks like

  1         2               2-563                   564
subject   activity     data from x_test/x_train    Type
  ... 
  

**2.Extracts only the measurements on the mean and standard deviation for each measurement**

**GoodCols**:columns that meet that requirement, that I wanna preserve from Data

**3.Uses descriptive activity names to name the activities in the data set. Details see code.**

Details see please see code notations.

**4.Appropriately labels the data set with descriptive variable names. **

Details see please see code notations.

**5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

**NewData**(4 columns)
 Columns: 
 subject    | Activity | variable                       | value
 
 
**Result**(30 subject x 6 activities = 180 rows)

 Columns:
 subject | Activity  | time_BodyAccelerator.mean...X | time_BodyAccelerator.mean...Y	...
 