Sys.setlocale("LC_ALL", "English")

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
               stringsAsFactors = FALSE)
df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))
df$Date_time <- paste(df$Date, df$Time)
df$Date_time <- strptime(df$Date_time, "%d/%m/%Y %H:%M:%S")
df$Date_time <- as.POSIXct(df$Date_time)

png("plot4.png")
par(mfrow = c(2, 2))
plot(df$Date_time, df$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power")
plot(df$Date_time, df$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")
plot(df$Date_time, df$Sub_metering_1, type = "l", col = "black", xlab = "",
     ylab = "Energy sub metering")
lines(df$Date_time, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date_time, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, col=c("black", "red", "blue"))
plot(df$Date_time, df$Global_reactive_power, type = "l", xlab = "datetime",
     ylab="Global_reactive_power")
dev.off()