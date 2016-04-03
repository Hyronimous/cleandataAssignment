Code Book
=========

Introduction
------------
The output is a summary of the project data from 

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
The `summary.txt` file is a summary data set of the full data set from this project

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

Variables
---------
**activity** One of the 6 activities listed below:
* laying
* sitting
* standing
* walking
* walking upstairs
* walking downstairs

**subjectId**
A unique integer to identify each of the subjects in the study, numbers range from 1 to 30.

**variable**
The variable (or feature) being measured.

**note**
Variables ending in "-X", "-Y" or "-Z" are movement on different axes in relation to the position of the smartphone.

**value**
The value of the variable for the  subject/activity.