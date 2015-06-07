hp <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", na.strings = "?")
hp$Date <- as.Date(hp$Date, format = "%d/%m/%Y")
hpTemp <- subset(hp, (hp$Date == "2007-02-01" | hp$Date == "2007-02-02"))
hp <- hpTemp
hp$DateTime <- paste(hp$Date, hp$Time, sep = " ")
hp$DateTime <- as.POSIXct(hp$DateTime)

png('plot3.png',width=480,height=480)
plot(x = hp$DateTime, y = hp$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
par(new=TRUE)
lines(x = hp$DateTime, y = hp$Sub_metering_2, col = "red")
par(new=TRUE)
lines(x = hp$DateTime, y = hp$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1)

dev.off()



