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

png("plot2.png", width = 480, height = 480)
# Plot line graph (type = "l")
plot(HouseholdMini$DT, HouseholdMini$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts", xlab = "")
dev.off()