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

png(file="plot1.png",width = 480, height = 480)
hist(dateCon[,3],
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)
dev.off()