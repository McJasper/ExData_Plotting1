# Moved the file caching code out to keep this script lean.
# In short sourceData.R: reads in the zip data, unzips, searches for the needed
# rows in the Date column, converts to the correct class, determines which rows 
# in the zipped table to read, and reads only those in.
# Finally, the data column of the required rows is formatted to the correct class
# and the environment is cleaned.

setwd(Your_wd_here)
source("sourceData.R")

# Plot3
png(filename = "plot3.png", width = 480, height = 480)

plot(x=rawData$DateTime, y = rawData$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(x=rawData$DateTime, y = rawData$Sub_metering_2, col ="red")
lines(x=rawData$DateTime, y = rawData$Sub_metering_3, col ="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)

dev.off()








