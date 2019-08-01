###Course Project Week 1####

#Load txt-file household_power_consumption.txt from working directory#

power_consumption <- read.table("household_power_consumption.txt", sep=";", head = TRUE, na.strings = "?")

#Change format of Date#

power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

#Only use Information from 2007-02-01 & 2007-02-02#

library(dplyr)
power_consumption <- filter(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")

#Convert dates#

datetime <- paste(as.Date(power_consumption$Date), power_consumption$Time)
power_consumption$Datetime <- as.POSIXct(datetime)

####Second Plot####
##1.Make variable Global_active_power a numeric variable##
power_consumption$Global_active_power <- as.numeric(as.character(power_consumption$Global_active_power))

##2.Construct plot, save as png with 480x480##
png("plot3.png", width = 480, height = 480)
with(power_consumption, {
  plot(Sub_metering_1~Datetime,type="l",xlab="",ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright",lty=1, lwd=2, col = c("black", "red","blue"), legend = c("sub_metering_1","sub_metering_2","sub_metering_3"))
dev.off()
