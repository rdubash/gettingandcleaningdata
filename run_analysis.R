# make sure the working directory is set to the UCIHAR Dataset folder

library(plyr)

library(dplyr)

library(tidyr)

library(data.table)
 
# read the required data

act <- read.table("activity_labels.txt")

feat <- read.table("features.txt")

sub_test <- read.table("test\\subject_test.txt")

x_test <- read.table("test\\X_test.txt")

y_test <- read.table("test\\Y_test.txt")

sub_train <- read.table("train\\subject_train.txt")

x_train <- read.table("train\\X_train.txt")

y_train <- read.table("train\\Y_train.txt")


### Merge the data sets - requirement 1 from project description

x_test_train <- rbind(x_test,x_train)

y_test_train <- rbind(y_test,y_train)

sub_test_train <- rbind(sub_test,sub_train)

x_y_sub_test_train <- cbind(x_test_train,y_test_train,sub_test_train)


### Subset the data to only mean and std deviation - requirement 2 from project description

colnames(x_y_sub_test_train) <- c(as.character(feat$V2),"562_Activity","563_Subj")

x_y_sub_test_train_avg_std <- x_y_sub_test_train[,grepl("mean|std|562_Activity|563_Subj",c(as.character(feat$V2),"562_Activity","563_Subj"))]

### change activities to descriptions - requirement 3 from project description

x_y_sub_test_train_avg_std_out <- merge(x_y_sub_test_train_avg_std,act,by.x="562_Activity",by.y="V1")

## Change Variable (column) Names to descriptions - requirement 4 from project description
## As per the features_info.txt
## change the first character 'f' to a more descriptive 'Frequency Domain'
## change the first character 't' to a more descriptive 'Time Domain'
## remove the '()' in the name
## change 'std' to a more descriptive 'std dev'
## change the subject and activity column names to the ones required

names(x_y_sub_test_train_avg_std_out) <- sub('^f','Freq Dom ',names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- sub('^t','Time Dom ',names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- sub("[:(:]","",names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- sub(')','',names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- sub('-std','-std dev',names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- sub('V2','activity',names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- sub('563_Subj','Subject',names(x_y_sub_test_train_avg_std_out))
names(x_y_sub_test_train_avg_std_out) <- tolower(names(x_y_sub_test_train_avg_std_out))

## new data set with average of each variable (column) grouped by Activity and Subject - requirement 5 from project desc
new_xysub_test_train_avgstd <- ddply(x_y_sub_test_train_avg_std_out,.(activity,subject), colwise(mean))

## remove the 562_activity columns that was used for joining y data set with activity

new_xysub_test_train_avgstd <- within(new_xysub_test_train_avgstd,rm("562_activity"))

## write the new data to a file
write.table(new_xysub_test_train_avgstd,"new_xysub_test_train_avgstd.txt",row.names=FALSE)
