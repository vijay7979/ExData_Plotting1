
power = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power2 = subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power2$Global_active_power = as.numeric(as.character(power2$Global_active_power))
hist (power2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()