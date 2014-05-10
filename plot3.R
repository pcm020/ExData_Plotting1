## Plot 3 for Coursera Explanatory Data Analysis Power Consumption data example.
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
png(file="plot3.png")
#Plot 3
# change to english day of week names: Sys.setlocale(category = "LC_ALL", locale = "C")
plot(data$Cdate, data$Sub_metering_1, type="l", xlab=" ", 
     ylab="Energy sub metering")
points(data$Cdate, data$Sub_metering_2, type="l", col="red")
points(data$Cdate, data$Sub_metering_3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


