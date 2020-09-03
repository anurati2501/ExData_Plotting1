power<-read.table("household_power_consumption.txt", skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="")

#renaming variables
colnames(power)<-read.table("household_power_consumption.txt",nrows=1,header=F,sep=";")

#combining date and time
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")

#creating empty plot
plot(power$DateTime, power$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(power$DateTime, power$Sub_metering_1, type = "l" )
points(power$DateTime, power$Sub_metering_2, type = "l", col="red")
points(power$DateTime, power$Sub_metering_3, type = "l", col="blue")

legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black", "red","blue"),lty= c(1,1,1))
dev.copy(png, file="plot3.png")
dev.off()