#Import packages
library(dplyr)

# Read data from source
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Manipulate date and filter as required
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
gap <- power %>% filter(Global_active_power != "?") %>% select(Global_active_power, Date, Time)
gap$Global_active_power <- as.numeric(gap$Global_active_power)
gap$Date <- as.POSIXct(paste(gap$Date, gap$Time))

# Plot and save image
png(filename = "plot2.png", width = 480, height = 480)
par(mar = c(4, 4, 2, 1))
plot(gap$Global_active_power ~ gap$Date, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()