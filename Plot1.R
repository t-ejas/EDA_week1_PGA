#To load the data from the system
dataset<-read.table("household_power_consumption.txt", header=TRUE,skip=1,sep=";")

#to gather entries marked in the dates 1/2/2007 and 2/2/2007
dt1<-dataset[dataset$Date=="1/2/2007",]
dt2<-dataset[dataset$Date=="2/2/2007",]

#rbind binds these two dataframes into data_pwr
data_pwr <- rbind(dt1,dt2)

#convert field GLobal Active power to numeric 
data_pwr$Global_active_power<-as.numeric(data_date$Global_active_power)

#plot histogram
hist(data_pwr$Global_active_power)

