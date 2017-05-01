#unzip file and read data
unzip("exdata-data-NEI_data.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#isolate Baltimore and Los Angeles County data
data1 <- NEI[NEI$fips == "24510" | NEI$fips == "06037", ]
data1$county <- NULL
for(i in 1:length(data1$fips)) {
  if (data1$fips[i] == "24510") {
    data1$county[i] <- "Baltimore"
  } else {
    data1$county[i] <- "Los Angeles"
  }
}

#create png plot
png(filename = "plot6.png")
require(ggplot2)
ggplot(data1, aes(y = Emissions, x = year)) +
  geom_point() +
  facet_grid(. ~ county) +
  labs(title = "Motor PM2.5 Emissions in Different Counties Between 1999 and 2008",
       x = "Year", y = "Motor PM2.5 Emissions (Tonnes)") +
  theme(plot.title = element_text(hjust = 0.5))
dev.off()


