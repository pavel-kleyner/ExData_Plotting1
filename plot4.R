library(data.table)
#Reads in total data set
big.table<-fread('household_power_consumption.txt')
#Subsets for first date
date1<-subset(big.table,big.table$Date=='1/2/2007')
#Subsets for second date
date2<-subset(big.table,big.table$Date=='2/2/2007')
#Combines together data from necessary days
final.data.table<-rbind(date1,date2)
#Combines the Date and Time columns of data frame
DateTime<-paste(final.data.table$Date,final.data.table$Time)
#Converts Date and Time to POSIXlt class
final.DT<-strptime(DateTime,format="%d/%m/%Y %H:%M:%S")
#Opens PNG device
png(file='plot4.png')
par(mfrow=c(2,2))
plot(final.DT,final.data.table$Global_active_power,type='l',xlab='',ylab='Global Active Power')
plot(final.DT,final.data.table$Voltage,type='l',xlab='datetime',ylab='Voltage')
plot(final.DT,final.data.table$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
lines(final.DT,final.data.table$Sub_metering_2,type='l',col='red')
lines(final.DT,final.data.table$Sub_metering_3,type='l',col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=c(1,1,1),col=c('black','red','blue'))
plot(final.DT,final.data.table$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')
dev.off()
