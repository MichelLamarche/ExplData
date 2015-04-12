##set working directory and load libraries
setwd("C:/Users/Michel/Documents/R")

options(stringsAsFactors = FALSE)
library(data.table)

##load data
data<-read.table("C:/Users/Michel/Documents/R/household_power_consumption.txt",sep =";", header = TRUE)
data$Date <- as.Date( as.character(data$Date), format= "%d/%m/%Y")
dataGood<- subset (data, Date >= as.Date("2007-02-01")  & Date <= as.Date("2007-02-02"))
rm(data)
dataGood[,4]<-as.numeric(dataGood[, 4])
dataGood[,5]<-as.numeric(dataGood[, 5])
dataGood[,6]<-as.numeric(dataGood[, 6])
x<-as.numeric(dataGood$Global_active_power)
par(mfrow=c(1,1))
hist(x,col =2,main="Global Active power")
dev.copy(png, file="Plot1.png", width = 480, height = 480)
dev.off()
