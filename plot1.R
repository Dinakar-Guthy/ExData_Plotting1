plot1 <- function(){
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
    png(filename = "plot1.png")
    hist(subsetted$Global_active_power, xlab = "Global Active Power (kilowatts)", 
         col = "red", main = "Global Active Power")
    dev.off()
}