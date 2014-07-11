##read in the data from the "household_power_consumption.txt" file
power = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##subset out the required dates ie 1st and 2nd February 2007
power2 = subset(power, Date == "1/2/2007" | Date == "2/2/2007")

## convert factor variables to numeric
power2$Global_active_power = as.numeric(as.character(power2$Global_active_power))


## paste the Date and Time variables together with 'paste'
library(stringr)
power2$date_time = paste(power2$Date, power2$Time)
library(lubridate)

## convert date_time to a POSIXct variable with the dmy_hms function from the lubridate package
power2$date_time = dmy_hms(power2$date_time)

## convert sub_metering_# to numeric
power2$sub1 = as.numeric(as.character(power2$Sub_metering_1))
power2$sub2 = as.numeric(as.character(power2$Sub_metering_2))
power2$sub3 = power2$Sub_metering_3

##save plot command
png("plot3.png", width=480, height=480)

## plot
with(power2, plot(date_time, sub1, pch = NA_integer_, ylab = "Energy Sub Metering", xlab = ""))
with(power2, lines(date_time, sub1))
with(power2, lines(date_time, sub2, col="red"))
with(power2, lines(date_time, sub3, col="blue"))

## add the legend
legend("topright", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()