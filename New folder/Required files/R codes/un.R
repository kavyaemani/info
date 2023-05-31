
setwd("C:/Users/kavyahbhat/Downloads/timetraker_new")

library(readxl)
library(dplyr)
library(lubridate)
library(sqldf)

files <- list.files(path = "C:/Users/kavyahbhat/Downloads/timetraker_new", pattern = "*.xlsx", full.names = T)


#---| PREVIOUS WEEK: LOAD AND SUMMARIZE |---

#load(file="C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/df_tt_w20190812.Rdata")
load("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/df_tt_w20190909.Rdata")
chk_prevw <- df_tt_w20190909 %>% group_by(Employee.name, Employee.Code) %>% summarise(Min=min(WeekStart), Max=max(WeekStart))

#---| LOCAL DIRECTORY |---

getwd()
setwd("C:/Users/kavyahbhat/Downloads/timetrackerfiles/20191108T104629Z-001")
#Current

#---| Read data and data cleaning |---
tt_22 <- read_excel("TimeTracker - 22.xlsx", sheet = 'DataSheet')
tt_27 <- read_excel("TimeTracker - 27.xlsx", sheet = 'DataSheet')
tt_33 <- read_excel("TimeTracker - 33.xlsx", sheet = 'DataSheet')
tt_40 <- read_excel("TimeTracker - 40.xlsx", sheet = 'DataSheet')
tt_43 <- read_excel("TimeTracker - 43.xlsx", sheet = 'DataSheet')
tt_50 <- read_excel("TimeTracker - 50.xlsx", sheet = 'DataSheet')
tt_58 <- read_excel("TimeTracker - 58.xlsx", sheet = 'DataSheet')
tt_60 <- read_excel("TimeTracker - 60.xlsx", sheet = 'DataSheet')
tt_61 <- read_excel("TimeTracker - 61.xlsx", sheet = 'DataSheet')
tt_62 <- read_excel("TimeTracker - 62.xlsx", sheet = 'DataSheet')
tt_64 <- read_excel("TimeTracker - 64.xlsx", sheet = 'DataSheet')

unique(tt_64$Date)
tt_22 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_27 <- subset(tt_27, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_33 <- subset(tt_33, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_40 <- subset(tt_40, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_43 <- subset(tt_43, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_50 <- subset(tt_50, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_58 <- subset(tt_58, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_60 <- subset(tt_60, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_61 <- subset(tt_61, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_62 <- subset(tt_62, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_64 <- subset(tt_64, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )

#head(tt_62)
##Creating master data-set - tt_32 NOT INCLUDED
#Remove: tt_17, tt_41, tt_51

df_tt <- rbind(tt_22,tt_27, tt_33, tt_40, tt_43, tt_50,tt_58, tt_60, tt_61, tt_62, tt_64)
unique(df_tt$`Employee Code`)
df_tt
df_tt$Date <- as.Date(ymd(df_tt$Date))
##Adding Week Start
df_tt$WeekStart <- floor_date(df_tt$Date, unit = "week")+1
class(df_tt$WeekStart)
#df_tt$WeekStart<-as.Date(ymd(df_tt$WeekStart))
##Check Min and Max Week
#typeof(chk_tt$Min_Week)
chk_tt <- df_tt %>% group_by(`Employee Code`,`Employee name`) %>% summarise(Min_Week=min(WeekStart), Max_Week=max(WeekStart))


chk_tt$Min_Week <- as.Date(chk_tt$Min_Week, format="%Y-%m-%d")
chk_tt$Max_Week <- as.Date(chk_tt$Max_Week, format="%Y-%m-%d")



chk_prevw
time_consol <- sqldf('select a.*,
                     b.Min,
                     b.Max
                     from chk_tt as a
                     left join
                     chk_prevw as b
                     on a.`Employee Code`= b.`Employee.Code`
                     ')

write.csv(time_consol,file = "TimebyResource.csv", row.names = FALSE)
#names(df_tt)
#---| INCREMENTAL DATA CALCULATION BY RESOURCE |---20191108T104629Z-001
#sum(is.na(df_tt$WeekStart))


class(df_tt$WeekStart)
new2<-df_tt%>%  filter(WeekStart >= as.Date("2019-09-09") & WeekStart <= as.Date("2019-11-08"))

names(new2)[2] <- "Employee.Code"
names(new2)[3] <- "Employee.name"
names(new2)[4] <- "Project.Name"
names(new2)[5] <- "Project.Activity"
names(new2)[6] <- "Time.Estimated..in.Hrs.."
names(new2)[7] <- "Time.Spent..in.Hrs.."
names(new2)[8] <- "Analyst.s.Comments"

df_ttw1 <- rbind(df_tt_w20190909, new2)
#names(df_tt_w20190909)
#View(df_tt_w20190909)
#View(new2)
#names(df_ttw)
##Check Min and Max Week
chk_tt1 <- new2 %>% group_by(Employee.name,Employee.Code) %>% summarise(Min_Week=min(WeekStart), Max_Week=max(WeekStart))
##Check Project Names and Leaves (8 Hrs)


chk_project <- new2 %>% group_by(Project.Name) %>% count()


df_ttw2 <- sqldf('select *,
                 case  when `Project.Name` in ("TCCC Meta Learnings_2019", "Meta Analysis","TCCC Meta Learning_2019","TCCC_Meta Analysis_March_2019") then "TCCC Meta Learning_2019"
                 when `Project.Name` in ("Learning Power BI_2019", "Self Learning Power BI_2019") then "Upskill-Power BI"
                 else `Project.Name` end as ProjectName,
                 
                 case when `Project.Activity`in ("14.0__Leave","Leave") then "8" else `Time.Spent..in.Hrs..` end as TimeSpent
                 
                 from df_ttw1
                 ')

df_ttw2$Project.Name <- NULL
df_ttw2$Time.Spent..in.Hrs.. <- NULL

#Rename Variable
names(df_ttw2)[names(df_ttw2) == "ProjectName"] <- "Project.Name"
names(df_ttw2)[names(df_ttw2) == "TimeSpent"] <- "Time.Spent..in.Hrs.."

#---| FINAL DATA FOR WEEK |---

df_tt_w20191108 <- df_ttw2

#Save Data
getwd()
save(df_tt_w20191108, file = "df_tt_w20191108.Rdata")

#---| REPORT: RESOURCE by WEEKS |---

df_final <- df_tt_w20191108

write.csv(df_final, file = "DataDump-TimeTracker_20191108.csv", row.names = FALSE)

df_people <- sqldf('select distinct `Employee.name`,
                   `Employee.Code`,
                   WeekStart,
                   sum(`Time.Spent..in.Hrs..`) as TimeSpent,
                   40 as TimeAllocated
                   from df_final
                   group by 1,2,3
                   order by 2,1,3
                   ')

df_people$Utilization <- df_people$TimeSpent/df_people$TimeAllocated
#write_excel(df_people,file = "Report.csv", sheetName = "Resource", row.names = FALSE, col.names = TRUE, append = FALSE)

write.csv(df_people,file = "Report-AnalyticsTimeTracker-20191108.csv")
