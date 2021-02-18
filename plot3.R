#setwd('C:/R_studio/exploratory_data_analysis/courseproj1')

data <- read.table('exdata_data_household_power_consumption/household_power_consumption.txt', header=T, sep = ';', na.strings = '?', stringsAsFactors = F)
names <- names(data)
# "Date"                  "Time"                  "Global_active_power"   "Global_reactive_power" "Voltage" "Global_intensity"      
#"Sub_metering_1"  "Sub_metering_2"        "Sub_metering_3"       

cd <- data[complete.cases(data),]
for (i in 3:length(names(cd))){
      
      cd[,i]  <-as.numeric( cd[,i])
}
sub <- subset(cd,Date == c("1/2/2008", '2/2/2008') )
dt <- strptime(paste(sub$Date, sub$Time, sep = ' '), '%d/%m/%Y %H:%M:%S' )


clr <- c('black','red','blue')
names <- c("Sub_metering_1",  "Sub_metering_2",  "Sub_metering_3" )
plot(dt, sub$Sub_metering_1, type = 'n', xlab = 'Date', ylab = 'Energy Sub Metering')
lines(dt, sub$Sub_metering_1, col= 'black')
lines(dt, sub$Sub_metering_2, col= 'red')
lines(dt, sub$Sub_metering_3, col = 'blue')
legend('topright', lty = c(1,1,1), col=clr, legend = names)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()

