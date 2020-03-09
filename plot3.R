library(tidyverse)

datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")

sub_power <-filter(datapower,Date == "1/2/2007" | Date == "2/2/2007")

sub_power$Date <- as.Date(sub_power$Date, format="%d/%m/%Y")
sub_power$Time <- strptime(sub_power$Time, format="%H:%M:%S")
sub_power[1:1440,"Time"] <- format(sub_power[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_power[1441:2880,"Time"] <- format(sub_power[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(sub_power$Time,sub_power$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(sub_power,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub_power,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub_power,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")
