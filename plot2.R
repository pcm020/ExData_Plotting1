## Plot 2 for Coursera Explanatory Data Analysis Power Consumption data example.
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
png(file="plot2.png")
#Plot 2
# change to english week names: Sys.setlocale(category = "LC_ALL", locale = "C")
plot(data$Cdate, data$Global_active_power, type="l", xlab=" ",
     ylab="Global Active Power (kilowatts)")
dev.off()


