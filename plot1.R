## Reading the data from the working directory
mydata <- read.table(file = "household_power_consumption.txt", 
                   sep = ";", na.strings = "?", header = TRUE)

## Convert the Date and Time variables to Date/Time classes
mydata[,2] <- as.POSIXct(strptime(paste(mydata[,1], mydata[,2]), "%d/%m/%Y %H:%M:%S"))
mydata[,1] <- as.Date(mydata[,1], format = "%d/%m/%Y")

## Subset the data
xxx <- subset(mydata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Open graphic device
png("plot1.png")

## Making a plot 1
hist(xxx[,3], main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

## Close the device
dev.off()