# Plots of power usage in a household on 2 days in February
# Data source: 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# This script assume that the data has been downloaded & unzipped
# to create the file household_power_consumption.txt

# Read in the data then subset it have just the 2 days of interest
# 2 days of interest are Feb 1 and 2, 2007
elec <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?', stringsAsFactors=FALSE)
elec <- subset(elec, Date=='1/2/2007' | Date=='2/2/2007')

# Combine date and time information into a single timestamp value called datetime
elec$datetime <- strptime(paste(elec$Date, elec$Time, sep=' '), format='%d/%m/%Y %H:%M:%S')

# Generate plot 4, a collection of 4 individual time series plots
png(filename="plot3.png", width=480, height=480)
png(filename="plot4.png", width=480, height=480)

par(mfcol = c(2,2))

with(elec,plot(datetime, Global_active_power, type='l',ylab='Global Active Power (kilowatts)',xlab=''))

with(elec,plot(datetime, Sub_metering_1, type='l',ylab='Energy sub metering',xlab='',col='black'))
with(elec,lines(datetime,Sub_metering_2,col='red'))
with(elec,lines(datetime,Sub_metering_3,col='blue'))
legend('topright',bty = 'n', col=c('black','red','blue'), c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1,1))

with(elec,plot(datetime,Voltage, type='l'))

with(elec,plot(datetime,Global_reactive_power, type='l'))

dev.off()  
