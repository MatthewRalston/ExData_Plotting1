# Plot1.r
# Author Matthew Ralston
# Date 1/27/16

setwd("/Users/Matthew/Projects/EDA/ExData_Plotting1/")
dataset<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
png("plot1.png",height = 480,width = 480)
dataset$Date<-as.Date(dataset$Date,format="%d/%m/%Y")
start<-as.Date("2007-02-01")
final<-as.Date("2007-02-02")
dataset <- dataset[dataset$Date == start | dataset$Date == final,]
dataset$Global_active_power<-as.numeric(dataset$Global_active_power)/1000
hist(dataset$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")
dev.off()
