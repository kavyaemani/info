setwd("C:/Users/kavyahbhat/Downloads")
getwd()
 
dat <- ts(sales, start = c(2014, 1),  frequency = 12)
plot.ts(dat)
library(forecast)
model1=auto.arima(dat)
model1
forecast(model1,12)
plot(forecast(model1,12))


setwd("C:/Users/kavyahbhat/Downloads")
getwd()
spk<-read.csv("PDS.csv")
data <- ts(spk, start = c(2014, 1),  frequency = 12)
plot.ts(data)
#library(forecast)
model2=auto.arima(data)
model2
forecast(model2,12)
plot(forecast(model2,12))


Punjab_Forecast<-as.data.frame(Punjab_Forecast)

library(openxlsx)
AP_Model <- list(`Fit` = Fit)
write.xlsx(Punjab_Forecast,"ARIMA_Punjab.xlsx")

