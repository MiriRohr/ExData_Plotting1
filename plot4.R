# Read data 
dt<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
dt[,1]<-as.Date(dt[,1],"%d/%m/%Y")

# Create data table with dates 2007-02-01 and 2007-02-02,
dt<-rbind(dt[as.Date(dt[,1])=="2007-02-01",],dt[as.Date(dt[,1])=="2007-02-02",])
Date_Time<-strptime(paste(dt[,1],dt[,2]), "%Y-%m-%d %H:%M:%S")

# Create data table for plotting.
dt<-cbind(Date_Time,dt[,c(3:9)]) 

# Device
png(file="plot4.png")

# Plot Settings
par(mfcol=c(2,2),cex=0.8)

# Plot 1
plot(dt$Date_Time,dt$Global_active_power,xlab="",ylab="Global Active Power",type="n")
lines(dt$Date_Time,dt$Global_active_power)

# Plot 2
plot(dt$Date_Time,dt$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
lines(dt$Date_Time,dt$Sub_metering_1,col="black")
lines(dt$Date_Time,dt$Sub_metering_2,col="red")
lines(dt$Date_Time,dt$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),bty="n",lty=c(1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot 3
plot(dt$Date_Time,dt$Voltage,xlab="datetime",ylab="Voltage",type="n")
lines(dt$Date_Time,dt$Voltage)

# Plot 4
plot(dt$Date_Time,dt$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="n")
lines(dt$Date_Time,dt$Global_reactive_power)

# Turn off device.
dev.off()