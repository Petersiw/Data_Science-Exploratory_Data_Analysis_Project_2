#unzip file and read data
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#isolate Baltimore city
data1 <- NEI[NEI$fips == "24510", ]
data1$year <- as.Date(as.character(data1$year), "%Y-%m-%d")
balt.emissions <- tapply(data1$Emissions, data1$year, sum)

#create png plot
png(filename = "plot2.png")
plot(unique(data1$year), balt.emissions, pch = 20, cex = 2,  xlab = "Year", ylab = "Total PM2.5 Emissions (Tonnes)")
lines(unique(data1$year), balt.emissions)
title(main = "Total Annual PM2.5 Emissions Between 1999 and 2008 for Baltimore", cex.main = 1)
dev.off()
