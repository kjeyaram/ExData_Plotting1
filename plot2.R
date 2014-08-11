HHPower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880, comment.char="")
headers <- read.table("household_power_consumption.txt", sep=";", nrows=1, colClasses = "character")
colnames(HHPower) <- headers
HHPower$Date <- as.Date(HHPower$Date,"%d/%m/%Y")
HHPower$Tmstmp <- strptime(paste(HHPower$Date,HHPower$Time),format='%Y-%m-%d %H:%M:%S')
png(file="plot2.png", width=480, height=480, units="px")
plot(HHPower$Tmstmp,HHPower$Global_active_power,type="l",ylab="Global Active Power(kilowatts)", xlab="")
dev.off()