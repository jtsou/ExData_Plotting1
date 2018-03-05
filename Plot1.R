#Plot1
#create histogram
hist(df_2007$Global_active_power, main = 'Global Active Power'
     ,xlab = 'Global Active Power (kilowatts)',col = 'red')
#save the file
dev.copy(png,'plot1.png',width = 480,height = 480)
dev.off()
