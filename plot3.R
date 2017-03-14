#plot 3
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors = F)
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
dataNew<- subset(data, subset=(Date>="2007-02-01" & Date <= "2007-02-02"))


dataNew <- transform(dataNew, newTime=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(dataNew$newTime, as.numeric(dataNew$Sub_metering_1), type = "l", xlab = "", ylab ="Energy Sub Metering", col = "black")
lines(dataNew$newTime,as.numeric(dataNew$Sub_metering_2),col="red")
lines(dataNew$newTime,as.numeric(dataNew$Sub_metering_3),col="blue")

legend("topright", col =c("black","red", "blue"), c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))
dev.off()
