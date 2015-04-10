## This program makes a copy of plot 3.

## read in file
##file_hhpower_data <- read.csv2("household_power_consumption.txt")

file_hhpower_data<- read.table("household_power_consumption.txt",
                               colClasses = c("character", "character", rep("numeric",7)), 
                               header = TRUE, sep = ";", na.strings = "?")

## convert dates to date format
file_hhpower_data$Convdates = as.Date(file_hhpower_data$Date, format = "%d/%m/%Y")

## subset Feb. 1 & 2, 2007
doi <- subset(file_hhpower_data, Convdates == '2007-02-01' | Convdates == '2007-02-02')

## combine date and time columns into one new column
doi$newt <- paste(doi$Date, doi$Time)

## convert date/time to R time class POSIXlt.
doi$Rtime <- strptime(doi$newt, format = "%d/%m/%Y %H:%M:%S")


## open png device
png(filename = "plot3.png")

## print line plot for submeter 1.  Add lines for submeters 2 & 3.  
plot(doi$Rtime, doi$Sub_metering_1, ylab = "Energy Sub Metering", type = "l", xlab = "")
lines(doi$Rtime, doi$Sub_metering_2, col = "red")
lines(doi$Rtime, doi$Sub_metering_3, col = "blue")

## Add a legend to the chart
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
    lty = c(1,1,1), col = c("black","red","blue"))

## close png device
dev.off()


