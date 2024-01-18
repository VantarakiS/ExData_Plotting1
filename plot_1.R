# readfile
f <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
f$Date <- as.Date(f$Date, format="%d/%m/%Y")

# data check
head(f)
tail(f)

# rename the columns
colnames(f) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", 
                 "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# subset data in the two days indicated
data <- subset(f, Date %in% as.Date(c("1/2/2007", "2/2/2007"), format="%d/%m/%Y"))

# plot1
png("plot_1.png", width = 480, height = 480, units = "px" )
hist(data$Global_active_power, col = "yellow", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
