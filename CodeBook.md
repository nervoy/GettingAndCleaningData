# Code Book
This file contains a description of how the data sets (subset.csv and averages.csv) were generated and explains the content of the files.

## Transformation process
The original two datasets (test and training) are taken from here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
(Code Book for these data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### (subset.csv):
Then they are merged (concatenated) into one data set and only variables containing means and standard deviations are kept. For the sake of readability activity names are added to the data set rather than their codes and some variables names amended by changing "t" and "f" prefixes to "time-" and "freq-" (freqency). Other terms are quite understandable and their meaning can be found in the description of the orignal dataset.

### (averages.csv):
A new data set is created which contains averages of each variable for each activity and each subject.

## New columns definitions
Apart from ammending variables names by changing "t" to "time-" and "f" to "freq-" (see explanation above), only two named columns are added: "subject" and "activityName", which are the subject as refered in the original project and a descriptive name of each activity correspondingly.
