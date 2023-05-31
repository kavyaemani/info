
library(lubridate)
asean_date<-rep(seq.Date(as.Date("2015-01-01"),as.Date("2019-12-01"),by = "months"),5)
asean_date<-as.Date(ymd(asean_date))

str(final_ind)

#asean_country<-rep("Indonesia",)
brand1<-rep("Brand1",60)
brand2<-rep("Brand2",60)
brand3<-rep("Brand3",60)
brand4<-rep("Brand4",60)
brand5<-rep("Brand5",60)
brand<-cbind(brand1,brand2,brand3,brand4,brand5)
final_ind<-cbind(asean_date,asean_country,brand)
#write.csv(final_ind,file)


asean_date<-rep(seq.Date(as.D
                         ate("2015-01-01"),as.Date("2019-12-01"),by = "months"),20)

asean_brand<-rep(c("Brand1","Brand2","Brand3","Brand4","Brand5"), each = 60, len = 1200)    # first 4 only.

asean_country<-rep(c("Indonesia","philippines","vietnam","thailand"), each = 300, len = 1200)    # first 4 only.
#rep(1:4, each = 2, len = 10)

asean<-data.frame(asean_date,asean_country,asean_brand)

asean_date<-as.Date(ymd(asean_date))
View(asean_date)
# 8 integers plus two recycled 1's.
rep(1:4, each = 2, times = 3) 
asean_brand<-as.data.frame(asean_brand)



