#Electric power consumption between 01/02/2007 and 02/02/2007
consumption<-read.table("household_power_consumption.txt",
                        header=TRUE,
                        sep=";",
                        na.strings = "?", 
                        colClasses = c("character","character",rep("numeric",7))
)
consumption[,1]<-as.Date(consumption[,1],format="%d/%m/%Y")
dateCon1<-consumption[consumption[,1]=="2007-02-01",]
dateCon2<-consumption[consumption[,1]=="2007-02-02",]
dateCon<-rbind(dateCon1,dateCon2)    

date <- strptime(paste(dateCon[,1],dateCon[,2]),"%Y-%m-%d %H:%M:%S")
timePower<-data.frame(date, power=dateCon[,3])
timeVoltage<-data.frame(date, dateCon[,5])
timeSubmeter<-data.frame(date, dateCon[,c(7,8,9)])
timeReactive<-data.frame(date, dateCon[,4])

png(file="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))
plot(timePower,
     type="l",
     xlab="",    
     ylab="Global Active Power (kilowatts)"
)
plot(timeVoltage,
     type="l",
     xlab="datetime",
     ylab="Voltage"
)

with(timeSubmeter, plot(date, timeSubmeter$Sub_metering_1, main = '', type = 'n', xlab = '', ylab = 'Energy sub metering'))
lines(timeSubmeter$date, timeSubmeter$Sub_metering_1, col = "black")
lines(timeSubmeter$date, timeSubmeter$Sub_metering_3, col = "blue")
lines(timeSubmeter$date, timeSubmeter$Sub_metering_2, col = "red")
legend('topright', bty = 'n', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 2)

plot(timeReactive,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
)
dev.off()