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

png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

#Top-Left plot
with(consumption, plot(datetime, Global_active_power,
                       type = 'l',
                       xlab = '',
                       ylab = 'Global Active Power'
                       )
)

#Top-Right plot
with(consumption, plot(datetime, Voltage,
                       type = 'l',
                       xlab = 'datetime',
                       ylab = 'Voltage')
)

#Bottom-Left plot
with(consumption, plot(datetime, Sub_metering_1,
                       type = 'l',
                       xlab = '',
                       ylab = 'Energy sub metering'
                       )
)
with(consumption, lines(datetime, Sub_metering_2,
                        col = 'red'
)
)
with(consumption, lines(datetime, Sub_metering_3,
                        col = 'blue'
)
)
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1,
       col = c('black', 'red', 'blue')
)

#Bottom-Right plot
with(consumption, plot(datetime, Global_reactive_power,
                       type = 'l',
                       xlab = 'datetime',
                       ylab = 'Global_reactive_power')
)
dev.off()