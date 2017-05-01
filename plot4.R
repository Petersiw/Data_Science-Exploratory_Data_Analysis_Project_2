#unzip file and read data
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Isolate coal data
scc.code <- SCC[grep("[Cc]oal$", SCC$EI.Sector), ]
data1 <- merge(scc.code, NEI, by = "SCC")
data1$year <- as.Date(as.character(data1$year), "%Y-%m-%d")
coal.emissions <- tapply(data1$Emissions, data1$year, sum, na.rm = T)

#create png plot
png(filename = "plot4.png")
plot(sort(unique(data1$year)), coal.emissions, pch = 20, cex = 2,  
     xlab = "Year", ylab = "Total Coal PM2.5 Emissions (Tonnes)")
lines(sort(unique(data1$year)), coal.emissions)
title(main = "Total Annual Coal PM2.5 Emissions Between 1999 and 2008")
dev.off()
