# Getting and Cleaning Data Course Project

1. Merges the training and the test sets to create one data set.
4. Appropriately labels the data set with descriptive variable names.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The reason why I put 4 after 1 is it's easier to add column names to the data frame before subset, the length of the features is the same as the column number of the merged data frame. 