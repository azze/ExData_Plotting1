#get data and extract relevant time period
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
mydata$ctime<-paste(mydata$Date,mydata$Time)
mydata$ctime<-as.POSIXct(strptime(mydata$ctime, "%d/%m/%Y %H:%M:%S"))
start<-as.POSIXct("2007-02-01")
end<-as.POSIXct("2007-02-03")
mydata<-mydata[mydata$ctime>=start,]
mydata<-mydata[mydata$ctime<end,]

#plot lines and add legend
par(mfrow=c(1,1))
mydata$Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))
with(mydata, plot(ctime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
lines(mydata$ctime,mydata$Sub_metering_2, col="red")
lines(mydata$ctime,mydata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red", "blue"))

#save plot to png
png(filename="plot3.png",width=480,height=480,unit="px")
with(mydata, plot(ctime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
lines(mydata$ctime,mydata$Sub_metering_2, col="red")
lines(mydata$ctime,mydata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red", "blue"))
dev.off()