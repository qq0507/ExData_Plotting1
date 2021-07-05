# Set work directory to the file
setwd("D:/R wd/Exploratory_Data_Analysis_Week_1")

# Reading the file
data<-read.table("./household_power_consumption.txt",header=TRUE, sep=";")

# Subset data from the dates 2007-02-01 and 2007-02-02
SubsetData<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot 4
##  Convert the variables to designated classes 
DateTime<-strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
GlobalActivePower<-as.numeric(SubsetData$Global_active_power)
GlobalReactivePower<-as.numeric(SubsetData$Global_reactive_power)
Voltage<-as.numeric(SubsetData$Voltage)
SubMetering1<-as.numeric(SubsetData$Sub_metering_1)
SubMetering2<-as.numeric(SubsetData$Sub_metering_2)
SubMetering3<-as.numeric(SubsetData$Sub_metering_3)

## Create plot4.png file
png("Plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(DateTime,GlobalActivePower,type="l",xlab="",ylab="Global Activie Power")

plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(DateTime,SubMetering1, type="l",xlab="",ylab="Energy sub metering")
lines(DateTime,SubMetering2,type="l",col="red")
lines(DateTime,SubMetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=,lwd=2.5,bty="o")

plot(DateTime,GlobalReactivePower,type="l",xlab="daytime",ylab="Global_reactive_power")

dev.off()
