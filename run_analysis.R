## download data
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ",
              "data/Dataset.zip", "curl")
unzip("data/Dataset.zip", exdir="data")

## features loading, selection and transformation
features <- read.table("data/UCI HAR Dataset/features.txt", row.names=1, as.is=T)
features_requied <- grep('mean|std', features$V2, ignore.case=T)
features_requied_names <- features[features_requied, ]
features_requied_names <- gsub('\\(\\)', '', features_requied_names)
features_requied_names <- gsub(',', '.', features_requied_names)
features_requied_names <- gsub('\\)', '', features_requied_names)
features_requied_names <- gsub('\\(', '_', features_requied_names)
features_requied_names <- gsub('-', '_', features_requied_names)
rm(features)

## loading activity lables
activity_labels <- read.table("data/UCI HAR Dataset/activity_labels.txt", row.names=1, as.is=T)

## loading test set
## ## loading subject ids
subject_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt", col.names = c('Subject'))
## ## loading feature variables
X_test <- read.table("data/UCI HAR Dataset/test/X_test.txt")
## ## selecting only required feature variables
X_test_required <- X_test[, features_requied]
## ## naming required feature variables
names(X_test_required) <- features_requied_names
## ## loading activity ids
y_test <- read.table("data/UCI HAR Dataset/test/y_test.txt", col.names = c('Activity'))
## ## combining test set
test <- cbind(subject_test, y_test, X_test_required)

rm(X_test, X_test_required, subject_test, y_test)

## loading train set
## ## loading subject ids
subject_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt", col.names = c('Subject'))
## ## loading feature variables
X_train <- read.table("data/UCI HAR Dataset/train/X_train.txt")
## ## selecting only required feature variables
X_train_required <- X_train[, features_requied]
## ## naming required feature variables
names(X_train_required) <- features_requied_names
## ## loading activity ids
y_train <- read.table("data/UCI HAR Dataset/train/y_train.txt", col.names = c('Activity'))
## ## combining train set
train <- cbind(subject_train, y_train, X_train_required)

rm(X_train, X_train_required, subject_train, y_train)

rm(features_requied, features_requied_names)

## merging two sets together
df <- rbind(train, test)
## factorizing activity ids
df$Activity <- as.factor(df$Activity)
## naming activity ids after their lables
levels(df$Activity) <- activity_labels[[1]]
## reordering set by subject id
df <- df[order(df$Subject), ]
## cleanup
row.names(df) <- NULL
rm(test, train, activity_labels)

## aggregating into resulting tidy set
tidyDf <- aggregate(. ~ Activity + Subject, data = df, mean)
## writing resulting tidy set
write.table(tidyDf, file="data/tidyDf.txt", row.names=F)
