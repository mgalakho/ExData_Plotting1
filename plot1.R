par(mfrow=c(1,1))

##Loading data
powerData <- read.csv("household_power_consumption.txt",sep=";")

##Filtering on dates
powerData <- subset(powerData,Date == "1/2/2007" | Date == "2/2/2007")

##Creating plot
hist(as.numeric(as.character(powerData$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")


##PNG Export
dev.copy(png,'plot1.png')

dev.off()