    #Exploratory Data Analysis - Assgn1 Plot1
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
    
    #plot1 Histagram of Global_active_power (Kilowatts) vs Frequency
    hist(dp$Global_active_power, col = "red", main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
    #copy to png file
    dev.copy(png, file = "plot1.png", width=480, height=480)
    dev.off()

