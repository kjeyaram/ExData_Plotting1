HHPower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880, comment.char="")
headers <- read.table("household_power_consumption.txt", sep=";", nrows=1, colClasses = "character")
colnames(HHPower) <- headers
HHPower$Date <- as.Date(HHPower$Date,"%d/%m/%Y")
HHPower$Tmstmp <- strptime(paste(HHPower$Date,HHPower$Time),format='%Y-%m-%d %H:%M:%S')

##Define png device for output
png(file="plot3.png", width=480, height=480, units="px")

## Plot the 3 sub_metering values over time and add a legend
plot(HHPower$Tmstmp,HHPower$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(HHPower$Tmstmp,HHPower$Sub_metering_2, col="red")
lines(HHPower$Tmstmp,HHPower$Sub_metering_3, col="blue")
legend("topright", pch="__", col=c("black", "blue", "red"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##Close png device
dev.off()