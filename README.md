This is the README file for the course assignment for the course Getting and Cleaning Data.

Files included are as follows:

- README.md
- run_analysis.R
- variables.txt

Details:

--README.md--
This file.

--run_analysis.R--
Course constraint information:
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

Notes on my work:
# Dear grader, I've done 1-3 in a bit of a mixed order. 
# In so doing, I hoped to only load the smallest necessary
# data frames, saving memory. Parts 4-5 are done in suggested order.

--variables.txt--
Contains the names of the variables in the output data frame. 

The first variable is the activity. The second is a unique subject id.

Further variables were selected because they were the mean or standard 
deviation variables obtained from the training and test sets, in accordance
with Constraint 2. mentioned above.