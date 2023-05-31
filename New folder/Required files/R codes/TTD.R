library(readxl)
library(dplyr)

files <- list.files(path = "C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909", pattern = "*.xlsx", full.names = T)



#version

###---| WEEK: 09SEP2019 |---###
#update.packages(checkBuilt = TRUE, ask = FALSE, repos = "https://cran.rstudio.com")

#---| PREVIOUS WEEK: LOAD AND SUMMARIZE |---

#load(file="C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/df_tt_w20190812.Rdata")
load("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/df_tt_w20190909.Rdata")
chk_prevw <- df_tt_w20190909 %>% group_by(Employee.name, Employee.Code) %>% summarise(Min=min(WeekStart), Max=max(WeekStart))

#---| LOCAL DIRECTORY |---

getwd()

#Current

#---| Read data and data cleaning |---

#NOTES: #22 has date format issues
tt_22 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 22.xlsx", sheet = 'DataSheet')
tt_26 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 26.xlsx", sheet = 'DataSheet')
tt_27 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 27.xlsx", sheet = 'DataSheet')
tt_32 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 32.xlsx", sheet = 'DataSheet')
tt_33 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 33.xlsx", sheet = 'DataSheet')
tt_40 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 40.xlsx", sheet = 'DataSheet')
tt_43 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 43.xlsx", sheet = 'DataSheet')
tt_50 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 50.xlsx", sheet = 'DataSheet')
tt_56 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 56.xlsx", sheet = 'DataSheet')
tt_58 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 58.xlsx", sheet = 'DataSheet')
tt_60 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 60.xlsx", sheet = 'DataSheet')
tt_61 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 61.xlsx", sheet = 'DataSheet')
tt_62 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 62.xlsx", sheet = 'DataSheet')
tt_64 <- read_excel("C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/TimeTracker - 64.xlsx", sheet = 'DataSheet')
head(tt_17)


tt_22 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_26 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_27 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_32 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_33 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_40 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_43 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_50 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_56 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_58 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_60 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_61 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_62 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_64 <- subset(tt_26, 'Project Activity' != 0 & 'Project Activity' != 'FALSE' & 'Project Activity' != '' )

##Creating master data-set - tt_32 NOT INCLUDED
#Remove: tt_17, tt_41, tt_51

df_tt <- rbind(tt_22, tt_26, tt_27, tt_32, tt_33, tt_40, tt_43, tt_50, tt_56, tt_58, tt_60, tt_61, tt_62, tt_64)
unique(df_tt$`Employee Code`)
write.csv(df_tt,file = "consolidated.csv")
##Adding Week Start
library(lubridate)
library(sqldf)
df_tt$WeekStart <- floor_date(df_tt$Date, unit = "week")+1

##Check Min and Max Week

chk_tt <- df_tt %>% group_by(`Employee Code`,`Employee name`) %>% summarise(Min_Week=min(WeekStart), Max_Week=max(WeekStart))
names(df_tt) 

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

getwd()
write.csv(time_consol,file = "TimebyResource1.csv", row.names = FALSE)
names(df_tt)
#---| INCREMENTAL DATA CALCULATION BY RESOURCE |---

tt_22w <- subset(df_tt, 'Employee Code'==22 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_26w <- subset(df_tt, 'Employee Code'==26 & WeekStart>'2019-07-22' & WeekStart<='2019-09-09')
tt_27w <- subset(df_tt, 'Employee Code'==27 & WeekStart>'2019-08-12' & WeekStart<='2019-08-26')
tt_32w <- subset(df_tt, 'Employee Code'==32 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_33w <- subset(df_tt, 'Employee Code'==33 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_40w <- subset(df_tt, 'Employee Code'==40 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_43w <- subset(df_tt, 'Employee Code'==43 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_50w <- subset(df_tt, 'Employee Code'==50 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_56w <- subset(df_tt, 'Employee Code'==56 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_58w <- subset(df_tt, 'Employee Code'==58 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_60w <- subset(df_tt, 'Employee Code'==60 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_61w <- subset(df_tt, 'Employee Code'==61 & WeekStart>'2019-07-22' & WeekStart<='2019-09-09')
tt_62w <- subset(df_tt, 'Employee Code'==62 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')
tt_64w <- subset(df_tt, 'Employee Code'==64 & WeekStart>'2019-08-12' & WeekStart<='2019-09-09')

#tt_32w,
df_ttw <- rbind(tt_22w, tt_26w, tt_27w, tt_32w, tt_33w, tt_40w, tt_43w, tt_50w, tt_56w, tt_58w, tt_60w, tt_61w, tt_62w, tt_64w)
df_ttw1 <- rbind(df_tt_w20190909, df_ttw)

names(df_ttw1)
##Check Min and Max Week
chk_tt1 <- df_ttw1 %>% group_by(Employee.name,Employee.Code) %>% summarise(Min_Week=min(WeekStart), Max_Week=max(WeekStart))
names(chk_tt1)
##Check Project Names and Leaves (8 Hrs)

chk_project <- df_ttw1 %>% group_by(Project.Name) %>% count()

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

df_tt_w20190909 <- df_ttw2

#Save Data
getwd()
save(df_tt_w20190909, file = "df_tt_w20190909.Rdata")

#---| REPORT: RESOURCE by WEEKS |---

df_final <- df_tt_w20190909

write.csv(df_final, file = "DataDump.csv", row.names = FALSE)

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

write.csv(df_people,file = "Report1.csv")

#---| For 360i |---

#df_360i <- subset(df_tt_w20190708, Project.Name=="360i Shiseido_2019")

#write.csv(df_360i, file = "Report-360iTimeTracker.csv", row.names = FALSE)
getwd()
