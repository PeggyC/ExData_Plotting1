## Plot3.R

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

# Plot 3:
png(filename = "plot3.png",width = 480, height = 480)
with(sub_data, plot(DateR,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col="black"),
     ylim=range(Sub_metering_1))
with(sub_data, lines(DateR,Sub_metering_2,col="red"))
with(sub_data, lines(DateR,Sub_metering_3,col="blue"))
legend("topright",legend=names(sub_data[7:9]),col=c("black","red","blue"),lty=c(1,1,1))

dev.off()     
