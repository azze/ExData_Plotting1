#get data and extract relevant time period
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
mydata$ctime<-paste(mydata$Date,mydata$Time)
mydata$ctime<-as.POSIXct(strptime(mydata$ctime, "%d/%m/%Y %H:%M:%S"))
start<-as.POSIXct("2007-02-01")
end<-as.POSIXct("2007-02-03")
mydata<-mydata[mydata$ctime>=start,]
mydata<-mydata[mydata$ctime<end,]

#set parameters and make first plot
par(mfrow=c(2,2))
mydata$Global_active_power<-as.numeric(as.character(mydata$Global_active_power))
with(mydata,plot(ctime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

#second plot
mydata$Voltage<-as.numeric(as.character(mydata$Voltage))
with(mydata,plot(ctime,Voltage,type="l",xlab="datetime"))

#third plot
mydata$Sub_metering_1<-as.numeric(as.character(mydata$Sub_metering_1))
mydata$Sub_metering_2<-as.numeric(as.character(mydata$Sub_metering_2))
mydata$Sub_metering_3<-as.numeric(as.character(mydata$Sub_metering_3))
with(mydata, plot(ctime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
lines(mydata$ctime,mydata$Sub_metering_2, col="red")
lines(mydata$ctime,mydata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red", "blue"),bty="n",cex=0.5)

#fourth plot
mydata$Global_reactive_power<-as.numeric(as.character(mydata$Global_reactive_power))
with(mydata,plot(ctime,Global_reactive_power,type="l",xlab="datetime"))

#save plot to png file
png(filename="plot4.png",width=480,height=480,unit="px")
par(mfrow=c(2,2))
with(mydata,plot(ctime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))
with(mydata,plot(ctime,Voltage,type="l",xlab="datetime"))
with(mydata, plot(ctime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
lines(mydata$ctime,mydata$Sub_metering_2, col="red")
lines(mydata$ctime,mydata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red", "blue"),bty="n")
with(mydata,plot(ctime,Global_reactive_power,type="l",xlab="datetime"))
dev.off()