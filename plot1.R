library(data.table)
#Reads in total data set
big.table<-fread('household_power_consumption.txt')
#Subsets for first date
date1<-subset(big.table,big.table$Date=='1/2/2007')
#Subsets for second date
date2<-subset(big.table,big.table$Date=='2/2/2007')
#Combines together data from necessary days
final.data.table<-rbind(date1,date2)
#Opens PNG device
png(file='plot1.png')
hist(as.numeric(final.data.table$Global_active_power),col="red",xlab='Global Active Power (kilowatts)',main='Global Active Power')
dev.off()