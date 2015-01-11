## reading the Data

a <- read.table("~/Coursera/Exploratory Data Analysis/Assignment1/household_power_consumption.txt", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), 
                nrow = 2879, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE)))
write.csv(a, "a.csv", sep = ";", row.names = FALSE)

df <- read.csv("~/Coursera/Exploratory Data Analysis/Assignment1/ExData_plotting1/a.csv", header = TRUE)

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S") ## Convert to Time:POSIXlt


## open picture file
output <- file("~/Coursera/Exploratory Data Analysis/Assignment1/ExData_plotting1/plot1.png")

# Describe png device
png(filename = 'plot4.png', width = 480, height = 480)
# Define multiplot variables
par(mfrow = c(2,2), mar = c(5,4,4,2), bg=NA)

# Plot
with(df, {
  
  # Plot 1
  plot(Global_active_power, type = "l", ylab = "Global Active Power", 
       xaxt = "n", xlab = "", cex.axis = 1.1, cex.lab = 1.1)
  axis(1, labels=c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880), cex.axis = 1.1)
  
  # Plot 2
  plot(Voltage, type = "l", ylab = "Voltage", xlab = "datetime", 
       xaxt = "n", cex.axis = 1.1, cex.lab = 1.1)
  axis(1, labels=c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880), cex.axis = 1.1)
  
  #Plot 3
  plot(Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering", 
       xaxt = "n", cex.axis = 1.1, cex.lab = 1.1)
  par(new=T)
  plot(Sub_metering_2, type = "l", col = "red", xlab = "", ylab = "", 
       xaxt = "n", yaxt = "n", ylim = c(0,35))
  par(new=T)
  plot(Sub_metering_3, type = "l", col = "blue", xlab = "", ylab = "", 
       xaxt = "n", yaxt = "n", ylim = c(0,35))
  axis(1, labels=c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880), cex.axis = 1.1)
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         lty = c(1,1), lwd=c(1,1,1), col=c("black","red","blue"), cex = 0.9, bty = "n")
  
  # Plot 4
  plot(Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", 
       xaxt = "n", ylim = c(0,0.5), cex.axis = 1.1, cex.lab = 1.1)
  axis(1, labels=c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880), cex.axis = 1.1)
  
})

# Close graphic device
dev.off()
close(output)
