# plot4 function will create 4 plots

plot4 <- function() {
  
  ## read all time data
  alldata <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.string='?')
  
  # select the required dates
  data <- subset(alldata, as.Date(alldata$Date, format = "%d/%m/%Y") %in% 
                   as.Date(c("01/02/2007", "02/02/2007"), format = "%d/%m/%Y"))
  
  #paste Date and Time
  data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                              format="%d/%m/%Y %H:%M:%S")
  
  # export to png
  png(file = "plot4.png")
  
  # prepare the base for a 2-2 multiple plots
  par(mfrow = c(2, 2))
  
  # create 1st plot
  plot(data$DateTime, data$Global_active_power, type="l", 
       xlab = NA, ylab = "Global Active Power (kilowatts)")
  
  # create the 2nd plot
  plot(data$DateTime, data$Voltage, type="l", 
       xlab = "datetime", ylab = "Voltage")
  
  # create the 3rd plot
  with(data, plot(DateTime, Sub_metering_1, col = "black", 
                  type="l", xlab = NA, ylab = "Energy sub metering"))
  with(data, lines(DateTime, Sub_metering_2, col = "red"))
  with(data, lines(DateTime, Sub_metering_3, col = "blue"))
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd=1, col=c("black", "red", "blue"))
  
  # create the 4th plot
  plot(data$DateTime, data$Global_reactive_power, type="l", 
       xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
}


