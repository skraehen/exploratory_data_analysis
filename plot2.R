library(data.table)
path.in <- "C://Users/skraehen/Desktop/Exploratory Data Analysis"
path.out <- paste(path.in,"/plots/",sep="")
file.out <- "plot2.png"
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

plot(date.new, hsh.sub$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()

