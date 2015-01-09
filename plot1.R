plot1 <- function(){
        big_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?")
        partial <- big_data[big_data$Date == "1/2/2007"| big_data$Date == "2/2/2007",]
        rm(big_data)
        png("plot1.png", width = 480, height = 480)
        par(bg = "transparent")
        hist(partial$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)")
        #hist(partial$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (Kilowatts)", cex.main = 0.80, cex.axis = 0.75, cex.lab = 0.75)
        #dev.copy(png, file = "plot1.png", width = 480, height = 480)
        dev.off()
}
