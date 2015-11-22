Question 1
* df_X_train : data.frame read from "train/X_train.txt" (measurement values)
* df_y_train : data.frame read from "train/y_train.txt" (activity_id)
* df_subject_train : data.frame read from "train/subject_train.txt" (subject_id)
* df_train : data.frame column bind by df_X_train, df_y_train, df_subject_train

* df_X_test : data.frame read from "test/X_test.txt" (measurement values)
* df_y_test : data.frame read from "test/y_test.txt" (activity_id)
* df_subject_test : data.frame read from "test/subject_test.txt" (subject_id)
* df_test : data.frame column bind by df_X_test, df_y_test, df_subject_test

* df_merge : data.frame row bind by df_train and df_test

Question 4
* df_features : data.frame read from "features.txt" (names for different measurements)
* header_features : character vector for names of measurements
* names(df_merge) : give columns names to merged data.frame

Question 2
* header_features_mean_std_index : index of columns with mean and standard deviation
* df_merge_mean_std : subset df_merge with mean and std columns

Question 3
df_activity_labels : read activity labels 
df_merge_mean_std_label : merge activity labels with df_merge_mean_std through activity_id

Question 5
df_activity_subject_mean : group df_merge_mean_std_label by activity_label and subject_id, get mean values for each other columns
write df_activity_subject_mean into a text file