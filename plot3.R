data <- read.table("household_power_consumption.txt", sep=";", header=T, na.string="?", nrow=2080000,
    colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
datetime <- paste(data$Date, data$Time, sep=" ")
data$Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(data$Datetime, data$Sub_metering_1, type="l", pch=NA, xlab="", ylab="")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty=1, pch=NA)
title(ylab="Energy sub metering")

dev.off()
