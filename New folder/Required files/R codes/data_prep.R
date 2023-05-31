setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

library(dplyr)
library(reshape2)

Bengaluru_temp<-raw%>% filter(States=='Bengaluru, India' & Weather=='Tmax')
View(Bengaluru_temp)
Bengaluru_temp<- melt(Bengaluru_temp,id.vars =c("States"))
View(Bengaluru_temp)

Bengaluru_preci<-raw%>%filter(States=='Bengaluru, India' & Weather=='Prcp Total')
View(Bengaluru_preci)
Bengaluru_preci<- melt(Bengaluru_preci,id.vars =c("States"))
View(Bengaluru_preci)

Bengaluru<-cbind(Bengaluru_temp,Bengaluru_preci$value)
View(Bengaluru)
Bengaluru<-Bengaluru[c(118:133),]
Bengaluru<-Bengaluru[-c(12:16),]

names(Bengaluru)[2]<-"Date"
names(Bengaluru)[3]<-"Tmax"
names(Bengaluru)[4]<-"Prcp Total"
#write.csv(Bengaluru,file = "C:/Users/kavyahbhat/Downloads/states")
#Blore<-Bengaluru[-c(68:83),]
#View(Blore)
#class(Bengaluru$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)
rm<-raw_dep[-c(2:4),]

cci<-melt(rm,id.vars =c("Row Labels"))
cci<-cci[,-1]
names(cci)[2]<-"VolSales"
names(cci)[1]<-"Date"

View(cci)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core<-melt(rm_ind,id.vars =c("Row Labels"))
core<-core[,-1]
names(core)[2]<-"Total SPK"
names(core)[1]<-"Date"

################################
blore_final<-cbind(Bengaluru,cci,core)

View(blore_final)
blore_final<-blore_final[,-c(5,7)]
write.csv(blore_final,file = "bengaluru.csv")

#######################################################################################
setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

Mumbai_temp<-raw%>% filter(States=='Mumbai, India' & Weather=='Tmax')
View(Mumbai_temp)
Mumbai_temp<- melt(Mumbai_temp,id.vars =c("States"))
View(Mumbai_temp)

mum_preci<-raw%>%filter(States=='Mumbai, India' & Weather=='Prcp Total')
View(mum_preci)
mum_preci<- melt(mum_preci,id.vars =c("States"))
View(mum_preci)

mumbai<-cbind(Mumbai_temp,mum_preci$value)
View(mumbai)
mumbai<-mumbai[-c(1:49,118:133),]

mumbai<-mumbai[c(118:133),]
mumbai<-mumbai[-c(12:16),]

names(mumbai)[2]<-"Date"
names(mumbai)[3]<-"Tmax"
names(mumbai)[4]<-"Prcp Total"

#Blore<-mumbai[-c(68:83),]
View(mumbai)
#class(mumbai$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)
rm<-raw_dep[-c(2:4),]

cci_mum<-melt(rm,id.vars =c("Row Labels"))
cci_mum<-cci_mum[,-1]
names(cci_mum)[2]<-"VolSales"
names(cci_mum)[1]<-"Date"

View(cci_mum)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core_mum<-melt(rm_ind,id.vars =c("Row Labels"))
core_mum<-core_mum[,-1]
names(core_mum)[2]<-"Total SPK"
names(core_mum)[1]<-"Date"

################################
mumbai_final<-cbind(mumbai,cci_mum,core_mum)

View(mumbai_final)
mumbai_final<-mumbai_final[,-c(5,7)]


write.csv(mumbai_final,file = "mumbai.csv")
####################################################################################

setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

delhi_temp<-raw%>% filter(States=='New Delhi, India' & Weather=='Tmax')
View(delhi_temp)
delhi_temp<- melt(delhi_temp,id.vars =c("States"))
View(delhi_temp)

delhi_preci<-raw%>%filter(States=='New Delhi, India' & Weather=='Prcp Total')
View(delhi_preci)
delhi_preci<- melt(delhi_preci,id.vars =c("States"))
View(delhi_preci)


delhi<-cbind(delhi_temp,delhi_preci$value)
View(delhi)
delhi<-delhi[-c(1:49,118:133),]


delhi<-delhi[c(118:133),]
delhi<-delhi[-c(12:16),]


