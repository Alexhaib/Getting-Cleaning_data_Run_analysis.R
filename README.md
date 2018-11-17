# Getting-Cleaning_data_Run_analysis.R
Peer-reviewed project for Getting &amp; Cleaning data course (week 4)

Pre-requisites:
1.	Download data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2.	Unzip it into your working directory
3.	Download run_analysis.R from this repo and run it on your machine.

The source data is divided into 2 groups: training data and testing data.

The script:
1.	reads experimental data from both groups to R, 
2.	merges Testing and Training into one dataset
3.	extracts only average (mean()) and standard deviation (std()) variables (66 out of 561 variables)
4.	assigns meaningful names to variables and activities
5.	calculates average by each activity and each subject for each variable in an independent dataset (average_data)
6.	saves the resulting independent dataset into text file in the working directory (“average_data.txt”)
