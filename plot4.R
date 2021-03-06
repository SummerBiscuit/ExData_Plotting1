#Plot 4

#Read data and specify time frame
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors = F)
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
dataNew<- subset(data, subset=(Date>="2007-02-01" & Date <= "2007-02-02"))
dataNew <- transform(dataNew, newTime=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")

#start plotting
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#top left

plot(dataNew$newTime, as.numeric(as.character(dataNew$Global_active_power)), type = "l", xlab = "", ylab ="Global Active Power(kilowatts)")

#top right
plot(dataNew$newTime, as.numeric(as.character(dataNew$Voltage)), type = "l", xlab = "datetime", ylab ="Voltage")

#bottom left
plot(dataNew$newTime, as.numeric(dataNew$Sub_metering_1), type = "l", xlab = "", ylab ="Energy Sub Metering", col = "black")
lines(dataNew$newTime,as.numeric(dataNew$Sub_metering_2),col="red")
lines(dataNew$newTime,as.numeric(dataNew$Sub_metering_3),col="blue")

legend("topright", col =c("black","red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1), bty = "n")

#bottom right
plot(dataNew$newTime, as.numeric(as.character(dataNew$Global_reactive_power)), type = "l", xlab = "datetime", ylab ="global_reactive_power(kilowatts)")
dev.off()
