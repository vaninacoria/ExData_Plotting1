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

timeSubmeter<-data.frame(time=strptime(paste(dateCon[,1],dateCon[,2]),"%Y-%m-%d %H:%M:%S"), dateCon[,c(7,8,9)])

with(timeSubmeter,{
    plot(time,Sub_metering_1,
         type="n",
         xlab="",
         ylab="Energy sub metering")
    lines(time,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black")
    lines(time,Sub_metering_2,type="l",xlab="",ylab="Energy sub metering",col="red")
    lines(time,Sub_metering_3,type="l",xlab="",ylab="Energy sub metering",col="blue")
})
legend("topright",lty=1,xjust=300,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))