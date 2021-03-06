plot4 <- function(){
    #read in data
    data <- read.table("household_power_consumption.txt", header = TRUE,
                       sep = ";", na.strings = "?")
    
    #convert Date column to Date objects
    data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
    
    #subset the Dates we want
    subsetted <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
    
    #create new column of Date_Time, then convert to Time object
    subsetted$Date_Time <- strptime(paste(subsetted$Date, subsetted$Time),
                                    format = "%Y-%m-%d %H:%M:%S")
    
    #open png file
    png(filename = "plot4.png")
    
    par(mfcol = c(2,2))
    
    #plot1
    plot(subsetted$Date_Time, subsetted$Global_active_power, type = 'l', 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    
    #plot 2
    with(subsetted, plot(Date_Time, Sub_metering_1, xlab = "", 
                         ylab = "Energy sub metering", type = "l"))
    with(subsetted, points(Date_Time, Sub_metering_2, type = "l", col = "red"))
    with(subsetted, points(Date_Time, Sub_metering_3, type = "l", col = "blue"))
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col = c("black", "red", "blue"), lty = 1, cex = 0.35)
    
    #plot 3
    with(subsetted, plot(Date_Time, Voltage, xlab = "datetime",
                         ylab = "Voltage", type = "l"))
    
    #plot 4
    with(subsetted, plot(Date_Time, Global_reactive_power,
                        xlab = "datetime",ylab = "Global_reactive_power", type = "l"))
    
    dev.off()
}