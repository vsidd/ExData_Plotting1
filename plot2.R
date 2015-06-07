hp <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", na.strings = "?")
hp$Date <- as.Date(hp$Date, format = "%d/%m/%Y")
hpTemp <- subset(hp, (hp$Date == "2007-02-01" | hp$Date == "2007-02-02"))
hp <- hpTemp
hp$DateTime <- paste(hp$Date, hp$Time, sep = " ")
hp$DateTime <- as.POSIXct(hp$DateTime)
plot(x = hp$DateTime, y = hp$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()