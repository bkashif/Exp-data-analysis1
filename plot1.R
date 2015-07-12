## Getting full dataset
	data_set <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, comment.char="", quote='\"')
	data_set$Date <- as.Date(data_set$Date, format="%d/%m/%Y")

## Subsetting the data
	data <- subset(data_set, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
	rm(data_set)  ##used to remove object data_set 

## Converting dates
	datetime <- paste(as.Date(data$Date), data$Time)
	data$Datetime <- as.POSIXct(datetime)

## Creating Plot 1
	hist(data$Global_active_power, main="Global Active Power", 
	xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Copying Plot to file
	dev.copy(png, file="plot1.png", height=480, width=480)
	dev.off()