names(delhi)[2]<-"Date"
names(delhi)[3]<-"Tmax"
names(delhi)[4]<-"Prcp Total"

#Blore<-mumbai[-c(68:83),]
View(delhi)
#class(mumbai$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)
rm<-raw_dep[-c(2:4),]

cci_del<-melt(rm,id.vars =c("Row Labels"))
cci_del<-cci_del[,-1]
names(cci_del)[2]<-"VolSales"
names(cci_del)[1]<-"Date"

View(cci_del)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core_del<-melt(rm_ind,id.vars =c("Row Labels"))
core_del<-core_del[,-1]
names(core_del)[2]<-"Total SPK"
names(core_del)[1]<-"Date"

################################
delhi_final<-cbind(delhi,cci_del,core_del)

View(delhi_final)
delhi_final<-delhi_final[,-c(5,7)]


write.csv(delhi_final,file = "delhi.csv")

#######################################################################################

setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

ahmd_temp<-raw%>% filter(States=='Ahmadabad, India' & Weather=='Tmax')

View(ahmd_temp)
ahmd_temp<- melt(ahmd_temp,id.vars =c("States"))
View(ahmd_temp)

ahmd_preci<-raw%>%filter(States=='Ahmadabad, India' & Weather=='Prcp Total')
View(ahmd_preci)
ahmd_preci<- melt(ahmd_preci,id.vars =c("States"))
View(ahmd_preci)


ahmd<-cbind(ahmd_temp,ahmd_preci$value)
View(ahmd)
ahmd<-ahmd[-c(1:49,118:133),]
#forecast
ahmd<-ahmd[c(118:133),]
ahmd<-ahmd[-c(12:16),]

names(ahmd)[2]<-"Date"
names(ahmd)[3]<-"Tmax"
names(ahmd)[4]<-"Prcp Total"

#Blore<-mumbai[-c(68:83),]
View(ahmd)
#class(mumbai$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)
rm<-raw_dep[-c(2:4),]

cci_ahmd<-melt(rm,id.vars =c("Row Labels"))
cci_ahmd<-cci_ahmd[,-1]
names(cci_ahmd)[2]<-"VolSales"
names(cci_ahmd)[1]<-"Date"

View(cci_ahmd)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core_ahmd<-melt(rm_ind,id.vars =c("Row Labels"))
core_ahmd<-core_ahmd[,-1]
names(core_ahmd)[2]<-"Total SPK"
names(core_ahmd)[1]<-"Date"

################################
ahmd_final<-cbind(ahmd,cci_ahmd,core_ahmd)

View(ahmd_final)
ahmd_final<-ahmd_final[,-c(5,7)]


write.csv(ahmd_final,file = "Ahmadabad.csv")
########################################################################################


setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

cal_temp<-raw%>% filter(States=='Calcutta, India' & Weather=='Tmax')
View(cal_temp)
cal_temp<- melt(cal_temp,id.vars =c("States"))
View(cal_temp)

cal_preci<-raw%>%filter(States=='Calcutta, India' & Weather=='Prcp Total')
View(cal_preci)
cal_preci<- melt(cal_preci,id.vars =c("States"))
View(cal_preci)


cal<-cbind(cal_temp,cal_preci$value)
View(cal)
cal<-cal[-c(1:49,118:133),]

#forecast
cal<-cal[c(118:133),]
cal<-cal[-c(12:16),]

names(cal)[2]<-"Date"
names(cal)[3]<-"Tmax"
names(cal)[4]<-"Prcp Total"

#Blore<-mumbai[-c(68:83),]
View(cal)
#class(mumbai$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)
rm<-raw_dep[-c(2:4),]

cci_cal<-melt(rm,id.vars =c("Row Labels"))
cci_cal<-cci_cal[,-1]
names(cci_cal)[2]<-"VolSales"
names(cci_cal)[1]<-"Date"

View(cci_cal)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core_cal<-melt(rm_ind,id.vars =c("Row Labels"))
core_cal<-core_cal[,-1]
names(core_cal)[2]<-"Total SPK"
names(core_cal)[1]<-"Date"

################################
cal_final<-cbind(cal,cci_cal,core_cal)

View(cal_final)
cal_final<-cal_final[,-c(5,7)]


write.csv(cal_final,file = "calcutta.csv")
########################################################################################


setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

