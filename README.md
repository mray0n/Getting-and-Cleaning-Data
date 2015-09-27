# Getting-and-Cleaning-Data
Assignment for Getting and Cleaning Data of Coursera Data Science Specialization


## sacar la tabla X e Y
## sacar la primera columna y_train y_test
y_train<-read.table("y_train.txt")
y_test<-read.table("y_test.txt")
X_train<-read.table("X_train.txt")
X_test<-read.table("X_test.txt")
subject_test<-read.table("subject_test.txt")
subject_train<-read.table("subject_train.txt")

## juntar y_train y y_test y subject
y_total<-rbind(y_test,y_train)
X_total<-rbind(X_test,X_train)
subject_total<-rbind(subject_test,subject_train)
##Sacar las columnas:
features<-read.table("features.txt")
##nombrar las columnas de X_total y_total y subject number
colnames(X_total)<-t(features[,2])
colnames(y_total)<-"activity"
colnames(subject_total)<-"Subject_number"
## en el total me quedo con las que son mean y std
X_mean<-X_total[grep("mean|std",names(X_total))]
y_total["activity"]<-NULL
## en y_total creo las categorías 
## 1 WALKING 2 WALKING_UPSTAIRS 3 WALKING_DOWNSTAIRS 4 SITTING 5 STANDING 6 LAYING
y_total$activity_names<-ifelse(y_total$activity==1,"WALKING", ifelse (y_total$activity==2,"WALKING_UPSTAIRS",ifelse(y_total$activity==3, "WALKING_DOWNSTAIRS", ifelse(y_total$activity==4, "SITTING", ifelse(y_total$activity==5, "STANDING", ifelse(y_total$activity==6, "LAYING",NA))))))
## quito la columna que me sobra
y_total["activity"]<-NULL
## junto los df
X_tidy<-cbind(subject_total,y_total,X_mean)


## rearrange<-aggregate(X_tidy, list(subject_number=subject_number,activity_names=activity_names),mean)

library(data.table)
X_tidy_DT<-data.table(X_tidy)
variables <- tail( names(X_tidy_DT), -2)
X_data_rearrange<-X_tidy_DT[, lapply(.SD, mean), .SDcols=variables, by=list(Subject_number, activity_names)]
