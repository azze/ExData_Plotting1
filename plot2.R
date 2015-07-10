#get data and extract relevant time period
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
mydata$ctime<-paste(mydata$Date,mydata$Time)
mydata$ctime<-as.POSIXct(strptime(mydata$ctime, "%d/%m/%Y %H:%M:%S"))
start<-as.POSIXct("2007-02-01")
end<-as.POSIXct("2007-02-03")
mydata<-mydata[mydata$ctime>=start,]
mydata<-mydata[mydata$ctime<end,]

#plot to screen device
par(mfrow=c(1,1))
mydata$Global_active_power<-as.numeric(as.character(mydata$Global_active_power))
with(mydata,plot(ctime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

#copy to png file
dev.copy(png,"plot2.png",width=480,height=480,unit="px")
dev.off()