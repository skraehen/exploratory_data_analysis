library(data.table)
path.in <- "C://Users/skraehen/Desktop/Exploratory Data Analysis"
file.out <- "plot1.png"
path.out <- paste(path.in,"/plots/",sep="")
setwd(path.in)
file <- "household_power_consumption.txt"

# read file
hsh <- fread(file,na.strings="?")
head(hsh)

# subset file
hsh.sub <- subset(hsh,Date == "1/2/2007" | Date == "2/2/2007")
head(hsh.sub)


# create png-file
png(file=paste(path.out,file.out),width=480, height=480)

hist(hsh.sub$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
