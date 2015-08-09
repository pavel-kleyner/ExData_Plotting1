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
png(file='plot2.png')
plot(final.DT,final.data.table$Global_active_power,type='l',xlab='',ylab='Global Active Power')
dev.off()