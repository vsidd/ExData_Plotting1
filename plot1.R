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

# plot the graph
hist(hp$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency") 

# save the plotted graph to a png file
dev.copy(png, file = "plot1.png", height = 480, width = 480) 

# swith off the opened device object
dev.off() 