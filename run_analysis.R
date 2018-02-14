library(tidyverse)
library(glue)

if (!file.exists("./data")) {
    dir.create("./data")
}

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./data/dataset.zip", method = "curl")
unzip("./data/dataset.zip", exdir = "./data", overwrite = TRUE)

basedir <- "./data/UCI HAR Dataset"

# Load variable names from features file
df_labels <- read_table2(glue("{basedir}/features.txt"),
                         col_names = FALSE,
                         col_types = cols(X1 = col_integer(),
                                          X2 = col_character()))
variable_names <- df_labels[[2]]

# Load Activity factors
activity_labels <- read_table2(glue(basedir, "/activity_labels.txt"),
                               col_names = c("code", "activity"),
                               col_types = cols(code = col_integer(),
                                                activity = col_character())) %>%
    mutate(activity = as_factor(activity))

read_dataset <- function(basedir, datasetname) {
    # Load time and frequency domain variables
    df_dataset <- read_table2(
            glue("{basedir}/{datasetname}/X_{datasetname}.txt"),
            col_names = variable_names,
            col_types = cols(.default = col_double())) %>%
        add_column(dataset = datasetname)

    # Load activities
    activities <- read_lines(glue("{basedir}/{datasetname}/y_{datasetname}.txt"))
    df_dataset <- add_column(df_dataset, activity = activities) %>%
        mutate(activity = activity_labels$activity[match(activity, activity_labels$code)])

    # Load Subject identifiers
    subjects <- read_lines(glue("{basedir}/{datasetname}/subject_{datasetname}.txt"))
    df_dataset <- add_column(df_dataset, subject = parse_factor(subjects, 1:30))

    # Load Inertial Signals data
    for (var in c("body_acc_x", "body_acc_y", "body_acc_z", "body_gyro_x", "body_gyro_y", "body_gyro_z", "total_acc_x", "total_acc_y", "total_acc_z")) {
        data <- read_lines(glue("{basedir}/{datasetname}/Inertial Signals/{var}_{datasetname}.txt"))
        data <- str_split(str_trim(data), " +")
        data <- lapply(data, as.double)
        df_dataset[[var]] <- data
    }
    
    df_dataset
}

# Combine train and test data sets
df_smartphone <- bind_rows(read_dataset(basedir, "train"),
                           read_dataset(basedir, "test"))

rm(activity_labels, df_labels, variable_names)
