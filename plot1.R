library(tidyverse)

datapower <- read.table("household_power_consumption.txt",skip=1,sep=";")

sub_power <-filter(datapower,Date == "1/2/2007" | Date == "2/2/2007")

hist(as.numeric(as.character(sub_power$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")
