#Reading data 
##(since the data is ordered, looking the file we can skip all lines after 70000 with confident )
data <- read.table(file.path(".", "household_power_consumption.txt"),nrows=70000, header=TRUE, sep=";",quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
selectedDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#uniform format for date (same number of digit per date)
selectedDays$Date <- as.Date(selectedDays$Date, format = "%d/%m/%Y")
#timeline data to draw over 
selectedDays$DateTime <- as.POSIXct(paste(selectedDays$Date, selectedDays$Time))

#Generate and export PNG
png("plot4.png", width = 504, height = 504)
par(mfcol=c(2,2))
plot(selectedDays$DateTime, selectedDays$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(selectedDays$DateTime, selectedDays$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(selectedDays$DateTime, selectedDays$Sub_metering_2, type="l", col="red")
lines(selectedDays$DateTime, selectedDays$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(selectedDays$DateTime,selectedDays$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(selectedDays$DateTime,selectedDays$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()