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

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_consumption, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
})
dev.off()

