Getting and Cleaning Data - Coursera
====================================

Introduction
------------
This repository contains my submission for the course project of the  "Data Science - Getting and Cleaning Data" course 

The goal of this Assignment is to download data, clean the data and then summarize the data.
The data is an example of a real-life dataset.

The input data set used was from the accelerometers and gyroscopes of a Samsung Galaxy S smartphone.
The Idea is that by collecting this data from the smartphone you can get insights in the activity of humans. For example we expect that you can identify walking a stairs by combinations of forward and vertical movements.
This data was produced as part of the [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project.


The input data set is located here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The project that gathered this data was 
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
==================================================================


Project Brief
--------------
In the project we will perform several steps : 

1. Merge the different sets into one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names so readers of the file can better identify the contents of the column.
4. Appropriately label the data set with descriptive variable names for easier readability. 
5. The dataset from step 4 we will use to create a second data set with the average of each variable for each activity and each subject.

Repository Contents
-------------------
The following files are in the repository
1. README.md
2. download clean and summarize.R
3. summary.txt
4. CodeBook.md

download clean and summarize.R
--------------
The `download clean and summarize.R` script performs the following:

* Downloads the compressed file to the ``./data`` folder,
* Extracts the raw data files from the compressed file
* Do the project steps as described in the Project Brief
* Write the resulting summary to a text file "summary.txt" 

The following R libraries are required
----------------
- dplyr
- tidyr

Software versions used when running this script are:

* R version 3.2.3 (2015-12-10) -- "Wooden Christmas-Tree"
* dplyr_0.4.3 built under R version 3.2.4
* tidyr_0.4.1 built under R version 3.2.4

To run the script call:
    source("download clean and summarize.R")

	
summary.txt
------------------------
The resulting summary data is a space delimited .txt file.
This file can be loaded into R by using the following line : 
data <- read.table("summary.txt", header=TRUE)
The file must be located in your current working directory


CodeBook.md
-----------
CodeBook.md contains a description of the `summary.txt` data file.