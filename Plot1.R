# Set work directory to the file
setwd("D:/R wd/Exploratory_Data_Analysis_Week_1")

## Reading the file
data<-read.table("./household_power_consumption.txt",header=TRUE, sep=";")

## Subset data from the dates 2007-02-01 and 2007-02-02
SubsetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Plot 1-Histogram 
GlobalActivePower<-as.numeric(SubsetData$Global_active_power)
png("plot1.png",width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Activie Power", xlab="Global Active Power(kilowatts)",ylab= "Frequency")
dev.off()