library(readr)
library(lubridate)
library(dplyr)
power<-read.table("household_power_consumption.txt", skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="")

#renaming variables
colnames(power)<-read.table("household_power_consumption.txt",nrows=1,header=F,sep=";")
hist(power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()