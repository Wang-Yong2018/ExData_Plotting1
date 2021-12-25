# this plot1.R plat a hisbox plot of global_activity_power
source('run_eda.R')
Sys.setlocale("LC_TIME", "English")
url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
# download, unzip, and load whole dataset
# note: I use data.table fread method instead of read.csv.sql. 
# as it fast and memory is enough for the case
dt <- getting_data(url)
# check memory usage. It is about 143MB,  for the dataset. 
print(tables(silent=TRUE)%>%select(c(1,2,3,4)))
dt_2days <-dt %>%filter(datetime >=as.Date('2007-02-01') &datetime <as.Date('2007-02-03' ))
par(mfrow=c(1,1),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(dt_2days,
     hist(Global_active_power,col='red',
          xlab='Global Active Power(kilowatts)',
          ylab='Frequency',
          main='Global Active Power'
          )
)
dev.copy(png, file = "plot1.png",height=480,width=480)
dev.off()
     