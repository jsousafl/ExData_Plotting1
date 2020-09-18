
#Reading data from the days of interest and constructing data frame
minutes_in_two_days <- 2880
filepath <-"../exdata_data_household_power_consumption/household_power_consumption.txt"
header<-read.table(filepath,nrows=1,sep=";")
test_df<-read.table(filepath,skip=grep("1/2/2007", readLines(filepath))-1,nrows=minutes_in_two_days,sep=";")
names(test_df)<-as.vector(unlist(header))


#Creating PNG Device (default size 480 x 480)
png(filename="plot3.png")

#Creating Date_Time column
test_df$DateANDTime <- paste(test_df$Date,test_df$Time)
test_df$DateANDTime <- strptime(test_df$DateANDTime, format = "%d/%m/%Y %H:%M:%S")
#Creating plot
plot(test_df$DateANDTime, test_df$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(test_df$DateANDTime, test_df$Sub_metering_2, type = "l", col = "red")
lines(test_df$DateANDTime, test_df$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty=1)

dev.off()