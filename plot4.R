#Reading data from file. File MUST be in working directory root
power_data <- read.table("household_power_consumption.txt", na.strings = "?",
                         header = TRUE, sep = ";", dec = ".")
#converting frames to dates
power_data[,1] <- as.Date(power_data[,1], format = "%d/%m/%Y")
#leaving in memory only two dates:  1st and 2nd of February 2007 
power_data <- subset(power_data, (power_data[,1] == "2007-02-01") | (power_data[,1] == "2007-02-02"))
#setting the number of plots in the device (just for the case)
par(mfrow = c(2,2))
#openig PNG device
png(filename = "plot4.png", width = 480, height = 480)
#plotting histogramm
with(power_data, 
{
  #TOP_LEFT
  #plotting
  plot(Global_active_power, #data
       type ="l",           #graph type = line
       xaxt = "n",          #no ticks on x-axis
       xlab = "",           #no x-axis name
       ylab = "Global Active Power") #y-axis name
  #adding a new x-axis
  axis(side = 1, labels = c("Thu", "Fri", "Sat"), 
       at = c(0, length(Global_active_power)/2, length(Global_active_power)), tick = TRUE)
  
  #TOP_RIGHT
  #plotting
  plot(Voltage, #data
       type ="l",           #graph type = line
       xaxt = "n",          #no ticks on x-axis
       xlab = "",           #no x-axis name
       ylab = "Voltage") #y-axis name
  #adding a new x-axis
  axis(side = 1, labels = c("Thu", "Fri", "Sat"), 
       at = c(0, length(Global_active_power)/2, length(Global_active_power)), tick = TRUE)
  #adding titile
  title(sub = "datetime")
  
  #BOTTOM_LEFT
  #plotting
  plot(Sub_metering_1, #data
       type ="l",           #graph type = line
       xaxt = "n",          #no ticks on x-axis
       xlab = "",           #no x-axis name
       ylab = "Energy sub metering") #y-axis name
  #adding points with different colours
  points(Sub_metering_2, type = "l", col = "red")
  points(Sub_metering_3, type = "l", col = "blue")
  #adding legend
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
         col = c("black", "red", "blue"), lty = 1)
  #adding a new x-axis
  axis(side = 1, labels = c("Thu", "Fri", "Sat"), 
       at = c(0, length(Global_active_power)/2, length(Global_active_power)), tick = TRUE)
  
  #BOTTOM_RIGHT
  #plotting
  plot(Global_reactive_power, #data
       type ="l",           #graph type = line
       xaxt = "n",          #no ticks on x-axis
       xlab = "")           #no x-axis name
  #adding a new x-axis
  axis(side = 1, labels = c("Thu", "Fri", "Sat"), 
       at = c(0, length(Global_reactive_power)/2, length(Global_active_power)), tick = TRUE)
  title(sub = "datetime")
})
#closing device. Now you have a "plot1.png" file in the working directory
dev.off()