#Import packages
library(dplyr)

# Read data from source
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Manipulate date and filter as required
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
power$DateTime <- as.POSIXct(paste(power$Date, power$Time))

# Plot and save image
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
plot(power$Global_active_power ~ power$DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(power$Voltage ~ power$DateTime, type = "l", xlab = "datetime", ylab = "Voltage")

plot(power$Sub_metering_1 ~ power$DateTime, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power$Sub_metering_2 ~ power$DateTime, col = 'Red')
lines(power$Sub_metering_3 ~ power$DateTime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, pt.cex = 1, cex = .5, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power$Global_reactive_power ~ power$DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()