library(data.table)
library(dplyr)
library(tidyr)
library(lubridate)
# load data
getting_data <- function(url,nrows=Inf){
  # dowload url to datafolder if not download
  # unzipped the downloaded file to 
  
  target_file = file.path('data','datasets.zip')
  txt_file_name = 'household_power_consumption.txt'
  txt_file_path= file.path('data',txt_file_name) 
  if (!file.exists(target_file)){
    if(!dir.exists('data')){
      dir.create('data')
    
      }
      download.file(url,target_file)
      date_downloaded <- date()
      print(paste('Downloaded timestamp: ',date_downloaded))
      }
  
  if(!file.exists(txt_file_path)){
    print(paste("Unzipping the ", target_file,"...->"))
    
    print(unzip(target_file, exdir='data',list=TRUE))
    unzip(target_file, exdir='data')
    print("unzip finished")
  
  }
  # using fread to load data and '?" string as NA value.
  # combined Date and Time to datetime.
  dt <- fread(txt_file_path,nrows=nrows,na.strings = '?') %>%  
    mutate(datetime=dmy_hms(paste(Date,Time))) %>%
    select(10,3,4,5,6,7,8,9) 
    
  
  # combined Date, Time columns and convert to POSIX time)
  
  dt
}
# making plots
make_plot<-function(){
  TBD
}
# 