
file_name = "household_power_consumption.txt"
data <- read.table(file = file_name, header = TRUE, sep = ";", na.strings = "?")

data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data <- data[data$datetime >= strptime(paste("01/02/2007", "00:00:00"), "%d/%m/%Y %H:%M:%S"),]
data <- data[data$datetime <= strptime(paste("02/02/2007", "23:59:59"), "%d/%m/%Y %H:%M:%S"),]

head(data, n = 10)

## plot number 2
png("plot2.png", bg = "White")
with(data, {plot(datetime,
                 Global_active_power,
                 type = "l",
                 xlab = "",
                 ylab = "Global Active Power (kilowatts)")})
dev.off()

