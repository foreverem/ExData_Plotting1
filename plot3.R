setwd('D:/R_ex')

dt=read.table('household_power_consumption.txt',header=T,sep=";",
na.strings="?")

dt$DateTime=strptime(paste(dt$Date,dt$Time),'%d/%m/%Y %H:%M:%S')

dt$Date=as.Date(dt$Date,'%d/%m/%Y')

dt=dt[dt$Date>='2007-02-01' & dt$Date<='2007-02-02',]

attach(dt)

Sys.setlocale('LC_TIME','C')

png(filename='plot3.png')

plot(dt$DateTime,Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')

lines(dt$DateTime,Sub_metering_2,col='red')

lines(dt$DateTime,Sub_metering_3,col='blue')

legend('topright',col=c('black','red','blue'),lwd=1,
legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

dev.off()

