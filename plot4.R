HHPower <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip=66636, nrows=2880, comment.char="")
headers <- read.table("household_power_consumption.txt", sep=";", nrows=1, colClasses = "character")
colnames(HHPower) <- headers
HHPower$Date <- as.Date(HHPower$Date,"%d/%m/%Y")
HHPower$Tmstmp <- strptime(paste(HHPower$Date,HHPower$Time),format='%Y-%m-%d %H:%M:%S')

##Define png device for output
png(file="plot4.png", width=480, height=480, units="px")

## Specify layout for multiple base plots
par(mfrow = c(2,2))

with(HHPower, {
  
  ## Plot global active power over time
  plot(Tmstmp,Global_active_power,type="l", 
       main="", xlab="", ylab="Global Active Power")
  
  ## Plot voltage over time
  plot(Tmstmp,Voltage,type="l", 
       main="", xlab="datetime", ylab="Voltage")
  
  ## Plot the 3 sub_metering values over time and add a legend
  plot(Tmstmp,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(Tmstmp,Sub_metering_2, col="red")
  lines(Tmstmp,Sub_metering_3, col="blue")
  legend("topright", pch="__", col=c("black", "blue", "red"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Plot global reactive power over time
  plot(Tmstmp,Global_reactive_power,type="l", 
       main="", xlab="datetime", ylab="Global_reactive_power")
})

dev.off()