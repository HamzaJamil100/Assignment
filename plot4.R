file <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";")
x <- file$Date == "2/1/2007" 
y <- file$Date == "2/2/2007"
file1 <- file[x,]
file2 <- file[y,]
file <- rbind(file1,file2)


file$Date_Time <- paste(file$Date,file$Time) #Merge Date and time column into a new column
file$Date_Time <- as.POSIXct(file$Date_Time, format = "%m/%d/%Y %H:%M:%S")

file$Global_reactive_power <- as.numeric(file$Global_reactive_power) #Converts character to numeric

file$Voltage <- as.numeric(file$Voltage)

file$Global_active_power <- as.numeric(file$Global_active_power) #Converts character to numeric

file$Sub_metering_1 <- as.numeric(file$Sub_metering_1)
file$Sub_metering_2 <- as.numeric(file$Sub_metering_2)
file$Sub_metering_3 <- as.numeric(file$Sub_metering_3)

x <- file$Date_Time
y1 <- file$Sub_metering_1
y2 <- file$Sub_metering_2
y3 <- file$Sub_metering_3



par(mfcol = c(2,2))

plot(file$Date_Time,file$Global_active_power, lwd = 2,type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(x, y1, col = "black", lwd = 2, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x, y2, col = "red", lwd = 2, type = "l")
lines(x, y3, col = "blue", lwd = 2, type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1  )

plot(file$Date_Time,file$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", lwd = 2)

plot(file$Date_Time,file$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", lwd = 2)

dev.copy(png, file = "Plot4.png")
dev.off()