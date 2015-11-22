#install.packages("dplyr")
library(dplyr)

# 1.Merges the training and the test sets to create one data set.

# data.frame train
df_X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
df_y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt") # activity numbers for train
df_subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt")
df_train <- cbind(df_y_train, df_subject_train, df_X_train)

# data.frame test
df_X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
df_y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt") # activity numbers for test
df_subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt")
df_test <- cbind(df_y_test, df_subject_test, df_X_test)

# merge
df_merge <- rbind(df_train, df_test)


# 4.Appropriately labels the data set with descriptive variable names. 
# data.frame header
df_features <- read.table("data/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
header_features <- df_features[,2] # length 561 
length(unique(header_features)) # 447 there are duplicated headers
names(df_merge) <- c("activity_id", "subject_id", header_features)


# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
header_features_mean_std_index <- grep("mean\\(\\)|std\\(\\)", header_features) # \\ means escape
header_features_mean_std_index <- header_features_mean_std_index + 2 # skip "activity_id" and "subject_id" columns
df_merge_mean_std <- df_merge[,c(1, 2, header_features_mean_std_index)]


# 3.Uses descriptive activity names to name the activities in the data set
df_activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt", col.names = c("id", "activity_label"))
df_merge_mean_std_label <- merge(df_activity_labels, df_merge_mean_std, by.x = "id", by.y = "activity_id")


# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
df_activity_subject_mean <- group_by(df_merge_mean_std_label, activity_label, subject_id)%>%
    summarise_each(funs(mean))

write.table(df_activity_subject_mean, file = "data/output_activity_subject_mean.txt", row.names = FALSE)
