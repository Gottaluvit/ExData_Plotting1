myFile <- "household_power_consumption.txt"
dfDates <- read.csv2.sql(myFile, sql = "select * from file where Date
     = '1/2/2007' OR Date = '2/2/2007'", header = TRUE)
png(filename = "plot1.png", width = 480, height = 480, units = "px", 
    bg = "Transparent")
hist(dfDates$"Global_active_power", col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim = c(0,1200))
dev.off()