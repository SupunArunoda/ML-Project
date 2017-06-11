traindata <- read.csv("traindata.csv", header = T) #Read Train Data
labeldata <- read.csv("label.csv", header = T) #Read Train Data Labels
testdata <- read.csv("testdata.csv", header = T) #Read Test Data
traindata$status_group <- labeldata$status_group #Add Train Data Labels to Actual Data

#Creating a New attribute called 'years in operation(yip)'
tmp <- format(as.Date(traindata$date_recorded, '%Y-%m-%d'),'%Y') 
tmp <- as.numeric(tmp)
traindata$yip <- tmp - traindata$construction_year
traindata$yip[traindata$yip > 2000] <- 0

#Removing Attributes-based on redundancy and logical reasoning
traindata$wpt_name <- NULL
traindata$subvillage <- NULL
traindata$region_code <- NULL
traindata$region <- NULL
traindata$ward <- NULL
traindata$recorded_by <- NULL
traindata$scheme_name <- NULL
traindata$permit <- NULL
traindata$extraction_type <- NULL
traindata$extraction_type_class <- NULL
traindata$management_group <- NULL
traindata$quality_group <- NULL
traindata$quantity_group <- NULL
traindata$waterpoint_type_group <- NULL
traindata$source_type <- NULL
# traindata$latitude <- NULL
# traindata$longitude <- NULL
#traindata$funder <- NULL
#traindata$installer <- NULL
traindata$date_recorded <- NULL

#factoring attributes
traindata$basin <- as.factor(traindata$basin)
#traindata$region <- as.factor(traindata$region)
traindata$public_meeting <- as.factor(traindata$public_meeting)
traindata$scheme_management <- as.factor(traindata$scheme_management)
traindata$extraction_type_group <- as.factor(traindata$extraction_type_group)
traindata$management <- as.factor(traindata$management)
traindata$payment <- as.factor(traindata$payment)
traindata$payment_type <- as.factor(traindata$payment_type)
traindata$water_quality <- as.factor(traindata$water_quality)
traindata$waterpoint_type <- as.factor(traindata$waterpoint_type)
traindata$quantity <- as.factor(traindata$quantity)
traindata$source <- as.factor(traindata$source)
traindata$source_class <- as.factor(traindata$source_class)
traindata$status_group <- as.factor(traindata$status_group)

#Removing NAs from attribute
traindata$public_meeting <- factor(traindata$public_meeting, levels = c("FALSE","TRUE",""))
traindata$public_meeting[is.na(traindata$public_meeting)] <- ""

#Creating New attribute called 'YIP' for testdata
tmp1 <- format(as.Date(testdata$date_recorded, '%Y-%m-%d'),'%Y')
tmp1 <- as.numeric(tmp1)

testdata$yip <- tmp1 - testdata$construction_year
testdata$yip[testdata$yip > 2000] <- 0

#Removing redundant and unimportant attributes
testdata$num_private <- NULL
testdata$wpt_name <- NULL
testdata$subvillage <- NULL
testdata$region_code <- NULL
testdata$region <- NULL
testdata$ward <- NULL
testdata$recorded_by <- NULL
testdata$scheme_name <- NULL
testdata$permit <- NULL
testdata$extraction_type <- NULL
testdata$extraction_type_class <- NULL
testdata$management_group <- NULL
testdata$quality_group <- NULL
testdata$quantity_group <- NULL
testdata$waterpoint_type_group <- NULL
testdata$source_type <- NULL
# testdata$latitude <- NULL
# testdata$longitude <- NULL
#testdata$funder <- NULL
#testdata$installer <- NULL
testdata$date_recorded <- NULL

testdata$public_meeting <- casefold(testdata$public_meeting, upper = TRUE)
testdata$public_meeting <- as.factor(testdata$public_meeting)
levels(testdata$scheme_management) <- levels(traindata$scheme_management)
