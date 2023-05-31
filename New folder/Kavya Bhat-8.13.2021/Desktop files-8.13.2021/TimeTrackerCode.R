
#setwd("D:\\Kavya 05Feb2020\\Time_Tracker\\TT_11th_May")
#setwd("C:\\Users\\kavyahbhat\\Downloads\\timetrackerfiles\\TT_04-01-2020")



setwd("D:\\Kavya Bhat-8.13.2021\\SynologyDrive\\Kavya 05Feb2020\\Time_Tracker\\2021")
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
tt_60 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Jimit Shah')
tt_22 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Sashank Ramesh')
tt_71 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Kavya H Bhat')
tt_58 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Amisha')
tt_80 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Dhanusha')
tt_82 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Sreya Ghosh')
tt_C13 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Susan')
tt_95 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Richa')
tt_I18 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Rujul')
tt_98 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Kumar Ankur')
tt_100 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Ishita')
tt_97 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Aakash Gupta')
tt_101 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Arnav Somani')
tt_102 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Lekha')

tt_93 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Hardik')
tt_88 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Alok Kumar')

tt_106 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Princecon Bera')
tt_i20 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Ankit Bansal')
tt_103 <- read_excel("New Time Tracker_Team Jimit.xlsx", sheet = 'Heeral ')


 


############-- Team Hamid--####

tt_50 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Mohammad Hamid')
tt_62 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'DR Dinakaran')
tt_61 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Mohit Aggrawal')
tt_69 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Shashank Agrawal')
tt_72 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Ajay Joshi')
tt_33 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Sekar Subramanian')
tt_74 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Deepak Singh')

tt_77 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Prasad Degala')
tt_89 <- read_excel("New Time Tracker_Team Hamid.xlsx", sheet = 'Gowtham P. Sabareesan')



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





data_dump <- rbind(tt_60,tt_22,tt_71,tt_58,tt_80,tt_82,tt_C13,tt_95,tt_I18,tt_98,tt_100,tt_97,tt_101,tt_102,tt_93,tt_88,tt_106,tt_i20,tt_103,tt_50,tt_62,tt_61,tt_69,tt_72,tt_33,tt_74,tt_77,tt_89)


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

write.csv(df_final, file = "DataDump-TimeTracker_19th_Sept_2021.csv", row.names = FALSE)
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
#order by 2,1,3
df_people$Utilization <- df_people$TimeSpent/df_people$TimeAllocated
#write_excel(df_people,file = "Report.csv", sheetName = "Resource", row.names = FALSE, col.names = TRUE, append = FALSE)

write.csv(df_people,file = "Report-AnalyticsTimeTracker-19th_Sept_2021.csv")






df_people <- sqldf('select distinct "Employee.name",
                   "Employee.Code",
                   "Week",
                   sum("Time.Spent..in.Hrs..") as TimeSpent,
                   40 as TimeAllocated
                   from df_final
                   group by 1,2,3
                   order by  2
                   ')
















tt_60 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Jimit')
tt_80 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Dhanusha')
tt_71 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Kavya')
tt_97 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Akash Gupta')
tt_I22 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Ankit Bansal')
tt_22 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Sashank')
tt_108 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Karthikaya')
tt_109 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Naveen')
tt_88 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Alok')
tt_98 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Ankur')
tt_58 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Amisha')
tt_103 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Heeral')
tt_100 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Ishitha')
tt_62 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Dhinakaran')
tt_102 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Lekha')
tt_101 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Arnav')
tt_61 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Mohit')
tt_74 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Deepak Singh')
tt_106 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Prince')
tt_33 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Sekar')
tt_77 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Prasad Degela')
tt_122 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Shreyas')
tt_112 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Rujul')
tt_93 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Hardik')
tt_89 <- read_excel("Time Tracker Sep 2021.xlsx", sheet = 'Gowtham')




data_dump <- rbind(tt_60,tt_80,tt_71,tt_97,tt_I22,tt_108,tt_109,tt_88,tt_98,tt_58,tt_103,tt_100,tt_62,tt_102,tt_101,tt_61,tt_74,tt_106,tt_33,tt_77,tt_122,tt_112,tt_93,tt_89)





