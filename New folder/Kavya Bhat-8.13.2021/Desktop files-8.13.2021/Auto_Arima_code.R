setwd("C:\\Users\\kavyahbhat\\Desktop")

spk<-read.xlsx("Auto_arima.xlsx")
head(spk)

Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=24)))
Forecast.allStates
write.csv(Forecast.allStates,file = "auto_arima_Forecasts3.csv")