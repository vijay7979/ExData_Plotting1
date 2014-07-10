power = read.table("household_power_consumption.txt", header = TRUE, sep = ";")
power2 = subset(power, Date == "1/2/2007" | Date == "2/2/2007")
power2$Global_active_power = as.numeric(as.character(power2$Global_active_power))
library(stringr)
## paste the Date and Time variables together with 'paste'
power2$date_time = paste(power2$Date, power2$Time)
library(lubridate)
## covert date_time to a POSIXct variable with the dmy_hms function from the lubridate package
power2$date_time = dmy_hms(power2$date_time)
##plot and name axises
with(power2, plot(date_time, Global_active_power, pch=NA_integer_ , ylab = "Global Active Power (kilowatts)", xlab = ""))
## Add the line
with(power2, lines(date_time, Global_active_power))
## save the plot to a png file
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()