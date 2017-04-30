
file_name = "household_power_consumption.txt"
data <- read.table(file = file_name, header = TRUE, sep = ";", na.strings = "?")

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- data[data$datetime >= strptime(paste("01/02/2007", "00:00:00"), "%d/%m/%Y %H:%M:%S"),]
data <- data[data$datetime <= strptime(paste("02/02/2007", "23:59:59"), "%d/%m/%Y %H:%M:%S"),]

head(data, n = 10)


# Plot number 4
png("plot4.png", bg = "White")

par(mfrow=c(2, 2))
with(data, {
    
    # Plot TL
    plot(datetime,
         Global_active_power,
         type = "l",
         xlab = "",
         ylab = "Global Active Power")
    
    # Plot TR
    plot(datetime,
         Voltage,
         type = "l",
         xlab = "datetime",
         ylab = "Voltage")
    
    # Plot BR
    plot(datetime,
         Sub_metering_1,
         type = "n",
         xlab = "",
         ylab = "Energy sub metering")
    
    lines(datetime,
          Sub_metering_1,
          col = "black")
    lines(datetime,
          Sub_metering_2,
          col = "red")
    lines(datetime,
          Sub_metering_3,
          col = "blue")
    
    legend("topright",
           legend = c("Sub_meterig_1","Sub_meterig_2","Sub_meterig_3"),
           col = c("black", "red", "blue"), 
           lty = "solid")
    
    # Plot BR
    plot(datetime,
         Global_reactive_power,
         type = "l")
    
})

dev.off()