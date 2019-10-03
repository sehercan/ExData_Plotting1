# plot3 function will create a line plot for 3 Sub metering values

plot3 <- function() {
  
  # read all the data
  alldata <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.string='?')
  
  # select the required dates
  data <- subset(alldata, as.Date(alldata$Date, format = "%d/%m/%Y") %in% 
                   as.Date(c("01/02/2007", "02/02/2007"), format = "%d/%m/%Y"))
  
  #paste Date and Time
  data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                              format="%d/%m/%Y %H:%M:%S")
  
  # export to png
  png(file = "plot3.png")
  
  # Create the 3 line plots for Sub_metering
  with(data, plot(DateTime, Sub_metering_1, col = "black", 
                  type="l", xlab = NA, ylab = "Energy sub metering"))
  with(data, lines(DateTime, Sub_metering_2, col = "red"))
  with(data, lines(DateTime, Sub_metering_3, col = "blue"))
  
  # add legend
  legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty=1, lwd=1, col=c("black", "red", "blue"))
  
  # close the device
  dev.off()
}
