## Reading the data from the working directory
mydata <- read.table(file = "household_power_consumption.txt", 
                     sep = ";", na.strings = "?", header = TRUE)

## Convert the Date and Time variables to Date/Time classes
mydata[,2] <- as.POSIXct(strptime(paste(mydata[,1], mydata[,2]), "%d/%m/%Y %H:%M:%S"))
mydata[,1] <- as.Date(mydata[,1], format = "%d/%m/%Y")

## Subset the data
xxx <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Open graphic device
png("plot2.png",width = 480, height = 480)

## Making a plot 2
plot(xxx[,2], xxx[,3], type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")

## Close the device
dev.off()