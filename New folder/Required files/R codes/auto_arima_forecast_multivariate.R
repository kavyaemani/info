setwd("C:/Users/kavyahbhat/Downloads/forcasted_files")
da<-read.csv("Book3.csv")
Category_Growth <- ts(da$Category_Growth , start = c(2015, 1),  frequency = 12)
#plot.ts(data)
#library(forecast)
model1=auto.arima(Category_Growth)
model1
Category_Growth<-forecast(model1,12)
#plot(forecast(model2,12))


Category_Growth<-as.data.frame(Category_Growth)

write.csv(Category_Growth,file = "Category_Growth.csv")
getwd()


CPI
CPI <- ts(da$CPI , start = c(2015, 1),  frequency = 12)
#plot.ts(data)
#library(forecast)
model2=auto.arima(CPI)
model2
CPI<-forecast(model2,12)
#plot(forecast(model2,12))


CPI<-as.data.frame(CPI)

write.csv(CPI,file = "CPI.csv")




IPS_CCI <- ts(da$IPS_CCI , start = c(2015, 1),  frequency = 12)
model3=auto.arima(IPS_CCI)
model3
IPS_CCI<-forecast(model3,12)
IPS_CCI<-as.data.frame(IPS_CCI)
write.csv(IPS_CCI,file = "IPS_CCI.csv")



IPS_Parle <- ts(da$IPS_Parle , start = c(2015, 1),  frequency = 12)
model4=auto.arima(IPS_Parle)
model4
IPS_Parle<-forecast(model4,12)
IPS_Parle<-as.data.frame(IPS_Parle)
write.csv(IPS_Parle,file = "IPS_Parle.csv")

IPS_PCI <- ts(da$IPS_PCI , start = c(2015, 1),  frequency = 12)
model5=auto.arima(IPS_PCI)
model5
IPS_PCI<-forecast(model5,12)
IPS_PCI<-as.data.frame(IPS_PCI)
write.csv(IPS_PCI,file = "IPS_PCI.csv")

OOS_CCI <- ts(da$OOS_CCI , start = c(2015, 1),  frequency = 12)
model6=auto.arima(OOS_CCI)
model6
OOS_CCI<-forecast(model6,12)
OOS_CCI<-as.data.frame(OOS_CCI)
write.csv(OOS_CCI,file = "OOS_CCI.csv")

OOS_Parle <- ts(da$OOS_Parle , start = c(2015, 1),  frequency = 12)
model7=auto.arima(OOS_Parle)
model7
OOS_Parle<-forecast(model7,12)
OOS_Parle<-as.data.frame(OOS_Parle)
write.csv(OOS_Parle,file = "OOS_Parle.csv")

OOS_PCI <- ts(da$OOS_PCI , start = c(2015, 1),  frequency = 12)
model8=auto.arima(OOS_PCI)
model8
OOS_PCI<-forecast(model8,12)
OOS_PCI<-as.data.frame(OOS_PCI)
write.csv(OOS_PCI,file = "OOS_PCI.csv")


Price_CCI_Core_SPK_Express <- ts(da$Price_CCI_Core_SPK_Express , start = c(2015, 1),  frequency = 12)
model9=auto.arima(Price_CCI_Core_SPK_Express)
model9
Price_CCI_Core_SPK_Express<-forecast(model9,12)
Price_CCI_Core_SPK_Express<-as.data.frame(Price_CCI_Core_SPK_Express)
write.csv(Price_CCI_Core_SPK_Express,file = "Price_CCI_Core_SPK_Express.csv")


Price_CCI_Core_SPK_Fridge <- ts(da$Price_CCI_Core_SPK_Fridge , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_CCI_Core_SPK_Fridge)
model8
Price_CCI_Core_SPK_Fridge<-forecast(model8,12)
Price_CCI_Core_SPK_Fridge<-as.data.frame(Price_CCI_Core_SPK_Fridge)
write.csv(Price_CCI_Core_SPK_Fridge,file = "Price_CCI_Core_SPK_Fridge.csv")


Price_CCI_Core_SPK_Mobile <- ts(da$Price_CCI_Core_SPK_Mobile , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_CCI_Core_SPK_Mobile)
model8
Price_CCI_Core_SPK_Mobile<-forecast(model8,12)
Price_CCI_Core_SPK_Mobile<-as.data.frame(Price_CCI_Core_SPK_Mobile)
write.csv(Price_CCI_Core_SPK_Mobile,file = "Price_CCI_Core_SPK_Mobile.csv")




