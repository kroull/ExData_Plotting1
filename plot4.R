# Only needed once. Done in plot1
# install.packages("sqldf")
# library(sqldf)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
hpc <- read.csv.sql("household_power_consumption.txt",
    sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")',
    header = T, sep =";", stringsAsFactors = F)

gap <- hpc$Global_active_power
sm1 <- hpc$Sub_metering_1
sm2 <- hpc$Sub_metering_2
sm3 <- hpc$Sub_metering_3
Voltage <- hpc$Voltage
Global_reactive_power <- hpc$Global_reactive_power
dateTime1 <- paste(hpc$Date, hpc$Time) # "1/2/2007 00:00:00" ...
datetime  <- strptime(dateTime1, format="%d/%m/%Y %H:%M:%S ")

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power")

plot(datetime, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, sm2, col="red")
lines(datetime, sm3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"), bty="n")

plot(datetime, Voltage, type="l")

plot(datetime, Global_reactive_power, type="l")

dev.off()

par(mfcol = c(1,1))
