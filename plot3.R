plot3 <- function(){
        big_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
        partial <- big_data[big_data$Date == "1/2/2007"| big_data$Date == "2/2/2007",]
        rm(big_data)
        partial$datetime <- strptime(paste(partial$Date, partial$Time), "%d/%m/%Y %H:%M:%S")
        tloc <- Sys.getlocale("LC_TIME")
        Sys.setlocale("LC_TIME", "en_US.UTF-8")
        #dpar <- par()
        png("plot3.png", width = 480, height = 480)
        par(pch = ".", cex.lab = 1, cex.axis = 1, bg = "transparent", mar = c(3.45, 4.1, 4.15, 2.1))
        with(partial, plot(datetime, Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering"))
        with(partial, lines(datetime, Sub_metering_1))
        with(partial, lines(datetime, Sub_metering_2, col="red"))
        with(partial, lines(datetime, Sub_metering_3, col= "blue"))
        legend("topright", lwd = 1.5,  col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "c")
        #legend("topright", pch = "-", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        Sys.setlocale("LC_TIME", tloc)
        
        #dev.copy(png, file = "plot3.png", width = 480, height = 480)
        dev.off()
#         par(dpar)
}