# Plot1.r
# Author Matthew Ralston
# Date 1/27/16

setwd("/Users/Matthew/Projects/EDA/ExData_Plotting1/")
dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)

dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
final<-as.Date("2007-02-02")
day1 <- dataset[dataset$Date == start,]
day2 <- dataset[dataset$Date == final,]
dataset <- rbind(day1,day2)

dataset$Datetime<-paste(dataset$Date,as.character(dataset$Time))
dataset$Datetime<-as.POSIXct(dataset$Datetime,format="%Y-%m-%d %H:%M:%S")




png("plot3.png",height = 480,width = 480)
plot(dataset$Datetime,as.numeric(dataset$Sub_metering_1),type="n",ylab="Energy sub metering",xlab="")
lines(dataset$Datetime,as.numeric(dataset$Sub_metering_1),type="l")
lines(dataset$Datetime,as.numeric(dataset$Sub_metering_2),type="l",col="red")
lines(dataset$Datetime,as.numeric(dataset$Sub_metering_3),type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2)
#axis(side=1,labels=c("Thu","Fri","Sat"),at=c("2016-02-01 00:00:00 EST","2016-02-02 00:00:00 EST","2016-02-02 23:59:00 EST"))
dev.off()
