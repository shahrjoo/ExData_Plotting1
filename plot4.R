#load the library
library(data.table)

#reading data from file
df<-read.table("household_power_consumption.txt",sep=";", na.strings = "?",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#subsetting the data
df1<-subset(df,(df$Date>="2007-02-01" & df$Date<="2007-02-02"))

#create a new column for DateTime
date_time <- paste(as.Date(df1$Date), df1$Time)
df1$Datetime <- as.POSIXct(date_time)



#set the output plot file
png(filename="plot4.png", width=480, height=480)

#setting parameters
par(mfrow = c(2,2), mar = c(4,4,3,1), oma = c(0,0,2,0))

with(df1,{
        plot(Global_active_power ~ Datetime, type = "l",ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ Datetime, type = "l",ylab = "Voltage", xlab = "datetime")
        plot(Datetime,Sub_metering_1,type="l",ylab = "Energy Sub metering", xlab = "")
        lines(Datetime,Sub_metering_2,type="l",col="red")
        lines(Datetime,Sub_metering_3,type="l",col="blue")
        legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty="n")
        plot(Global_reactive_power ~ Datetime, type = "l",ylab = "Global_rective_power", xlab = "datetime")
        
        
})

dev.off()
