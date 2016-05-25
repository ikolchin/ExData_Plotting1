Sys.setlocale("LC_ALL", "English")

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
               stringsAsFactors = FALSE)
df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))
df$Date_time <- paste(df$Date, df$Time)
df$Date_time <- strptime(df$Date_time, "%d/%m/%Y %H:%M:%S")
df$Date_time <- as.POSIXct(df$Date_time)

png("plot2.png")
plot(df$Date_time, df$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()