# Course project for the "Data Science - Getting and Cleaning Data" assignment 
#
# This script obtains, cleans and summarises data from Samsung Galaxy S smartphone accelerometers.
#
# This script needs the 'dplyr' and 'tidyr' packeges installed.
# The output of the script is a file "summarize.txt".


inputURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
inputfile <- "./data/UCI HAR Dataset.zip"
outputfile <- "./data/summary.txt"
directory <- "./data"


library(dplyr)
library(tidyr)

# Create data directory if necessary, check if file is present or else download from location
if (!file.exists(directory)) { dir.create("./data")}
if (!file.exists(inputfile)) {download.file(url= inputURL,destfile=inputfile)
                              unzip("./data/UCI HAR Dataset.zip", exdir=directory)}


# Load column and activity names
featureLabels  <- read.table("./data/UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)[[2]]
activityLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("ActivityID", "activity"))

# Load training data
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names=c("ActivityID"))
sTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names=c("subjectId"))

# Load test data
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names=c("ActivityID"))
sTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names=c("subjectId"))

# --- STEP 1 --- Merge the training and test data sets.
allData <- rbind(xTrain, xTest)
colnames(allData) <- featureLabels

# --- STEP 2 --- Extract only mean and standard deviation values for each measurement.
searchLabels <- "mean\\()|std\\()"
allData <- allData[,featureLabels[grepl(searchLabels, featureLabels)]]

# --- STEP 3 --- Use descriptive activity names.
activityData <- merge(rbind(yTrain, yTest), activityLabels, by="ActivityID", sort=FALSE)[["activity"]]
allData["activity"] <- sub("_", " ", tolower(activityData))


# --- STEP 4 --- # create a function to improve the variable names
allData["subjectId"] <- rbind(sTrain, sTest)

# --- STEP 5 ---
# Summarise dataset.
varName <- names(allData)
shortnames <- c("^f", "^t", "Acc", "-mean\\(\\)", "-meanFreq\\(\\)", "-std\\(\\)", "Gyro", "Mag", "BodyBody")
betternames<- c("meanFrequency", "meanTime", "Acceleration", "Mean", "MeanFrequency", "Standard", "Gyroscope", "Magnitude", "Body")
for(i in seq_along(shortnames)){varName <- sub(shortnames[i], betternames[i], varName)}
names(allData) <- varName

tidyData <- allData %>%
    gather(variable, value, -activity, -subjectId) %>%
    group_by(activity, subjectId, variable) %>%
    summarise(value=mean(value)) %>%
    arrange(activity, subjectId, variable)

# write the final out data to a file, Name can be altered by changing variable outputfile in the beginning of the script
write.table(tidyData, outputfile, row.names=FALSE)

# clean up data variables
rm(list=c("sTrain", "sTest","xTrain", "xTest","yTrain", "yTest", "activityData","outputfile"))