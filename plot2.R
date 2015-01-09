plot2 <- function(){
        big_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
        partial <- big_data[big_data$Date == "1/2/2007"| big_data$Date == "2/2/2007",]
        rm(big_data)
        partial$datetime <- strptime(paste(partial$Date, partial$Time), "%d/%m/%Y %H:%M:%S")
        tloc <- Sys.getlocale("LC_TIME")
        Sys.setlocale("LC_TIME", "en_US.UTF-8")
        png("plot2.png", width = 480, height = 480)
        par(bg = "transparent", mar = c(3.4, 4.1, 4.1, 2.1))
        plot(partial$datetime, partial$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch=".")
        #plot(partial$datetime, partial$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch=".", cex.lab = 0.75, cex.axis = 0.70)
        lines(partial$datetime, partial$Global_active_power)
        Sys.setlocale("LC_TIME", tloc)
        #dev.copy(png, file = "plot2.png", width = 480, height = 480)
        dev.off()
}