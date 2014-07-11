myFile <- "household_power_consumption.txt"
dfData <- read.csv2.sql(myFile, sql = "select * from file where Date
     = '1/2/2007' OR Date = '2/2/2007'", header = TRUE)
newDates<-paste(dfData$Date, dfData$Time)
DateTime<- strptime(newDates, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480, units = "px", 
    bg = "transparent")
plot(DateTime, dfData$"Global_active_power", type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)" )
dev.off()