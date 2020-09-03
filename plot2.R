power<-read.table("household_power_consumption.txt", skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="")

#renaming variables
colnames(power)<-read.table("household_power_consumption.txt",nrows=1,header=F,sep=";")

#combining date and time
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
plot(power$DateTime, power$Global_active_power, type = "line", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png")
dev.off()