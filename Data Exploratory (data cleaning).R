df = read.table('household_power_consumption.txt',sep = ';',header = TRUE, na.string ='?',
                colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
#format Date to date type
df$Date = as.Date(df$Date, '%d/%m/%Y')
#use data only from 2007-2-1 and 2007-2-2
df_2007 =  subset(df, Date >= as.Date('2007-2-1') & Date <= as.Date('2007-2-2'))
head(df_2007)

#remove incomplete data
df_2007 = df_2007[complete.cases(df_2007),]

#Plot1
#create histogram
hist(df_2007$Global_active_power, main = 'Global Active Power'
     ,xlab = 'Global Active Power (kilowatts)',col = 'red')
#save the file
dev.copy(png,'plot1.png',width = 480,height = 480)
dev.off()


#plot2
dateTime = paste(df_2007$Date, df_2007$Time)
dateTime = setNames(dateTime,'dateTime')
df_2007 = cbind(dateTime, df_2007)
df_2007$dateTime = as.POSIXct(dateTime)
plot(df_2007$dateTime, df_2007$Global_active_power, 
     type='l',xlab ='', ylab='Global Active Power (kilowatts)')

#save the file
dev.copy(png,'plot2.png',width = 480,height = 480)
dev.off()

#plot 3
names(df_2007)
with (df_2007, {
  plot(Sub_metering_1 ~ dateTime, type = 'l', ylab ='Global Active Power (kilowatts)', xlab = '')
  lines(Sub_metering_2 ~ dateTime, col = 'red')
  lines(Sub_metering_3 ~ dateTime, col = 'blue')
})
legend('topright', col=c('black','red','blue'), lwd=c(1,1,1),c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
#save the file
dev.copy(png,'plot3.png',width = 480,height = 480)
dev.off()

#plot4
#set subplots
par(mfrow = c(2,2),mar=c(4,4,2,1))
with (df_2007, {
  plot(Global_active_power ~ dateTime, type='l', ylab ='Global Active Power (kilowatts)',
       xlab = '')
  plot(Voltage ~dateTime, type = 'l',ylab ='Global Active Power (kilowatts)', xlab = '')
  plot(Sub_metering_1 ~ dateTime, type = 'l', ylab ='Global Active Power (kilowatts)', xlab = '')
  lines(Sub_metering_2 ~ dateTime, col = 'red')
  lines(Sub_metering_3 ~ dateTime, col = 'blue')
  legend('topright', bty='n',lty=1, lwd=1,c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'))
  plot(Global_reactive_power ~dateTime, type='l',ylab ='Global Active Power (kilowatts)', xlab = '')
  
})
#save the file
dev.copy(png,'plot4.png',width = 480,height = 480)
dev.off()
