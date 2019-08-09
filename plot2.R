
## reading, naming and subsetting the power consumption data

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

subpower <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

## Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively

datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subpower$Global_active_power)

## calling the basic plot function

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

## annotating graph

title(main = "Global Active Power vs Time")

dev.copy(png,file="plot2.png", height = 480, width = 480)

dev.off()
