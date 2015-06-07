# Only needed once
install.packages("sqldf")
library(sqldf)

# We will only be using data from the dates 2007-02-01 and 2007-02-02
hpc <- read.csv.sql("household_power_consumption.txt",
    sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")',
    header = T, sep =";", stringsAsFactors = F)

# Explore the hpc data
# str(hpc)     # Nice names
# summary(hpc) # No NA => Good!

png("plot1.png", width=480, height=480)
hist(hpc$Global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowats)")
dev.off()
