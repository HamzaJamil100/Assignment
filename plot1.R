file <- read.csv("household_power_consumption.txt",header = TRUE, sep = ";")
x <- file$Date == "1/2/2007" 
y <- file$Date == "2/2/2007"
file1 <- file[x,]
file2 <- file[x,]
file <- rbind(file1,file2)

par(mfrow = c(1,1))
par(mar = c(4,4,1,1))
task1 <- file$Global_active_power
task1 <- as.numeric(task1)
hist(task1, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")


dev.copy(png, file = "Plot1.png")
dev.off()