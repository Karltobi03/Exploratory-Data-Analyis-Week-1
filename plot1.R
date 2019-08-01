###Course Project Week 1####

#Load txt-file household_power_consumption.txt from working directory#

power_consumption <- read.table("household_power_consumption.txt", sep=";", head = TRUE, na.strings = "?")

#Change format of Date#

power_consumption$Date <- as.POSIXct(strptime(power_consumption$Date, format= "%d/%m/%Y"))
format(power_consumption$date, format="%Y-%m-%d")

#Only use Information from 2007-02-01 & 2007-02-02#
library(dplyr)
power_consumption <- filter(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

####First Plot####
##1.Make variable Global_active_power a numeric variable##
power_consumption$Global_active_power <- as.numeric(as.character(power_consumption$Global_active_power))

##2.Construct histogram, save as png with 480x480##
png("plot1.png", width = 480, height = 480)
hist(power_consumption$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()