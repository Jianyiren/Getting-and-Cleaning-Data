---
title: "CodeBook"
author: "Jianyi"
date: "Sunday, March 22, 2015"
output: html_document
---
Here I listed all the main data frame that I have been using

1.Merges the training and the test sets to create one data set

-Data

  1         2               2-563             564
subject   activity    x_test/x_train data     Type

#

2.Extracts only the measurements on the mean and standard deviation for each measurement
GoodCols:columns that meet that requirement, that I wanna preserve from Data

3.
N.A

4.
N.A

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


-NewData
 subject     Activity      variable                          value
 2           STANDING    	time_BodyAccelerator.mean...X	    0.2571778   
 ...
-Result
subject  Activity   	time_BodyAccelerator.mean...X	    time_BodyAccelerator.mean...Y	...
   1	      LAYING                  	0.2215982	              -0.040513953
 .....