#unzip file and read data
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#load required package
library(ggplot2)

#isolate Baltimore city
data1 <- NEI[NEI$fips == "24510", ]
data1$year <- as.Date(as.character(data1$year), "%Y-%m-%d")

#create png panel plot
png(filename = "plot3.png")
ggplot(data1, aes(y = Emissions, x = year)) + 
  geom_point() + 
  facet_grid(. ~ type) + 
  geom_smooth(method = "lm", se = F) + 
  labs(title = "Plot of Different Emission Types in Baltimore Between 1999 and 2008", 
       x = "Year", y = "PM2.5 Emissions (Tonnes)")
dev.off()