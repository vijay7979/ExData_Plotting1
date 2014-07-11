
## read in the data from the "household_power_consumption.txt" file
power = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

## subset out the rquired dates
power2 = subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## convert Global_active_power to numeric
power2$Global_active_power = as.numeric(as.character(power2$Global_active_power))

## create the histogram
hist (power2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## save the plot
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()