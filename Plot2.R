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
