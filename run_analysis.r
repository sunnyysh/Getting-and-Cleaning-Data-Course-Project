library(dplyr) #load dplyr lib
#file reading block for test
xtest <- read.table ("./test/X_test.txt") #data 
ytest <- read.table ("./test/y_test.txt") #activity info
subjecttest <- read.table ("./test/subject_test.txt") #subject info
testdata <-cbind(subjecttest,ytest,xtest) #make a file with col subject, activity and data
#file reading block for train
xtrain <- read.table ("./train/X_train.txt") #data 
ytrain <- read.table ("./train/y_train.txt") #activity info
subjecttrain <- read.table ("./train/subject_train.txt")
traindata <- cbind(subjecttrain,ytrain,xtrain) #make a file with col subject, activity and data
#create master file
Alldata <- rbind(testdata,traindata) #cobine testdata and traindata
features <- read.table("features.txt") #get feature list names
colnames(Alldata)[1] <- "subject" #set first colname as subject
colnames(Alldata)[2] <- "activity" #set second colname as activity
colnames(Alldata)[3:563]<- as.character(features[,2]) #set column 3:563 with names form feature list
#subset the master file using the featuers.txt as a guide to get all mean and std columns
Cleandata <- Alldata[,c(1:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]
#using gsub to turn activities into there corresponding char
Cleandata[,2] <-gsub(1,"WALKING",Cleandata[,2])
Cleandata[,2] <-gsub(2,"WALKING_UPSTAIRS",Cleandata[,2])
Cleandata[,2] <-gsub(3,"WALKING_DOWNSTAIRS",Cleandata[,2])
Cleandata[,2] <-gsub(4,"SITTING",Cleandata[,2])
Cleandata[,2] <-gsub(5,"STANDING",Cleandata[,2])
Cleandata[,2] <-gsub(6,"LAYING",Cleandata[,2])
#use dplyr pipeline to group data by subjecy then acaicity and summarise each of the features with their means
finaltable <- Cleandata %>% group_by(subject,activity) %>% summarise_each(funs(mean))
#output file
write.table(finaltable, "finaltable.txt",  row.name=FALSE)
