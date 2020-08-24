file <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";")
x <- file$Date == "2/1/2007" 
y <- file$Date == "2/2/2007"
file1 <- file[x,]
file2 <- file[y,]
file <- rbind(file1,file2)


file$Date_Time <- paste(file$Date,file$Time) #Merge Date and time column into a new column
file$Date_Time <- as.POSIXct(file$Date_Time, format = "%m/%d/%Y %H:%M:%S")

file$Global_active_power <- as.numeric(file$Global_active_power) #Converts character to numeric

plot(file$Date_Time,file$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.copy(png, file = "Plot2.png")
dev.off()