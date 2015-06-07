# Only needed once
# install.packages("sqldf")
# library(sqldf)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
hpc <- read.csv.sql("household_power_consumption.txt",
    sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")',
    header = T, sep =";", stringsAsFactors = F)

gap <- hpc$Global_active_power
dateTime1 <- paste(hpc$Date, hpc$Time) # "1/2/2007 00:00:00" ...
dateTime2 <- strptime(dateTime1, format="%d/%m/%Y %H:%M:%S ")
# str(dateTime2)

png("plot2.png", width=480, height=480)
plot(dateTime2, gap, main="Global Active Power", type="l", xlab="",
     ylab="Global Active Power (kilowats)")
dev.off()
