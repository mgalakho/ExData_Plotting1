par(mfrow=c(1,1))

##Loading data
powerData <- read.csv("household_power_consumption.txt",sep=";")

##Filtering on dates
powerData <- subset(powerData,Date == "1/2/2007" | Date == "2/2/2007")

##Adding datetime field
powerData$datetime <- strptime(paste(powerData$Date,powerData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

##Creating plot
plot(powerData$datetime,as.numeric(as.character(powerData$Sub_metering_1)),type = "l",xlab="",ylab="Energy sub metering")

lines(powerData$datetime,as.numeric(as.character(powerData$Sub_metering_2)),col="red")

lines(powerData$datetime,as.numeric(as.character(powerData$Sub_metering_3)),col="blue")

legend("topright",col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

##PNG Export
dev.copy(png,'plot3.png')

dev.off()