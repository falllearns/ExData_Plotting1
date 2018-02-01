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
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$Time <- format(strptime(dat$Time, "%H:%M:%S"), "%H:%M:%S")
dat <- dat[which(dat$Date == as.Date("01/02/2007", "%d/%m/%Y") | dat$Date == as.Date("02/02/2007", "%d/%m/%Y")),]
png(filename = 'plot1.png')
hist(dat$Global_active_power,main = "Global Active Power", xlim = c(0,6), freq = T,xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red",xaxt='n')
axis(side=1,at=seq(0,6,2),labels=seq(0,6,2))
dev.off()