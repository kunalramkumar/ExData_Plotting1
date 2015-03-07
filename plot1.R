# Import packages
library(dplyr)

# Read data from source
power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Manipulate date and filter as required
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
gap <- power %>% filter(Global_active_power != "?") %>% select(Global_active_power)
gap$Global_active_power <- as.numeric(gap$Global_active_power)

# Plot histogram and save image
png(filename = "plot1.png", width = 480, height = 480)
par(mar = c(4, 4, 2, 1))
hist(gap$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()