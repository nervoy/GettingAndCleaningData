# Readme
These data sets (subset.csv and averages.csv) are based on the data from this project:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data themselves are taken from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The repo contains the script which can be used to regenreate the data sets (subset.csv and averages.csv) from the initial data. To do it,
1) copy and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your computer.

2) create a destination folder where you want the generated data sets to be created.

3) source the script file run_analysis.R from this repo and run a function called "generateDataSets" with the source directory (where you unzipped the files and directories from the archive) and the destination directory as parameters. For example, generateDataSets("./Data Science Course/PA4","./Data Science Course/Assignment4").

4) Find your data sets in the destination folder.

A description of the data resulting data sets can be found in the CodeBook.md file in this repo.
