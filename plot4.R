myFile <- "household_power_consumption.txt"
dfData <- read.csv2.sql(myFile, sql = "select * from file where Date
     = '1/2/2007' OR Date = '2/2/2007'", header = TRUE)
newDates<-paste(dfData$Date, dfData$Time)
DateTime<- strptime(newDates, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480, units = "px", 
    bg = "transparent")
par(mfcol = c(2,2), mar = c(4,4,2,2))
plot(DateTime, dfData$"Global_active_power", type = "l", xlab = "", 
     ylab = "Global Active Power" )
plot(DateTime, dfData$"Sub_metering_1", type = "l", xlab = "", 
     ylab = "Energy sub metering" )
points(DateTime, dfData$"Sub_metering_2", type = "l", col = "red")
points(DateTime, dfData$"Sub_metering_3", type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1), col = c("black", "red", "blue"), bty = "n")
plot(DateTime, dfData$"Voltage", type = "l", ylab = "Voltage")
plot(DateTime, dfData$"Global_reactive_power", type = "l", ylab = "Global_reactive_power")
dev.off()