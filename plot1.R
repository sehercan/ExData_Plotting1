# plot1 function will create a histogram for Global Active Power.

plot1 <- function() {
  
  # read all the data
  alldata <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", na.string='?')
  
  # select the required dates
  data <- subset(alldata, as.Date(alldata$Date, format = "%d/%m/%Y") %in% 
                   as.Date(c("01/02/2007", "02/02/2007"), format = "%d/%m/%Y"))
  
  # export to png
  png(file = "plot1.png")
  
  ## Create the histogram with the required attributes
  hist(data$Global_active_power, col = "red", main = "Global Active Power", 
       xlab = "Global Active Power (kilowatts)") 
  
  # close the device
  dev.off()
}

