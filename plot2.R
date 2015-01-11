## reading the Data

a <- read.table("~/Coursera/Exploratory Data Analysis/Assignment1/household_power_consumption.txt", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), 
                nrow = 2879, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE)))
write.csv(a, "a.csv", sep = ";", row.names = FALSE)

df <- read.csv("~/Coursera/Exploratory Data Analysis/Assignment1/ExData_plotting1/a.csv", header = TRUE)

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S") ## Convert to Time:POSIXlt

## open picture file
output <- file("~/Coursera/Exploratory Data Analysis/Assignment1/ExData_plotting1/plot1.png")

# Open png device
png(filename = 'plot2.png', width = 480, height = 480)
par(bg=NA)
with(df, {
  plot(Global_active_power, type = "l", ylab = "Global Active Power",
       xaxt = "n", xlab = "", cex.axis = 1.1, cex.lab = 1.1)
  axis(1, labels=c("Thu", "Fri", "Sat"), at = c(0, 1440, 2880), cex.axis = 1.1)
})
# Close png device 
dev.off()
close(output)