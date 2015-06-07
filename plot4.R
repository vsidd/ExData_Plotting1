# Read the csv file with given settings and load it to a variable
hp <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", quote = "", na.strings = "?")

# Convert the Date column which is in character class to Date class
hp$Date <- as.Date(hp$Date, format = "%d/%m/%Y")

# load all values that occur in the given date to a temp variable
hpTemp <- subset(hp, (hp$Date == "2007-02-01" | hp$Date == "2007-02-02"))

# load the temp variable back to original variable thereby removing the previously loaded data from memory
hp <- hpTemp

# Join the date and the time column and make a new column of the joined data
hp$DateTime <- paste(hp$Date, hp$Time, sep = " ")

# convert the joined date and time column to POSIXct form
hp$DateTime <- as.POSIXct(hp$DateTime)

# Start the device to save a png file
png('plot4.png',width=480,height=480)

# create a framework for the graphs to display in 2x2 matrix form
par(mfcol=c(2,2),  mar=c(4,5,2,2))
# plot the first graph at (1,1) position
plot(x = hp$DateTime, y = hp$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
# plot the second graph at (2,1) position
plot(x = hp$DateTime, y = hp$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
# execute following command to overwrite the current graph
par(new=TRUE)
# plot another graph over the second graph at (2,2) position
lines(x = hp$DateTime, y = hp$Sub_metering_2, col = "red")
# execute following command to overwrite the current graph
par(new=TRUE)
# plot another graph over the second graph at (2,2) position
lines(x = hp$DateTime, y = hp$Sub_metering_3, col = "blue")
# add legend to the overall graph mentioning what each graph line represents
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", lty = c(1,1,1))
# plot the third graph at (1,2) position
plot(x = hp$DateTime, y = hp$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")
# plot the fourth graph at (2,2) position
plot(x = hp$DateTime, y = hp$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")

# swith off the opened device object
dev.off()