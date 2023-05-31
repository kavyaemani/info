





new2<-df_tt%>%  filter(WeekStart >= as.Date("2019-09-09") & WeekStart <= as.Date("2019-11-08"))

names(new2)[2] <- "Employee.Code"
names(new2)[3] <- "Employee.name"
names(new2)[4] <- "Project.Name"
names(new2)[5] <- "Project.Activity"
names(new2)[6] <- "Time.Estimated..in.Hrs.."
names(new2)[7] <- "Time.Spent..in.Hrs.."
names(new2)[8] <- "Analyst.s.Comments"

df_ttw1 <- rbind(df_tt_w20190909, new2)
names(df_tt_w20190909)
View(df_tt_w20190909)
View(new2)
names(df_ttw)
##Check Min and Max Week
chk_tt1 <- new2 %>% group_by(Employee.name,Employee.Code) %>% summarise(Min_Week=min(WeekStart), Max_Week=max(WeekStart))
##Check Project Names and Leaves (8 Hrs)


chk_project <- new2 %>% group_by(Project.Name) %>% count()
write.csv(chk_project,file = "demo.csv",row.names = FALSE)

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
