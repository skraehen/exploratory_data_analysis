library(data.table)
path.in <- "C://Users/skraehen/Desktop/Exploratory Data Analysis"
path.out <- paste(path.in,"/plots/",sep="")
file.out <- "plot4.png"

setwd(path.in)
file <- "household_power_consumption.txt"

# read file
hsh <- fread(file,na.strings="?")
head(hsh)

# subset file
hsh.sub <- subset(hsh,Date == "1/2/2007" | Date == "2/2/2007")
head(hsh.sub)

# convert date/time variables
date.new <- strptime(paste(hsh.sub$Date,hsh.sub$Time),format="%d/%m/%Y %H:%M:%S")

# create png-file
png(file=paste(path.out,file.out),width=480, height=480)
par(mfrow=c(2,2),mar=c(4,4,4,4),oma=c(0,0,2,0))

# ul
plot(date.new, hsh.sub$Global_active_power,xlab="", ylab="Global Active Power", type="l")

# ur
plot(date.new, hsh.sub$Voltage,xlab="datetime", ylab="Voltage", type="l")

# ll
plot(date.new, hsh.sub$Sub_metering_1,xlab="", ylab="Energy sub metering", type="l")
lines(date.new, hsh.sub$Sub_metering_2, col="red")
lines(date.new, hsh.sub$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

# lr
plot(date.new, hsh.sub$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()

