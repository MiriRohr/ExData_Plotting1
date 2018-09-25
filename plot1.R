# Read data 
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dt[,1]<-as.Date(dt[,1],"%d/%m/%Y")

# Create data table with dates 2007-02-01 and 2007-02-02,
dt<-rbind(dt[as.Date(dt[,1])=="2007-02-01",],dt[as.Date(dt[,1])=="2007-02-02",])
Date_Time<-strptime(paste(dt[,1],dt[,2]), "%Y-%m-%d %H:%M:%S")

# Create a new data table for plotting.
dt<-cbind(Date_Time,dt[,c(3:9)]) 

# Device
png(file="plot1.png")

# Plot 
hist(dt$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# Turn off device.
dev.off()