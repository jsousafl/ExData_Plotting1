
#Reading data from the days of interest and constructing data frame
minutes_in_two_days <- 2880
filepath <-"../exdata_data_household_power_consumption/household_power_consumption.txt"
header<-read.table(filepath,nrows=1,sep=";")
test_df<-read.table(filepath,skip=grep("1/2/2007", readLines(filepath))-1,nrows=minutes_in_two_days,sep=";")
names(test_df)<-as.vector(unlist(header))

#Creating PNG Device (default size 480 x 480)
png(filename="plot1.png")

#Creating Histogram (editing title, x label and color)
hist(test_df$Global_active_power, main ="Global Active Power",xlab = "Global Active Power (kilowatts)", col ="red")

#Setup y axis ticks interval
axis(2, at=seq(0,1200,200))

dev.off()

