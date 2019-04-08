library(data.table)
path.in <- "C://Users/skraehen/Desktop/Exploratory Data Analysis"
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
path.out <- paste(path.in,"/plots/",sep="")
file.out <- "plot3.png"
png(file=paste(path.out,file.out),width=480, height=480)

plot(date.new, hsh.sub$Sub_metering_1,xlab="", ylab="Energy sub metering", type="l")
lines(date.new, hsh.sub$Sub_metering_2, col="red")
lines(date.new, hsh.sub$Sub_metering_3,col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1)

dev.off()

