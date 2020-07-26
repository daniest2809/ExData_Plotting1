data<-read.csv("C:/Users/57314/OneDrive - Universidad de los Andes/coursera/datasciencecoursera/Exploratory and data analysis/household_power_consumption.txt",sep = ";")
Power<-subset(data,Date=="2/2/2007"|Date=="1/2/2007")
Power$Date<-strptime(data$Date,"%D")
Power$Global_active_power<-as.numeric(Power$Global_active_power)
par(mfrow=c(1,1))
hist(Power$Global_active_power,main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "red",xlim = c(0,6))
dev.copy(png,'plot1.png')
dev.off()
