HHPower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880, comment.char="")
headers <- read.table("household_power_consumption.txt", sep=";", nrows=1, colClasses = "character")
colnames(HHPower) <- headers
HHPower$Date <- as.Date(HHPower$Date,"%d/%m/%Y")
png(file="plot1.png", width=480, height=480, units="px")
hist(HHPower$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()