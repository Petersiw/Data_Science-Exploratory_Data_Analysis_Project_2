#unzip file and read data
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Isolate motor vehicle data
data1 <- NEI[NEI$type == "ON-ROAD" | NEI$fips == "24510", ]
data1$year <- as.Date(as.character(data1$year), "%Y-%m-%d")
motor.emissions <- tapply(data1$Emissions, data1$year, sum)

#create png plot
png(filename = "plot5.png")
plot(unique(data1$year), motor.emissions, pch = 20, cex = 2,  
     xlab = "Year", ylab = "Total Motor PM2.5 Emissions (Tonnes)")
lines(sort(unique(data1$year)), motor.emissions)
title(main = "Total Annual Motor PM2.5 Emissions in Baltimore 
      Between 1999 and 2008")
dev.off()