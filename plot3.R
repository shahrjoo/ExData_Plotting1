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



with(df1,{
        plot(Datetime,Sub_metering_1,type="l",ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(Datetime,Sub_metering_2,type="l",col="red")
        lines(Datetime,Sub_metering_3,type="l",col="blue")
        legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
})

#create the png file
dev.copy(png,file="plot3.png")
dev.off()