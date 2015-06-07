# Only needed once. Done in plot1
# install.packages("sqldf")
# library(sqldf)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
hpc <- read.csv.sql("household_power_consumption.txt",
    sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")',
    header = T, sep =";", stringsAsFactors = F)

# str(hpc)     # Look for new variable names
sm1 <- hpc$Sub_metering_1
sm2 <- hpc$Sub_metering_2
sm3 <- hpc$Sub_metering_3
dateTime1 <- paste(hpc$Date, hpc$Time) # "1/2/2007 00:00:00" ...
dateTime2 <- strptime(dateTime1, format="%d/%m/%Y %H:%M:%S ")

png("plot3.png", width=480, height=480)
plot(dateTime2, sm1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime2, sm2, col="red")
lines(dateTime2, sm3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()
