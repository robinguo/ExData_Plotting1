data <- read.table("household_power_consumption.txt", sep=";", header=T, na.string="?", nrow=2080000,
    colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
datetime <- paste(data$Date, data$Time, sep=" ")
data$Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

png("plot1.png")

hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col = "red")

dev.off()
