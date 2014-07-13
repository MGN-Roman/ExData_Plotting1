#Reading data from file. File MUST be in working directory root
power_data <- read.table("household_power_consumption.txt", na.strings = "?",
                      header = TRUE, sep = ";", dec = ".")
#converting frames to dates
power_data[,1] <- as.Date(power_data[,1], format = "%d/%m/%Y")
#leaving in memory only two dates:  1st and 2nd of February 2007 
power_data <- subset(power_data, (power_data[,1] == "2007-02-01") | (power_data[,1] == "2007-02-02"))
#setting the number of plots in the device (just for the case)
par(mfrow = c(1,1))
#openig PNG device
png(filename = "plot1.png", width = 480, height = 480)
#plotting histogramm
with(power_data, hist(Global_active_power, ylab = "Frequency", breaks = 20,
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))
#closing device. Now you have a "plot1.png" file in the working directory
dev.off()