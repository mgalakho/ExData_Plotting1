##Loading data
powerData <- read.csv("household_power_consumption.txt",sep=";")

##Filtering on dates
powerData <- subset(powerData,Date == "1/2/2007" | Date == "2/2/2007")

##Adding datetime field
powerData$datetime <- strptime(paste(powerData$Date,powerData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

##Setting up the 4 chart spaces
par(mfrow=c(2,2))

##Creating plot 1
plot(powerData$datetime,as.numeric(as.character(powerData$Global_active_power)),type = "l",xlab="",ylab="Global Active Power (kilowatts)")

##Creating plot 2
plot(powerData$datetime,as.numeric(as.character(powerData$Voltage)),type = "l",xlab="",ylab="Voltage")

##Creating plot 3
plot(powerData$datetime,as.numeric(as.character(powerData$Sub_metering_1)),type = "l",xlab="datetime",ylab="Energy sub metering")

lines(powerData$datetime,as.numeric(as.character(powerData$Sub_metering_2)),col="red")

lines(powerData$datetime,as.numeric(as.character(powerData$Sub_metering_3)),col="blue")

legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, cex=0.8)

##Creating plot 4
plot(powerData$datetime,as.numeric(as.character(powerData$Global_reactive_power)),type = "l",xlab="datetime",ylab="Global_reactive_power")



##PNG Export
dev.copy(png,'plot4.png')

dev.off()