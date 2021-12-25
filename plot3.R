# this plot3.R plat a plot of global_activity_power ~ datetime adding legend
source('run_eda.R')
Sys.setenv(LC_COLLATE = "utf8", LANGUAGE = "en")
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
     plot(Sub_metering_1~datetime,
          ylab='Energy sub metering',
          xlab='',
          col='black',
          type='l'
     )
)
with(dt_2days,
     lines(Sub_metering_2~datetime,
          #ylab='Energy Sub metering',
          xlab='',
          col='red',
          type='l'
     )
)
with(dt_2days,
     lines(Sub_metering_3~datetime,
          #ylab='Energy Sub metering',
          xlab='',
          col='blue',
          type='l'
     )
)
legend('topright', 
       col=c('black',
            'red',
            'blue'
            ),
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       pch='_',
       pt.cex=1,
       pt.lwd=2
)
dev.copy(png, file = "plot3.png")
dev.off()