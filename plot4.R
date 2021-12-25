# this plot4.R plat a plot of with 4 sub plots
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
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(dt_2days,{
# plot 1st chart
  plot(Global_active_power~datetime,
       ylab='Global Active Power',
       xlab='',
       type='l'
  )

# plot 2nd chart
  plot(Voltage~datetime,
       type='l'
      )
# plot 3rd chart
     plot(Sub_metering_1~datetime,
          ylab='Energy sub metering',
          xlab='',
          col='black',
          type='l'
     )
     lines(Sub_metering_2~datetime,
          #ylab='Energy Sub metering',
          xlab='',
          col='red',
          type='l'
     )
     lines(Sub_metering_3~datetime,
          #ylab='Energy Sub metering',
          xlab='',
          col='blue',
          type='l'
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
# plot 4th chart
    plot(Global_reactive_power~datetime,
         type='l'
    )
}
)
dev.copy(png, file = "plot4.png")
dev.off()