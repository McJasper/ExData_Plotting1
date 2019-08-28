# Moved the file caching code out to keep this script lean.
# In short, this file reads in the zip data, unzips, searches for the needed
# rows in the Date column, converts to the correct class, determines which rows 
# in the zipped table to read, and reads only those in.
# Finally, the data column of the required rows is formatted to the correct class
# and the environment is cleaned.

setwd(Your_wd_here)

source("sourceData.R")

# Plot2
png(filename = "plot2.png", width = 480, height = 480)
plot(x = rawData$DateTime, y = rawData$Global_active_power,
     ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")
dev.off()








