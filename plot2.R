consumption <- read.csv(file = './household_power_consumption.txt',
                        sep = ';',
                        na.strings = "?",
                        stringsAsFactors = FALSE)

sel <- (consumption$Date == "1/2/2007") | (consumption$Date == "2/2/2007")
consumption <- consumption[sel,]
rm(sel)

tmp <- paste(consumption$Date, consumption$Time, sep = ' ')
consumption$datetime <- strptime(tmp, format = "%d/%m/%Y %H:%M:%S")
rm(tmp)

png(file = "plot2.png", width = 480, height = 480)
with(consumption, plot(datetime, Global_active_power,
                       type = 'l',
                       xlab = '',
                       ylab = 'Global Active Power (kilowatts)'
                       )
)
dev.off()