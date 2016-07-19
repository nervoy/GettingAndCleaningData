# in case if we need to set working directory: setwd("./Data Science Course/PA4/data")

# getting test data set
testSubjects <- read.table("./test/subject_test.txt")
testActivities <- read.table("./test/y_test.txt")
testSet <- read.table("./test/X_test.txt")

# getting train data set
trainSubjects <- read.table("./train/subject_train.txt")
trainActivities <- read.table("./train/y_train.txt")
trainSet <- read.table("./train/X_train.txt")

# merging data sets
subjects <- rbind(testSubjects, trainSubjects)
activities <- rbind(testActivities, trainActivities)
dataset <- rbind(testSet, trainSet)

# merging and naming tables
activityLabels <- read.table("./activity_labels.txt", col.names = c("activity","activityName"))
activities <- merge(activities, activityLabels, by.x = "V1", by.y = "activity")
dataset <- cbind(dataset, subjects, activities)
features <- read.table("./features.txt")
addFeatures <- data.frame(V1 = c(562,563, 564), V2 = c("subject","activity", "activityName"))
features <- rbind(features, addFeatures)
names(dataset) <- features[,2]

# subsetting mean and standard deviation
subset <- subset(dataset, select = c(grep("mean[(]|std[(]", names(dataset)), 562, 564))

# improving variables names readability
names(subset) <- sub("^t", "time-", names(subset))
names(subset) <- sub("^f", "freq-", names(subset))

# calculating means by activity and subject
averages <- aggregate(subset[,1:66], list(subject=subset[,"subject"], activityName=subset[,"activityName"]), mean)

