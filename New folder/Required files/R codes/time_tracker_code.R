#setwd("D:\\Kavya 05Feb2020\\Time_Tracker\\TT_11th_May")
#setwd("C:\\Users\\kavyahbhat\\Downloads\\timetrackerfiles\\TT_04-01-2020")



setwd("D:\\SynologyDrive\\Kavya 05Feb2020\\Time_Tracker\\2021\\Sreya's New Request")
library(readxl)


library(dplyr)
library(lubridate)
library(sqldf)

#files <- list.files(path = "C:/Users/kavyahbhat/Downloads/timetraker_new", pattern = "*.xlsx", full.names = T)


#---| PREVIOUS WEEK: LOAD AND SUMMARIZE |---

#load(file="C:/Users/kavyahbhat/Downloads/Data-20190909/Data-20190909/df_tt_w20190812.Rdata")
#load("C:\\Users\\kavyahbhat\\Downloads\\timetrackerfiles\\tt_22_12_2019\\df_tt_w20191202.Rdata")
#chk_prevw <- df_tt_w20190909 %>% group_by(Employee.name, Employee.Code) %>% summarise(Min=min(WeekStart), Max=max(WeekStart))

#---| LOCAL DIRECTORY |---
## sujit,sekar,amisha,swathi,dhanusha

#Current

#---| Read data and data cleaning |---Team JIMIT--
tt_60 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Jimit Shah')
tt_22 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Sashank Ramesh')
tt_71 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Kavya H Bhat')
tt_58 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Amisha Kapoor')
tt_80 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Dhanusha')
tt_82 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Sreya Ghosh')
tt_C13 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Susan Philipose')
tt_95 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Richa Gulwani')
tt_I18 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Rujul Parekh')
tt_98 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Ankur')
tt_100 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Ishita Ghosh')
tt_97 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Aakash Gupta')
tt_101 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Arnav')
tt_102 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Lekha')

tt_93 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Hardik')
tt_88 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Alok')

  

############-- Team Hamid--####

tt_50 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Mohammad Hamid')
tt_62 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'DR Dinakaran')
tt_61 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Mohit Aggrawal')
tt_69 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Shashank Agrawal')
tt_72 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Ajay Joshi')
tt_33 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Sekar Subramanian')
tt_i10 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Deepak Singh')

tt_77 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Prasad Degala')
tt_i12 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Gowtham P. Sabareesan')



tt_60 <- subset(tt_60, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_22 <- subset(tt_22, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
#tt_41 <- subset(tt_41, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
#tt_64 <- subset(tt_64, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_71 <- subset(tt_71, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_27 <- subset(tt_27, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_50 <- subset(tt_50, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_62 <- subset(tt_62, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_61 <- subset(tt_61, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_58 <- subset(tt_58, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_i9 <- subset(tt_i9, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_69 <- subset(tt_69, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_72 <- subset(tt_72, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_33 <- subset(tt_33, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_i10 <- subset(tt_i10, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )


tt_20 <- subset(tt_20, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )

tt_38 <- subset(tt_38, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )

tt_73 <- subset(tt_73, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )


tt_75 <- subset(tt_75, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )
tt_77 <- subset(tt_77, 'Project Activity' != 0 &' Project Activity' != 'FALSE' & 'Project Activity' != '' )





data_dump <- rbind(tt_60,tt_22,tt_71,tt_58,tt_80,tt_82,tt_C13,tt_95,tt_I18,tt_98,tt_100,tt_97,tt_101,tt_102,tt_93,tt_88,tt_50,tt_62,tt_61,tt_69,tt_72,tt_33,tt_i10,tt_77,tt_i12)
data_dump$Date <- as.Date(ymd(data_dump$Date))
data_dump$Week <- as.Date(ymd(data_dump$Week))

class(data_dump$Week)

#str(data_dump)






#---| FINAL DATA FOR WEEK |---

df_tt_w2020_03_09 <- data_dump

#Save Data
getwd()
save(df_tt_w2020_03_09, file = "df_tt_w2020_May_12th.Rdata")

#---| REPORT: RESOURCE by WEEKS |---


df_final <- df_tt_w2020_03_09

write.csv(df_final, file = "DataDump-TimeTracker_1st_Aug_2021.csv", row.names = FALSE)
names(df_final)
####################################################################
#changing variable names
names(df_final)[3] <- "Employee.Code"
names(df_final)[4] <- "Employee.name"
names(df_final)[5] <- "Project.Name"
names(df_final)[6] <- "Project.Activity"
names(df_final)[7] <- "Time.Spent..in.Hrs.."

###################################################

#names(df_final)
df_people <- sqldf('select distinct "Employee.name",
                   "Employee.Code",
                   "Week",
                   sum("Time.Spent..in.Hrs..") as TimeSpent,
                   40 as TimeAllocated
                   from df_final
                   group by 1,2,3
                   order by 2,1,3
                   ')

df_people$Utilization <- df_people$TimeSpent/df_people$TimeAllocated
#write_excel(df_people,file = "Report.csv", sheetName = "Resource", row.names = FALSE, col.names = TRUE, append = FALSE)

write.csv(df_people,file = "Report-AnalyticsTimeTracker-1st_Aug_2021.csv")
