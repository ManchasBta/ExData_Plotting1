# Exploratory Data Analysis
# By MAVC 08/02/2015

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE)
power_consumption_subset <- household_power_consumption[complete.cases(household_power_consumption),]
power_consumption_subset <- power_consumption_subset[which(power_consumption_subset$Date == "1/2/2007" | power_consumption_subset$Date == "2/2/2007"),]
power_consumption_subset$Time <- paste(as.character(power_consumption_subset$Date),as.character(power_consumption_subset$Time), sep= " ")
power_consumption_subset$Date <- as.Date(power_consumption_subset$Date, '%d/%m/%Y')
power_consumption_subset$Time <- strptime(power_consumption_subset$Time,  '%d/%m/%Y %H:%M:%S')
power_consumption_subset$Global_active_power<-as.numeric(levels(power_consumption_subset$Global_active_power))[power_consumption_subset$Global_active_power]
power_consumption_subset$Global_reactive_power<-as.numeric(levels(power_consumption_subset$Global_reactive_power))[power_consumption_subset$Global_reactive_power]
power_consumption_subset$Voltage<-as.numeric(levels(power_consumption_subset$Voltage))[power_consumption_subset$Voltage]
power_consumption_subset$Sub_metering_1<-as.numeric(levels(power_consumption_subset$Sub_metering_1))[power_consumption_subset$Sub_metering_1]
power_consumption_subset$Sub_metering_2<-as.numeric(levels(power_consumption_subset$Sub_metering_2))[power_consumption_subset$Sub_metering_2]
power_consumption_subset$Sub_metering_3<-as.numeric(levels(power_consumption_subset$Sub_metering_3))[power_consumption_subset$Sub_metering_3]
par(mfrow = c(2, 2))
plot(power_consumption_subset$Time,power_consumption_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(power_consumption_subset$Time,power_consumption_subset$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(power_consumption_subset$Time,power_consumption_subset$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n", ylim = c(0,40))
points(power_consumption_subset$Time, power_consumption_subset$Sub_metering_1, type = "l")
points(power_consumption_subset$Time, power_consumption_subset$Sub_metering_2, type = "l", col = "Blue")
points(power_consumption_subset$Time, power_consumption_subset$Sub_metering_3, type = "l", col = "Red")
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
plot(power_consumption_subset$Time, power_consumption_subset$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, 'plot4.png')
dev.off()