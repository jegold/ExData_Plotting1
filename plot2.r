## This program makes a copy of plot 2.

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
doi$Rtime <- strptime(doi$newt, format = "%d/%m/%Y %H:%S:%M")


## open png device
png(filename = "plot2.png")

## print line plot.  Make sure no label is given on the x-axis.

plot(doi$Rtime, doi$Global_active_power, ylab = "Global Active Power (kilowatts)",
     type = "l", xlab = "")

## close png device
dev.off()

