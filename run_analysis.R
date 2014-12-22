# Step 1
X_train<-read.table("train/X_train.txt")
X_test<-read.table("test/X_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")    
y_train <- read.table("train/y_train.txt")
y_test <- read.table("test/y_test.txt")


data_training <- cbind(subject_train, y_train, X_train)
data_test <- cbind(subject_test, y_test, X_test)

data <- rbind(data_training, data_test)
names(data)[1] <- c("subject")
names(data)[2] <- c("activity")

# Step 2
features <- read.table("features.txt", stringsAsFactors=FALSE)
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]


data_mean_std <- data[, c(1, 2, features_mean_std$V1+2)]

# Step 3
activities <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
data_mean_std$activity <- activities[data_mean_std$activity, 2]

# Step 4
columnnames_data <- c("subject", "activity", features_mean_std$V2)
colnames(data_mean_std) <- columnnames_data

## Step 5
total_column_nos <- ncol(data_mean_std)
data_average <- aggregate(data_mean_std[,3:total_column_nos], 
                        by = list(subject = data_mean_std$subject,
                                  activity = data_mean_std$activity), mean )

write.table(format(data_average, scientific=T), "tidy.txt",
            row.names=F, col.names=F, quote=2)

