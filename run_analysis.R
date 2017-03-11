analysis <- function(){

#== Read test files
test_sub <- read.table("subject_test.txt")
test_X <- read.table("X_test.txt")
test_Y <- read.table("y_test.txt")

#== Variables and observations
var <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

#== Building the test dataset, added variable - candidate and status
names(test_X) <- var[,2]
test<-cbind(test_Y, test_X)
test<-cbind(test_sub, test)
test <- cbind(test,rep("test",dim(test)[1]))
names(test)[c(1,2,dim(test)[2])] <- c("candidate","activity", "status")


#== Clearing space
remove(test_sub, test_X, test_Y)

#== Read train files
train_sub <- read.table("subject_train.txt")
train_X <- read.table("X_train.txt")
train_Y <- read.table("y_train.txt")

#== Building the train dataset, added variable - candidate and status
names(train_X) <- var[,2]
train<-cbind(train_Y, train_X)
train<-cbind(train_sub, train)
train <- cbind(train,rep("train",dim(train)[1]))
names(train)[c(1,2,dim(train)[2])] <- c("candidate","activity", "status")

#== Combining test and train
Total <- group_by(rbind(test,train), candidate)

#== Extracting mean and St. deviation col
stat <- Total[,c(1:2,sort(c(grep(".mean().",names(Total)), grep(".std().",names(Total)))),dim(Total)[2])]

#== Making activity as a factor
stat$activity<- factor(stat$activity, levels=1:6,labels=as.character(activity[,2]))

#== Avg for each variable, each activity, each subject
summary <- summarize_each(group_by(stat, candidate,activity), funs(mean))
write.table(summary,file = "summary.txt")

}