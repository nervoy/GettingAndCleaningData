generateDataSets <- function(sourceDir, outputDir) {
    # check if directories exist
    if (!dir.exists(sourceDir)) { 
        stop("Source directory does not exist")} 
    else if(!dir.exists(outputDir)) {
            stop("Ouput directory does not exist")
        }
        
    # in case if we need to set working directory: setwd("./Data Science Course/PA4/data")
    
    # getting test data set
    testSubjects <- read.table(paste0(sourceDir,"/data/test/subject_test.txt"))
    testActivities <- read.table(paste0(sourceDir,"/data/test/y_test.txt"))
    testSet <- read.table(paste0(sourceDir,"/data/test/X_test.txt"))
    
    # getting train data set
    trainSubjects <- read.table(paste0(sourceDir,"/data/train/subject_train.txt"))
    trainActivities <- read.table(paste0(sourceDir,"/data/train/y_train.txt"))
    trainSet <- read.table(paste0(sourceDir,"/data/train/X_train.txt"))
    
    # merging data sets
    subjects <- rbind(testSubjects, trainSubjects)
    activities <- rbind(testActivities, trainActivities)
    dataset <- rbind(testSet, trainSet)
    
    # merging and naming tables
    activityLabels <- read.table(paste0(sourceDir,"/data/activity_labels.txt"), 
                                    col.names = c("activity","activityName"))
    activities <- merge(activities, activityLabels, by.x = "V1", by.y = "activity")
    dataset <- cbind(dataset, subjects, activities)
    features <- read.table(paste0(sourceDir,"/data/features.txt"))
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
    
    # create files with datasets
    write.csv(subset, paste0(outputDir,"/subset.csv"))
    write.csv(averages, paste0(outputDir,"/averages.csv"))
}
