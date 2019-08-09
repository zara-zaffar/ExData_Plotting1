
## reading, naming and subsetting the power consumption data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subpower <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

## Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively

datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subpower$Global_active_power)

subMetering1 <- as.numeric(subpower$Sub_metering_1)

subMetering2 <- as.numeric(subpower$Sub_metering_2)

subMetering3 <- as.numeric(subpower$Sub_metering_3)

## calling the basic plot function

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## annotating graph

title(main = "Energy Sub_Metering")

dev.copy(png,file="plot3.png", height = 480, width = 480)

dev.off()



