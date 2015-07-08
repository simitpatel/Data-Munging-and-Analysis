#load libraries

library(plyr)
library(dplyr)
library(stringr)

#read dashboard files in

dash_all <- read.csv("./201506.csv")

#split into cars and no-cars

clist <- filter(dash_all,REPORTING_EMAIL=str_detect(dash_all$EMAIL,"@c.com"))
nonc <- anti_join(dash_all,clist,by="EMAIL")

#write CSV files

write.csv(clist,file="./clist-070615.csv")
write.csv(nonc,file="./nonc-070615.csv")