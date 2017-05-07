## Plot1.R

# Clean previous variables if needed:
rm(list=ls())

# Read Data:
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors=FALSE) # colClasses=c("Date", "NULL","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
                   
# Add a POSIXlt POSIXt column to the data
x<-paste(data$Date,data$Time)
data$DateR <- strptime(x,format = "%d/%m/%Y %H:%M:%S")

# Subset the data:
start_date <- strptime("01/02/2007",format = "%d/%m/%Y")
end_date   <- strptime("03/02/2007",format = "%d/%m/%Y")
sub_data   <- subset(data, DateR >= start_date & DateR <= end_date, na.strings = "?")

# Plot 1:
png(filename = "plot1.png",width = 480, height = 480)
with(sub_data, hist(Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", 
                    main="Global Active Power", breaks = 20, col="red",xlim=c(0,6)))   
     
dev.off()     
