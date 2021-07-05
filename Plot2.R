# Set work directory to the file
setwd("D:/R wd/Exploratory_Data_Analysis_Week_1")

# Reading the file
data<-read.table("./household_power_consumption.txt",header=TRUE, sep=";")

# Subset data from the dates 2007-02-01 and 2007-02-02
SubsetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot 2-Historam
## Convert the Date and Time variables to Date/Time classes 
DateTime<-strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## Create plot2.png file
png("plot2.png",width=480,height=480)
plot(DateTime,GlobalActivePower,type="l",xlab="",ylab="Global Active Power(kilowatts)")
dev.off()
