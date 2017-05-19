train_data <- read.csv("data/train_dataing set values.csv", header = T) #Read train_data Data
label_data <- read.csv("data/train_dataing set labels.csv", header = T) #Read train_data Data Labels
test_data <- read.csv("data/Test set values.csv", header = T) #Read Test Data
train_data$status_group <- label_data$status_group #Add train_data Data Labels to Actual

#Data Cleaning Proceess

###Remove redundancy and logical reasoning based attributes###
train_data$ward <- NULL
train_data$recorded_by <- NULL
train_data$scheme_name <- NULL
train_data$permit <- NULL
train_data$num_private <- NULL
train_data$wpt_name <- NULL
train_data$subvillage <- NULL
train_data$region_code <- NULL
train_data$region <- NULL
train_data$extraction_type <- NULL
train_data$extraction_type_class <- NULL
train_data$waterpoint_type_group <- NULL
train_data$source_type <- NULL
train_data$date_recorded <- NULL
train_data$management_group <- NULL
train_data$quality_group <- NULL
train_data$quantity_group <- NULL

###Reomove factoring based attributes###
train_data$extraction_type_group <- as.factor(train_data$extraction_type_group)
train_data$management <- as.factor(train_data$management)
train_data$basin <- as.factor(train_data$basin)
train_data$public_meeting <- as.factor(train_data$public_meeting)
train_data$scheme_management <- as.factor(train_data$scheme_management)
train_data$payment <- as.factor(train_data$payment)
train_data$payment_type <- as.factor(train_data$payment_type)
train_data$source_class <- as.factor(train_data$source_class)
train_data$status_group <- as.factor(train_data$status_group)
train_data$water_quality <- as.factor(train_data$water_quality)
train_data$waterpoint_type <- as.factor(train_data$waterpoint_type)
train_data$quantity <- as.factor(train_data$quantity)
train_data$source <- as.factor(train_data$source)

###Remove unnecessary NAs from trainig data###
train_data$public_meeting <- factor(train_data$public_meeting, levels = c("FALSE","TRUE",""))
train_data$public_meeting[is.na(train_data$public_meeting)] <- ""