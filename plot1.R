setwd('D:/R_ex')

dt=read.table('household_power_consumption.txt',header=T,sep=";",
na.strings="?")

dim(dt)

dt$DateTime=strptime(paste(dt$Date,dt$Time),'%d/%m/%Y %H:%M:%S')

dt$Date=as.Date(dt$Date,'%d/%m/%Y')

dt=dt[dt$Date>='2007-02-01' & dt$Date<='2007-02-02',]

attach(dt)

png(filename='plot1.png')

hist(Global_active_power,col='red',main='Global Active Power',
xlab='Global Active Power (kilowatts)')

dev.off()