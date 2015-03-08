#load the library
library(data.table)

#reading data from file
df<-read.table("household_power_consumption.txt",sep=";", na.strings = "?",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),header = TRUE)
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#subsetting the data
df1<-subset(df,(df$Date>="2007-02-01" & df$Date<="2007-02-02"))


#set the output plot file
png(filename="plot1.png", width=480, height=480)

#setting parameters
par(mfrow=c(1,1), mar = c(5,4,4,4))

#drawing histogram
hist(df1$Global_active_power,col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)",cex=0.7)

dev.off()
