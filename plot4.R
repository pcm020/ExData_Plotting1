## Plot 4 for Coursera Explanatory Data Analysis Power Consumption data example.
# Get column names
clnames <- read.table("household_power_consumption.txt",
                      nrow = 1, header = TRUE, sep=";")
# Get data only range 1/2/2007 2/2/2007
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
        sep = ";", na.strings="?", 
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
        col.names = colnames(clnames)) 
# Create a new date class column
data$Cdate <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#open file png
png(file="plot4.png")
#Plot 4
par(mfcol = c(2, 2))
#Position 1 1
plot(data$Cdate, data$Global_active_power, type="l", xlab=" ",
     ylab="Global Active Power")
#Position 1 2
plot(data$Cdate, data$Sub_metering_1, type="l", xlab=" ", 
     ylab="Energy sub metering")
points(data$Cdate, data$Sub_metering_2, type="l", col="red")
points(data$Cdate, data$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Position 2 1
plot(data$Cdate, data$Voltage, type="l", xlab="datetime", 
     ylab="Voltage")
#Position 2 2
with(data, {plot(Cdate, Global_reactive_power, type="l", xlab="datetime") })
dev.off()
