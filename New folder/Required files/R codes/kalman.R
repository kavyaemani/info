library(forecast)
library(dlm)
library(ggplot2)
library(zoo)# for yearmon
library(gridExtra)
library(dplyr)
library(lubridate)
library(openxlsx)

setwd("C:\\Users\\kavyahbhat\\Downloads\\dwnlds")
air<-read.xlsx("kalman.xlsx",sheet = "Sheet2")
air <- ts(air, start = c(2014),end = c(2019,8), frequency = 12)
#plot.ts(air)
index(air)
class(index(air))
#air <- AirPassengers

log.air <- log(air)

grid.arrange(
  qplot(x=index(air), y=air,geom = "line"),
  qplot(x=index(air), y=log.air, geom = "line"),
  nrow=2
)
# forecasting using state sapce models
model.build <- function(p) {
  return(
    dlmModPoly(2, dV=p[1], dW=p[2:3]) + 
      dlmModSeas(12, dV=p[4])
  )
}

#log.air <- log(air) + rnorm(length(log.air), 0, 0.15)
log.air <- log(air)

length(log.air)
train <- log.air[1:56]
test <- log.air[57:68]

model.mle <- dlmMLE(train, parm=c(1, 1, 1, 1), build=model.build)

model.mle <- dlmMLE(co2, parm=c(0.1, 0, 1, 1), build=model.build)
if(model.mle$convergence==0) print("converged") else print("did not converge")
model.mle$par



model.fit <- model.build(model.mle$par)
model.filtered <- dlmFilter(train, model.fit)
model.smoothed <- dlmSmooth(train, model.fit)


n <- 2*12
model.forecast <- dlmForecast(model.filtered, nAhead=n)
model.build()

model.filtered$m

index(log.air)
x <- index(log.air)
a <- drop(model.forecast$a%*%t(FF(model.fit)))
df <- rbind(
  data.frame(x=index(log.air), y=as.numeric(log.air), series="original"),
  data.frame(x=x[1:56], y=apply(model.filtered$m[-1,1:2], 1, sum), series="filtered"),
  data.frame(x=x[1:56], y=apply(model.smoothed$s[-1,1:2], 1, sum), series="smoothed"),
  data.frame(x=x[56:68], y=a, series="forecast")
)
g.dlm <- ggplot(subset(df, x>2015), aes(x=x, y=y, colour=series)) + geom_line()
g.dlm



#########################################################################
model.mle$par





n <- 2*12
model.forecast <- dlmForecast(model.filtered, nAhead=n)

x <- index(air)
xf <- seq(max(x), max(x)+n/12, 1/12)
aa <- model.forecast$a[,-1]*(-1)
aa <- cbind(model.forecast$a[,1], aa)
a <- drop(model.forecast$a%*%t(FF(model.fit)))
a <- c(tail(air,1), a)
df <- rbind(
  data.frame(x=index(log.air), y=as.numeric(air), series="original"),
  data.frame(x=x[1:56], y=apply(model.filtered$m[-1,2:4], 1, sum), series="filtered"),
  data.frame(x=x[1:56], y=apply(model.smoothed$s[-1,2:4], 1, sum), series="smoothed"),
  data.frame(x=xf, y=a, series="forecast")
)
g.dlm <- ggplot(subset(df, x>2014), aes(x=x, y=y, colour=series)) + geom_line()
g.dlm
###################################################################3

# forecasting using arima
model <- auto.arima(air)
model.forecast <- forecast(model, h = 1*12)
plot(model.forecast)

##################################################################################

air<-read.xlsx("kalman.xlsx",sheet = "Sheet2")
air <- ts(air, start = c(2014),end = c(2019,8), frequency = 12)
#plot.ts(air)
index(air)
class(index(air))
#air <- AirPassengers

log.air <- log(air)

grid.arrange(
  qplot(x=index(air), y=air,geom = "line"),
  qplot(x=index(air), y=log.air, geom = "line"),
  nrow=2
)
# forecasting using state sapce models
model.build <- function(p) {
  return(
    dlmModPoly(2, dV=p[1], dW=p[2:3]) + 
      dlmModSeas(12, dV=p[4])
  )
}

model.mle <- dlmMLE(air, parm=c(0.1, 0, 1, 1), build=model.build)
if(model.mle$convergence==0) print("converged") else print("did not converge")
model.mle$par


model.fit <- model.build(model.mle$par)
model.filtered <- dlmFilter(air, model.fit)


all(model.filtered$m %*% t(model.fit$GG) == model.filtered$a) 
# kalman smoother
model.smoothed <- dlmSmooth(air, model.fit)


n <- 2*12
model.forecast <- dlmForecast(model.filtered, nAhead=n)

x <- index(air)
xf <- seq(max(x), max(x)+n/12, 1/12)
aa <- model.forecast$a[,-1]*(-1)
aa <- cbind(model.forecast$a[,1], aa)
a <- drop(model.forecast$a%*%t(FF(model.fit)))
a <- c(tail(air,1), a)
df <- rbind(
  data.frame(x=x, y=as.numeric(air), series="original"),
  data.frame(x=x, y=apply(model.filtered$m[-1,1:2], 1, sum), series="filtered"),
  data.frame(x=x, y=apply(model.smoothed$s[-1,1:2], 1, sum), series="smoothed"),
  data.frame(x=xf, y=a, series="forecast")
)
g.dlm <- ggplot(subset(df, x>2014), aes(x=x, y=y, colour=series)) + geom_line()
g.dlm

#http://gradientdescending.com/state-space-models-for-time-series-analysis-and-the-dlm-package/








