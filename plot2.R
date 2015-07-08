## clean clear and load package
rm(list = ls())
cat("\014")
require(data.table)
## load and subset data
df <- fread("~/household_power_consumption.txt", sep=";", header = TRUE, colClasses = list(character=1:9))
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
ddf <- df[Date %between% c('2007-02-01', '2007-02-02')]
ddf$DateTime <- as.POSIXct(paste(ddf$Date, ddf$Time), format="%Y-%m-%d %H:%M:%S")
## create and save plot
png(filename = "~/plot2.png", width = 480, height = 480) 
plot(x=ddf$DateTime,y=as.numeric(ddf$Global_active_power),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()