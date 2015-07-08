## clean, clear and load package
rm(list = ls())
cat("\014")
require(data.table)
## load and subset data
df <- fread("~/household_power_consumption.txt", sep=";", header = TRUE, colClasses = list(character=1:9))
df$Date <- as.Date(df$Date,format = '%d/%m/%Y')
ddf <- df[Date %between% c('2007-02-01', '2007-02-02')]
ddf$DateTime <- as.POSIXct(paste(ddf$Date, ddf$Time), format="%Y-%m-%d %H:%M:%S")
##create and save plot
png(filename = "~/plot4.png", width = 480, height = 480) 
par(mfrow=c(2,2))
## subplot1
plot(x=ddf$DateTime,y=as.numeric(ddf$Global_active_power),type="l",ylab="Global Active Power",xlab="")
## subplot2
plot(x=ddf$DateTime,y=as.numeric(ddf$Voltage),type="l",ylab="Voltage",xlab="datetime")
## subplot3
plot(x=ddf$DateTime,y=as.numeric(ddf$Sub_metering_1),type="l",ylab="Global Active Power",xlab="")
lines(x=ddf$DateTime,y=as.numeric(ddf$Sub_metering_2),type="l",ylab="Global Active Power",xlab="",col = "red")
lines(x=ddf$DateTime,y=as.numeric(ddf$Sub_metering_3),type="l",ylab="Global Active Power",xlab="", col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1), # gives the legend appropriate symbols (lines)
       col=c("black","blue","red"), bty = "n")
##subplot 4
plot(x=ddf$DateTime,y=as.numeric(ddf$Global_reactive_power),type="l",ylab="Global_reative_power",xlab="datetime")
dev.off()