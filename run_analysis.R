#This is the course Project code for 'Getting and Cleaning Data' on coursera

install.packages("dplyr")
install.packages("reshape2")
library(dplyr)
library("reshape2")

#1.Merges the training and the test sets to create one data set.

##  1         2               2-563             564
##subject   activity    x_test/x_train data     Type
##

#Load raw data

#prepare column 3-564
X_test=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE)
X_test=mutate(X_test,type="test")#append info of data type(test) in last column
X_train=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE)
X_train=mutate(X_train,type="train")#append info of data type(train) in last column
X=rbind(X_test,X_train)
 
 

feature=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/features.txt")#extract row names
names(X)=feature$V2

#prepare column 2
Y_test=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/test/Y_test.txt")
Y_train=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/train/Y_train.txt")
Y=rbind(Y_test,Y_train)

#prepare column 1
subject_test=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
subject_train=read.table("C:/Users/Jianyi/Documents/DS3/UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
subject=rbind(subject_test,subject_train)

#Join subject, activity, and measurements
Data=data.frame(cbind(subject,Y,X))
#fix row names
names(Data)[1]="subject"
names(Data)[2]="Activity"
names(Data)[564]="Type"


#2.Extracts only the measurements on the mean and standard deviation for each measurement. 
GoodCols=grep("mean|std", feature$V2)#extract mean/std related terms
GoodCols=GoodCols+2#considering we add two columns in front
GoodCols=c(1,2,GoodCols, 564)#we also don't wanna lose the first two columns and last column
Data=Data[,GoodCols]

#3.Uses descriptive activity names to name the activities in the data set
#i create Data2, a copy of Data to demonstrate data manipulation capability, and preserved the original Data file
 
Data[which(Data$Activity==1),2]="WALKING"
Data[which(Data$Activity==2),2]="WALKING_UPSTAIRS"
Data[which(Data$Activity==3),2]="WALKING_DOWNSTAIRS"
Data[which(Data$Activity==4),2]="SITTING"
Data[which(Data$Activity==5),2]="STANDING"
Data[which(Data$Activity==6),2]="LAYING"

#4.Appropriately labels the data set with descriptive variable names. 

#Have a peep first
names(Data)

#will do the following substitute
# Acc->Accelerator
# Gyro->Gyroscope
# Mag->Magnitude

# t->time_
# f->frequency_

names(Data)=gsub("Acc","Accelerator",names(Data))
names(Data)=gsub("Gyro","Gyroscope",names(Data))
names(Data)=gsub("Mag","Magnitude",names(Data))
names(Data)=gsub("^t","time_",names(Data))
names(Data)=gsub("^f","frequency_",names(Data))


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#-NewData
#subject     Activity      variable                          value
#  2        STANDING    	time_BodyAccelerator.mean...X	    0.2571778   
#...
NewData=melt(Data, id.vars=c("subject","Activity"))
NewData$value=as.numeric(NewData$value)

# build final data frame, called "Result"
#-Result
#subject  Activity     time_BodyAccelerator.mean...X	    time_BodyAccelerator.mean...Y	...
#  1	   LAYING                  	0.2215982	              -0.040513953

Result=dcast(NewData,subject+Activity~variable,mean)
write.table(Result,"TidyData.txt",row.names = FALSE)
