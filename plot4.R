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
