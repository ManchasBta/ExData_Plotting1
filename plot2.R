# Exploratory Data Analysis
# By MAVC 08/02/2015

household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", header = TRUE)
power_consumption_subset <- household_power_consumption[complete.cases(household_power_consumption),]
power_consumption_subset <- power_consumption_subset[which(power_consumption_subset$Date == "1/2/2007" | power_consumption_subset$Date == "2/2/2007"),]
power_consumption_subset$Time <- paste(as.character(power_consumption_subset$Date),as.character(power_consumption_subset$Time), sep= " ")
power_consumption_subset$Date <- as.Date(power_consumption_subset$Date, '%d/%m/%Y')
power_consumption_subset$Time <- strptime(power_consumption_subset$Time,  '%d/%m/%Y %H:%M:%S')
power_consumption_subset$Global_active_power<-as.numeric(levels(power_consumption_subset$Global_active_power))[power_consumption_subset$Global_active_power]
plot(power_consumption_subset$Time,power_consumption_subset$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, 'plot2.png')
dev.off()