# Exploratory Data Analysis with R: Project 1
# By Austin Lanser
# Last updated: 2/11/2018

##########################################################################################################

###Libraries
library(readr) #for data import

###Import downloaded data into R
poweruse <- read_delim("~/Coursera/Exploratory Data Analysis with R/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                       ";", escape_double = FALSE, 
                       col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                        Time = col_time(format = "%H:%M:%S")), 
                       trim_ws = TRUE,
                       na = c("", "?"))

###Data integrity checks and cleaning

#Only want 2007-02-01 to 2007-02-02
datsub <- subset(poweruse, (Date >= "2007-02-01" & Date <= "2007-02-02") )

### Plot

png(filename="plot3.png")

plot(x=as.POSIXct(paste(datsub$Date,datsub$Time)), y=datsub$Sub_metering_1, type="l",
     xlab="", ylab="Energy sub metering")
lines(x=as.POSIXct(paste(datsub$Date,datsub$Time)), y=datsub$Sub_metering_2, col="red")
lines(x=as.POSIXct(paste(datsub$Date,datsub$Time)), y=datsub$Sub_metering_3, col="blue")
legend("topright",legend=(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),
       col=c("black","red","blue"), lty=c(1,1,1))

dev.off()