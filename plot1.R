## this code read the household power consumption data and plot the histogram using data from 2007-02-01 to 2007-02-02
## clear workspace and console, load package
rm(list = ls())
cat("\014")
require(data.table)
## read and subset data
df <- fread("~/household_power_consumption.txt", sep=";", header = TRUE, colClasses = list(character=1:9))
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
ddf <- df[Date %between% c('2007-02-01', '2007-02-02')]
## create and export png file here
png(filename = "~/plot1.png", width = 480, height = 480) 
hist(as.numeric(ddf$Global_active_power), col = 'red', xlab = 'Gloabal Active Power (kilowatts)',
     main = 'Global Active Power')
dev.off()