punjab_temp<-raw%>% filter(States=='Chandigarh, India' & Weather=='Tmax')
View(punjab_temp)
punjab_temp<- melt(punjab_temp,id.vars =c("States"))
View(punjab_temp)

punjab_preci<-raw%>%filter(States=='Chandigarh, India' & Weather=='Prcp Total')
View(punjab_preci)
punjab_preci<- melt(punjab_preci,id.vars =c("States"))
View(punjab_preci)


punjab<-cbind(punjab_temp,punjab_preci$value)
View(punjab)
punjab<-punjab[-c(1:49,118:133),]

#forecast
cal<-cal[c(118:133),]
cal<-cal[-c(12:16),]

names(punjab)[2]<-"Date"
names(punjab)[3]<-"Tmax"
names(punjab)[4]<-"Prcp Total"

#Blore<-mumbai[-c(68:83),]
View(punjab)
#class(mumbai$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)

rm<-raw_dep[-c(2:4),]

cci_pun<-melt(rm,id.vars =c("Row Labels"))
cci_pun<-cci_pun[,-1]
names(cci_pun)[2]<-"VolSales"
names(cci_pun)[1]<-"Date"

View(cci_pun)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core_pun<-melt(rm_ind,id.vars =c("Row Labels"))
core_pun<-core_pun[,-1]
names(core_pun)[2]<-"Total SPK"
names(core_pun)[1]<-"Date"

################################
punjab_final<-cbind(punjab,cci_pun,core_pun)

View(punjab_final)
punjab_final<-punjab_final[,-c(5,7)]


write.csv(punjab_final,file = "punjab.csv")
########################################################################################


setwd("C:/Users/kavyahbhat/Downloads")
getwd()
raw<-read_excel("Dataset_Prep_14Nov19.xlsx", sheet = 'Export Data',skip = 11)

lucknow_temp<-raw%>% filter(States=='Lucknow, India' & Weather=='Tmax')
View(lucknow_temp)
lucknow_temp<- melt(lucknow_temp,id.vars =c("States"))
View(lucknow_temp)

lucknow_preci<-raw%>%filter(States=='Lucknow, India' & Weather=='Prcp Total')
View(lucknow_preci)
lucknow_preci<- melt(lucknow_preci,id.vars =c("States"))
View(lucknow_preci)


lucknow<-cbind(lucknow_temp,lucknow_preci$value)
View(lucknow)
lucknow<-lucknow[-c(1:49,118:133),]

#forecast
lucknow<-lucknow[c(118:133),]
lucknow<-lucknow[-c(12:16),]

names(lucknow)[2]<-"Date"
names(lucknow)[3]<-"Tmax"
names(lucknow)[4]<-"Prcp Total"

#Blore<-mumbai[-c(68:83),]
View(lucknow)
#class(mumbai$Date)


###########################
raw_dep<-read_excel("CCI VoLSales data.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_dep)

rm<-raw_dep[-c(2:4),]

cci_luck<-melt(rm,id.vars =c("Row Labels"))
cci_luck<-cci_luck[,-1]
names(cci_luck)[2]<-"VolSales"
names(cci_luck)[1]<-"Date"

View(cci_luck)
###############################
raw_ind<-read_excel("Long Term Category Trend_SPK.xlsx", sheet = 'Sheet4',skip = 3)
View(raw_ind)
rm_ind<-raw_ind[-c(2:4),]

core_luck<-melt(rm_ind,id.vars =c("Row Labels"))
core_luck<-core_luck[,-1]
names(core_luck)[2]<-"Total SPK"
names(core_luck)[1]<-"Date"

################################
lucknow_final<-cbind(lucknow,cci_luck,core_luck)

View(lucknow_final)
lucknow_final<-lucknow_final[,-c(5,7)]


write.csv(lucknow_final,file = "lucknow.csv")
########################################################################################


state_consolidate<-rbind(blore_final,mumbai_final,lucknow_final,cal_final,ahmd_final,delhi_final,punjab_final)
write.csv(state_consolidate,file = "C:/Users/kavyahbhat/Downloads/states/state_consolidated.csv")
##################################################################################


forecast_values_consolidate<-rbind(Bengaluru,mumbai,delhi,ahmd,cal,lucknow)
write.csv(forecast_values_consolidate,file = "C:/Users/kavyahbhat/Downloads/states/To_be_forecasted.csv")










