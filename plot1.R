## reading the Data

a <- read.table("~/Coursera/Exploratory Data Analysis/Assignment1/household_power_consumption.txt", skip = grep("1/2/2007", readLines("household_power_consumption.txt")), 
                nrow = 2879, col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE)))
write.csv(a, "a.csv", sep = ";", row.names = FALSE)

df <- read.csv("~/Coursera/Exploratory Data Analysis/Assignment1/ExData_plotting1/a.csv", header = TRUE)

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, "%H:%M:%S") ## Convert to Time:POSIXlt

output <- file("~/Coursera/Exploratory Data Analysis/Assignment1/ExData_plotting1/plot1.png")
# Describe png device
png(filename = 'plot1.png', width = 480, height = 480)
par(bg=NA)
# Plot histogram of Global_active_power variable
with(df, hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

# Close png device
dev.off()
close(output)
