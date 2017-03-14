# plot 2
# Read data
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors = F)

#Change date format and specify timeframe
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
dataNew<- subset(data, subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

dataNew <- transform(dataNew, newTime=as.POSIXct(paste(Date,Time)),"%d/%m/%Y %H:%M:%S")

#plot
png("plot2.png", width=480, height=480)
plot(dataNew$newTime, as.numeric(as.character(dataNew$Global_active_power))/1000, type = "l", xlab = "", ylab ="Global Active Power(kilowatts)")
dev.off()
