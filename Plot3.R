##set working directory and load libraries
setwd("C:/Users/Michel/Documents/R")

options(stringsAsFactors = FALSE)
library(data.table)

##load data
data<-read.table("C:/Users/Michel/Documents/R/household_power_consumption.txt",sep =";", header = TRUE)
data$Date <- as.Date( as.character(data$Date), format= "%d/%m/%Y")
dataGood<- subset (data, Date >= as.Date("2007-02-01")  & Date <= as.Date("2007-02-02"))
rm(data)
dataGood[,7]<-as.numeric(dataGood[, 7])
dataGood[,8]<-as.numeric(dataGood[, 8])
dataGood[,9]<-as.numeric(dataGood[, 9])
par(mfrow=c(1,1))
x<-as.numeric(dataGood$Sub_metering_1)
y<-as.numeric(dataGood$Sub_metering_2)
z<-as.numeric(dataGood$Sub_metering_3)
a<-as.factor(weekdays(dataGood$Date))
plot(x,type="l",xaxt="n", ylab="Energy sub metering" )
lines(y,type="l",col =2)
lines(z,type="l",col =100)
axis(1,at= 1:2880 ,labels=a)

dev.copy(png, file="Plot3.png", width = 480, height = 480)
dev.off()
