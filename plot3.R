data<-read.csv("C:/Users/57314/OneDrive - Universidad de los Andes/coursera/datasciencecoursera/Exploratory and data analysis/household_power_consumption.txt",sep = ";")
Power<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
Power$Date_and_time<-paste(Power$Date,Power$Time,sep = " ")
library(lubridate)
Power$Date_and_time<-dmy_hms(Power$Date_and_time)
View(Power)
Power$Global_active_power<-as.numeric(Power$Global_active_power)
with(Power,plot(Sub_metering_1~Date_and_time,type="l"))
points(Power$Date_and_time,Power$Sub_metering_2,type = "l",col="red")
points(Power$Date_and_time,Power$Sub_metering_3,type = "l",col="blue")

temp <- legend("topright", legend = c(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),
               text.width = strwidth("1,000,000"),lty = 1,
                xjust = 1, yjust = 1,col = c("black","red","blue"))
dev.copy(png,'plot3.png')
dev.off()

