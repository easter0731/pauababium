rm(list=ls())
#memory required
print(paste("memory needed",round(8*2075259*9/(2^20))," MB"))

f<-"exdata-data-household_power_consumption.zip"

zip<-unzip(f)
dat<-read.table(zip,header=T,sep=";",na.strings="?",	
	colClasses=c("character","character",rep("numeric",7)))

dat<-subset(dat,dat$Date%in%c("1/2/2007","2/2/2007"))

date<-strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

png("plot4.png")
par(mfrow=c(2,2))

plot(date,dat$Global_active_power,ylab="Global Active Power (kilowatts)",
	type="l",xlab="")	

plot(date,dat$Voltage,ylab="Voltage",
	type="l",xlab="datetime")

plot(date,dat$Sub_metering_1,type="l",
	xlab="",ylab="Energy sub metering")
lines(date,dat$Sub_metering_2,col="red")
lines(date,dat$Sub_metering_3,col="blue")
legend("topright",legend=paste("Sub_metering_",seq(1,3),sep=""),
	pch="-",col=c("black","red","blue"),bty="n")

plot(date,dat$Global_reactive_power,ylab="Global_reactive_power",
	type="l",xlab="datetime")

dev.off()

