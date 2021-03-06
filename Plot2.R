#to load data from system
dataset<-read.table("household_power_consumption.txt", header=TRUE,skip=1,sep=";")

#to gather entries marked in the dates 1/2/2007 and 2/2/2007
dt1<-dataset[dataset$Date=="1/2/2007",]
dt2<-dataset[dataset$Date=="2/2/2007",]

#rbind binds these two dataframes into data_pwr
data_pwr <- rbind(dt1,dt2)

#converting date and time to appropriate format
data_pwr$Date<-as.Date(data_pwr$Date, format="%d/%m/%Y")
data_pwr$Time<-strptime(data_pwr$Time,format="%H:%M:%S")
data_pwr[1:1440,"Time"]<-format(data_pwr[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data_pwr[1441:2880,"Time"]<-format(data_pwr[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


plot(data_pwr$Time,as.numeric(as.character(data_pwr$Global_active_power)),type="l", xlab="",ylab="Global Active Power(kiloWatts)")
