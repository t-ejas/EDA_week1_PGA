dataset<-read.table("household_power_consumption.txt", header=TRUE,skip=1,sep=";")
data_pwr$Date<-as.Date(data_pwr$Date, format="%d/%m/%Y")
dt1<-dataset[dataset$Date=="1/2/2007",]
dt2=dataset[dataset$Date=="2/2/2007",]
data_date <- rbind(dt1,dt2)
data_date$Global_active_power<-as.numeric(data_date$Global_active_power)
hist(data_date$Global_active_power)
