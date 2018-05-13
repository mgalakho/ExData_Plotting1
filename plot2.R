par(mfrow=c(1,1))

##Loading data
powerData <- read.csv("household_power_consumption.txt",sep=";")

##Filtering on dates
powerData <- subset(powerData,Date == "1/2/2007" | Date == "2/2/2007")

##Adding datetime field
powerData$datetime <- strptime(paste(powerData$Date,powerData$Time,sep=" "), "%d/%m/%Y %H:%M:%S")

##Creating plot
plot(powerData$datetime,as.numeric(as.character(powerData$Global_active_power)),type = "l",xlab="",ylab="Global Active Power (kilowatts)")

##PNG Export
dev.copy(png,'plot2.png')

dev.off()