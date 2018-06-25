URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = URL, destfile = "Ass1.zip")
unzip("Ass1.zip")

#Read data 
Household <- read_delim("household_power_consumption.txt",
                        ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y"),
                                                                     Time = col_time(format = "%H:%M: %S")), trim_ws = TRUE)

#Subset for the date range analyzed into a "Mini" version of the data set 
HouseholdMini <- filter(Household, Household$Date >= "2007-02-01" & Household$Date <= "2007-02-02")

#Combine Date and Time into one continuous variable named DT
HouseholdMini$DT <- strptime(paste(HouseholdMini$Date, HouseholdMini$Time), "%Y-%m-%d %H:%M:%S")

png("plot3.png", width = 480, height = 480)
plot(HouseholdMini$DT, HouseholdMini$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(HouseholdMini$DT, HouseholdMini$Sub_metering_2, col = "red")
lines(HouseholdMini$DT, HouseholdMini$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
