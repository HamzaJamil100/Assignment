file <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";")
x <- file$Date == "2/1/2007" 
y <- file$Date == "2/2/2007"
file1 <- file[x,]
file2 <- file[y,]
file <- rbind(file1,file2)


file$Date_Time <- paste(file$Date,file$Time) #Merge Date and time column into a new column
file$Date_Time <- as.POSIXlt(file$Date_Time, format = "%m/%d/%Y %H:%M:%S")

file$Sub_metering_1 <- as.numeric(file$Sub_metering_1)
file$Sub_metering_2 <- as.numeric(file$Sub_metering_2)
file$Sub_metering_3 <- as.numeric(file$Sub_metering_3)

x <- file$Date_Time
y1 <- file$Sub_metering_1
y2 <- file$Sub_metering_2
y3 <- file$Sub_metering_3

plot(x, y1, col = "black", lwd = 1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(x, y2, col = "red", lwd = 1, type = "l")
lines(x, y3, col = "blue", lwd = 1, type = "l")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1  )

dev.copy(png, file = "Plot3.png")
dev.off()