rm(list=ls())
#memory required
print(paste("memory needed",round(8*2075259*9/(2^20))," MB"))

f<-"exdata-data-household_power_consumption.zip"

zip<-unzip(f)
dat<-read.table(zip,header=T,sep=";",na.strings="?",	
	colClasses=c("character","character",rep("numeric",7)))

dat<-subset(dat,dat$Date%in%c("1/2/2007","2/2/2007"))

date<-strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

png("plot2.png")
plot(date,dat$Global_active_power,ylab="Global Active Power (kilowatts)",
	type="l",xlab="")
dev.off()