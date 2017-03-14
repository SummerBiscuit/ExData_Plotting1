# plot 1
data <- read.table("household_power_consumption.txt", sep=";",header=TRUE, stringsAsFactors = F)
data$Date <-as.Date(data$Date, format = "%d/%m/%Y")
dataNew<- subset(data, subset=(Date>="2007-02-01" & Date <= "2007-02-02"))

png("plot1.png", width=480, height=480)
hist(as.numeric(dataNew$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()