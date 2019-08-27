# Dependencies
library(data.table)
library(lubridate)

# Download zipped files
if(!file.exists("power.zip")){download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "power.zip")}

# Unzip rawdata
if(!file.exists("household_power_consumption.txt")){unzip(zipfile = "power.zip")}

# Load raw data and cache column names for later
smallData <- read.table(file = "household_power_consumption.txt", 
                        header = T, sep = ";", stringsAsFactors = F, nrows = 5)
columnNames <- colnames(smallData)

# Read only date column
allDates <- fread(file = "household_power_consumption.txt", 
                  header = T, sep = ";", select = "Date")

# Format dates as date class and store in a vector
dateVector <- as.Date(strptime(allDates$Date, format = "%d/%m/%Y"))

# Match indices of vector to desired dates
dateIndices <- which(dateVector >= as.Date(strptime("2007-02-01", format = "%Y-%m-%d")) &
                       dateVector <= as.Date(strptime("2007-02-02", format = "%Y-%m-%d")))

# Specify classes desired from read.table
tableClasses <- c("character", "character", rep("numeric", 7))

# Read desired section of data file and assign column names
rawData <- read.table(file = "household_power_consumption.txt", 
                      header = T, sep = ";", stringsAsFactors = F, 
                      colClasses = tableClasses, na.strings = "?",
                      skip = dateIndices[1]-1, nrows = length(dateIndices))
colnames(rawData) <- columnNames

# Clean up environment
rm(allDates, smallData, columnNames, dateIndices, dateVector, tableClasses)

# Reformat date to correct class and format
rawData$Date <- as.Date(strptime(x = rawData$Date, format = "%d/%m/%Y"))

# Reformat time to correct class and format
rawData$Time <- factor(rawData$Time, ordered = T)
