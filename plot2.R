# plot2 function will create a line plot for Global Active Power.

plot2 <- function() {
  
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
  png(file = "plot2.png")
  
  ## Create the line plot
  plot(data$DateTime, data$Global_active_power, type="l", 
       xlab = NA, ylab = "Global Active Power (kilowatts)")
  
  # close the device
  dev.off()
}
