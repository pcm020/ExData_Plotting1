## Plot 1 for Coursera Explanatory Data Analysis Power Consumption data example.
# Get column names
clnames <- read.table("household_power_consumption.txt",
                      nrow = 1, header = TRUE, sep=";")
# Get data only range 1/2/2007 2/2/2007
data <- read.table("household_power_consumption.txt", skip = 66637, nrow = 2880,
        sep = ";", na.strings="?", 
        colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
        col.names = colnames(clnames)) 

#open file png
png(file="plot1.png")

#Histogram Plot 1
hist(data$Global_active_power, main = "Global Active Power", xlab= "Global Active Power (kilowatts)", col = "red")

dev.off()

