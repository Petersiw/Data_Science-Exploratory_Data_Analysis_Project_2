#unzip file and read data
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#sum variables by year
NEI$year <- as.Date(as.character(NEI$year), "%Y")
year.emissions <- tapply(NEI$Emissions, NEI$year, sum)

#create png plot
png(filename = "plot1.png")
plot(unique(NEI$year), year.emissions, pch = 20, cex = 2,  xlab = "Year", ylab = "Total PM2.5 Emissions (Tonnes)")
lines(unique(NEI$year), year.emissions)
title(main = "Total Annual PM2.5 Emissions Between 1999 and 2008")
dev.off()

