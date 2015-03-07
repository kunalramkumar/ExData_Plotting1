#Import packages
library(dplyr)

# Read data from source
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Manipulate date and filter as required
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
sub <- power %>% select(Sub_metering_1, Sub_metering_2, Sub_metering_3, Date, Time)
sub$Date <- as.POSIXct(paste(sub$Date, sub$Time))

# Plot and save image
png(filename = "plot3.png", width = 480, height = 480)
par(mar = c(4, 4, 2, 1))
plot(sub$Sub_metering_1 ~ sub$Date, type = "l", xlab = "", ylab = "Energy sub metering")
lines(sub$Sub_metering_2 ~ sub$Date, col = 'Red')
lines(sub$Sub_metering_3 ~ sub$Date, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, pt.cex = 1, cex = .75, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()