setwd("F:/Universidad/202001/Data Science ToolBox - Johns Hopkins/datasciencecoursera/datasciencecoursera/Getting and Cleaning Data/UCI HAR Dataset")
#Required Libraries.
library(dplyr)
library(stringr)
#Reading the different data sets needed to create the tidy file
train<-read.table("./train/X_train.txt") 
test<-read.table("./test/X_test.txt")
#Subjects ID
id_train<-read.table("./train/subject_train.txt")
id_test<-read.table("./test/subject_test.txt")
#Activity Labels
train_labels<-read.table("./train/Y_train.txt")
test_labels<-read.table("./test/Y_test.txt")
#To create the complete train and test data sets, the dataframes read earlier need to be join by columns
#The first column will have the ID of the individual, the second will have the activity that individual
#all the other columns will have information of the different measurements taken.
train<-cbind(id_train,train_labels,train)
test<-cbind(id_test,test_labels,test)
#Union of test and train datasets
#These union is made by rows. Each dataframe has information of a different set of individuals. 
experiment_dataset<-rbind(train,test)
#Filtering relevant information.
#Only the columns with mean() or std() are consider.
variable_information<-read.table("./features.txt")
columns<-c(1,2,grep("mean[^Freq]|std",variable_information[,2])+2)
experiment_dataset<-experiment_dataset[,columns]
#Some characters are removed in order to get just plain text form then names. 
columnNames<-c("ID","Activity",grep("mean[^Freq]|std",variable_information$V2,value=T))
columnNames<-gsub("-"," ",columnNames)
columnNames<-sub("\\()","",columnNames)
#The columns of the dataframe are renamed with the new names.
colnames(experiment_dataset)<-columnNames
#Each activity is relabeled .
experiment_dataset$Activity<-as.factor(experiment_dataset$Activity)
levels(experiment_dataset$Activity)<-list("Walking"=1,"Walking Upstairs"=2,
                                          "Walking Downstairs"=3, "Sitting"=4,"Standing"=5,"Laying"=6)
#The mean of the data is summarized by individual and activity. 
tidy_data<-experiment_dataset%>%group_by(ID,Activity)%>%summarise_all(mean)
#A .txt file is created with the new tidy dataframe,
write.table(tidy_data,file = "tidy_dataframe.txt",row.name = FALSE)