Price_CCI_Core_SPK_Party <- ts(da$Price_CCI_Core_SPK_Party , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_CCI_Core_SPK_Party)
model8
Price_CCI_Core_SPK_Party<-forecast(model8,12)
Price_CCI_Core_SPK_Party<-as.data.frame(Price_CCI_Core_SPK_Party)
write.csv(Price_CCI_Core_SPK_Party,file = "Price_CCI_Core_SPK_Party.csv")



Price_CCI_Core_SPK_RGB <- ts(da$Price_CCI_Core_SPK_RGB , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_CCI_Core_SPK_RGB)
model8
Price_CCI_Core_SPK_RGB<-forecast(model8,12)
Price_CCI_Core_SPK_RGB<-as.data.frame(Price_CCI_Core_SPK_RGB)
write.csv(Price_CCI_Core_SPK_RGB,file = "Price_CCI_Core_SPK_RGB.csv")



Price_Parle_SPK_Express <- ts(da$Price_Parle_SPK_Express , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_Parle_SPK_Express)
model8
Price_Parle_SPK_Express<-forecast(model8,12)
Price_Parle_SPK_Express<-as.data.frame(Price_Parle_SPK_Express)
write.csv(Price_Parle_SPK_Express,file = "Price_Parle_SPK_Express.csv")


Price_Parle_SPK_Fridge <- ts(da$Price_Parle_SPK_Fridge , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_Parle_SPK_Fridge)
model8
Price_Parle_SPK_Fridge<-forecast(model8,12)
Price_Parle_SPK_Fridge<-as.data.frame(Price_Parle_SPK_Fridge)
write.csv(Price_Parle_SPK_Fridge,file = "Price_Parle_SPK_Fridge.csv")


Price_Parle_SPK_Mobile <- ts(da$Price_Parle_SPK_Mobile , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_Parle_SPK_Mobile)
model8
Price_Parle_SPK_Mobile<-forecast(model8,12)
Price_Parle_SPK_Mobile<-as.data.frame(Price_Parle_SPK_Mobile)
write.csv(Price_Parle_SPK_Mobile,file = "Price_Parle_SPK_Mobile.csv")



Price_Parle_SPK_Party <- ts(da$Price_Parle_SPK_Party , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_Parle_SPK_Party)
model8
Price_Parle_SPK_Party<-forecast(model8,12)
Price_Parle_SPK_Party<-as.data.frame(Price_Parle_SPK_Party)
write.csv(Price_Parle_SPK_Party,file = "Price_Parle_SPK_Party.csv")




Price_PCI_SPK_Express <- ts(da$Price_PCI_SPK_Express , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_PCI_SPK_Express)
model8
Price_PCI_SPK_Express<-forecast(model8,12)
Price_PCI_SPK_Express<-as.data.frame(Price_PCI_SPK_Express)
write.csv(Price_PCI_SPK_Express,file = "Price_PCI_SPK_Express.csv")



Price_PCI_SPK_Fridge <- ts(da$Price_PCI_SPK_Fridge , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_PCI_SPK_Fridge)
model8
Price_PCI_SPK_Fridge<-forecast(model8,12)
Price_PCI_SPK_Fridge<-as.data.frame(Price_PCI_SPK_Fridge)
write.csv(Price_PCI_SPK_Fridge,file = "Price_PCI_SPK_Fridge.csv")



Price_PCI_SPK_Mobile <- ts(da$Price_PCI_SPK_Mobile , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_PCI_SPK_Mobile)
model8
Price_PCI_SPK_Mobile<-forecast(model8,12)
Price_PCI_SPK_Mobile<-as.data.frame(Price_PCI_SPK_Mobile)
write.csv(Price_PCI_SPK_Mobile,file = "Price_PCI_SPK_Mobile.csv")



Price_PCI_SPK_Party <- ts(da$Price_PCI_SPK_Party , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_PCI_SPK_Party)
model8
Price_PCI_SPK_Party<-forecast(model8,12)
Price_PCI_SPK_Party<-as.data.frame(OOS_PCI)
write.csv(Price_PCI_SPK_Party,file = "Price_PCI_SPK_Party.csv")



Price_PCI_SPK_RGB <- ts(da$Price_PCI_SPK_RGB , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Price_PCI_SPK_RGB)
model8
Price_PCI_SPK_RGB<-forecast(model8,12)
Price_PCI_SPK_RGB<-as.data.frame(Price_PCI_SPK_RGB)
write.csv(Price_PCI_SPK_RGB,file = "Price_PCI_SPK_RGB.csv")



