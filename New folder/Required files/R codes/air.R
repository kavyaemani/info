library(forecast)
library(dlm)
library(ggplot2)
library(zoo)
library(gridExtra)




class(index(air))

data("AirPassengers")
index(air)
head(AirPassengers)

dim(AirPassengers)
library(dplyr)
air <- AirPassengers
View(air)
log.air <- log(air)
grid.arrange(
  qplot(x=index(air), y=air, geom = "line"),
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
train <- log.air[1:120]
test <- log.air[121:144]

model.mle <- dlmMLE(train, parm=c(1, 1, 1, 1), build=model.build)
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
  data.frame(x=x[1:120], y=apply(model.filtered$m[-1,1:2], 1, sum), series="filtered"),
  data.frame(x=x[1:120], y=apply(model.smoothed$s[-1,1:2], 1, sum), series="smoothed"),
  data.frame(x=x[121:144], y=a, series="forecast")
)
g.dlm <- ggplot(subset(df, x>1950), aes(x=x, y=y, colour=series)) + geom_line()
g.dlm
