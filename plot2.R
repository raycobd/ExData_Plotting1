#Reading data 
##(since the data is ordered, looking the file we can skip all lines after 70000 with confident )
data <- read.table(file.path(".", "household_power_consumption.txt"),nrows=70000, header=TRUE, sep=";",quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
selectedDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#uniform format for date (same number of digit per date)
selectedDays$Date <- as.Date(selectedDays$Date, format = "%d/%m/%Y")
#timeline data to draw over 
selectedDays$DateTime <- as.POSIXct(paste(selectedDays$Date, selectedDays$Time))

#Generate and export PNG
png("plot2.png", width=504, height=504)
plot(selectedDays$DateTime, selectedDays$Global_active_power,type='l', ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()