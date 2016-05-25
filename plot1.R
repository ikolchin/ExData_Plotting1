Sys.setlocale("LC_ALL", "English")

df <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
               stringsAsFactors = FALSE)
df <- subset(df, df$Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png")
hist(df$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()