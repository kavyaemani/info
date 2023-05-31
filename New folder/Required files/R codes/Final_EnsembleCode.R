Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre7')
options(java.parameters = "-Xmx20g")
options(scipen = 999)

install.packages("forecast")

library(forecast)
library(readxl)

install.packages("ForecastComb")
library(ForecastComb)

setwd('D:/TCCC India/Weather/Ensemble')

actual <- read_excel("Rajasthan_Actual.xlsx")
predicted <- read_excel("Rajasthan_Predicted.xlsx")

actual <- as.data.frame(actual)
predicted <- as.data.frame(predicted)

actual1 <- actual[1:56,-c(1)]
predicted1 <- predicted[-c(1)]
?foreccomb


data <- foreccomb(actual1,predicted1)
comb_LAD(data)
comb_BG(data)
comb_OLS(data)
View(data)
