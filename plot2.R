setwd('D:/R_ex')

dt=read.table('household_power_consumption.txt',header=T,sep=";",
na.strings="?")

dt$DateTime=strptime(paste(dt$Date,dt$Time),'%d/%m/%Y %H:%M:%S')

dt$Date=as.Date(dt$Date,'%d/%m/%Y')

dt=dt[dt$Date>='2007-02-01' & dt$Date<='2007-02-02',]

attach(dt)

Sys.setlocale('LC_TIME','C')

png(filename='plot2.png')

plot(dt$DateTime,Global_active_power,type='l',xlab='',
ylab='Global Active Power (kilowatts)')

dev.off()