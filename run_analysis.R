  ## Script to get the different files form the WD and generate a tidy dataset
  ## and a rearranged table with the summary per subject an activity
  ## load y_train; y_test; X_train, X_test subject_train, subject_test 

y_train<-read.table("y_train.txt")
y_test<-read.table("y_test.txt")
X_train<-read.table("X_train.txt")
X_test<-read.table("X_test.txt")
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")


  ## bind the test data and the train data on X, y and subject

y_total<-rbind(y_test,y_train)
X_total<-rbind(X_test,X_train)
subject_total<-rbind(subject_test,subject_train)


  ##Name the variables in  the data. In order to do so, load the names in feature.txt
features<-read.table("features.txt")

  ##and assing the column names:
colnames(X_total)<-t(features[,2])
colnames(y_total)<-"activity"
colnames(subject_total)<-"Subject_number"

  ## extract only the data relative to mean and Standard deviation on the data set
  ## On the features names this is equivalent to all the columns in whcih name 
  ## either the word mean or std appear

X_mean<-X_total[grep("mean|std",names(X_total))]
y_total["activity"]<-NULL


  ## On the other hand, to the y_total file, assign names to the activities 
  ## 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING

y_total$activity_names<-ifelse(y_total$activity==1,"WALKING",
      ifelse (y_total$activity==2,"WALKING_UPSTAIRS",
      ifelse(y_total$activity==3, "WALKING_DOWNSTAIRS", 
      ifelse(y_total$activity==4, "SITTING", 
      ifelse(y_total$activity==5, "STANDING",
      ifelse(y_total$activity==6, "LAYING",NA))))))

  ## drop the variable that indicates the activities with the numerical code

y_total["activity"]<-NULL

  ## Finnally attach together all the data frames:
X_tidy<-cbind(subject_total,y_total,X_mean)
  ## X_tidy is the df containing the means and standard deviation with the activities names
  ## correspond to step 4 of assignment


  ## finnally to get to step 5, use the data.table package
  
library(data.table)
X_tidy_DT<-data.table(X_tidy)
variables <- tail( names(X_tidy_DT), -2)
X_data_rearrange<-X_tidy_DT[, lapply(.SD, mean), .SDcols=variables, by=list(Subject_number, activity_names)]
