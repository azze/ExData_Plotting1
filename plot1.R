#read data from file
mydata<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

#get time period of interest
mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y")
start<-as.Date("2007-02-01")
end<-as.Date("2007-02-02")
mydata<-mydata[mydata$Date>=start,]
mydata<-mydata[mydata$Date<=end,]

#plot histogram to screen device
par(mfrow=c(1,1))
mydata$Global_active_power<-as.numeric(as.character(mydata$Global_active_power))
hist(mydata$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#copy to png file
dev.copy(png,"plot1.png",width=480,height=480,unit="px")
dev.off()