seas1 <- ts(da$seas1 , start = c(2015, 1),  frequency = 12)
model8=auto.arima(seas1)
model8
seas1<-forecast(model8,12)
seas1<-as.data.frame(seas1)
write.csv(seas1,file = "seas1.csv")




SOCF_CCI_Core_SPK <- ts(da$SOCF_CCI_Core_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOCF_CCI_Core_SPK)
model8
SOCF_CCI_Core_SPK<-forecast(model8,12)
SOCF_CCI_Core_SPK<-as.data.frame(SOCF_CCI_Core_SPK)
write.csv(SOCF_CCI_Core_SPK,file = "SOCF_CCI_Core_SPK.csv")




SOCF_Parle_SPK <- ts(da$SOCF_Parle_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOCF_Parle_SPK)
model8
SOCF_Parle_SPK<-forecast(model8,12)
SOCF_Parle_SPK<-as.data.frame(SOCF_Parle_SPK)
write.csv(SOCF_Parle_SPK,file = "SOCF_Parle_SPK.csv")





SOCF_PCI_SPK <- ts(da$SOCF_PCI_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOCF_PCI_SPK)
model8
SOCF_PCI_SPK<-forecast(model8,12)
SOCF_PCI_SPK<-as.data.frame(SOCF_PCI_SPK)
write.csv(SOCF_PCI_SPK,file = "SOCF_PCI_SPK.csv")





SOTS_CCI_Core_SPK <- ts(da$SOTS_CCI_Core_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOTS_CCI_Core_SPK)
model8
SOTS_CCI_Core_SPK<-forecast(model8,12)
SOTS_CCI_Core_SPK<-as.data.frame(SOTS_CCI_Core_SPK)
write.csv(SOTS_CCI_Core_SPK,file = "SOTS_CCI_Core_SPK.csv")





SOTS_Parle_SPK <- ts(da$SOTS_Parle_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOTS_Parle_SPK)
model8
SOTS_Parle_SPK<-forecast(model8,12)
SOTS_Parle_SPK<-as.data.frame(SOTS_Parle_SPK)
write.csv(SOTS_Parle_SPK,file = "SOTS_Parle_SPK.csv")




SOTS_PCI_SPK <- ts(da$SOTS_PCI_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOTS_PCI_SPK)
model8
SOTS_PCI_SPK<-forecast(model8,12)
SOTS_PCI_SPK<-as.data.frame(SOTS_PCI_SPK)
write.csv(SOTS_PCI_SPK,file = "SOTS_PCI_SPK.csv")





SOWF_CCI_Core_SPK <- ts(da$SOWF_CCI_Core_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOWF_CCI_Core_SPK)
model8
SOWF_CCI_Core_SPK<-forecast(model8,12)
SOWF_CCI_Core_SPK<-as.data.frame(SOWF_CCI_Core_SPK)
write.csv(SOWF_CCI_Core_SPK,file = "SOWF_CCI_Core_SPK.csv")



SOWF_Parle_SPK <- ts(da$SOWF_Parle_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOWF_Parle_SPK)
model8
SOWF_Parle_SPK<-forecast(model8,12)
SOWF_Parle_SPK<-as.data.frame(SOWF_Parle_SPK)
write.csv(SOWF_Parle_SPK,file = "SOWF_Parle_SPK.csv")




