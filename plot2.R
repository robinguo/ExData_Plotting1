data <- read.table("household_power_consumption.txt", sep=";", header=T, na.string="?", nrow=2080000,
    colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
datetime <- paste(data$Date, data$Time, sep=" ")
data$Datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(data$Datetime, data$Global_active_power, type="l", pch=NA, xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

