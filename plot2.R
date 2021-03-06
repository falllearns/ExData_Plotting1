#Dataset: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Date: Date in format dd/mm/yyyy
#Time: time in format hh:mm:ss
#Global_active_power: household global minute-averaged active power (in kilowatt)
#Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
#Voltage: minute-averaged voltage (in volt)
#Global_intensity: household global minute-averaged current intensity (in ampere)
#Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
#Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
#Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
dat <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings='?',colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
dat$Time <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y%H:%M:%S")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat<-subset(dat,dat$Date == as.Date("01/02/2007", "%d/%m/%Y") | dat$Date == as.Date("02/02/2007", "%d/%m/%Y"))# | dat$Date == as.Date("03/02/2007", "%d/%m/%Y"))
png(filename = 'plot2.png')
plot(dat$Time, dat$Global_active_power, type='l', ylab = "Global Active Power (kilowatts)", xlab='')
dev.off()
