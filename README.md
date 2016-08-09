---
title: "README.md"
author: "Vincent Roy"
date: "August 8, 2016"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

Introduction

This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:

    Dataset: Electric power consumption [20Mb]

    Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

    Date: Date in format dd/mm/yyyy
    Time: time in format hh:mm:ss
    Global_active_power: household global minute-averaged active power (in kilowatt)
    Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
    Voltage: minute-averaged voltage (in volt)
    Global_intensity: household global minute-averaged current intensity (in ampere)
    Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
    Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
    Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

Loading the data

    The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).We will only be using data from the dates 2007-02-01 and 2007-02-02. Date and Time are used to create a Datetime variable (Date/Time class) in R using the strptime() and as.Date() functions.

(Note that in this dataset missing values are coded as ?)

Making Plots

Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. 


For each of the four PNG files with a width of 480 pixels and a height of 480 pixels:
- "Plot1.png" is a histogram of 'Global Active Power vs. Frequecy' 
- "Plot2.png" is a plot of 'Datetime vs Global Active Power'
- "Plot3.png" is a plot of 'Datetime vs Energy Sub Metering'
- "Plot4.png" is a lattice of four plots as in 2 and 3 plus "Datetime vs Voltage" and "Datetime vs Global Reactive Power"
- Emphasis was to produce exactly as in the project instruction.

The corresponding scripts in R are labelled the same Plot1.R, Plot2.R, Plot3.R, Plot4.R. Rinning them directly will try to obtain the raw data unless the file "household_power_consumption.txt"  is aleady in your working directory.  

```{r}
#original raw zip file location
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

```



