library(dplyr)
colnames<-read.table("./UCI HAR Dataset/features.txt")[,2]
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",col.names = colnames)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt",col.names = "activitylabels")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",col.names = colnames)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt",col.names = "activitylabels")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = "Subject")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = "Subject")
test_total<-cbind(subject_test,y_test,X_test)
train_total<-cbind(subject_train,y_train,X_train)
data_set<-rbind(test_total,train_total)
colnames<-colnames(data_set)
col_index_selected<-grep("Subject|activitylabels|[Mm]ean|std",colnames)
data_set_mean_std<-data_set[,col_index_selected]
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
data_set_mean_std<-mutate(data_set_mean_std,activity=activity_labels[data_set_mean_std$activitylabels,2])
data_set_mean_std<-arrange(data_set_mean_std,Subject,activitylabels)
data_set_question5<-data_set_mean_std[0,]
for (i in 1:30) {
    for (j in 1:6) {
        target<-subset(subset(data_set_mean_std,Subject==i),activitylabels==j)[,1:88]
        data_set_question5<-rbind(data_set_question5,apply(target,2,mean))
    }
}
colnames(data_set_question5)<-colnames(data_set_mean_std)[1:88]
data_set_question5<-mutate(data_set_question5,activity=activity_labels[data_set_question5$activitylabels,2])
View(data_set_question5)
