#Reading data 
##(since the data is ordered, looking the file we can skip all lines after 70000 with confident )
data <- read.table(file.path(".", "household_power_consumption.txt"),nrows=70000, header=TRUE, sep=";",quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
selectedDays <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Generate and export PNG
png("plot1.png", width=504, height=504)
hist(selectedDays$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()