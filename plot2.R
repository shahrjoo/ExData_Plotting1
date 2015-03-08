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
png(filename="plot2.png", width=480, height=480)

#setting parameters
par(mfrow=c(1,1), mar = c(5,4,4,4))

#plotting the data
plot(df1$Global_active_power ~ df1$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "",cex=0.7)


dev.off()