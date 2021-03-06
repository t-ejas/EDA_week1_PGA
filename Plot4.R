dataset<-read.table("household_power_consumption.txt", header=TRUE,skip=1,sep=";")

dt1<-dataset[dataset$Date=="1/2/2007",]
dt2=dataset[dataset$Date=="2/2/2007",]

data_pwr <- rbind(dt1,dt2)

data_pwr$Date<-as.Date(data_pwr$Date, format="%d/%m/%Y")
data_pwr$Time<-strptime(data_pwr$Time,format="%H:%M:%S")
data_pwr[1:1440,"Time"]<-format(data_pwr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_pwr[1441:2880,"Time"]<-format(data_pwr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(data_pwr$Time,as.numeric(as.character(data_pwr$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")
plot(data_pwr$Time,as.numeric(as.character(data_pwr$Voltage)), type="l",xlab="datetime",ylab="Voltage")
plot(data_pwr$Time,data_pwr$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
 with(data_pwr,lines(Time,as.numeric(as.character(Sub_metering_1))))
 with(data_pwr,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
 with(data_pwr,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
plot(data_pwr$Time,as.numeric(as.character(data_pwr$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
