## This program makes a copy of plot 1.

## read in file
##file_hhpower_data <- read.csv2("household_power_consumption.txt")

file_hhpower_data<- read.table("household_power_consumption.txt",
              colClasses = c("character", "character", rep("numeric",7)), 
              header = TRUE, sep = ";", na.strings = "?")

## convert dates to date format
file_hhpower_data$Convdates = as.Date(file_hhpower_data$Date, format = "%d/%m/%Y")

## subset Feb. 1 & 2, 2007
doi <- subset(file_hhpower_data, Convdates == '2007-02-01' | Convdates == '2007-02-02')

## open png device
png(filename = "plot1.png")

## print histogram
## THIS CODE IS NO LONGER NECESSARY SINCE VAR NOT BEING READ IN AS A FACTOR
##hist(as.numeric(levels(doi$Global_active_power))[doi$Global_active_power], 
##     col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

hist(doi$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)" )

## close png device
dev.off()
