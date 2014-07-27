# R-Script for cleaning up the
# Human Activity Recognition Using Smartphones Dataset Version 1.0.
# First set you working directory to the folder "UC HAR Dataset".

# 1. Merge the training and the test sets to create one data set.
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)

# 2. Extract only the measurements on the mean and standard deviation 
#    for each measurement

features <- read.table("features.txt")
features[,2] <- gsub("-", "_", features[,2])
X.cut <- X[,(grep("mean[()]", features[,2]))]
X.cut <- cbind(X.cut, X[,(grep("std", features[,2]))])

# 3. Use descriptive activity names to name the activities in the data set.

activity <- read.table("activity_labels.txt")

y.name <- y
colnames(y.name) <- "Activity"
pat <- activity[,1]
repl <- activity[,2]
for (i in 1:length(pat)) {
    y.name[y.name==as.character(pat[i])] <- as.character(repl[i]) 
    #y$name = as.character(gsub(pat[i], repl[i], y))
}

X.cut.named <- cbind(y.name, X.cut)

# 4. Appropriately label the data set with descriptive variable names.


colnames(X.cut.named) <- c("Activity", features[(grep("mean[()]", features[,2])),2],
                           features[(grep("std", features[,2])),2])

# 5. Creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.


X.cut.named <- cbind(person.activity=paste(c(subject_test[,1], subject_train[,1]), 
                                           X.cut.named$Activity, sep="."),
                     person=c(subject_test[,1], subject_train[,1]), X.cut.named)
X.cut.named.sort <- X.cut.named[order(X.cut.named$person),]
sum(is.na(X.cut.named.sort))

X.cut.tidy <- X.cut.named.sort[!duplicated(X.cut.named.sort$person.activity),c(2:3)]
for(i in c(4:69)){
colmeans <- tapply(X.cut.named.sort[,i], X.cut.named.sort[,1], mean)
X.cut.tidy <- cbind(X.cut.tidy, colmeans)
}

colnames(X.cut.tidy) <- colnames(X.cut.named.sort[2:69])
row.names(X.cut.tidy) <- X.cut.named.sort$person.activity[!duplicated(X.cut.named.sort$person.activity)]

write.table(X.cut.tidy, file="tidy.dataset.txt")