SOWF_PCI_SPK <- ts(da$SOWF_PCI_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(SOWF_PCI_SPK)
model8
SOWF_PCI_SPK<-forecast(model8,12)
SOWF_PCI_SPK<-as.data.frame(SOWF_PCI_SPK)
write.csv(SOWF_PCI_SPK,file = "SOWF_PCI_SPK.csv")



WD_CCI_Core_SPK <- ts(da$WD_CCI_Core_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(WD_CCI_Core_SPK)
model8
WD_CCI_Core_SPK<-forecast(model8,12)
WD_CCI_Core_SPK<-as.data.frame(WD_CCI_Core_SPK)
write.csv(WD_CCI_Core_SPK,file = "WD_CCI_Core_SPK.csv")


  WD_Parle_SPK <- ts(da$WD_Parle_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(WD_Parle_SPK)
model8
WD_Parle_SPK<-forecast(model8,12)
WD_Parle_SPK<-as.data.frame(WD_Parle_SPK)
write.csv(WD_Parle_SPK,file = "WD_Parle_SPK.csv")


WD_PCI_SPK <- ts(da$WD_PCI_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(WD_PCI_SPK)
model8
WD_PCI_SPK<-forecast(model8,12)
WD_PCI_SPK<-as.data.frame(WD_PCI_SPK)
write.csv(WD_PCI_SPK,file = "WD_PCI_SPK.csv")




Weight_Brand_Parle_SPK <- ts(da$Weight_Brand_Parle_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Weight_Brand_Parle_SPK)
model8
Weight_Brand_Parle_SPK<-forecast(model8,12)
Weight_Brand_Parle_SPK<-as.data.frame(Weight_Brand_Parle_SPK)
write.csv(Weight_Brand_Parle_SPK,file = "Weight_Brand_Parle_SPK.csv")




Weight_Brand_PCI_SPK <- ts(da$Weight_Brand_PCI_SPK , start = c(2015, 1),  frequency = 12)
model8=auto.arima(Weight_Brand_PCI_SPK)
model8
Weight_Brand_PCI_SPK<-forecast(model8,12)
Weight_Brand_PCI_SPK<-as.data.frame(Weight_Brand_Parle_SPK)
write.csv(Weight_Brand_PCI_SPK,file = "Weight_Brand_PCI_SPK.csv")



######################################################################
library(readxl)
library(openxlsx)
library(forecast)
setwd("D:\\Coco-Cola\\India\\Data_prep_files")
setwd("D:\\Coco-Cola\\India\\Coco-cola-Water")

setwd("C:/Users/kavyahbhat/Downloads/forcasted_files")
#das<-read.csv("Book3.csv")


Forecast.allStates <- as.data.frame(lapply(ts(das,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=12)))

tail(Forecast.allStates)

########################################################


setwd("D:\\")
getwd()



head(spk)
Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=12)))
Forecast.allStates
write.csv(Forecast.allStates,file = "Total_Category_FMCG_MH.csv")

##########################################################

spk <- ts(spk$Total_Spk_chennai, start = c(2015, 1),  frequency = 12)
model8=auto.arima(spk)
model8

Total_Spk_chennai<-forecast(model8,12)
accuracy(Total_Spk_chennai)
#Weight_Brand_PCI_SPK<-as.data.frame(Weight_Brand_Parle_SPK)
#write.csv(Weight_Brand_PCI_SPK,file = "Weight_Brand_PCI_SPK.csv")


spk <- ts(spk$VolSales_patna,start = c(2015, 1),  frequency = 12)

model8=auto.arima(spk)
model8

VolSales_patna<-forecast(model8,12)
write.csv(VolSales_patna,file = "Bihar_Spk_forecasts.csv")
accuracy(VolSales_patna)


setwd("D:\\Kavya 05Feb2020\\7states")

spk<-read.xlsx("BI_data_check.xlsx")
head(spk)
setwd("D:\\Coco-Cola\\India\\Data_prep_files")
Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=12)))
Forecast.allStates
write.csv(Forecast.allStates,file = "BI_forecats.csv")






library(lubridate)


date_ship=format(as.Date(spk$Date, "%B %d %Y"), "%d-%m-%Y")
write.csv(date_ship,file = "date_ship.csv")

setwd("D:\\")

spk<-read.xlsx("Book_data.xlsx")
Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2013, 1),  frequency = 7), function(x) forecast(auto.arima(x),h=52)))
Forecast.allStates


#################################################################


setwd("C:\\Users\\kavyahbhat\\Desktop")

spk<-read.xlsx("Auto_arima.xlsx")
head(spk)

Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=10)))
Forecast.allStates
write.csv(Forecast.allStates,file = "auto_arima_Forecasts.csv")


#########################################################################

spk <- ts(spk , start = c(2015, 1),  frequency = 12)
spk
model=auto.arima(spk)
model
spk<-forecast(model,10)
spk<-as.data.frame(spk)
write.csv(Weight_Brand_PCI_SPK,file = "Weight_Brand_PCI_SPK.csv")











######################################################################

setwd("D:\\Coco-Cola\\India\\India_Phase2\\New_Data_with_March_2020\\Data_prep_files\\Forecasts_files\\SPK")
spk<-read.xlsx("Hydration_Category.xlsx",sheet = "mar")
tail(spk)

Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=24)))
Forecast.allStates
write.csv(Forecast.allStates,file = "Sparkling_Category_Data_till_July19_Forecasts.csv")


######################################################################


setwd("D:\\Test\\FB's_Prophet")

spk<-read.xlsx("SPK_Category&UE_values.xlsx",sheet = "mar")
tail(spk)

Forecast.allStates <- as.data.frame(lapply(ts(spk,start = c(2015, 1),  frequency = 12), function(x) forecast(auto.arima(x),h=12)))
Forecast.allStates
write.csv(Forecast.allStates,file = "forecasts.csv")



