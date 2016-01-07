## Reading the data from the working directory
mydata <- read.table(file = "household_power_consumption.txt", 
                     sep = ";", na.strings = "?", header = TRUE)

## Convert the Date and Time variables to Date/Time classes
mydata[,2] <- as.POSIXct(strptime(paste(mydata[,1], mydata[,2]), "%d/%m/%Y %H:%M:%S"))
mydata[,1] <- as.Date(mydata[,1], format = "%d/%m/%Y")

## Subset the data
xxx <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Open graphic device
png("plot4.png",width = 480, height = 480)

## Making a plot 4
par(mfrow = c(2, 2), ps = 14, mar = c(4,4,1,1))
plot(xxx[,2], xxx[,3], type = "l", xlab = "", 
     ylab = "Global Active Power")
plot(xxx[,2], xxx[,5], type = "l", ylab = "Voltage", xlab = "datetime")
with(xxx, plot(xxx$Time, xxx$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(subset(xxx["Sub_metering_1"]), lines(xxx$Time, xxx$Sub_metering_1))
with(subset(xxx["Sub_metering_2"]), lines(xxx$Time, xxx$Sub_metering_2, col = "red"))
with(subset(xxx["Sub_metering_3"]), lines(xxx$Time, xxx$Sub_metering_3, col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3") ,bty="n", cex = 0.8)
plot(xxx[,2], xxx[,4], type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Close the device
dev.off()