setwd("C:/Users/nauman/Documents/Coursera/Exploratory Data Analysis")
library(ggplot2)

##reading, naming and subsetting the power consumption data

power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Data", "Time" ,"Global_active_power","Global_reactive_power","Voltage", "Gloabal_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power, power$Data=="1/2/2007"|power$Data=="2/2/2007")

##calling a basic plot function

hist(as.numeric(as.character(subpower$Global_active_power)),col = "red", main = "Global Active Power", xlab = "Gloabal Active power(kilowatts)",ylab = "Frequency")
dev.copy(png,file="plot1.png", height = 480, width = 480)
dev.off()
