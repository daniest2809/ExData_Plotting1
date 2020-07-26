data<-read.csv("C:/Users/57314/OneDrive - Universidad de los Andes/coursera/datasciencecoursera/Exploratory and data analysis/household_power_consumption.txt",sep = ";")
Power<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
Power$Date_and_time<-paste(Power$Date,Power$Time,sep = " ")
library(lubridate)
Power$Date_and_time<-dmy_hms(Power$Date_and_time)
View(Power)
Power$Global_active_power<-as.numeric(Power$Global_active_power)
par(mfrow=c(2,2))
with(Power, plot(Global_active_power~Date_and_time,type="l",xlab="",
                 ylab = "Global Active Power (kilowatts)"))
with(Power,plot(Voltage~Date_and_time,type="l",xlab="datetime",ylab = "Voltage"))

with(Power,plot(Sub_metering_1~Date_and_time,type="l"))
points(Power$Date_and_time,Power$Sub_metering_2,type = "l",col="red")
points(Power$Date_and_time,Power$Sub_metering_3,type = "l",col="blue")

temp <- legend("topright", legend = c(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),
               text.width = strwidth("1,000,000"),lty = 1,
               xjust = 1, yjust = 1,col = c("black","red","blue"))

with(Power,plot(Global_reactive_power~Date_and_time,type="l",xlab="datetime",ylab = "Global_reactive_power"))

dev.copy(png,'plot4.png')
dev.off()
