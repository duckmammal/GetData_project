# You should create one R script called run_analysis.R that does 
# the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data 
# set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and 
# each subject.

# Note to grader: I've done 1-3 in a bit of a mixed order. 
# In so doing, I hoped to only load the smallest necessary
# data frames, saving memory.

require(dplyr)

# find rows discussing mean and std
feats<- read.table("features.txt")
feats<- feats[with(feats, grepl("std", V2) | grepl("mean", V2)),]
rownames(feats) <- NULL

# activity labels
actLab <- read.table('activity_labels.txt')
actLab[,2] <- as.factor(actLab[,2])

# get training data
trainSet <- read.table('train/X_train.txt')
trainLab <- read.table('train/y_train.txt')
trainSub <- read.table('train/subject_train.txt')
trainLab <- sapply(trainLab, function(x) actLab[x,2])

# get test data
testSet <- read.table('test/X_test.txt')
testLab <- read.table('test/y_test.txt')
testSub <- read.table('test/subject_test.txt')
testLab <- sapply(testLab, function(x) actLab[x,2] )

# combine training data
trainSet <- trainSet %>% select(feats$V1)
train <- cbind(trainLab,trainSub,trainSet)

# combine test data
testSet <- testSet %>% select(feats$V1)
test<- cbind(testLab,testSub,testSet)

# combine training and test data into one data frame
df <- rbind(train, test) %>% tbl_df()
colnames(df)<- c('Activity', 'SubID',feats$V2%>%as.character)
write.table(colnames(df), 'variables.txt', 
            row.names = FALSE, col.names = FALSE)

# Find the mean of every variable grouped by Activity and SubID
newdf <- df %>% group_by(Activity, SubID) %>% summarize_each(funs(mean))
write.table(newdf, "newdf.txt", row.names = FALSE)