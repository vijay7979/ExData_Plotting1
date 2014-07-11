##read in the data from the "household_power_consumption.txt" file
power = read.table("household_power_consumption.txt", header = TRUE, sep = ";")

##subset out the required dates ie 1st and 2nd February 2007
power2 = subset(power, Date == "1/2/2007" | Date == "2/2/2007")

##convert factor variables to numeric
power2$Global_active_power = as.numeric(as.character(power2$Global_active_power))
power2$Global_reactive_power = as.numeric(as.character(power2$Global_reactive_power))
power2$Voltage = as.numeric(as.character(power2$Voltage))

## paste the Date and Time variables together with 'paste'
library(stringr)
power2$date_time = paste(power2$Date, power2$Time)

## convert date_time to a POSIXct variable with the dmy_hms function from the lubridate package
library(lubridate)
power2$date_time = dmy_hms(power2$date_time)

## convert sub_metering_x to numeric
power2$sub1 = as.numeric(as.character(power2$Sub_metering_1))
power2$sub2 = as.numeric(as.character(power2$Sub_metering_2))
power2$sub3 = power2$Sub_metering_3

##save plot command
png("plot4.png", width=480, height=480)

## set the number of rows and columns for the plots
par(mfrow = c(2,2))

##plot
with (power2, {
  ##row 1, col 1 plot
  plot(date_time, Global_active_power, pch=NA_integer_ , ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(date_time, Global_active_power)
  ##row 1, col 2 plot
  plot(date_time, Voltage, pch=NA_integer_ , ylab = "Voltage", xlab = "datetime")
  lines(date_time, Voltage)
  ##row 2, col 1 plot
  plot(date_time, sub1, pch = NA_integer_, ylab = "Energy Sub Metering", xlab = "")
  lines(date_time, sub1)
  lines(date_time, sub2, col="red")
  lines(date_time, sub3, col="blue")
  legend("topright", lty="solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  ##row 2, col 2 plot
  plot(date_time, Global_reactive_power, pch=NA_integer_ , ylab = "Global_reactive_power", xlab = "datetime")
  lines(date_time, Global_reactive_power)  
  
})

dev.off()