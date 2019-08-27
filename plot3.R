# Moved the file caching code out to keep this script lean.
# In short, this file reads in the zip data, unzips, searches for the needed
# rows in the Date column, converts to the correct class, determines which rows 
# in the zipped table to read, and reads only those in.
# Finally, the data column of the required rows is formatted to the correct class
# and the environment is cleaned.

setwd(Your_wd_here)
source("sourceData.R")

# Plot3
png(filename = "plot1.png", width = 480, height = 480)
hist(x = rawData$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts",
     ylab = "Frequency")
dev.off()








