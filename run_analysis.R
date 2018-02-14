library(tidyverse)

if (!file.exists("./data")) {
    dir.create("./data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/dataset.zip", method = "curl")
unzip("./data/dataset.zip", exdir = "./data", overwrite = TRUE)

# Load variable names from features file
df_labels <- read_table2("./data/UCI HAR Dataset/features.txt",
                         col_names = FALSE,
                         col_types = cols(X1 = col_integer(), X2 = col_character()))
variable_names <- df_labels[[2]]

# Load train data
df_train <- read_table2("./data/UCI HAR Dataset/train/X_train.txt",
                        col_names = FALSE,
                        col_types = cols(.default = col_character()))
names(df_train) <- variable_names

df_train <- add_column(df_train, dataset = "train")

train_activities <- read_lines("./data/UCI HAR Dataset/train/y_train.txt")
df_train <- add_column(df_train, activity = train_activities)

df_test <- read_table2("./data/UCI HAR Dataset/test/X_test.txt",
                        col_names = FALSE,
                        col_types = cols(.default = col_character()))
names(df_test) <- variable_names

df_test <- add_column(df_test, dataset = "test")

test_activities <- read_lines("./data/UCI HAR Dataset/test/y_test.txt")
df_test <- add_column(df_test, activity = test_activities)

# Combine train and test data sets
df <- bind_rows(df_train, df_test)

# Clean up temporary data
rm(df_labels, variable_names, df_train, train_activities, df_test, test_activities)

activity_labels <-
    read_table2("./data/UCI HAR Dataset/activity_labels.txt",
        col_names = c("code", "activity"),
        col_types = cols(code = col_integer(), activity = col_character())) %>%
    mutate(activity = as_factor(activity))

df <- mutate(df, activity = activity_labels$activity[match(activity, activity_labels$code)])