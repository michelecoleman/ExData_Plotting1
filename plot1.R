# Plot of power usage in a household on 2 days in February
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

# Generate plot 1, distibution of "Global Active Power"
png(filename="plot1.png", width=480, height=480)
hist(elec$Global_active_power, main='Global Active Power', col='red', ylab='Frequency',xlab='Global Active Power (kilowatts)', ylim=c(0,1200))
dev.off()  
