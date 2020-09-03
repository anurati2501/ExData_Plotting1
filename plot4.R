power<-read.table("household_power_consumption.txt", skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="")

#renaming variables
colnames(power)<-read.table("household_power_consumption.txt",nrows=1,header=F,sep=";")

#combining date and time
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
#plot1
plot(power$DateTime, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot2
plot(power$DateTime, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot3
plot(power$DateTime, power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(power$DateTime, power$Sub_metering_1, type = "l" )
points(power$DateTime, power$Sub_metering_2, type = "l", col="red")
points(power$DateTime, power$Sub_metering_3, type = "l", col="blue")

legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red","blue"),lty= c(1,1,1))

#plot4
plot(power$DateTime, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png")
dev.off()