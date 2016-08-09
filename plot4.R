    #Exploratory Data Analysis - Assgn1 Plot4
    #Vincent Roy
    
    #Temp copy of data, create <data>.txt ouput.
    
    if (!file.exists("household_power_consumption.txt")) {
      tf <- tempfile()
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", tf)
      list.files <- unzip(tf, list = TRUE) # To verify file name
      data <- read.table(unz(tf, "household_power_consumption.txt"), header=T, sep=';', na.strings="?", 
                         nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
      head(data)
      write.table(data, file = paste0(getwd(),"/household_power_consumption.txt"), 
                  append = FALSE, quote = TRUE, sep = ";",
                  eol = "\n", na = "?", dec = ".", row.names = TRUE,
                  col.names = TRUE, qmethod = c("escape", "double"),
                  fileEncoding = "")
      
    }
    data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
    head(data)
    unlink(tf)
    
    #convert to date format
    data$Date <-  as.Date(data$Date, format="%Y-%m-%d")
    
    #subset  2007-02-01 to 2007-02-02 data set and format new datetime var   
    dp <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
    datetime <- strptime(paste(dp$Date, dp$Time, sep=" "), "%Y-%m-%d %H:%M:%S")
    dp$Datetime <- as.POSIXct(datetime) 
    
    #select plot data
    dp$Global_active_power <- as.numeric(dp$Global_active_power)
    dp$Global_reactive_power <- as.numeric(dp$Global_reactive_power)
    dp$Voltage <- as.numeric(dp$Voltage)
    dp$Sub_metering_1 <- as.numeric(dp$Sub_metering_1)
    dp$Sub_metering_2 <- as.numeric(dp$Sub_metering_2)
    dp$Sub_metering_3 <- as.numeric(dp$Sub_metering_3)
    
    #plot1 Histagram of Global_active_power (Kilowatts) vs Frequency
    par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
    attach(dp) 
    plot(Global_active_power ~ Datetime, type="l", xlab="", 
                                   ylab="Global Active Power", cex=0.2)
    plot(Voltage ~ Datetime, type="l", xlab="datetime", ylab="Voltage")
    plot(Sub_metering_1 ~ Datetime, type="l",
                                   ylab="Energy Sub Metering", xlab="") 
    lines(Sub_metering_2 ~ Datetime, type="l", col = "red")
    lines(Sub_metering_3 ~ Datetime, type="l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
                                  "Sub_metering_3"), lty = 1, lwd = 2, 
                                   col = c("black", "red", "blue"))
    plot(Global_reactive_power ~ Datetime, type="l", 
         ylab="Global Rective Power",xlab="")
    
    #copy plot and close device
    dev.copy(png, file="plot4.png", height=480, width=480)
    dev.off()
 
