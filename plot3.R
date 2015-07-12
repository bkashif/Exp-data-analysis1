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

## Creating Plot 2
	with(data, {
    		plot(Sub_metering_1~Datetime, type="l",
         	ylab="Global Active Power (kilowatts)", xlab="")
    		lines(Sub_metering_2~Datetime,col='Red')
    		lines(Sub_metering_3~Datetime,col='Blue')
		})
	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
	legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copying Plot to file
	dev.copy(png, file="plot3.png", height=480, width=480)
	dev.off()
